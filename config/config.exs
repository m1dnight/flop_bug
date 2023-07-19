import Config

config :flop_test,
  ecto_repos: [FlopTest.Repo]

config :flop, repo: FlopTest.Repo

config :flop_test, FlopTest.Repo,
  adapter: Ecto.Adapters.MySQL,
  hostname: "0.0.0.0",
  username: "root",
  password: "root",
  database: "hello_phoenix_dev"
