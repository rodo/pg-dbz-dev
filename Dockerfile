FROM postgres:17

LABEL org.opencontainers.image.authors="rodolphe@quiedeville.org"

# add pgtap extension, always useful to do some test
RUN apt-get update && apt-get install -y --no-install-recommends postgresql-17-pgtap && apt-get clean

# Install the extension in the temaplte database to make it available
#  in all newly created databases

ENV POSTGRES_PASSWORD=postgres

COPY ./init-*.sh /docker-entrypoint-initdb.d/

EXPOSE 5432
