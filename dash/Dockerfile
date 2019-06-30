FROM matrixds/pythonbase:v5

ARG VERSION
RUN pip install --upgrade pip \
    && rm -rf ~/.cache/pip

RUN pip install dash dash-daq flask

# Add entrypoint (this allows variable expansion)
COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

ENV ORIGIN="127.0.0.1:8050" PORT="8050" PREFIX="" LOG_LEVEL="info"

EXPOSE 8050

COPY ./apps/ /apps

RUN echo "Dash Server logs" > /var/log/stdout.log

WORKDIR /

ENTRYPOINT ["sh", "-c", "/entrypoint.sh"]
