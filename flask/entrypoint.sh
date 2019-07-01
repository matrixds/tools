#!/bin/sh
if [ -z "${PREFIX}" ]; then
    PREFIX_PARAM="";
else
    PREFIX_PARAM="--prefix ${PREFIX}";
fi


if [ ! -d "/app/flask" ]
then
  mkdir -p /app/flask
  cp -r /apps/* /app/flask/
else 
  if [ ! "$(ls -A /app/flask)" ]
   then
     cp -r /apps/* /app/flask/
  fi
fi

python /app/flask/app.py

