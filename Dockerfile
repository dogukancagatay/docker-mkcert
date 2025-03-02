FROM busybox:stable
LABEL maintainer="Doğukan Çağatay <dcagatay@gmail.com>"

ARG MKCERT_VERSION="v1.4.4"
ARG GITHUB_PROXY="https://github.com"

ENV DOMAINS="dev.mydomain.com"

ADD ${GITHUB_PROXY}/FiloSottile/mkcert/releases/download/${MKCERT_VERSION}/mkcert-${MKCERT_VERSION}-linux-amd64 /usr/bin/mkcert
COPY ./entrypoint.sh /entrypoint.sh

WORKDIR /root/.local/share/mkcert

RUN chmod +x /usr/bin/mkcert /entrypoint.sh && \
    ln -s /root/.local/share/mkcert /certs

ENTRYPOINT ["/entrypoint.sh"]
