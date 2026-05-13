defmodule BrilliantFantasticWeb.ForHireController do
  use BrilliantFantasticWeb, :controller

  alias BrilliantFantastic.Photos

  def index(conn, _params) do
    conn
    |> assign(:page_title, "For Hire")
    |> assign(
      :page_description,
      "Hire Jamie Wright — principal-level software engineer with 20+ years of experience. Available for contract or full-time work."
    )
    |> assign(:page_url_path, "/for_hire")
    |> assign(:brilliant_photos, Photos.all(:brilliant))
    |> assign(:fantastic_photos, Photos.all(:fantastic))
    |> render(:index)
  end
end
