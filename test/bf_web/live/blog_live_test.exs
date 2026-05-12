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
  end
end
