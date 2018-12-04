#!/bin/bash -e

mkdir -p /home/rstudio/.R/library

cp /home/README.txt /home/rstudio/README.txt

chown -R rstudio:rstudio /home/rstudio/.R
[ -f  /home/rstudio/.Rprofile ] || echo '.libPaths("/home/rstudio/.R/library")' > /home/rstudio/.Rprofile
chown rstudio:rstudio /home/rstudio/.Rprofile
[ -f  /home/rstudio/.Renvron ] || echo 'R_LIBS=/usr/local/lib/R/site-library:/usr/local/lib/R/library:/usr/lib/R/library:/home/rstudio/.R/library
' > /home/rstudio/.Renvron
chown rstudio:rstudio /home/rstudio/.Renvron
#start RStudio
/init
