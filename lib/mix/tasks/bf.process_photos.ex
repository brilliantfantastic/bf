defmodule Mix.Tasks.Bf.ProcessPhotos do
  @shortdoc "Generate WebP variants from source photos for the hero backgrounds"

  @moduledoc """
  Processes source JPG photos into responsive WebP variants for deployment.

  Reads JPG/JPEG files from the source directory (organized by side: `brilliant/`
  and `fantastic/`), generates multiple resolutions, and writes WebP outputs to
  `priv/static/images/photos/{side}/`.

  Source files are gitignored; only the WebP outputs are committed.

  ## Usage

      mix bf.process_photos [options]

  ## Options

    * `--source PATH` — source directory containing `brilliant/` and `fantastic/`
      subdirectories (default: `priv/photos_source`)
    * `--output PATH` — output base directory; WebP files are written to
      `{output}/{side}/{name}-{width}.webp` (default: `priv/static/images/photos`)
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
  4. Commit the generated WebP files in `priv/static/images/photos/`.
  """

  use Mix.Task

  @switches [
    source: :string,
    output: :string,
    quality: :integer,
    widths: :string,
    force: :boolean
  ]

  @defaults [
    source: "priv/photos_source",
    output: "priv/static/images/photos",
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
    quality = opts[:quality]
    force = opts[:force]

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

    for side <- ["brilliant", "fantastic"] do
      process_side(side, source_dir, output_base, widths, quality, force)
    end
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

  defp all_up_to_date?(output_paths, src_mtime) do
    Enum.all?(output_paths, fn dest ->
      case File.stat(dest) do
        {:ok, %{mtime: mtime}} -> mtime >= src_mtime
        {:error, _} -> false
      end
    end)
  end

  defp generate_variants(src_path, output_paths, widths, quality) do
    results =
      Enum.zip(widths, output_paths)
      |> Enum.reduce_while({:ok, 0}, fn {width, dest}, {:ok, acc_bytes} ->
        case generate_one(src_path, dest, width, quality) do
          {:ok, bytes} -> {:cont, {:ok, acc_bytes + bytes}}
          {:error, _} = err -> {:halt, err}
        end
      end)

    results
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
