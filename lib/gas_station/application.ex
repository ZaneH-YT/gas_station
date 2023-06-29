defmodule GasStation.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      GasStation.Fetchers.Eth,
      GasStation.Fetchers.Polygon,
      Plug.Cowboy.child_spec(
        scheme: :http,
        plug: GasStation.Endpoint,
        options: [port: 4000]
      )
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: GasStation.Supervisor]
    Supervisor.start_link(children, opts)
  end
end
