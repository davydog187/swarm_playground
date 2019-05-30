defmodule SwarmPlayground.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

o

  def start(_type, _args) do
    # List all child processes to be supervised
    children = [
      # Starts a worker by calling: SwarmPlayground.Worker.start_link(arg)
      # {SwarmPlayground.Worker, arg}
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: SwarmPlayground.Supervisor]
    Supervisor.start_link(children, opts)
  end
end
