#!/bin/sh
if [ -z "${PREFIX}" ]; then
    PREFIX_PARAM="";
else
    PREFIX_PARAM="--prefix ${PREFIX}";
fi


if [ ! -d "/app/dash" ]
then
  mkdir -p /app/dash
  cp -r /apps/* /app/dash/
else 
  if [ ! "$(ls -A /app/dash)" ]
   then
     cp -r /apps/* /app/dash/
  fi
fi

python /app/dash/app.py

