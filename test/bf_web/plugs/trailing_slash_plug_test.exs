defmodule BrilliantFantasticWeb.TrailingSlashPlugTest do
  use BrilliantFantasticWeb.ConnCase

  test "redirects a trailing-slash path to its canonical form", %{conn: conn} do
    conn = get(conn, "/blog/")

    assert redirected_to(conn, 301) == "/blog"
  end

  test "preserves the query string when redirecting", %{conn: conn} do
    conn = get(conn, "/blog/?page=2")

    assert redirected_to(conn, 301) == "/blog?page=2"
  end

  test "leaves the root path untouched", %{conn: conn} do
    conn = get(conn, "/")

    assert conn.status == 200
  end

  test "leaves slash-free paths untouched", %{conn: conn} do
    conn = get(conn, ~p"/blog")

    assert conn.status == 200
  end
end
