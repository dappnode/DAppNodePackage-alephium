ARG UPSTREAM_VERSION
ARG TARGETOS
ARG TARGETARCH

FROM golang:1.19-buster as builder

RUN GOOS=${TARGETOS} GOARCH=${TARGETARCH} go install github.com/touilleio/tee-hash@latest

# Remove the -adoptjdk suffix when docker updates to 20.10.21 or higher
FROM alephium/alephium:${UPSTREAM_VERSION}-adoptjdk

USER root
RUN apt update && apt-get install -y bc && apt-get clean
USER nobody

COPY --from=builder /go/bin/tee-hash /usr/local/bin/tee-hash

COPY user.conf /alephium-home/.alephium/user.conf
COPY snapshot-loader.sh /snapshot-loader.sh
COPY entrypoint.sh /entrypoint.sh

EXPOSE 9973/tcp
EXPOSE 9973/udp

ENTRYPOINT ["/entrypoint.sh"]
