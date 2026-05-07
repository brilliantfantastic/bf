defmodule Mix.Tasks.Bf.ProcessPhotos do
  @shortdoc "Generate WebP variants from source photos for the hero backgrounds"

  @moduledoc """
  Processes source JPG photos into responsive WebP variants for deployment.

  Reads JPG/JPEG files from the source directory (organized by side: `brilliant/`
  and `fantastic/`), generates multiple resolutions, and writes WebP outputs to
  `priv/static/images/photos/{side}/`.

  After processing, writes a manifest file (`priv/photos.manifest` by default)
  listing all photo names per side. `BrilliantFantastic.Photos` reads this
  manifest at compile time, so the registry recompiles automatically when the
  manifest changes — no `mix compile --force` or server restart needed.

  Source files are gitignored; only the WebP outputs are committed.

  ## Usage

      mix bf.process_photos [options]

  ## Options

    * `--source PATH` — source directory containing `brilliant/` and `fantastic/`
      subdirectories (default: `priv/photos_source`)
    * `--output PATH` — output base directory; WebP files are written to
      `{output}/{side}/{name}-{width}.webp` (default: `priv/static/images/photos`)
    * `--manifest PATH` — path to write the photos manifest
      (default: `priv/photos.manifest`)
    * `--quality N` — WebP quality, 1–100 (default: 90)
    * `--widths CSV` — comma-separated output widths in pixels
      (default: `480,960,1440,1920`)
    * `--force` — re-process all photos even if outputs are already up to date

  ## Workflow

  1. Pre-rename source JPG files with descriptive names in Finder
     (e.g. `headshot-01.jpg`, `studio-01.jpg`). The filename minus extension
     becomes the WebP basename.
  2. Drop renamed JPGs into `priv/photos_source/brilliant/` or
     `priv/photos_source/fantastic/`.
  3. Run `mix bf.process_photos`.
  4. Commit the generated WebP files in `priv/static/images/photos/` and the
     updated `priv/photos.manifest`.
  """

  use Mix.Task

  @sides ["brilliant", "fantastic"]

  @switches [
    source: :string,
    output: :string,
    manifest: :string,
    quality: :integer,
    widths: :string,
    force: :boolean
  ]

  @defaults [
    source: "priv/photos_source",
    output: "priv/static/images/photos",
    manifest: "priv/photos.manifest",
    quality: 90,
    widths: "480,960,1440,1920",
    force: false
  ]

  @impl Mix.Task
  def run(args) do
    {opts, _rest, invalid} = OptionParser.parse(args, strict: @switches)

    if invalid != [] do
      Mix.raise("Unknown options: #{Enum.map_join(invalid, ", ", fn {k, _} -> k end)}")
    end

    opts = Keyword.merge(@defaults, opts)
    source_dir = opts[:source]
    output_base = opts[:output]
    manifest_path = opts[:manifest]
    quality = opts[:quality]
    force = opts[:force]

    unless quality in 1..100 do
      Mix.raise("Invalid --quality #{quality}. Must be an integer between 1 and 100.")
    end

    widths =
      opts[:widths]
      |> String.split(",")
      |> Enum.map(&String.trim/1)
      |> Enum.map(fn w ->
        case Integer.parse(w) do
          {n, ""} when n > 0 -> n
          _ -> Mix.raise("Invalid width: #{inspect(w)}. Must be a positive integer.")
        end
      end)

    Application.ensure_all_started(:image)

    for side <- @sides do
      process_side(side, source_dir, output_base, widths, quality, force)
    end

    write_manifest(manifest_path, output_base)
  end

  defp process_side(side, source_dir, output_base, widths, quality, force) do
    side_source = Path.join(source_dir, side)

    unless File.dir?(side_source) do
      Mix.shell().info("[#{side}] source directory not found: #{side_source} — skipping")
      :ok
    else
      jpgs = Path.wildcard(Path.join(side_source, "*.{jpg,jpeg}"))

      if jpgs == [] do
        Mix.shell().info("[#{side}] no JPG files found in #{side_source}")
      else
        Enum.each(jpgs, &process_file(&1, side, output_base, widths, quality, force))
      end
    end
  end

  defp process_file(src_path, side, output_base, widths, quality, force) do
    filename = Path.basename(src_path)
    basename = src_path |> Path.basename() |> Path.rootname() |> String.downcase()
    output_dir = Path.join(output_base, side)

    File.mkdir_p!(output_dir)

    src_mtime = File.stat!(src_path).mtime

    outputs =
      Enum.map(widths, fn width ->
        Path.join(output_dir, "#{basename}-#{width}.webp")
      end)

    if not force and all_up_to_date?(outputs, src_mtime) do
      Mix.shell().info("[#{side}] #{filename} -> skipped (up to date)")
    else
      case generate_variants(src_path, outputs, widths, quality) do
        {:ok, total_bytes} ->
          size_label = format_bytes(total_bytes)
          Mix.shell().info("[#{side}] #{filename} -> #{length(widths)} variants (#{size_label})")

        {:error, reason} ->
          Mix.shell().error("[#{side}] #{filename} -> ERROR: #{inspect(reason)}")
      end
    end
  end

  # Scans the output directory for all WebP files and writes the manifest
  # listing unique photo names per side. Called after all processing.
  defp write_manifest(manifest_path, output_base) do
    sections =
      Enum.map(@sides, fn side ->
        names =
          Path.join(output_base, "#{side}/*.webp")
          |> Path.wildcard()
          |> Enum.map(fn path ->
            # Strip the trailing -{width} from the basename, e.g. "foo-960.webp" -> "foo"
            Path.basename(path, ".webp") |> String.replace(~r/-\d+$/, "")
          end)
          |> Enum.uniq()
          |> Enum.sort()

        {side, names}
      end)

    content =
      Enum.map_join(sections, "\n", fn {side, names} ->
        "[#{side}]\n" <> Enum.join(names, "\n")
      end) <> "\n"

    File.mkdir_p!(Path.dirname(manifest_path))
    File.write!(manifest_path, content)

    total = sections |> Enum.map(fn {_, names} -> length(names) end) |> Enum.sum()
    Mix.shell().info("Wrote #{manifest_path} (#{total} photos)")
  end

  defp all_up_to_date?(output_paths, src_mtime) do
    Enum.all?(output_paths, fn dest ->
      case File.stat(dest) do
        {:ok, %{mtime: mtime}} -> mtime >= src_mtime
        {:error, _} -> false
      end
    end)
  end

  defp generate_variants(src_path, output_paths, widths, quality) do
    Enum.zip(widths, output_paths)
    |> Enum.reduce_while({:ok, 0}, fn {width, dest}, {:ok, acc_bytes} ->
      case generate_one(src_path, dest, width, quality) do
        {:ok, bytes} -> {:cont, {:ok, acc_bytes + bytes}}
        {:error, _} = err -> {:halt, err}
      end
    end)
  end

  defp generate_one(src_path, dest_path, width, quality) do
    # Pass "WIDTHx9999" so width is always the binding constraint — portrait
    # photos would otherwise be height-constrained when given a plain integer.
    with {:ok, img} <- Image.thumbnail(src_path, "#{width}x9999"),
         {:ok, img} <- Image.sharpen(img),
         {:ok, _} <- Image.write(img, dest_path, quality: quality, effort: 6) do
      stat = File.stat!(dest_path)
      {:ok, stat.size}
    end
  end

  defp format_bytes(bytes) when bytes < 1024, do: "#{bytes} B"

  defp format_bytes(bytes) when bytes < 1_048_576 do
    kb = Float.round(bytes / 1024, 1)
    "#{kb} KB"
  end

  defp format_bytes(bytes) do
    mb = Float.round(bytes / 1_048_576, 1)
    "#{mb} MB"
  end
end
