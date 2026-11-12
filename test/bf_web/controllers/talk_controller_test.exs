defmodule BrilliantFantasticWeb.TalkControllerTest do
  use BrilliantFantasticWeb.ConnCase

  test "GET /jamie/talks/:id redirects to the talk's thank-you page", %{conn: conn} do
    conn = get(conn, ~p"/jamie/talks/2026-exmex")

    assert redirected_to(conn, 301) == ~p"/jamie/talks/2026-exmex/thankyou"
  end

  describe "GET /:year/:event" do
    test "redirects a published talk to its thank-you page", %{conn: conn} do
      conn = get(conn, "/2026/exmex")

      assert redirected_to(conn, 302) == ~p"/jamie/talks/2026-exmex/thankyou"
    end

    test "is a 404 for a year with no matching talk", %{conn: conn} do
      assert_error_sent 404, fn -> get(conn, "/1999/nope") end
    end

    test "is a 404 when the first segment isn't a four-digit year", %{conn: conn} do
      assert_error_sent 404, fn -> get(conn, "/jamie/exmex") end
      assert_error_sent 404, fn -> get(conn, "/26/exmex") end
    end
  end
end
