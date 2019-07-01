FROM matrixds/pythonbase:v5

ARG VERSION
RUN pip install --upgrade pip \
    && rm -rf ~/.cache/pip

RUN pip install flask

# Add entrypoint (this allows variable expansion)
COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

EXPOSE 5000

COPY ./apps/ /apps

RUN echo "Flask Server logs" > /var/log/stdout.log

WORKDIR /

ENTRYPOINT ["sh", "-c", "/entrypoint.sh >>/var/log/stdout.log 2>>/var/log/stderr.log"]
