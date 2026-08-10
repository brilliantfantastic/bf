defmodule BrilliantFantasticWeb.TrailingSlashPlug do
  @moduledoc """
  301-redirects any request path with a trailing slash (except the root
  "/") to its canonical slash-free form, preserving the query string.

  Phoenix strips trailing slashes when matching routes, so `/blog/` and
  `/blog` both render the same page with a `200`. Left alone, that
  produces duplicate URLs that Google Search Console reports as
  "Alternate page with proper canonical tag". Redirecting collapses the
  variants onto the single canonical URL.
  """
  import Plug.Conn

  def init(opts), do: opts

  def call(%Plug.Conn{request_path: path} = conn, _opts) when path != "/" do
    if trailing_slash?(path) do
      redirect_to_canonical(conn, clean_trailing_slash(path))
    else
      conn
    end
  end

  def call(conn, _opts), do: conn

  defp trailing_slash?(path), do: String.ends_with?(path, "/")

  defp clean_trailing_slash(path) do
    case String.trim_trailing(path, "/") do
      "" -> "/"
      trimmed -> trimmed
    end
  end

  defp redirect_to_canonical(conn, target) do
    query = if conn.query_string != "", do: "?#{conn.query_string}", else: ""

    conn
    |> put_resp_header("location", target <> query)
    |> send_resp(301, "")
    |> halt()
  end
end
