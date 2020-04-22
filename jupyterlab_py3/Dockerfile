FROM ubuntu:xenial
# Does a build ot the RDKit Python wrappers and runs the tests
# Mainly intended as a demo of what's required to do so
MAINTAINER Greg Landrum <greg.landrum@t5informatics.com>

RUN apt-get update && apt-get upgrade && apt install -y \
  curl \
  wget \
  libboost-all-dev \
  cmake \
  git \
  g++ \
  libeigen3-dev \
  python3 \
  libpython3-all-dev \
  python3-numpy \
  python3-pip \
  python3-pil \
  python3-six \
  python3-pandas


ENV LANG C

#
RUN mkdir /src
WORKDIR /src
ENV RDBASE=/src/rdkit
ARG RDKIT_BRANCH
RUN git clone https://github.com/rdkit/rdkit.git
WORKDIR $RDBASE
RUN git checkout $RDKIT_BRANCH

ENV PYTHONPATH=$RDBASE
ENV LD_LIBRARY_PATH=$RDBASE/lib
WORKDIR $RDBASE
RUN mkdir build
WORKDIR build
RUN cmake -DPYTHON_EXECUTABLE=/usr/bin/python3 ..
RUN make -j3 .. install
RUN ctest -j3

RUN echo $PATH
#RUN /usr/bin/python --version

RUN \
    apt-get update && \
    apt-get install -y python3-pip sudo && \
    apt-get clean && \
    pip3 install jupyterlab 
   # nodejs npm  
   # && \
   # update-alternatives --install /usr/bin/python python /usr/bin/python3 1 && \
   # update-alternatives --install /usr/bin/pip pip /usr/bin/pip3 1

#jupyterlab extenstion
# RUN jupyter labextension install @lckr/jupyterlab_variableinspector

WORKDIR /app
COPY entrypoint.sh .
RUN chmod a+x entrypoint.sh
COPY jupyter_notebook_config.py .
COPY pip.conf .

# Create and use matrix user
RUN groupadd --gid=1100 matrix && \
    useradd --create-home --uid=1100 --gid=1100 matrix && \
    echo 'matrix ALL = (ALL) NOPASSWD: ALL' >> /etc/sudoers

# Somewhere to put the sqllite DB which cannot be on NFS
RUN mkdir /app/jupyter && chown -R matrix:matrix /app/
RUN touch /var/log/stderr.log && touch /var/log/stdout.log && chown matrix:matrix /var/log/stderr.log && chown matrix:matrix /var/log/stdout.log
#COPY README.txt /home/matrix/README.txt
COPY README.txt /README.txt

RUN pip3 install numpy

USER matrix
WORKDIR /home/matrix
EXPOSE 8888

ENTRYPOINT ["sh", "-c", "/app/entrypoint.sh >>/var/log/stdout.log 2>>/var/log/stderr.log"]
#ENTRYPOINT ["sh", "-c", "/app/entrypoint.sh"]