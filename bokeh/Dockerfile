FROM matrixds/pythonbase:v5
# Install nodejs (see: https://askubuntu.com/a/720814)
RUN curl -sL https://deb.nodesource.com/setup_8.x | bash \
    && apt-get install nodejs \
    && apt-get -yq autoremove \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

ARG VERSION
RUN pip install --upgrade pip \
#    && pip install bokeh \
    && rm -rf ~/.cache/pip

RUN conda install -c bokeh/channel/dev bokeh

# Add entrypoint (this allows variable expansion)
COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

ENV ORIGIN="127.0.0.1:5100" PORT="5100" PREFIX="" LOG_LEVEL="info"

# Example comment
EXPOSE 5100

COPY ./apps/ /apps


RUN echo "Bokeh Server logs" > /var/log/stdout.log

WORKDIR /

ENTRYPOINT ["sh", "-c", "/entrypoint.sh >>/var/log/stdout.log 2>>/var/log/stderr.log"]
