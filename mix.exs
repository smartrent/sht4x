defmodule SHT4X.MixProject do
  use Mix.Project

  @version "0.1.7-measure"
  @source_url "https://github.com/mnishiguchi/sht4x"
  @sht4x_datasheet_url "https://cdn-learn.adafruit.com/assets/assets/000/099/223/original/Sensirion_Humidity_Sensors_SHT4x_Datasheet.pdf"

  def project do
    [
      app: :sht4x,
      version: @version,
      description: description(),
      elixir: "~> 1.11",
      start_permanent: Mix.env() == :prod,
      deps: deps(),
      package: package(),
      aliases: [],
      dialyzer: dialyzer(),
      docs: docs(),
      preferred_cli_env: %{
        docs: :docs,
        "hex.publish": :docs,
        "hex.build": :docs
      }
    ]
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    [
      extra_applications: [:logger]
    ]
  end

  def description do
    "Use Sensirion SHT4X humidity and temperature sensors in Elixir"
  end

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
      {:circuits_i2c, "~> 1.0"},
      {:credo, "~> 1.6", only: [:dev, :test], runtime: false},
      {:dialyxir, "~> 1.1", only: [:dev, :test], runtime: false},
      {:ex_doc, "~> 0.28", only: :docs, runtime: false},
      {:mix_test_watch, "~> 1.1", only: :dev, runtime: false},
      {:typed_struct, "~> 0.3.0"}
    ]
  end

  defp dialyzer() do
    [
      flags: [:missing_return, :extra_return, :unmatched_returns, :error_handling, :underspecs]
    ]
  end

  defp docs do
    [
      main: "readme",
      extras: ["README.md", "CHANGELOG.md"],
      source_ref: "v#{@version}",
      source_url: @source_url,
      skip_undefined_reference_warnings_on: ["CHANGELOG.md"]
    ]
  end

  defp package do
    %{
      files: [
        "lib",
        "test",
        "mix.exs",
        "README.md",
        "LICENSE",
        "CHANGELOG.md"
      ],
      licenses: ["MIT"],
      links: %{
        "GitHub" => @source_url,
        "Data sheet" => @sht4x_datasheet_url
      }
    }
  end
end
