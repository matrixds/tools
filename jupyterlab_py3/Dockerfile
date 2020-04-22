FROM matrixds/pythonbase

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