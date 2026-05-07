defmodule BrilliantFantastic.Photos do
  @moduledoc """
  Compile-time registry of hero background photos.

  Scans `priv/static/images/photos/{brilliant,fantastic}/*-960.webp` at
  compile time. Uses `@external_resource` so adding or removing WebP files
  triggers a recompile of this module.

  ## Public API

      BrilliantFantastic.Photos.random(:brilliant)
      #=> %{name: "headshot-01", side: :brilliant}  (or nil when pool is empty)

      BrilliantFantastic.Photos.srcset(%{name: "headshot-01", side: :brilliant})
      #=> "/images/photos/brilliant/headshot-01-480.webp 480w, ..."

      BrilliantFantastic.Photos.src(%{name: "headshot-01", side: :brilliant})
      #=> "/images/photos/brilliant/headshot-01-960.webp"
  """

  @photos_dir Path.expand("../../priv/static/images/photos", __DIR__)
  @sides [:brilliant, :fantastic]
  @widths [480, 960, 1440, 1920]

  # Register each matched WebP as an external resource so file changes trigger
  # recompilation.
  for side <- @sides,
      file <- Path.wildcard(Path.join(@photos_dir, "#{side}/*-960.webp")) do
    @external_resource file
  end

  @brilliant_photos Path.join(@photos_dir, "brilliant/*-960.webp")
                    |> Path.wildcard()
                    |> Enum.map(&Path.basename(&1, "-960.webp"))
                    |> Enum.sort()

  @fantastic_photos Path.join(@photos_dir, "fantastic/*-960.webp")
                    |> Path.wildcard()
                    |> Enum.map(&Path.basename(&1, "-960.webp"))
                    |> Enum.sort()

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

  @doc false
  def pick([], _side), do: nil
  def pick(names, side), do: %{name: Enum.random(names), side: side}
end
