defmodule WatcherOver.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  def start(_type, _args) do
    children = [
      # Start the Ecto repository
      WatcherOver.Repo,
      # Start the Telemetry supervisor
      WatcherOverWeb.Telemetry,
      # Start the PubSub system
      {Phoenix.PubSub, name: WatcherOver.PubSub},
      # Start the Endpoint (http/https)
      WatcherOverWeb.Endpoint,
      # Starts a worker by calling: WatcherOver.Worker.start_link(arg)
      # {WatcherOver.Worker, arg},
      WatcherOver.Scheduler
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: WatcherOver.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  def config_change(changed, _new, removed) do
    WatcherOverWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
