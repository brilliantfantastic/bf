defmodule BrilliantFantasticWeb.ProjectController do
  use BrilliantFantasticWeb, :controller

  def index(conn, _params) do
    render(conn, :index)
  end
end
