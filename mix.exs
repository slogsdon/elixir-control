defmodule Control.Mixfile do
  use Mix.Project

  def project do
    [app: :control,
     version: "0.0.1",
     elixir: "~> 1.1",
     build_embedded: Mix.env == :prod,
     start_permanent: Mix.env == :prod,
     description: description,
     package: package,
     deps: deps]
  end

  def application do
    [applications: [:logger]]
  end

  defp deps do
    []
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
