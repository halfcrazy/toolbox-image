#!/usr/bin/env sh
trap "echo break; exit 1" SIGINT

while true
do
  echo starting nginx
  nginx -g "daemon off;"
done
