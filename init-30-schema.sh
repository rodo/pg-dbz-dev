#!/bin/bash
set -e

psql -v ON_ERROR_STOP=1 --username "auto"  <<-EOSQL
        CREATE TABLE books (id serial primary key, created_at text);
        CREATE TABLE dbz_signal (id VARCHAR(42) PRIMARY KEY, type VARCHAR(32) NOT NULL, data VARCHAR(2048) NULL);
        CREATE TABLE dbz_heartbeat(id SERIAL, last_update TIMESTAMP DEFAULT current_timestamp, PRIMARY KEY (id));
EOSQL

psql -v ON_ERROR_STOP=1 --username "manual"  <<-EOSQL
        CREATE TABLE books (id serial primary key, created_at text);
        CREATE PUBLICATION manual FOR TABLE books;
        SELECT pg_create_logical_replication_slot('debezium','pgoutput');
        CREATE TABLE dbz_signal (id VARCHAR(42) PRIMARY KEY, type VARCHAR(32) NOT NULL, data VARCHAR(2048) NULL);
        CREATE TABLE dbz_heartbeat(id SERIAL, last_update TIMESTAMP DEFAULT current_timestamp, PRIMARY KEY (id));
EOSQL
