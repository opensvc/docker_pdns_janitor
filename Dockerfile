FROM alpine:latest

LABEL maintainer="support@opensvc.com"
LABEL org.opencontainers.image.source="https://github.com/opensvc/pdns_janitor"
LABEL org.opencontainers.image.licenses="Apache-2.0"
LABEL org.opencontainers.image.description="A backend for a pdns server serving records for the services deployed in a OpenSVC cluster."

ENV OPENSVC_LSNR_SOCK /var/run/lsnr/lsnr.sock
ENV OPENSVC_RECURSOR_SOCK /var/run/pdns_recursor.controlsocket

LABEL maintainer="support@opensvc.com"

RUN apk --update add --no-cache python3

COPY pdns_janitor /usr/local/bin/pdns_janitor

ENTRYPOINT ["/usr/local/bin/pdns_janitor"]
