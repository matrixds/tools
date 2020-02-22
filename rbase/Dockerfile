FROM matrixds/asmith
#FROM matrixds/asmith:slim1

#install some helper python packages
RUN pip3 install sympy numpy

# R Repo, see https://cran.r-project.org/bin/linux/ubuntu/README.html
RUN echo 'deb https://cloud.r-project.org/bin/linux/ubuntu bionic-cran35/' >> /etc/apt/sources.list
RUN apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys E298A3A825C0D65DFD57CBB651716619E084DAB9
RUN add-apt-repository ppa:marutter/c2d4u3.5

# R-specific packages
RUN apt-get update \
  && apt-get install -y --no-install-recommends \
    r-base \
    r-base-core \
    r-recommended \
    r-base-dev \
    r-cran-boot \
    r-cran-class \
    r-cran-cluster \
    r-cran-codetools \
    r-cran-foreign \
    r-cran-kernsmooth \
    r-cran-matrix \
    r-cran-rjava \
    r-cran-rpart \
    r-cran-spatial \
    r-cran-survival
COPY r_packages.R .
RUN R CMD javareconf \
  && Rscript r_packages.R \
  && rm r_packages.R


COPY packages.R /usr/local/lib/R/packages.R

#install R packages
RUN R CMD javareconf && \
    Rscript /usr/local/lib/R/packages.R
