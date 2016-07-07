defmodule BeamHomunculus.Mixfile do
  use Mix.Project

  def project do
    [app: :beam_homunculus,
     version: "0.1.0",
     elixir: "~> 1.3",
     build_embedded: Mix.env == :prod,
     start_permanent: Mix.env == :prod,
     description: description(),
     package: package(),
     deps: deps()]
  end

  # Configuration for the OTP application
  #
  # Type "mix help compile.app" for more information
  def application do
    [applications: [:logger],
     mod: {BeamHomunculus, []}]
  end

  # Dependencies can be Hex packages:
  #
  #   {:mydep, "~> 0.3.0"}
  #
  # Or git/path repositories:
  #
  #   {:mydep, git: "https://github.com/elixir-lang/mydep.git", tag: "0.1.0"}
  #
  # Type "mix help deps" for more examples and options
  defp deps do
    [{:ex_doc, ">= 0.0.0", only: :dev},
     {:dialyxir, "~> 0.3.5", only: [:dev, :test]},
     {:credo, "~> 0.4", only: [:dev, :test]}]
  end

  defp description do
    "A bot framework for ErlangVM(beam)"
  end

  defp package do
    [maintainers: ["niku"],
     licenses: ["MIT"],
     links: %{"GitHub" => "https://github.com/niku/beam_homunculus"}]
  end
end