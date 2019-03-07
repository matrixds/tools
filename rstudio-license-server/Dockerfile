FROM ubuntu:18.04

ARG key
RUN echo $key
RUN apt-get update
RUN apt-get install -y wget sudo net-tools gdebi-core vim sudo less inetutils-ping

RUN wget https://s3.amazonaws.com/rstudio-license-server/rsp-license-server-1.0.9-x86_64.deb
RUN gdebi --n rsp-license-server-1.0.9-x86_64.deb

RUN echo "/usr/sbin/rsp-license-server activate $key"
RUN /usr/sbin/rsp-license-server activate $key

COPY rsp-license-server.conf /etc/rsp-license-server.conf
COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

ENTRYPOINT ["sh", "-c", "/entrypoint.sh >>/var/log/stdout.log 2>>/var/log/stderr.log"]
