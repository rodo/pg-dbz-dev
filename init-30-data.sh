#!/bin/bash
set -e

psql -v ON_ERROR_STOP=1 --username "auto"  <<-EOSQL
        CREATE TABLE books (id serial primary key, title text);
EOSQL

psql -v ON_ERROR_STOP=1 --username "manual"  <<-EOSQL
        CREATE TABLE books (id serial primary key, title text);
EOSQL
