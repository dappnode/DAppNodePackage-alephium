ARG ALEPHIUM_EXPLORER_VERSION
FROM alephium/explorer:${ALEPHIUM_EXPLORER_VERSION}

ADD entrypoint.sh /usr/local/bin/entrypoint.sh

ENTRYPOINT [ "/usr/local/bin/entrypoint.sh" ]
