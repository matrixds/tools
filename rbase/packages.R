#Script for common package installation on MatrixDS docker image
p<-c('httr','nnet','kknn','randomForest','xgboost','tidyverse','plotly','shiny','shinydashboard',
	  'devtools','DT', 'kernlab', 'parsnip', 'tidymodels','C50','xgboost', 'mlbench',
     'htmlwidgets','rmarkdown','lubridate','leaflet','sparklyr','magrittr','openxlsx',
     'packrat','roxygen2','knitr','readr','readxl','stringr','broom','feather',
     'forcats','testthat','plumber','RCurl','rvest','nlme','foreign','lattice',
     'expm','Matrix','flexdashboard','plotROC','RJDBC','rgdal',
     'highcharter','timetk','scales', 'reticulate',
     'shinyWidgets','flextable','knitr','ggiraph','ECharts2Shiny','kableExtra','cli','gt')


install.packages(p,dependencies = TRUE)

devtools::install_github("laresbernardo/lares")
