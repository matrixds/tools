FROM asmith:v1

COPY packages.R /usr/local/lib/R/packages.R

#install R packages
RUN R CMD javareconf && \
    Rscript /usr/local/lib/R/packages.R
