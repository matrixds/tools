#Script for common package installation on MatrixDS docker image
PKGS <- c(
     "tidyverse"
)

install.packages(PKGS, dependencies = TRUE)
