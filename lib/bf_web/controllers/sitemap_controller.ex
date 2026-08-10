defmodule BrilliantFantasticWeb.SitemapController do
  @moduledoc """
  Serves an XML sitemap at `/sitemap.xml`.

  Static routes are listed explicitly; blog posts are pulled from `Blog`
  (compiled in at build time by NimblePublisher). Every URL is absolute
  and uses the canonical (slash-free) form the pages declare in their
  `<link rel="canonical">` tags.
  """
  use BrilliantFantasticWeb, :controller

  alias BrilliantFantastic.Blog
  alias BrilliantFantasticWeb.SitemapHTML

  # Canonical paths for the static pages.
  @static_paths ["/", "/blog", "/projects", "/for_hire"]

  def index(conn, _params) do
    base = BrilliantFantasticWeb.Endpoint.url()

    static_urls = Enum.map(@static_paths, fn path -> %{loc: base <> path} end)

    published_blog_post_urls =
      Enum.map(Blog.published_posts(), fn post ->
        %{loc: base <> "/blog/#{post.id}", lastmod: Date.to_iso8601(post.date)}
      end)

    sitemap_urls = static_urls ++ published_blog_post_urls
    xml = SitemapHTML.to_xml(sitemap_urls)

    conn
    |> put_resp_content_type("application/xml")
    |> send_resp(200, xml)
  end
end
