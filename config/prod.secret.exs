use Mix.Config

# In this file, we keep production configuration that
# you likely want to automate and keep it away from
# your version control system.
config :actordb_elixirthrift, ActordbElixirthrift.Endpoint,
  secret_key_base: "Bdk87Di9P+BVa3XurUxpsbwnKNzTnKnii26ujuFGoXE9h7YeMuzqS3L22U1gH6J9"

# Configure your database
config :actordb_elixirthrift, ActordbElixirthrift.Repo,
  adapter: Ecto.Adapters.Postgres,
  username: "postgres",
  password: "postgres",
  database: "actordb_elixirthrift_prod",
  size: 20 # The amount of database connections in the pool
