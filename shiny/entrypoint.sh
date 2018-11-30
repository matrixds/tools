#!/bin/bash

mkdir -p /srv/shiny-server
mkdir -p /srv/.R/library
[ -f  /srv/.Rprofile ] || echo '.libPaths("/srv/.R/library/")' > /srv/.Rprofile
[ -f  /srv/.Renvron ] || echo 'R_LIBS=/usr/local/lib/R/site-library:/usr/local/lib/R/library:/usr/lib/R/library:/srv/.R/library
' > /srv/.Renvron

sh /usr/bin/shiny-server.sh

