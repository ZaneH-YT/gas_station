defmodule GasStation.Fetchers.GasServer do
  defmacro __using__(_opts) do
    quote do
      use GenServer

      def get(), do: GenServer.call(__MODULE__, :fetch)

      def init(init_arg) do
        {:ok, init_arg}
      end

      def start_link(_opts) do
        GenServer.start_link(
          __MODULE__,
          %{
            "last_updated" => 0,
            "last_response" => nil
          },
          name: __MODULE__
        )
      end
    end
  end
end
