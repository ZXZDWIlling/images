#! /bin/bash
echo "[filebeat] $HOSTNAME" \
  && exec "$@"
