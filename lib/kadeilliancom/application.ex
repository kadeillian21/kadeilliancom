defmodule Kadeilliancom.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      # Start the Ecto repository
      Kadeilliancom.Repo,
      # Start the Telemetry supervisor
      KadeilliancomWeb.Telemetry,
      # Start the PubSub system
      {Phoenix.PubSub, name: Kadeilliancom.PubSub},
      # Start the Endpoint (http/https)
      KadeilliancomWeb.Endpoint
      # Start a worker by calling: Kadeilliancom.Worker.start_link(arg)
      # {Kadeilliancom.Worker, arg}
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: Kadeilliancom.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  @impl true
  def config_change(changed, _new, removed) do
    KadeilliancomWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
