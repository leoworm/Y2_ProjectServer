defmodule Projectserver.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      # Start the Ecto repository
      Projectserver.Repo,
      # Start the Telemetry supervisor
      ProjectserverWeb.Telemetry,
      # Start the PubSub system
      {Phoenix.PubSub, name: Projectserver.PubSub},
      # Start the Endpoint (http/https)
      ProjectserverWeb.Endpoint
      # Start a worker by calling: Projectserver.Worker.start_link(arg)
      # {Projectserver.Worker, arg}
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: Projectserver.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  @impl true
  def config_change(changed, _new, removed) do
    ProjectserverWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
