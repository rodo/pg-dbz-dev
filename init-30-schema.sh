#!/bin/bash
set -e

psql -v ON_ERROR_STOP=1 --username "auto"  <<-EOSQL
        CREATE TABLE books (id serial primary key, created_at text);
EOSQL

psql -v ON_ERROR_STOP=1 --username "manual"  <<-EOSQL
        CREATE TABLE books (id serial primary key, created_at text);
        CREATE PUBLICATION manual FOR TABLE books;
        SELECT pg_create_logical_replication_slot('debezium','pgoutput');
EOSQL
