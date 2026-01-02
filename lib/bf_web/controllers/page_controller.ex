defmodule BrilliantFantasticWeb.PageController do
  use BrilliantFantasticWeb, :controller

  def home(conn, _params) do
    render(conn, :home)
  end
end
