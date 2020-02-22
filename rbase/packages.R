#Script for common package installation on MatrixDS docker image
p<-c('nnet','kknn','randomForest','xgboost','tidyverse','plotly','shiny','shinydashboard',
	  'devtools','DT', 'kernlab', 'parsnip', 'tidymodels',
     'htmlwidgets','rmarkdown','lubridate','leaflet','sparklyr','magrittr','openxlsx',
     'packrat','roxygen2','knitr','readr','readxl','stringr','broom','feather',
     'forcats','testthat','plumber','RCurl','rvest','nlme','foreign','lattice',
     'expm','Matrix','flexdashboard','mlbench','plotROC','RJDBC','rgdal',
     'highcharter','timetk','scales', 'C50','xgboost','reticulate')


install.packages(p,dependencies = TRUE)
