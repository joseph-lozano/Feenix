defmodule Feenix.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  def start(_type, _args) do
    children = [
      # Start the Ecto repository
      Feenix.Repo,
      # Start the Telemetry supervisor
      FeenixWeb.Telemetry,
      # Start the PubSub system
      {Phoenix.PubSub, name: Feenix.PubSub},
      # Start the Endpoint (http/https)
      FeenixWeb.Endpoint
      # Start a worker by calling: Feenix.Worker.start_link(arg)
      # {Feenix.Worker, arg}
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: Feenix.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  def config_change(changed, _new, removed) do
    FeenixWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
