#!/bin/sh
set -e

mkdir -p /var/log/nginx
#mkdir -p /usr/share/nginx/html



if [ ! -d "/usr/share/nginx/html" ]
then	
  mkdir -p /usr/share/nginx/html
  cp -r /test/index.html /usr/share/nginx/html/

else
  if [ ! "$(ls -A /usr/share/nginx/html)" ]
  then
     cp -r /test/index.html /usr/share/nginx/html/
  fi
fi

#if [ ! -d "html" ]
#then
#	mkdir html
#	cp index.html html/
#fi	






nginx -g "daemon off;"
