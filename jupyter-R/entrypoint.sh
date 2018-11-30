#!/bin/bash -e
cd $HOME

mkdir -p $HOME/.jupyter
cp /app/jupyter_notebook_config.py $HOME/.jupyter/.

mkdir -p /app/jupyter/runtime
mkdir -p /app/jupyter/ipython
mkdir -p $HOME/.pip

[[ -f $HOME/.pip/pip.conf ]] || cp /app/pip.conf $HOME/.pip/.

export JUPYTER_RUNTIME_DIR=/app/jupyter/runtime
export IPYTHONDIR=/app/jupyter/ipython

# Sort out R
mkdir -p /home/matrix/matrixds_project_files/.R/library
chown -R matrix:matrix /home/matrix/matrixds_project_files/.R
[ -f  /home/matrix/.Rprofile ] || echo '.libPaths("/home/matrix/matrixds_project_files/.R/library")' > /home/matrix/.Rprofile
chown matrix:matrix /home/matrix/.Rprofile
[ -f  /home/matrix/.Renvron ] || echo 'R_LIBS=/usr/local/lib/R/site-library:/usr/local/lib/R/library:/usr/lib/R/library:/home/matrix/matrixds_project_files/.R/library
' > /home/matrix/.Renvron
chown matrix:matrix /home/matrix/.Renvron

# Run it
jupyter lab
