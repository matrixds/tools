
# Make Kernel available to Jupyter
devtools::install_github('IRkernel/IRkernel', clean = TRUE)
IRkernel::installspec()
IRkernel::installspec(user = FALSE)
