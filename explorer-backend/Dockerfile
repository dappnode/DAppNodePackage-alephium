FROM alephium/explorer-backend:v1.16.1

ADD entrypoint.sh /usr/local/bin/entrypoint.sh

ENV DB_USER=alephium
ENV DB_PASSWORD=alephium

ENTRYPOINT [ "/usr/local/bin/entrypoint.sh" ]
