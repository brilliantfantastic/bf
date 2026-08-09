defmodule BrilliantFantasticWeb.SitemapController do
  @moduledoc """
  Serves an XML sitemap at `/sitemap.xml`.

  Static routes are listed explicitly; blog posts are pulled from
  `Blog.published_posts/0` at request time so newly published posts
  appear without a redeploy. Every URL is absolute and uses the
  canonical (slash-free) form the pages declare in their `<link
  rel="canonical">` tags.
  """
  use BrilliantFantasticWeb, :controller

  alias BrilliantFantastic.Blog

  # Canonical paths for the static pages, matching each page's
  # `page_url_path` (and therefore its canonical tag).
  @static_paths ["/", "/blog", "/projects", "/for_hire"]

  def index(conn, _params) do
    base = BrilliantFantasticWeb.Endpoint.url()

    static_urls = Enum.map(@static_paths, fn path -> %{loc: base <> path} end)

    post_urls =
      Enum.map(Blog.published_posts(), fn post ->
        %{loc: base <> "/blog/#{post.id}", lastmod: Date.to_iso8601(post.date)}
      end)

    xml = render_sitemap(static_urls ++ post_urls)

    conn
    |> put_resp_content_type("application/xml")
    |> send_resp(200, xml)
  end

  defp render_sitemap(urls) do
    body = urls |> Enum.map_join("\n", &url_entry/1)

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

  defp escape(value) do
    value
    |> String.replace("&", "&amp;")
    |> String.replace("<", "&lt;")
    |> String.replace(">", "&gt;")
  end
end
