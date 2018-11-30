FROM postgres:10.4

ENV POSTGRES_USER postgres

#COPY docker-entrypoint.sh /usr/local/bin/
# Change postgres user to run as UID/GID 1100
RUN usermod -u 1100 postgres && groupmod -g 1100 postgres && chmod a+rwX /var/log

ENTRYPOINT ["sh", "-c", "/usr/local/bin/docker-entrypoint.sh postgres >>/var/log/stdout.log 2>>/var/log/stderr.log"]
CMD = []
