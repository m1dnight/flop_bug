defmodule FlopTest.MixProject do
  use Mix.Project

  def project do
    [
      app: :flop_test,
      version: "0.1.0",
      elixir: "~> 1.14",
      start_permanent: Mix.env() == :prod,
      deps: deps()
    ]
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    [
      extra_applications: [:logger, :mariaex],
      mod: {FlopTest.Application, []}
    ]
  end

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
      {:ecto_sql, "~> 3.0"},
      {:myxql, "~> 0.6.0"},
      {:mariaex, "~> 0.6.1", override: true},
      {:flop, "~> 0.20.0"},
    ]
  end
end
