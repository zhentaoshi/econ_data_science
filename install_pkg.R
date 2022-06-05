# use renv to create and maintain an environment

if ( ("renv" %in% installed.packages()) == FALSE){
  install.packages("renv")
}
renv::restore()