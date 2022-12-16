FROM zhenghaoyu11/econ_data_science:econ

RUN R --slave -e 'install.packages(c("randomForest","glmnet","doBy","Quandl","AER"), repos="https://cran.r-project.org/")'

