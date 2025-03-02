#!/bin/sh

set -e

if [ -z "$@" ]; then
  mkcert -install
else
  mkcert -install && mkcert "$@"
fi

if [ -n "${PUID}" ] && [ -n "${PGID}" ]; then
  chown -R "$PUID:$PGID" /certs
fi
