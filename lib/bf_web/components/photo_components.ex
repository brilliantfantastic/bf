defmodule BrilliantFantasticWeb.PhotoComponents do
  @moduledoc """
  Function components for rendering hero background photos.

  Two components are provided:

  - `<.hero_photo>` — renders a positioned `<img>` with responsive `srcset`.
  - `<.preload_photo>` — renders a `<link rel="preload">` tag for LCP improvement.

  Both components render nothing when `photo` is `nil`, so callers don't need
  to guard against an empty photo pool.
  """

  use Phoenix.Component

  alias BrilliantFantastic.Photos

  attr :photo, :map, default: nil, doc: "Photo map with :name and :side keys, or nil"
  attr :class, :string, default: nil, doc: "Additional CSS classes appended to hero-photo"

  @doc """
  Renders a hero photo `<img>` with responsive srcset, or nothing if photo is nil.
  """
  def hero_photo(%{photo: nil} = assigns), do: ~H""

  def hero_photo(assigns) do
    ~H"""
    <img
      class={["hero-photo", @class]}
      src={Photos.src(@photo)}
      srcset={Photos.srcset(@photo)}
      sizes="100vw"
      alt=""
      decoding="async"
    />
    """
  end

  attr :photo, :map, default: nil, doc: "Photo map with :name and :side keys, or nil"

  @doc """
  Renders a `<link rel="preload">` tag for the given photo, or nothing if photo is nil.
  """
  def preload_photo(%{photo: nil} = assigns), do: ~H""

  def preload_photo(assigns) do
    ~H"""
    <link
      rel="preload"
      as="image"
      imagesrcset={Photos.srcset(@photo)}
      imagesizes="100vw"
      fetchpriority="high"
    />
    """
  end
end
