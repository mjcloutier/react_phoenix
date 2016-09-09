defmodule ReactPhoenix.Mixfile do
  use Mix.Project

  def project do
    [
      app: :react_phoenix,
      version: "0.0.1",
      elixir: "~> 1.0.1 or ~> 1.1",
      deps: deps,
      package: [
        contributors: ["Koutaro Chikuba"],
        licenses: ["MIT"],
        links: %{github: "https://github.com/mizchi/react_phoenix"}
      ],
      description: """
      Phoenix Template Engine for ReactJSX (WIP)
      """
    ]
  end

  def application do
    [
      applications: [:phoenix, :exjsx, :erlang_v8],
      mod: {ReactPhoenix, []}
    ]
  end

  defp deps do
    [
      {:phoenix, "~> 1.0"},
      {:phoenix_html, "~> 2.1"},
      {:exjsx, "~> 3.2.0"},
      {:erlang_v8, github: "strange/erlang_v8", branch: "contexts", compile: "make"},
      {:cowboy, "~> 1.0.0", only: [:dev, :test]}
    ]
  end
end
