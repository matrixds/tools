#!/bin/bash

mkdir -p /srv/shiny-server
mkdir -p /srv/.R/library
[ -f  /srv/.Rprofile ] || echo '.libPaths("/srv/.R/library/")' > /srv/.Rprofile
[ -f  /srv/.Renvron ] || echo 'R_LIBS=/usr/local/lib/R/site-library:/usr/local/lib/R/library:/usr/lib/R/library:/srv/.R/library
' > /srv/.Renvron

if [ ! -d "/srv/shiny-server" ]
then
  mkdir -p /srv/shiny-server
  cp -r /root/shiny-server/example_shiny/app.R /srv/shiny-server/
else
  if [ ! "$(ls -A /srv/shiny-server)" ]
   then
     cp -r /root/shiny-server/example_shiny/app.R /srv/shiny-server/
  fi
fi

sh /usr/bin/shiny-server.sh

