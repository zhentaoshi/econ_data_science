FROM zhenghaoyu11/econ_data_science:econ

RUN R --slave -e 'install.packages("randomForest", repos="https://cran.r-project.org/")'

