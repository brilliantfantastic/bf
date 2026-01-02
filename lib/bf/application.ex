defmodule BrilliantFantastic.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      BrilliantFantasticWeb.Telemetry,
      BrilliantFantastic.Repo,
      {DNSCluster, query: Application.get_env(:bf, :dns_cluster_query) || :ignore},
      {Phoenix.PubSub, name: BrilliantFantastic.PubSub},
      # Start a worker by calling: BrilliantFantastic.Worker.start_link(arg)
      # {BrilliantFantastic.Worker, arg},
      # Start to serve requests, typically the last entry
      BrilliantFantasticWeb.Endpoint
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: BrilliantFantastic.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  @impl true
  def config_change(changed, _new, removed) do
    BrilliantFantasticWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
