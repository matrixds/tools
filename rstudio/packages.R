#Script for common package installation on MatrixDS docker image
p<-c('stringdist','cli','googledrive')


install.packages(p,dependencies = TRUE)
