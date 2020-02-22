FROM ubuntu:18.04

USER root

ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update

# Install all basic OS dependencies uncomment dependincies if they are requred for down steam R or python packages
RUN apt-get update \
  && apt-get install -yq --no-install-recommends \
    apt \
    apt-utils \
    bash-completion \
    build-essential \
   byacc \
    bzip2 \
    ca-certificates \
   emacs \
   file \
   flex \
   fonts-dejavu \
   fonts-liberation \
   fonts-texgyre \
    g++ \
    gcc \
    gettext \
    gfortran \
    git \
    gnupg2 \
    gsfonts \
    hdf5-tools \
    icu-devtools \
    jed \
    lmodern \
    locales \
    make \
   mesa-common-dev \
   nano \
   netcat \
   openjdk-8-jdk \
   pandoc \
     software-properties-common \
    sudo \
    texlive-fonts-extra \
    texlive-fonts-recommended \
    texlive-generic-recommended \
    texlive-latex-base \
    texlive-latex-extra \
    texlive-xetex \
   tzdata \
    unzip \
    vim \
    wget \
    zip \
  && echo "en_US.UTF-8 UTF-8" >> /etc/locale.gen \
  && locale-gen en_US.utf8 \
  && /usr/sbin/update-locale LANG=en_US.UTF-8

#make the "en_US.UTF-8" locale so postgres will be utf-8 enabled by default
ENV LANG=en_US.utf8 \
    LC_ALL=en_US.UTF-8 \
    TERM=xterm \
    APT_KEY_DONT_WARN_ON_DANGEROUS_USAGE=1

#Install additional dependency libraries
RUN apt-get install -yq --no-install-recommends \
    libblas-dev \
    libcurl4 \
    libcurl4-gnutls-dev \
    libgdal-dev \
    libglu1-mesa-dev \
    libgmp3-dev \
    libicu60 \
    libjpeg-turbo8 \
    libmagick++-dev \
    libmariadb-client-lgpl-dev \
    libmpfr-dev \
    libmpfr-dev \
    libncurses5-dev \
    libnettle6 \
    libnlopt-dev \
    libopenblas-dev \
    libpango1.0-0 \
    libpangocairo-1.0-0 \
    libpng16-16 \
    libpq-dev \
    libsasl2-dev \
    libsm6 \
    libssl-dev \
    libtiff5 \
    libtool \
    libudunits2-dev \
    libxext-dev \
    libxml2-dev \
    libxrender1 \
    zlib1g-dev

# Set timezone noninteractively
RUN ln -fs /usr/share/zoneinfo/US/Pacific /etc/localtime

# Python stuff
RUN apt-get install -y --no-install-recommends \
    # python-pip \
    # python-setuptools \
    # python-wheel \
    # python-dev \
    python3-pip \
    python3-setuptools \
    python3-wheel \
    python3-dev \
  && apt-get clean

#install git, vim

RUN apt-get install -y git \
	                   vim \
                       curl

#install kaggle cli
RUN pip3 install kaggle dvc tensorflow keras pandas 

#mongo cli
#RUN apt-get install -y mongodb-clients

#mysql shell
#RUN apt-get install -y mysql-client

#postgre shell
#RUN apt-get install -y postgresql-client

# Add Tini
ENV TINI_VERSION v0.18.0
ADD https://github.com/krallin/tini/releases/download/${TINI_VERSION}/tini /tini
RUN chmod +x /tini
ENTRYPOINT ["/tini", "--"]

RUN apt-get clean \
  && rm -rf /var/lib/apt/lists/*
