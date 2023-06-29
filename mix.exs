defmodule GasStation.MixProject do
  use Mix.Project

  def project do
    [
      app: :gas_station,
      version: "0.1.0",
      elixir: "~> 1.15",
      start_permanent: Mix.env() == :prod,
      deps: deps()
    ]
  end

  def application do
    [
      extra_applications: [:logger],
      mod: {GasStation.Application, []}
    ]
  end

  defp deps do
    [
      {:httpoison, "~> 2.0"},
      {:poison, "~> 5.0"},
      {:plug_cowboy, "~> 2.0"}
    ]
  end
end
