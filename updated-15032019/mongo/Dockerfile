FROM mongo:3.6.3

# Change mongodb user to run as UID/GID 1100
RUN usermod -u 1100 mongodb && groupmod -g 1100 mongodb

#this script is already added from base image i.e. mongo image
# Modified entrypoint to ensure database directory exists
#COPY docker-entrypoint.sh /usr/local/bin/

##newly added
ENTRYPOINT ["docker-entrypoint.sh"]

EXPOSE 27017
CMD ["mongod"]
