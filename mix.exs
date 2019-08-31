defmodule Perseus.MixProject do
  use Mix.Project

  def project do
    [
      app: :perseus,
      name: "Perseus",
      docs: [main: "Perseus"],
      source_url: "https://github.com/denvaar/perseus",
      version: "0.1.0",
      elixir: "~> 1.9.1",
      start_permanent: Mix.env() == :prod,
      deps: deps()
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
      {:ex_doc, "~>  0.21.2", only: [:dev], runtime: false}
    ]
  end
end
