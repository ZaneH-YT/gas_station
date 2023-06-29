defmodule GasStation.Endpoint do
  use Plug.Router
  alias GasStation.Fetchers.{Eth, Polygon}

  plug(Plug.Logger)
  plug(:match)
  plug(Plug.Parsers, parsers: [:json], json_decoder: Poison)
  plug(:dispatch)

  get "/gas/eth" do
    {:ok, gas_info} = Eth.get()
    send_resp(conn, 200, Poison.encode!(gas_info))
  end

  get "/gas/polygon" do
    {:ok, gas_info} = Polygon.get()
    send_resp(conn, 200, Poison.encode!(gas_info))
  end

  match _ do
    send_resp(conn, 404, "Not found")
  end
end
