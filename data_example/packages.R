# install missing packages

wanted <- (c("knitr", "tidyverse", "magrittr",
  "AER", "quantmod",
  "reshape2", "gridExtra",
  "doBy", "Quandl",
  "caret"))

ins <- installed.packages()

missing <- setdiff(wanted, ins[,"Package"])

install.packages(missing)