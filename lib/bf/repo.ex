defmodule BrilliantFantastic.Repo do
  use Ecto.Repo,
    otp_app: :bf,
    adapter: Ecto.Adapters.Postgres
end
