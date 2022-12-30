# by Haoyu
# See here for image contents: https://hub.docker.com/r/jupyter/datascience-notebook/

FROM jupyter/datascience-notebook

# [Optional] If your pip requirements rarely change, uncomment this section to add them to the image.
# COPY requirements.txt /tmp/pip-tmp/
# RUN pip3 --disable-pip-version-check --no-cache-dir install -r /tmp/pip-tmp/requirements.txt \
#    && rm -rf /tmp/pip-tmp

# [Optional] Uncomment this section to install additional OS packages.
# RUN apt-get update && export DEBIAN_FRONTEND=noninteractive \
#     && apt-get -y install --no-install-recommends <your-package-list-here>

USER root

RUN R -e "install.packages(c('languageserver','jsonlite','flexdashboard','plotly','ggplot2','magrittr','dplyr','zoo','rvest','doParallel','ranger','caret','foreach','tibble','Matrix','shiny'), dependencies=TRUE, repos='http://cran.rstudio.com/')"

RUN R -e "install.packages(c('randonForest','MASS','plotrix','grid','Quandl'),dependencies=TRUE, repo='http://cran.rstudio.com/')"

RUN R -e 'install.packages(c("doBy","Quandl","AER"), dependencies=TRUE, repos="https://cran.rstudio.org/")'

# the r package "CVXR" is unavailable in cran.rstudio.com. To deal with it later.