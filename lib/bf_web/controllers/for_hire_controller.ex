defmodule BrilliantFantasticWeb.ForHireController do
  use BrilliantFantasticWeb, :controller

  def index(conn, _params) do
    conn
    |> assign(:page_title, "For Hire")
    |> render(:index)
  end
end
