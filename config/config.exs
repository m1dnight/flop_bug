import Config

config :flop_test,
  ecto_repos: [FlopTest.Repo]

config :flop,
  repo: FlopTest.Repo,
  default_limit: 2

config :flop_test, FlopTest.Repo,
  database: "flop_test_repo",
  username: "postgres",
  password: "postgres",
  hostname: "localhost"
