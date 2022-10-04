FROM postgres:14.1-bullseye
ENV POSTGRES_USER=alephium
ENV POSTGRES_PASSWORD=alephium
ENV POSTGRES_DB=alephium-explorer

ADD entrypoint.sh /usr/local/bin/entrypoint.sh
RUN chown postgres /usr/local/bin/entrypoint.sh

CMD [ "entrypoint.sh" ]