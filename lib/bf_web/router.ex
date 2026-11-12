defmodule BrilliantFantasticWeb.Router do
  use BrilliantFantasticWeb, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_live_flash
    plug :put_root_layout, html: {BrilliantFantasticWeb.Layouts, :root}
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", BrilliantFantasticWeb do
    pipe_through :browser

    live "/", HomeLive
    live "/blog", BlogLive.Index, :index
    live "/blog/:id", BlogLive.Show, :show
    live "/jamie/talks/:id/thankyou", TalkLive.Show, :show
    get "/jamie/talks/:id", TalkController, :show
    get "/projects", ProjectController, :index
    get "/for_hire", ForHireController, :index
    get "/for-hire", ForHireController, :index
    get "/sitemap.xml", SitemapController, :index
  end

  # Other scopes may use custom stacks.
  # scope "/api", BrilliantFantasticWeb do
  #   pipe_through :api
  # end

  # Enable LiveDashboard and Swoosh mailbox preview in development
  if Application.compile_env(:bf, :dev_routes) do
    # If you want to use the LiveDashboard in production, you should put
    # it behind authentication and allow only admins to access it.
    # If your application does not have an admins-only section yet,
    # you can use Plug.BasicAuth to set up some basic authentication
    # as long as you are also using SSL (which you should anyway).
    import Phoenix.LiveDashboard.Router

    scope "/dev" do
      pipe_through :browser

      live_dashboard "/dashboard", metrics: BrilliantFantasticWeb.Telemetry
      forward "/mailbox", Plug.Swoosh.MailboxPreview
    end
  end

  # Short talk URLs: /2026/exmex -> the 2026-exmex talk. This matches any
  # two-segment path, so it stays last; the controller 404s anything that
  # isn't a year plus a published talk.
  scope "/", BrilliantFantasticWeb do
    pipe_through :browser

    get "/:year/:event", TalkController, :short
  end
end
