#!/bin/bash
set -e

psql -v ON_ERROR_STOP=1 --username "$POSTGRES_USER" --dbname "$POSTGRES_DB" <<-EOSQL
        CREATE USER auto REPLICATION PASSWORD 'auto';
        CREATE DATABASE auto OWNER auto;
        GRANT ALL PRIVILEGES ON DATABASE auto TO auto;
EOSQL

psql -v ON_ERROR_STOP=1 --username "$POSTGRES_USER" --dbname "$POSTGRES_DB" <<-EOSQL
        CREATE USER manual REPLICATION PASWWORD 'manual';
        CREATE DATABASE manual OWNER manual;
        GRANT ALL PRIVILEGES ON DATABASE manual TO manual;
EOSQL
