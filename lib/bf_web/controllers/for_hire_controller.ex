defmodule BrilliantFantasticWeb.ForHireController do
  use BrilliantFantasticWeb, :controller

  def index(conn, _params) do
    render(conn, :index)
  end
end
