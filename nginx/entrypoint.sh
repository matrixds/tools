#!/bin/sh
set -e

mkdir -p /var/log/nginx
#mkdir -p /usr/share/nginx/html


if [ ! -d "/usr/share/nginx/html" ]
then
  mkdir -p /usr/share/nginx/html
  cp -r /index.html /usr/share/nginx/html/

else
  if [ ! "$(ls -A /usr/share/nginx/html)" ]
  then
     cp -r /index.html /usr/share/nginx/html/
  fi
fi



nginx -g "daemon off;"
