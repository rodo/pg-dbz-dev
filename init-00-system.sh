#!/bin/bash
set -e

psql -v ON_ERROR_STOP=1 --username "$POSTGRES_USER" --dbname postgres <<-EOSQL
        ALTER SYSTEM SET wal_level=logical;
        ALTER SYSTEM SET log_connections=on;
        ALTER SYSTEM SET log_disconnections=on;
        CREATE EXTENSION pg_cron;
EOSQL
