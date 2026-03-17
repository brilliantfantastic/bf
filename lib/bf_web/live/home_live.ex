defmodule BrilliantFantasticWeb.HomeLive do
  use BrilliantFantasticWeb, :live_view

  alias BrilliantFantasticWeb.Components.Illustrations

  @directions ~w(
    transformation typography_art generative_canvas world_building
    anti_hero marquee typewriter chromatic tilt fragments
    neon_noir liquid terminal brutalist botanical holographic
    cosmic kaleidoscope
  )

  embed_templates "home_live/*"
  embed_templates "home_live/heroes/*"

  def mount(_params, _session, socket) do
    {:ok, assign(socket, :direction, Enum.random(@directions))}
  end

  def handle_event("randomize-direction", _params, socket) do
    {:noreply, assign(socket, :direction, Enum.random(@directions))}
  end
end
