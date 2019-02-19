#!/bin/sh

set -e

if [ "$1" = 'version' ]; then
  exec su-exec ansible ansible --version

elif [ "$1" = 'setup' ]; then
  exec su-exec ansible ansible -m setup all

elif [ "$1" = 'makemeroot' ]; then
  exec ash

else
  exec su-exec ansible "$@"
fi