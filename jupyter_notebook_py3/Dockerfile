FROM matrixds/pythonbase

RUN \
    apt-get update && \
    apt-get install -y python3-pip sudo && \
    apt-get clean && \
    pip3 install jupyter && \
    update-alternatives --install /usr/bin/python python /usr/bin/python3 1 && \
    update-alternatives --install /usr/bin/pip pip /usr/bin/pip3 1

WORKDIR /app
COPY entrypoint.sh .
COPY jupyter_notebook_config.py .
COPY pip.conf .

# Create and use matrix user
RUN \
  chmod a+x entrypoint.sh && \
  groupadd --gid=1100 matrix && \
  useradd --create-home --uid=1100 --gid=1100 matrix && \
  echo 'matrix ALL = (ALL) NOPASSWD: ALL' >> /etc/sudoers && \
  mkdir /app/jupyter && chown matrix:matrix /app/jupyter


USER matrix
WORKDIR /home/matrix
EXPOSE 8888
ENTRYPOINT ["sh", "-c", "/app/entrypoint.sh >>/var/log/stdout.log 2>>/var/log/stderr.log"]

