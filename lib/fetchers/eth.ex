defmodule GasStation.Fetchers.Eth do
  alias GasStation.Fetchers.GasServer
  alias GasStation.Api

  use GasServer

  def handle_call(
    :fetch,
    _from,
    %{
      "last_updated" => last_updated
    } = state
  ) do
    now = :os.system_time(:millisecond)

    if now - 30_000 > last_updated do
      response = Api.Eth.fetch_response()
      IO.puts("Response: #{inspect(response)}")

      {:reply, response,
       %{
         "last_updated" => now,
         "last_response" => response
       }}
    else
      {:reply, state["last_response"], state}
    end
  end
end
