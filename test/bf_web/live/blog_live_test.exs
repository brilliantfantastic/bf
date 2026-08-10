defmodule BrilliantFantasticWeb.BlogLiveTest do
  use BrilliantFantasticWeb.ConnCase

  import Phoenix.LiveViewTest

  describe "BlogLive.Index" do
    test "renders blog index with post titles", %{conn: conn} do
      {:ok, _view, html} = live(conn, ~p"/blog")
      assert html =~ "Blog"
      assert html =~ "Available Now"
    end

    test "displays post summary", %{conn: conn} do
      {:ok, _view, html} = live(conn, ~p"/blog")
      assert html =~ "A nice website overhaul is available now"
    end

    test "links to individual posts", %{conn: conn} do
      {:ok, view, _html} = live(conn, ~p"/blog")
      assert has_element?(view, "a[href='/blog/available-now']")
    end
  end

  describe "BlogLive.Show" do
    test "renders a single post with title and body", %{conn: conn} do
      {:ok, _view, html} = live(conn, ~p"/blog/available-now")
      assert html =~ "Available Now"
      assert html =~ "Poor Jamie"
      assert html =~ "Jamie Wright"
    end

    test "has back link to blog index", %{conn: conn} do
      {:ok, view, _html} = live(conn, ~p"/blog/available-now")
      assert has_element?(view, "a[href='/blog']")
    end

    test "redirects to blog index for nonexistent post", %{conn: conn} do
      assert {:error, {:live_redirect, %{to: "/blog"}}} =
               live(conn, ~p"/blog/nonexistent-post-id")
    end

    test "uses cover_image_alt as the cover image alt text and caption", %{conn: conn} do
      post = BrilliantFantastic.Blog.get_post_by_id("careless-spotify")
      {:ok, view, _html} = live(conn, ~p"/blog/careless-spotify")

      assert has_element?(view, "figure.brutal-cover img[alt='#{post.cover_image_alt}']")

      assert view |> element("figure.brutal-cover figcaption") |> render() =~
               post.cover_image_alt
    end

    test "renders no cover figure when the post has no cover image", %{conn: conn} do
      {:ok, view, _html} = live(conn, ~p"/blog/available-now")

      refute has_element?(view, "figure.brutal-cover")
    end

    test "sets og:image:alt from the cover image alt", %{conn: conn} do
      post = BrilliantFantastic.Blog.get_post_by_id("careless-spotify")
      html = conn |> get(~p"/blog/careless-spotify") |> html_response(200)

      assert html =~ ~s(property="og:image:alt" content="#{post.cover_image_alt}")
      assert html =~ ~s(name="twitter:image:alt" content="#{post.cover_image_alt}")
    end

    test "omits og:image:alt when the post has no cover image", %{conn: conn} do
      html = conn |> get(~p"/blog/available-now") |> html_response(200)

      refute html =~ "og:image:alt"
    end
  end
end
