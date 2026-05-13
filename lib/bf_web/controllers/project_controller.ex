defmodule BrilliantFantasticWeb.ProjectController do
  use BrilliantFantasticWeb, :controller

  alias BrilliantFantastic.Projects

  def index(conn, _params) do
    conn
    |> assign(:page_title, "Projects")
    |> assign(
      :page_description,
      "A look at some of the projects Jamie Wright and Brilliant Fantastic have shipped over the years."
    )
    |> assign(:page_url_path, "/projects")
    |> assign(:projects, Projects.all_projects())
    |> render(:index)
  end
end
