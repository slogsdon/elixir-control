defmodule Control.Mixfile do
  use Mix.Project

  def project do
    [app: :control,
     version: "0.1.0",
     elixir: "~> 1.0",
     build_embedded: Mix.env == :prod,
     start_permanent: Mix.env == :prod,
     test_coverage: [tool: ExCoveralls],
     preferred_cli_env: [coveralls: :test, bench: :test],
     description: description(),
     package: package(),
     deps: deps()]
  end

  def application do
    [applications: [:logger]]
  end

  defp deps do
    [
      {:earmark, "~> 1.2", only: :dev},
      {:ex_doc, "~> 0.18", only: :dev},

      {:excoveralls, "~> 0.7", only: :test},
      {:dialyze, "~> 0.2", only: :test},
      {:dogma, "~> 0.1", only: :test},
      {:benchfella, "~> 0.3", only: :test},
    ]
  end

  defp description do
    """
    An exploratory look into functors, applicatives, and monads for Elixir.
    """
  end

  defp package do
    [
     maintainers: ["Shane Logsdon"],
     licenses: ["MIT"],
     links: %{"GitHub" => "https://github.com/slogsdon/elixir-control"}]
  end
end
