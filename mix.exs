defmodule SwarmPlayground.MixProject do
  use Mix.Project

  def project do
    [
      app: :swarm_playground,
      version: "0.1.0",
      elixir: "~> 1.8",
      start_permanent: Mix.env() == :prod,
      deps: deps()
    ]
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    [
      extra_applications: [:logger],
      mod: {SwarmPlayground.Application, []}
    ]
  end

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
      {:swarm, "~> 3.0"}
    ]
  end
end
