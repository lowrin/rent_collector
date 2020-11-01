#!/bin/bash
set -o allexport
eval $(grep -v '^#' /usr/src/app/.env | sed 's/^/export /')
set +o allexport
/usr/local/bin/python /usr/src/app/manage.py runcrons
