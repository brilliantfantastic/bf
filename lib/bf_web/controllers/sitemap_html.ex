defmodule BrilliantFantasticWeb.SitemapHTML do
  @moduledoc """
  Renders the `sitemaps.org` XML document served by `SitemapController`.
  """

  @doc """
  Renders a list of URL maps as a sitemap XML document.

  Each entry is a `%{loc: String.t()}` map with an optional `:lastmod`
  (an ISO-8601 date string).
  """
  def to_xml(urls) do
    body = Enum.map_join(urls, "\n", &url_entry/1)

    """
    <?xml version="1.0" encoding="UTF-8"?>
    <urlset xmlns="http://www.sitemaps.org/schemas/sitemap/0.9">
    #{body}
    </urlset>
    """
  end

  defp url_entry(%{loc: loc} = url) do
    lastmod =
      case url do
        %{lastmod: lastmod} -> "<lastmod>#{escape(lastmod)}</lastmod>"
        _ -> ""
      end

    "  <url><loc>#{escape(loc)}</loc>#{lastmod}</url>"
  end

  # Escape via Phoenix.HTML so `&`, `<`, `>`, and quotes become their
  # matching entities (all valid in XML text).
  defp escape(value) do
    value |> Phoenix.HTML.html_escape() |> Phoenix.HTML.safe_to_string()
  end
end
