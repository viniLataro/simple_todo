defmodule SimpleTodo.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      # Start the Telemetry supervisor
      SimpleTodoWeb.Telemetry,
      # Start the Ecto repository
      SimpleTodo.Repo,
      # Start the PubSub system
      {Phoenix.PubSub, name: SimpleTodo.PubSub},
      # Start Finch
      {Finch, name: SimpleTodo.Finch},
      # Start the Endpoint (http/https)
      SimpleTodoWeb.Endpoint
      # Start a worker by calling: SimpleTodo.Worker.start_link(arg)
      # {SimpleTodo.Worker, arg}
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: SimpleTodo.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  @impl true
  def config_change(changed, _new, removed) do
    SimpleTodoWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
