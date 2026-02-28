defmodule BrilliantFantasticWeb.HomeLive do
  use BrilliantFantasticWeb, :live_view

  alias BrilliantFantasticWeb.Components.Illustrations

  embed_templates "home_live/*"

  def mount(_params, _session, socket) do
    {:ok, socket}
  end
end
