#Script for common package installation on MatrixDS docker image
p<-c('tidyverse','plotly','shiny','shinydashboard','devtools','FinCal','googleVis','DT',
     'htmlwidgets','rmarkdown','lubridate','leaflet','sparklyr','magrittr','openxlsx',
     'packrat','roxygen2','knitr','readr','readxl','stringr','broom','feather',
     'forcats','testthat','plumber','RCurl','rvest','mailR','nlme','foreign','lattice',
     'expm','Matrix','flexdashboard','caret','mlbench','plotROC','RJDBC','rgdal',
     'highcharter','tidyquant','timetk','quantmod','PerformanceAnalytics','scales',
     'tidymodels','C50','xgboost','parsnip','rmetalog')


install.packages(p,dependencies = TRUE)
