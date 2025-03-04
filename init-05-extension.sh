#!/bin/bash
set -e

psql -v ON_ERROR_STOP=1 --username "$POSTGRES_USER" --dbname template1 <<-EOSQL
        CREATE SCHEMA pgtap;
        CREATE EXTENSION pgtap SCHEMA pgtap;
        GRANT USAGE ON SCHEMA pgtap TO public;
EOSQL
