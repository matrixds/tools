FROM matrixds/pythonbase:v3

RUN echo $PATH
RUN /usr/bin/python --version

WORKDIR /app
COPY entrypoint.sh .

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
