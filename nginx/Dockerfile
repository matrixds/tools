FROM nginx:1.15.0-alpine

COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh


COPY index.html /index.html

ENTRYPOINT /entrypoint.sh
