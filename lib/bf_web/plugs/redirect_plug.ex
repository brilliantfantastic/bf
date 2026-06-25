defmodule BrilliantFantasticWeb.RedirectPlug do
  import Plug.Conn

  def init(opts), do: opts

  def call(%Plug.Conn{host: "brilliantfantastic.com"} = conn, _opts) do
    query = if conn.query_string != "", do: "?#{conn.query_string}", else: ""

    conn
    |> put_resp_header("location", "https://bf.lol#{conn.request_path}#{query}")
    |> send_resp(301, "")
    |> halt()
  end

  def call(conn, _opts), do: conn
end
