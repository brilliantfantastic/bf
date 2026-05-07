defmodule BrilliantFantastic.Photos do
  @moduledoc """
  Compile-time registry of hero background photos.

  Reads photo names from a manifest file at compile time. The manifest path
  defaults to `priv/photos.manifest` but can be overridden per environment via:

      config :bf, :photos_manifest, "/absolute/path/to/photos.manifest"

  Uses `@external_resource` on the manifest so any change to it (e.g. after
  running `mix bf.process_photos`) triggers an automatic recompile of this
  module without needing `mix compile --force` or a server restart.

  If the manifest doesn't exist yet (fresh checkout, no photos processed),
  both pools are empty and `random/1` returns `nil`.

  ## Public API

      BrilliantFantastic.Photos.random(:brilliant)
      #=> %{name: "headshot-01", side: :brilliant}  (or nil when pool is empty)

      BrilliantFantastic.Photos.srcset(%{name: "headshot-01", side: :brilliant})
      #=> "/images/photos/brilliant/headshot-01-480.webp 480w, ..."

      BrilliantFantastic.Photos.src(%{name: "headshot-01", side: :brilliant})
      #=> "/images/photos/brilliant/headshot-01-960.webp"
  """

  @manifest_path Application.compile_env(
                   :bf,
                   :photos_manifest,
                   Path.expand("../../priv/photos.manifest", __DIR__)
                 )

  @widths [480, 960, 1440, 1920]

  @external_resource @manifest_path

  # Parse the manifest at compile time, returning %{brilliant: [...], fantastic: [...]}.
  # Falls back to empty lists when the file doesn't exist (e.g. fresh checkout).
  {brilliant_photos, fantastic_photos} =
    case File.read(@manifest_path) do
      {:error, _} ->
        {[], []}

      {:ok, content} ->
        %{brilliant: b, fantastic: f} =
          content
          |> String.split("\n")
          |> Enum.reduce(%{current: nil, brilliant: [], fantastic: []}, fn line, acc ->
            line = String.trim(line)

            cond do
              line == "[brilliant]" -> %{acc | current: :brilliant}
              line == "[fantastic]" -> %{acc | current: :fantastic}
              line == "" -> acc
              acc.current != nil -> Map.update!(acc, acc.current, &[line | &1])
              true -> acc
            end
          end)
          |> then(fn acc ->
            %{
              brilliant: acc.brilliant |> Enum.reverse() |> Enum.sort(),
              fantastic: acc.fantastic |> Enum.reverse() |> Enum.sort()
            }
          end)

        {b, f}
    end

  @brilliant_photos brilliant_photos
  @fantastic_photos fantastic_photos

  @doc "Returns a random photo map for the given side, or nil if the pool is empty."
  @spec random(:brilliant | :fantastic) :: %{name: String.t(), side: atom()} | nil
  def random(:brilliant), do: pick(@brilliant_photos, :brilliant)
  def random(:fantastic), do: pick(@fantastic_photos, :fantastic)

  @doc "Returns a responsive srcset string with all four widths."
  @spec srcset(%{name: String.t(), side: atom()}) :: String.t()
  def srcset(%{name: name, side: side}) do
    Enum.map_join(@widths, ", ", fn w ->
      "/images/photos/#{side}/#{name}-#{w}.webp #{w}w"
    end)
  end

  @doc "Returns the 960w URL — the default src for the photo."
  @spec src(%{name: String.t(), side: atom()}) :: String.t()
  def src(%{name: name, side: side}), do: "/images/photos/#{side}/#{name}-960.webp"

  # nil-safe: returns nil when pool is empty (e.g. no photos processed yet).
  defp pick(names, side) do
    case names do
      [] -> nil
      _ -> %{name: Enum.random(names), side: side}
    end
  end
end
