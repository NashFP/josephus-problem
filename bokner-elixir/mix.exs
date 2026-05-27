defmodule Josephus.MixProject do
  use Mix.Project

  def project do
    [
      app: :josephus,
      version: "0.0.1",
      elixir: "~> 1.18",
      start_permanent: Mix.env() == :prod,
      deps: deps(),
      description: description()
    ]
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    [
      extra_applications: [:logger]
    ]
  end

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
      {:inplace, "~> 0.7.7"}
    ]
  end

  defp description() do
    "Josephus problem"
  end

end
