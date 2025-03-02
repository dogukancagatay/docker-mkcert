#!/bin/sh

set -e

if [ "$#" -eq 0 ]; then
  mkcert -install
else
  mkcert -install && mkcert "$@"
fi

if [ -n "${PUID}" ] && [ -n "${PGID}" ]; then
  chown -R "$PUID:$PGID" /certs
fi
