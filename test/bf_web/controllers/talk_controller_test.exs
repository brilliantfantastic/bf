defmodule BrilliantFantasticWeb.TalkControllerTest do
  use BrilliantFantasticWeb.ConnCase

  test "GET /jamie/talks/:id redirects to the talk's thank-you page", %{conn: conn} do
    conn = get(conn, ~p"/jamie/talks/2026-exmex")

    assert redirected_to(conn, 301) == ~p"/jamie/talks/2026-exmex/thankyou"
  end
end
