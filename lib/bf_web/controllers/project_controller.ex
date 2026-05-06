defmodule BrilliantFantasticWeb.ProjectController do
  use BrilliantFantasticWeb, :controller

  alias BrilliantFantastic.Projects

  def index(conn, _params) do
    conn
    |> assign(:page_title, "Projects")
    |> assign(:projects, Projects.all_projects())
    |> render(:index)
  end
end
