ARG UPSTREAM_VERSION
ARG TARGETOS
ARG TARGETARCH

FROM golang:1.19-buster as builder

RUN GOOS=${TARGETOS} GOARCH=${TARGETARCH} go install github.com/touilleio/tee-hash@latest

FROM alephium/alephium:${UPSTREAM_VERSION}-adoptjdk

COPY --from=builder /go/bin/tee-hash /usr/local/bin/tee-hash

COPY user.conf /alephium-home/.alephium/user.conf
COPY snapshot-loader.sh /snapshot-loader.sh
COPY entrypoint.sh /entrypoint.sh

EXPOSE 9973/tcp
EXPOSE 9973/udp

ENTRYPOINT ["/entrypoint.sh"]
