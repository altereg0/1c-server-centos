#!/bin/bash

if [ "$1" = "ragent" ]; then
  #exec su -m usr1cv8 /opt/1C/v8.3/x86_64/ragent
  exec /opt/1C/v8.3/x86_64/ragent
fi

exec "$@"
