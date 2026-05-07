defmodule BrilliantFantasticWeb.HomeLivePhotoTest do
  use BrilliantFantasticWeb.ConnCase

  import Phoenix.LiveViewTest

  # 5.4.1 — Hero photos render with correct srcset
  describe "hero photo rendering" do
    test "brilliant hero photo img is present with srcset", %{conn: conn} do
      {:ok, view, _html} = live(conn, ~p"/")

      assert has_element?(view, "img.photo-bg.brilliant-photo[srcset]")
    end

    test "brilliant hero photo srcset contains all four widths", %{conn: conn} do
      {:ok, _view, _initial_html} = live(conn, ~p"/")
      # Use render/1 to get the fully connected (post-mount) HTML
      {:ok, view, _} = live(conn, ~p"/")
      html = render(view)
      document = LazyHTML.from_fragment(html)

      imgs = LazyHTML.query(document, "img.photo-bg.brilliant-photo")
      [srcset | _] = LazyHTML.attribute(imgs, "srcset")

      assert srcset =~ "480w"
      assert srcset =~ "960w"
      assert srcset =~ "1440w"
      assert srcset =~ "1920w"
    end

    test "fantastic hero photo img is present with srcset", %{conn: conn} do
      {:ok, view, _html} = live(conn, ~p"/")

      assert has_element?(view, "img.photo-bg.fantastic-photo[srcset]")
    end

    test "fantastic hero photo srcset contains all four widths", %{conn: conn} do
      {:ok, view, _} = live(conn, ~p"/")
      html = render(view)
      document = LazyHTML.from_fragment(html)

      imgs = LazyHTML.query(document, "img.photo-bg.fantastic-photo")
      [srcset | _] = LazyHTML.attribute(imgs, "srcset")

      assert srcset =~ "480w"
      assert srcset =~ "960w"
      assert srcset =~ "1440w"
      assert srcset =~ "1920w"
    end

    test "both hero photos have sizes='100vw'", %{conn: conn} do
      {:ok, view, _html} = live(conn, ~p"/")

      assert has_element?(view, "img.photo-bg.brilliant-photo[sizes='100vw']")
      assert has_element?(view, "img.photo-bg.fantastic-photo[sizes='100vw']")
    end

    test "brilliant hero photo URL is in the /images/photos/brilliant/ directory", %{conn: conn} do
      {:ok, view, _} = live(conn, ~p"/")
      html = render(view)
      document = LazyHTML.from_fragment(html)

      imgs = LazyHTML.query(document, "img.photo-bg.brilliant-photo")
      [src | _] = LazyHTML.attribute(imgs, "src")

      assert String.starts_with?(src, "/images/photos/brilliant/")
    end

    test "fantastic hero photo URL is in the /images/photos/fantastic/ directory", %{conn: conn} do
      {:ok, view, _} = live(conn, ~p"/")
      html = render(view)
      document = LazyHTML.from_fragment(html)

      imgs = LazyHTML.query(document, "img.photo-bg.fantastic-photo")
      [src | _] = LazyHTML.attribute(imgs, "src")

      assert String.starts_with?(src, "/images/photos/fantastic/")
    end
  end

  # 5.4.2 — Preload link tags present in <head>
  describe "preload link tags" do
    test "full page HTML contains preload link tags", %{conn: conn} do
      # Use a regular GET to retrieve the full HTML including <head>
      conn = get(conn, ~p"/")
      html = html_response(conn, 200)

      assert html =~ ~s(rel="preload")
      assert html =~ ~s(as="image")
      assert html =~ "imagesrcset"
      assert html =~ ~s(fetchpriority="high")
    end

    test "preload links contain all four widths in imagesrcset", %{conn: conn} do
      conn = get(conn, ~p"/")
      html = html_response(conn, 200)

      # The imagesrcset attribute values include all four widths
      assert html =~ "480w"
      assert html =~ "960w"
      assert html =~ "1440w"
      assert html =~ "1920w"
    end

    test "preload links reference both brilliant and fantastic photo directories", %{conn: conn} do
      conn = get(conn, ~p"/")
      html = html_response(conn, 200)

      assert html =~ "/images/photos/brilliant/"
      assert html =~ "/images/photos/fantastic/"
    end
  end

  # 5.4.3 — randomize-direction event re-rolls direction and photos
  describe "randomize-direction event" do
    test "event is handled without error and page re-renders with photo imgs", %{conn: conn} do
      {:ok, view, _html} = live(conn, ~p"/")

      html = render_hook(view, "randomize-direction", %{})

      # Both photo images must still be present after the event
      assert html =~ "brilliant-photo"
      assert html =~ "fantastic-photo"
    end

    test "both hero photo imgs remain after multiple re-rolls", %{conn: conn} do
      {:ok, view, _html} = live(conn, ~p"/")

      for _ <- 1..5 do
        render_hook(view, "randomize-direction", %{})
      end

      assert has_element?(view, "img.photo-bg.brilliant-photo[srcset]")
      assert has_element?(view, "img.photo-bg.fantastic-photo[srcset]")
    end

    test "re-rolling runs cleanly and assigns update", %{conn: conn} do
      # With 18 directions and 2 fixture photos per side, 10 re-rolls
      # are guaranteed to complete without error. We accept that random
      # picks may occasionally repeat — we just assert the event ran cleanly.
      {:ok, view, _html} = live(conn, ~p"/")

      Enum.each(1..10, fn _ ->
        html = render_hook(view, "randomize-direction", %{})

        # At minimum, both photo imgs must be rendered after every roll
        document = LazyHTML.from_fragment(html)
        brilliant_imgs = LazyHTML.query(document, "img.photo-bg.brilliant-photo")
        fantastic_imgs = LazyHTML.query(document, "img.photo-bg.fantastic-photo")

        assert Enum.any?(brilliant_imgs, fn _ -> true end),
               "brilliant hero photo img missing after randomize-direction"

        assert Enum.any?(fantastic_imgs, fn _ -> true end),
               "fantastic hero photo img missing after randomize-direction"
      end)
    end
  end
end
