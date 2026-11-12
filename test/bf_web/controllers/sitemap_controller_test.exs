defmodule BrilliantFantasticWeb.SitemapControllerTest do
  use BrilliantFantasticWeb.ConnCase

  alias BrilliantFantastic.Blog
  alias BrilliantFantastic.Talks

  test "GET /sitemap.xml returns an XML sitemap", %{conn: conn} do
    conn = get(conn, ~p"/sitemap.xml")

    assert response_content_type(conn, :xml)

    body = response(conn, 200)

    assert body =~ ~s(<urlset xmlns="http://www.sitemaps.org/schemas/sitemap/0.9">)
    assert body =~ "<loc>"
  end

  test "sitemap lists the static pages", %{conn: conn} do
    body = conn |> get(~p"/sitemap.xml") |> response(200)

    for path <- ["/", "/blog", "/projects", "/for_hire"] do
      assert body =~ "<loc>#{BrilliantFantasticWeb.Endpoint.url()}#{path}</loc>"
    end
  end

  test "sitemap lists every published blog post with a lastmod", %{conn: conn} do
    body = conn |> get(~p"/sitemap.xml") |> response(200)

    for post <- Blog.published_posts() do
      assert body =~ "/blog/#{post.id}</loc>"
      assert body =~ "<lastmod>#{Date.to_iso8601(post.date)}</lastmod>"
    end
  end

  test "sitemap does not list unpublished posts", %{conn: conn} do
    body = conn |> get(~p"/sitemap.xml") |> response(200)

    unpublished = Blog.all_posts() -- Blog.published_posts()

    for post <- unpublished do
      refute body =~ "/blog/#{post.id}</loc>"
    end
  end

  test "sitemap lists every published talk page with a lastmod", %{conn: conn} do
    body = conn |> get(~p"/sitemap.xml") |> response(200)

    assert [_ | _] = Talks.published_talks()

    for talk <- Talks.published_talks() do
      assert body =~ "/jamie/talks/#{talk.id}/thankyou</loc>"
      assert body =~ "<lastmod>#{Date.to_iso8601(talk.date)}</lastmod>"
    end
  end

  test "sitemap does not list unpublished talks", %{conn: conn} do
    body = conn |> get(~p"/sitemap.xml") |> response(200)

    for talk <- Talks.all_talks() -- Talks.published_talks() do
      refute body =~ "/jamie/talks/#{talk.id}/thankyou</loc>"
    end
  end
end
