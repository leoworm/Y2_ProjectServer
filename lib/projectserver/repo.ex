defmodule Projectserver.Repo do
  use Ecto.Repo,
    otp_app: :projectserver,
    adapter: Ecto.Adapters.Postgres
end
