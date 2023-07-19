# FlopTest

docker run -it --rm --network=host -e POSTGRES_USER=postgres -e POSTGRES_PASSWORD=postgres postgres

docker run -it -d --name flop_mysql -e MYSQL_ROOT_PASSWORD=root -p 3306:3306 mysql
