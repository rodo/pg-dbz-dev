#!/bin/bash
set -e

psql -v ON_ERROR_STOP=1 --username "postgres"  <<-EOSQL
        SELECT cron.schedule_in_database('add-data-auto', '* * * * *', 'INSERT INTO books (created_at) VALUES (now())', 'auto');
        SELECT cron.schedule_in_database('add-data-manual', '* * * * *', 'INSERT INTO books (created_at) VALUES (now())', 'manual');
EOSQL
