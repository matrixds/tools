FROM rbase:v1

ARG RSTUDIO_VERSION
ENV PATH=/usr/lib/rstudio-server/bin:$PATH

#Creating etc folder at /usr/local/lib/R/ location Searce
RUN mkdir -p /usr/local/lib/R/etc



## Download and install RStudio server & dependencies
## Attempts to get detect latest version, otherwise falls back to version given in $VER
## Symlink pandoc, pandoc-citeproc so they are available system-wide
RUN apt-get update \
  && apt-get install -y --no-install-recommends \
#    file \
    libapparmor1 \
    libcurl4-openssl-dev \
    libedit2 \
    lsb-release \
    psmisc \
  && wget -O libssl1.0.0.deb http://ftp.debian.org/debian/pool/main/o/openssl/libssl1.0.0_1.0.1t-1+deb8u8_amd64.deb \
  && dpkg -i libssl1.0.0.deb \
  && rm libssl1.0.0.deb \
  && RSTUDIO_LATEST=$(wget --no-check-certificate -qO- https://s3.amazonaws.com/rstudio-server/current.ver) \
  && [ -z "$RSTUDIO_VERSION" ] && RSTUDIO_VERSION=$RSTUDIO_LATEST || true \
  && wget -q http://download2.rstudio.org/rstudio-server-${RSTUDIO_VERSION}-amd64.deb \
  && dpkg -i rstudio-server-${RSTUDIO_VERSION}-amd64.deb \
  && rm rstudio-server-*-amd64.deb \
  ## Symlink pandoc & standard pandoc templates for use system-wide
  && ln -s /usr/lib/rstudio-server/bin/pandoc/pandoc /usr/local/bin \
  && ln -s /usr/lib/rstudio-server/bin/pandoc/pandoc-citeproc /usr/local/bin \
  && git clone https://github.com/jgm/pandoc-templates \
  && mkdir -p /opt/pandoc/templates \
  && cp -r pandoc-templates*/* /opt/pandoc/templates && rm -rf pandoc-templates* \
  && mkdir /root/.pandoc && ln -s /opt/pandoc/templates /root/.pandoc/templates \
  && apt-get clean \
  && rm -rf /var/lib/apt/lists/ \
  ## RStudio wants an /etc/R, will populate from $R_HOME/etc
  && mkdir -p /etc/R \
  ## Write config files in $R_HOME/etc
  && echo '\n\
    \n# Configure httr to perform out-of-band authentication if HTTR_LOCALHOST \
    \n# is not set since a redirect to localhost may not work depending upon \
    \n# where this Docker container is running. \
    \nif(is.na(Sys.getenv("HTTR_LOCALHOST", unset=NA))) { \
    \n  options(httr_oob_default = TRUE) \
    \n}' >> /usr/local/lib/R/etc/Rprofile.site \
  && echo "PATH=${PATH}" >> /usr/local/lib/R/etc/Renviron \
  ## Need to configure non-root user for RStudio
  && useradd rstudio \
  && echo "rstudio:matrix" | chpasswd \
	&& mkdir /home/rstudio \
	&& chown rstudio:rstudio /home/rstudio \
	&& addgroup rstudio staff \
  ## Prevent rstudio from deciding to use /usr/bin/R if a user apt-get installs a package
  &&  echo 'rsession-which-r=/usr/bin/R' >> /etc/rstudio/rserver.conf \
  ## use more robust file locking to avoid errors when using shared volumes:
#  && echo 'lock-type=advisory' >> /etc/rstudio/file-locks \
  ## configure git not to request password each time
  && git config --system credential.helper 'cache --timeout=3600' \
  && git config --system push.default simple \
  ## Set up S6 init system
  && wget -P /tmp/ https://github.com/just-containers/s6-overlay/releases/download/v1.11.0.1/s6-overlay-amd64.tar.gz \
  && tar xzf /tmp/s6-overlay-amd64.tar.gz -C / \
  && mkdir -p /etc/services.d/rstudio \
  && echo '#!/usr/bin/with-contenv bash \
          \n exec /usr/lib/rstudio-server/bin/rserver --server-daemonize 0' \
          > /etc/services.d/rstudio/run \
  && echo '#!/bin/bash \
          \n rstudio-server stop' \
          > /etc/services.d/rstudio/finish

COPY userconf.sh /etc/cont-init.d/userconf

## running with "-e ADD=shiny" adds shiny server
#COPY add_shiny.sh /etc/cont-init.d/add

COPY pam-helper.sh /usr/lib/rstudio-server/bin/pam-helper

EXPOSE 8787

## automatically link a shared volume for kitematic users
#VOLUME /home/rstudio/kitematic

COPY user-settings /home/rstudio/.rstudio/monitored/user-settings/
# No chown will cause "RStudio Initalization Error"
# "Error occurred during the transmission"; RStudio will not load.
RUN chown -R rstudio:rstudio /home/rstudio/.rstudio


############ https://github.com/matrixds/tools/blob/master/rstudio/Dockerfile ##########

RUN \
  apt-get update && apt-get install -y && \
  DEBIAN_FRONTEND=noninteractive apt install --no-install-recommends -y -o Dpkg::Options::="--force-confdef" -o Dpkg::Options::="--force-confold" \
    default-jre default-jdk icu-devtools && apt-get clean
#    r-base-core icu-devtools zlib1g-dev libncurses5-dev libsasl2-dev libnlopt-dev libgmp3-dev libglu1-mesa-dev \
#    libssl-dev libxml2-dev openjdk-8-jdk  r-cran-rjava libmariadb-client-lgpl-dev r-cran-rgl libmpfr-dev \
#    libpq-dev texlive-xetex libgdal-dev libudunits2-dev libmagick++-dev \
#    && apt-get clean
#  R CMD javareconf

COPY entrypoint.sh /entrypoint.sh

#add encrypted auth html file
COPY encrypted-sign-in.htm /usr/lib/rstudio-server/www/templates/encrypted-sign-in.htm

#Reset password for rstudio user
#RUN echo "rstudio:rstudio" | chpasswd

RUN   usermod -u 1100 rstudio && \
      groupmod -g 1100 rstudio && \
      chown -R rstudio:rstudio /home/rstudio && \
      chmod +x /entrypoint.sh

ENV PASSWORD matrix
ENV DISABLE_AUTH true
ENV ROOT TRUE
WORKDIR /home/rstudio
COPY README.txt /home/rstudio/README.txt

ENTRYPOINT ["sh", "-c", "/entrypoint.sh >>/var/log/stdout.log 2>>/var/log/stderr.log"]

#CMD ["/init"]
