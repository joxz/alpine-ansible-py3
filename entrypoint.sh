#!/bin/sh

set -e

if [ "$1" = 'version' ]; then
  exec ansible --version

elif [ "$1" = 'setup' ]; then
  exec ansible -m setup all

else
  exec "$@"
fi
