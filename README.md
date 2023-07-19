# FlopTest

```
docker run -it -d --name flop_mysql -e MYSQL_ROOT_PASSWORD=root -p 3306:3306 mysql
mix ecto.create
mix ecto.migrate
iex -S mix
```

To reproduce the casting bug, evaluate `FlopTest.query_example` in the REPL.
