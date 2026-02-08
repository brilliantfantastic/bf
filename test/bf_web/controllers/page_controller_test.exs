defmodule BrilliantFantasticWeb.HomeLiveTest do
  use BrilliantFantasticWeb.ConnCase

  import Phoenix.LiveViewTest

  test "GET /", %{conn: conn} do
    {:ok, _view, html} = live(conn, ~p"/")
    assert html =~ "Brilliant Fantastic"
  end
end
