use Mix.Config

# We don't run a server during test. If one is required,
# you can enable the server option below.
config :yak, Yak.Web.Endpoint,
  http: [port: 4001],
  server: false

# Print only warnings and errors during test
config :logger, level: :warn

# Configure your database
config :yak, Yak.Repo,
  adapter: Ecto.Adapters.Postgres,
  username: "gavlak",
  password: "",
  database: "yak_test",
  hostname: "localhost",
  pool: Ecto.Adapters.SQL.Sandbox
