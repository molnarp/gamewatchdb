FROM library/postgres

ENV POSTGRES_USER=gamewatch \
    POSTGRES_PASSWORD=abc123

ADD schema-v2.sql /docker-entrypoint-initdb.d/
