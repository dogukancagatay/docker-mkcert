FROM busybox:stable
LABEL maintainer="Doğukan Çağatay <dcagatay@gmail.com>"

ARG MKCERT_VERSION="v1.4.4"
ARG GITHUB_PROXY="https://github.com"

ARG TARGETOS
ARG TARGETARCH
ADD ${GITHUB_PROXY}/FiloSottile/mkcert/releases/download/${MKCERT_VERSION}/mkcert-${MKCERT_VERSION}-$TARGETOS-$TARGETARCH /usr/bin/mkcert
COPY ./entrypoint.sh /entrypoint.sh
RUN chmod +x /usr/bin/mkcert /entrypoint.sh

# Put CA certificates under /certs/ca
ENV CAROOT="/certs/ca"

WORKDIR /certs
VOLUME /certs
ENTRYPOINT ["/entrypoint.sh"]
