#Script for common package installation on MatrixDS docker image
#p<-c('tidyverse','ggplot2','plotly','shiny','shinydashboard','devtools','FinCal','googleVis','DT',
#     'htmlwidgets','rmarkdown','lubridate','leaflet','sparklyr','magrittr','openxlsx',
#     'packrat','roxygen2','knitr','readr','readxl','stringr','broom','feather',
#     'forcats','testthat','plumber','RCurl','rvest','mailR','nlme','foreign','lattice',
#     'expm','Matrix','flexdashboard','caret','mlbench','plotROC','RJDBC','rgdal')

#install.packages(p,dependencies = TRUE, clean = TRUE)

# Make Kernel available to Jupyter
devtools::install_github('IRkernel/IRkernel', clean = TRUE)
IRkernel::installspec()
IRkernel::installspec(user = FALSE)
