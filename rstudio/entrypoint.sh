#!/bin/bash -e

mkdir -p /home/rstudio/matrixds_project_files/.R/library
chown -R rstudio:rstudio /home/rstudio/matrixds_project_files/.R
[ -f  /home/rstudio/.Rprofile ] || echo '.libPaths("/home/rstudio/matrixds_project_files/.R/library")' > /home/rstudio/.Rprofile
chown rstudio:rstudio /home/rstudio/.Rprofile
[ -f  /home/rstudio/.Renvron ] || echo 'R_LIBS=/usr/local/lib/R/site-library:/usr/local/lib/R/library:/usr/lib/R/library:/home/rstudio/matrixds_project_files/.R/library
' > /home/rstudio/.Renvron
chown rstudio:rstudio /home/rstudio/.Renvron
#echo "www-address=127.0.0.1" >> /etc/rstudio/rserver.conf
#service nginx start

/init
