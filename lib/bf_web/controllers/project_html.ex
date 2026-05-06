defmodule BrilliantFantasticWeb.ProjectHTML do
  use BrilliantFantasticWeb, :html

  # Inline placeholder SVGs at compile time so they paint as part of the
  # parent layer instead of going through the <img> rasterization path —
  # 30+ rotated SVGs were causing long paint frames during scroll.
  for n <- 1..7 do
    @external_resource "priv/static/images/projects/placeholder-#{n}.svg"
  end

  @placeholder_svgs (for n <- 1..7, into: %{} do
                       path = "priv/static/images/projects/placeholder-#{n}.svg"

                       {"/images/projects/placeholder-#{n}.svg",
                        path |> File.read!() |> String.trim()}
                     end)

  embed_templates "project_html/*"

  attr :image, :map, required: true

  @doc """
  Renders a project image — inline SVG for known placeholder paths, plain
  `<img>` otherwise. Inline SVGs avoid the per-image raster step that was
  blowing the paint budget with 30+ rotated frames on screen.
  """
  def project_image(%{image: image} = assigns) do
    case Map.get(@placeholder_svgs, image.src) do
      nil ->
        ~H"""
        <img src={@image.src} alt={@image.alt} loading="lazy" />
        """

      svg ->
        assigns = assign(assigns, :svg, svg)

        ~H"""
        <span class="brutal-project-image-svg" role="img" aria-label={@image.alt}>
          {Phoenix.HTML.raw(@svg)}
        </span>
        """
    end
  end

  @doc """
  Formats a project timeline as `MMM YYYY → MMM YYYY` or `MMM YYYY → now`.
  """
  def format_timeline(%Date{} = started_on, :now) do
    "#{format_date(started_on)} → now"
  end

  def format_timeline(%Date{} = started_on, %Date{} = ended_on) do
    "#{format_date(started_on)} → #{format_date(ended_on)}"
  end

  defp format_date(%Date{} = date) do
    Calendar.strftime(date, "%b %Y")
  end

  @doc """
  Splits a description into paragraphs, treating each non-empty line as its own.
  """
  def paragraphs(description) when is_binary(description) do
    description
    |> String.split(~r/\n+/)
    |> Enum.map(&String.trim/1)
    |> Enum.reject(&(&1 == ""))
  end
end
