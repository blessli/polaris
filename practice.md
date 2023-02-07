docker exec -i mysql mysql -h 127.0.0.1 -P 3306 -u root -p'rootroot' < store/mysql/scripts/polaris_server.sql

docker exec -i mysql mysql -h 127.0.0.1 -P 3306 -u root -p'rootroot' -e "show databases;"

docker exec -i mysql mysql -h 127.0.0.1 -P 3306 -u root -p'rootroot' -e "use polaris_server;show tables;"

go run . start