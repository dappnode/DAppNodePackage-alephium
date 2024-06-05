ARG ALEPHIUM_BACKEND_VERSION
FROM alephium/explorer-backend:${ALEPHIUM_BACKEND_VERSION}

ADD entrypoint.sh /usr/local/bin/entrypoint.sh

ENV DB_USER=alephium
ENV DB_PASSWORD=alephium

ENTRYPOINT [ "/usr/local/bin/entrypoint.sh" ]
