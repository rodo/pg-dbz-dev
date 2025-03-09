#!/bin/bash
set -e

psql -v ON_ERROR_STOP=1 --username "$POSTGRES_USER" --dbname "$POSTGRES_DB" <<-EOSQL
        CREATE USER auto REPLICATION PASSWORD 'auto';
        CREATE DATABASE auto OWNER auto;
        CREATE DATABASE sink_auto OWNER auto;
EOSQL

psql -v ON_ERROR_STOP=1 --username "$POSTGRES_USER" --dbname "$POSTGRES_DB" <<-EOSQL
        CREATE USER manual REPLICATION PASSWORD 'manual';
        CREATE DATABASE manual OWNER manual;
        CREATE DATABASE sink_manual OWNER manual;
EOSQL
