FROM mysql:5.7

# Change postgres user to run as UID/GID 1100
RUN usermod -u 1100 mysql && groupmod -g 1100 mysql
#ENTRYPOINT ["sh", "-c", "mysqld >>/var/log/stdout.log 2>>/var/log/stderr.log"]

RUN touch /var/log/stderr.log && touch /var/log/stdout.log

ENTRYPOINT ["docker-entrypoint.sh"]

EXPOSE 3306 33060
#CMD ["mysqld >>/var/log/stdout.log 2>>/var/log/stderr.log"]

CMD ["mysqld"]
