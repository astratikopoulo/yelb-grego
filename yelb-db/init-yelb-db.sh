#!/bin/bash
set -e

psql -v ON_ERROR_STOP=1 --username "$POSTGRES_USER" <<-EOSQL
    CREATE DATABASE yelbdatabase;
    \connect yelbdatabase;
	CREATE TABLE restaurants (
    	name        char(30),
    	count       integer,
    	PRIMARY KEY (name)
	);
	INSERT INTO restaurants (name, count) VALUES ('outback', 100);
	INSERT INTO restaurants (name, count) VALUES ('bucadibeppo', 30);
	INSERT INTO restaurants (name, count) VALUES ('chipotle', 10);
	INSERT INTO restaurants (name, count) VALUES ('ihop', 20);
EOSQL

