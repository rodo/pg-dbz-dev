#!/bin/bash
set -e

psql -v ON_ERROR_STOP=1 --username "$POSTGRES_USER" --dbname "$POSTGRES_DB" <<-EOSQL
        CREATE USER auto REPLICATION PASSWORD 'auto';
        CREATE DATABASE auto OWNER auto;
EOSQL

psql -v ON_ERROR_STOP=1 --username "$POSTGRES_USER" --dbname "$POSTGRES_DB" <<-EOSQL
        CREATE USER manual REPLICATION PASWWORD 'manual';
        CREATE DATABASE manual OWNER manual;
EOSQL
