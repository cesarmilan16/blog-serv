#!/bin/sh
set -e

host="$1"
shift
cmd="$@"

until mysql -h "$host" -u blog -pblog -e "select 1" &> /dev/null; do
  echo "Esperando a MySQL en $host..."
  sleep 2
done

exec $cmd
