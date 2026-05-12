defmodule BrilliantFantasticWeb.ForHireController do
  use BrilliantFantasticWeb, :controller

  alias BrilliantFantastic.Photos

  def index(conn, _params) do
    conn
    |> assign(:page_title, "For Hire")
    |> assign(:brilliant_photos, Photos.all(:brilliant))
    |> assign(:fantastic_photos, Photos.all(:fantastic))
    |> render(:index)
  end
end
