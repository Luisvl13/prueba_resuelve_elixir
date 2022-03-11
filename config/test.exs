import Config

# Configure your database
#
# The MIX_TEST_PARTITION environment variable can be used
# to provide built-in test partitioning in CI environment.
# Run `mix help test` for more information.
config :prueba_resuelve_elixir, PruebaResuelveElixir.Repo,
  username: "root",
  password: "root",
  hostname: "db",
  database: "prueba_resuelve_elixir_dev#{System.get_env("MIX_TEST_PARTITION")}",
  pool: Ecto.Adapters.SQL.Sandbox,
  pool_size: 10

# We don't run a server during test. If one is required,
# you can enable the server option below.
config :prueba_resuelve_elixir, PruebaResuelveElixirWeb.Endpoint,
  http: [ip: {127, 0, 0, 1}, port: 4002],
  secret_key_base: "wTkbYD/Eozc5h4eFjEMeB5F6qY+FFDI8jJ/U1iTGEV+tSjNdWVqZrFlZlcl5XVFg",
  server: false

# Print only warnings and errors during test
config :logger, level: :warn

# Initialize plugs at runtime for faster test compilation
config :phoenix, :plug_init_mode, :runtime
