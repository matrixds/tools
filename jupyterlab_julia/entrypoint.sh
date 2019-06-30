#!/bin/bash -e
cd $HOME

mkdir -p $HOME/.jupyter
cp /app/jupyter_notebook_config.py $HOME/.jupyter/.
#cp /home/README.txt /home/matrix/README.txt
cp /README.txt /home/matrix/README.txt

mkdir -p /app/jupyter/runtime
mkdir -p /app/jupyter/ipython
mkdir -p $HOME/.pip

[ -f $HOME/.pip/pip.conf ] || cp /app/pip.conf $HOME/.pip/.

export JUPYTER_RUNTIME_DIR=/app/jupyter/runtime
export IPYTHONDIR=/app/jupyter/ipython


# Run it
jupyter lab --allow-root
