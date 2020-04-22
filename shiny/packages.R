#Script for common package installation on MatrixDS docker image
p <- c('stringdist')


install.packages(p, dependencies = TRUE)
