defmodule BrilliantFantasticWeb.TalkLiveTest do
  use BrilliantFantasticWeb.ConnCase

  import Phoenix.LiveViewTest

  describe "TalkLive.Show" do
    test "renders the slides section", %{conn: conn} do
      {:ok, view, _html} = live(conn, ~p"/jamie/talks/2026-exmex/thankyou")
      assert has_element?(view, "#talk-slides")
    end

    test "renders the notes body", %{conn: conn} do
      {:ok, view, _html} = live(conn, ~p"/jamie/talks/2026-exmex/thankyou")
      assert has_element?(view, "#talk-notes")
    end

    test "renders all configured sections", %{conn: conn} do
      {:ok, view, _html} = live(conn, ~p"/jamie/talks/2026-exmex/thankyou")

      assert has_element?(view, "#talk-section-hire")
      assert has_element?(view, "#talk-section-projects")
      assert has_element?(view, "#talk-section-recent-posts")
      assert has_element?(view, "#talk-section-contact")
    end

    test "redirects to home for a nonexistent talk id", %{conn: conn} do
      assert {:error, {:live_redirect, %{to: "/"}}} =
               live(conn, ~p"/jamie/talks/no-such-talk/thankyou")
    end

    test "embeds the Speaker Deck player and links to the deck", %{conn: conn} do
      {:ok, view, _html} = live(conn, ~p"/jamie/talks/2026-exmex/thankyou")

      assert has_element?(view, ~s(#talk-slides iframe[src^="https://speakerdeck.com/player/"]))
      assert has_element?(view, ~s(#talk-slides a[href^="https://speakerdeck.com/"]))
      refute has_element?(view, "#talk-slides-placeholder")
    end

    test "links the event label in the header to the event's site", %{conn: conn} do
      {:ok, view, _html} = live(conn, ~p"/jamie/talks/2026-exmex/thankyou")

      assert has_element?(view, ~s(#talk-header a#talk-event[href="https://exmexconf.com"]))
    end

    test "renders the talk header with event and title", %{conn: conn} do
      {:ok, view, _html} = live(conn, ~p"/jamie/talks/2026-exmex/thankyou")
      assert has_element?(view, "#talk-header")
    end
  end
end
