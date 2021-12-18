#!/bin/sh

# set -x

if [ -z "$@" ]; then
  mkcert -install
else
  mkcert -install && mkcert $@
fi

if [ ! -z "$UID" ] && [ ! -z "$GID" ]; then
  chown -R "$UID:$GID" /certs/*
fi
