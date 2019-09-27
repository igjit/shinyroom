FROM rocker/tidyverse:3.6.1

RUN apt update && apt install -y \
    libfftw3-dev \
    libtiff-dev \
    libx11-dev \
    libxt-dev \
 && apt clean \
 && rm -rf /var/lib/apt/lists/*

RUN install2.r --error \
    golem \
    imager \
    shinythemes \
 && rm -rf /tmp/downloaded_packages/

RUN R -e 'remotes::install_github("igjit/shinyloadermessage")'

ENV PROJ_DIR=/opt/shinyroom

COPY . ${PROJ_DIR}

WORKDIR ${PROJ_DIR}

RUN R -e 'remotes::install_local(".")'

CMD R -e "options(shiny.port = ${PORT}, shiny.host = '0.0.0.0', golem.app.prod = TRUE); shinyroom::run_app()"
