# syntax=docker/dockerfile:1
FROM ubuntu:18.04
ENV POSTGRES_USER=alephium
ENV POSTGRES_PASSWORD=alephium
ENV POSTGRES_DB=alephium-explorer

RUN apt-get update && apt-get install -y gnupg dirmngr wget
RUN echo "deb http://apt.postgresql.org/pub/repos/apt/ bionic-pgdg main" > /etc/apt/sources.list.d/pgdg.list
RUN wget --quiet -O - https://www.postgresql.org/media/keys/ACCC4CF8.asc | apt-key add -
RUN apt-get update && DEBIAN_FRONTEND=noninteractive apt-get install -y software-properties-common postgresql-14 postgresql-client-14

ADD entrypoint.sh /usr/local/bin/entrypoint.sh
RUN chown postgres /usr/local/bin/entrypoint.sh

# Run the rest of the commands as the ``postgres`` user created by the ``postgres-14`` package when it was ``apt-get installed``
USER postgres
# Create a PostgreSQL role and then create a database owned by the role.
# Note: here we use ``&&\`` to run commands one after the other - the ``\``
#       allows the RUN command to span multiple lines.
RUN /etc/init.d/postgresql start &&\
    psql --command "CREATE USER $POSTGRES_USER WITH SUPERUSER PASSWORD '$POSTGRES_PASSWORD';" &&\
    createdb -O $POSTGRES_USER $POSTGRES_DB
# # Adjust PostgreSQL configuration so that remote connections to the
# # database are possible.
RUN echo "host all  all    0.0.0.0/0  md5" >> /etc/postgresql/14/main/pg_hba.conf
# # And add ``listen_addresses`` to ``/etc/postgresql/9.3/main/postgresql.conf``
RUN echo "listen_addresses='*'" >> /etc/postgresql/14/main/postgresql.conf
# # Expose the PostgreSQL port
EXPOSE 5432

ENTRYPOINT [ "/usr/local/bin/entrypoint.sh" ]
