defmodule ActordbElixirthrift.Mixfile do
  use Mix.Project

  def project do
    [app: :actordb_elixirthrift,
     version: "0.0.1",
     elixir: "~> 1.0",
     elixirc_paths: elixirc_paths(Mix.env),
     compilers: [:phoenix] ++ Mix.compilers,
     build_embedded: Mix.env == :prod,
     start_permanent: Mix.env == :prod,
     deps: deps]
  end

  # Configuration for the OTP application
  #
  # Type `mix help compile.app` for more information
  def application do
    :application.set_env(:actordb_client, :pools,
    [{:default_pool,
      [{:size, 10}, {:max_overflow, 5}],
      [{:hostname, '127.0.0.1'},
       {:username, 'root'},
       {:password, 'rootpass'},
       {:port,33306}
     ]}]);
    [mod: {ActordbElixirthrift, []},
     applications: [:phoenix, :phoenix_html, :cowboy, :logger,
                    #:phoenix_ecto,
                    #:postgrex
                    :actordb_client]]
  end

  # Specifies which paths to compile per environment
  defp elixirc_paths(:test), do: ["lib", "web", "test/support"]
  defp elixirc_paths(_),     do: ["lib", "web"]

  # Specifies your project dependencies
  #
  # Type `mix help deps` for examples and options
  defp deps do
    [{:phoenix, "~> 0.16"},
     #{:phoenix_ecto, "~> 0.9"},
     #{:postgrex, ">= 0.0.0"},
     {:phoenix_html, "~> 2.0"},
     {:phoenix_live_reload, "~> 0.6", only: :dev},
     {:cowboy, "~> 1.0"},
     {:actordb_client, git: "https://github.com/biokoda/actordb_client.git"},
     {:thrift_ex, git: "http://github.com/dantswain/thrift_ex"}
    ]
  end
end
