#!/bin/bash -e

mkdir -p /home/plumber/plumber
mkdir -p /home/plumber/R/library
touch /home/plumber/plumber.R

[ -f  /home/plumber/.Rprofile ] || echo '.libPaths("/home/plumber/R/library/")' > /home/plumber/.Rprofile
[ -f  /home/plumber/.Renvron ] || echo 'R_LIBS=/usr/local/lib/R/site-library:/usr/local/lib/R/library:/usr/lib/R/library:/home/plumber/R/library
' > /home/plumber/.Renvron

Rscript /home/plumber/plumber/plumber.R
/init
