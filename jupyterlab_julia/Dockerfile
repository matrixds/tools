FROM matrixds/asmith:v3

RUN apt-get update && apt-get clean

#python 
RUN pip install jupyterlab numpy

WORKDIR /app
COPY entrypoint.sh .
RUN chmod a+x entrypoint.sh
COPY jupyter_notebook_config.py .
COPY pip.conf .

# Create and use matrix user
RUN groupadd --gid=1100 matrix && \
    useradd --create-home --uid=1100 --gid=1100 matrix && \
    echo 'matrix ALL = (ALL) NOPASSWD: ALL' >> /etc/sudoers

USER root
WORKDIR /home/matrix

# Somewhere to put the sqllite DB which cannot be on NFS
RUN chown -R matrix:matrix /app/ && mkdir /app/jupyter 
RUN touch /var/log/stderr.log && touch /var/log/stdout.log && chown matrix:matrix /var/log/stderr.log && chown matrix:matrix /var/log/stdout.log

ENV JULIA_DEPOT_PATH=/opt/julia
ENV JULIA_PKGDIR=/opt/julia
ENV JUPYTER /usr/local/bin/jupyter
ENV JULIA_VERSION=1.1.0

#julia
RUN mkdir /opt/julia-${JULIA_VERSION} && \
    cd /tmp && \
    wget -q https://julialang-s3.julialang.org/bin/linux/x64/`echo ${JULIA_VERSION} | cut -d. -f 1,2`/julia-${JULIA_VERSION}-linux-x86_64.tar.gz && \
    echo "80cfd013e526b5145ec3254920afd89bb459f1db7a2a3f21849125af20c05471 *julia-${JULIA_VERSION}-linux-x86_64.tar.gz" | sha256sum -c - && \
    tar xzf julia-${JULIA_VERSION}-linux-x86_64.tar.gz -C /opt/julia-${JULIA_VERSION} --strip-components=1 && \
    rm /tmp/julia-${JULIA_VERSION}-linux-x86_64.tar.gz && \
	ln -fs /opt/julia-*/bin/julia /usr/local/bin/julia

RUN julia -e 'import Pkg; Pkg.update()' && \
    julia -e "using Pkg; pkg\"add Gadfly RDatasets IJulia InstantiateFromURL PyPlot Images DataFrames\"; pkg\"precompile\"" 

RUN	cp -r /root/.local/share/jupyter/kernels/julia-* /usr/local/share/jupyter/kernels/ &&  \
    chmod -R +rx /usr/local/share/jupyter/kernels/julia-*/ && \
    chmod -R +rx /opt/julia 

EXPOSE 8888

COPY README.txt /README.txt

ENTRYPOINT ["sh", "-c", "/app/entrypoint.sh --allow-root >>/var/log/stdout.log 2>>/var/log/stderr.log"]

