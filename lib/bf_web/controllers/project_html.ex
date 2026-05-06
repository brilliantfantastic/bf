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

  @status_titles %{
    current: "Currently active",
    retired: "Retired",
    hiatus: "On hiatus",
    upcoming: "Coming soon"
  }

  @doc """
  Human-readable label for a project status — used as the tooltip on the
  status dot.
  """
  def status_title(status), do: Map.get(@status_titles, status, "Unknown status")

  @doc """
  Renders a project description as HTML, treating each non-empty line as its
  own paragraph and supporting inline markdown.

  Per-link `target="_blank"` is supported via Earmark's IAL syntax:

      [Keith](https://github.com/keiththomps){: target="_blank"}

  Any link rendered with `target="_blank"` automatically gets
  `rel="noopener noreferrer"` added for security.

  Uses Earmark (already pulled in transitively via nimble_publisher).
  """
  def render_description(description) when is_binary(description) do
    description
    |> normalize_paragraphs()
    |> Earmark.as_html!(escape: false, smartypants: false)
    |> add_noopener_to_blank_links()
    |> Phoenix.HTML.raw()
  end

  # Treats single newlines as paragraph breaks so existing descriptions keep
  # rendering as separate paragraphs without needing to be reformatted with
  # blank lines between them.
  defp normalize_paragraphs(text) do
    text
    |> String.split(~r/\n+/)
    |> Enum.map(&String.trim/1)
    |> Enum.reject(&(&1 == ""))
    |> Enum.join("\n\n")
  end

  # Adds rel="noopener noreferrer" to any <a target="_blank"> that doesn't
  # already have a rel attribute. Prevents window.opener leakage from
  # newly-opened tabs.
  defp add_noopener_to_blank_links(html) do
    Regex.replace(~r{<a\b([^>]*\btarget="_blank"[^>]*)>}, html, fn match, attrs ->
      if Regex.match?(~r/\brel=/, attrs) do
        match
      else
        ~s(<a #{String.trim(attrs)} rel="noopener noreferrer">)
      end
    end)
  end
end
