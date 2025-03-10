FROM postgres:17.4-alpine3.21

LABEL org.opencontainers.image.authors="rodolphe@quiedeville.org"

# add pgtap extension, always useful to do some test
RUN apt-get update && apt-get install -y --no-install-recommends postgresql-17-pgtap postgresql-17-cron && apt-get clean

ENV POSTGRES_PASSWORD=postgres

COPY ./init-*.sh /docker-entrypoint-initdb.d/

EXPOSE 5432

CMD ["postgres", \
     "-c", "shared_preload_libraries=pg_cron", \
     "-c", "cron.database_name=postgres", \
     "-c", "wal_level=logical" ]