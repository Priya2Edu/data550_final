FROM rocker/tidyverse:4.5.1 as base

RUN apt-get update && apt-get install -y \
  libuv1 \
  libuv1-dev \
  libxml2-dev \
  libcurl4-openssl-dev \
  libssl-dev \
  && rm -rf /var/lib/apt/lists/*

RUN mkdir -p /home/rstudio/project
WORKDIR /home/rstudio/project

RUN mkdir -p renv
COPY renv.lock renv.lock
COPY .Rprofile .Rprofile
COPY renv/activate.R renv/activate.R
COPY renv/settings.json renv/settings.json

RUN mkdir renv/.cache
ENV RENV_PATHS_CACHE renv/.cache

RUN Rscript -e "renv::restore(prompt = FALSE)"

##########

FROM rocker/tidyverse:4.5.1

RUN apt-get update && apt-get install -y \
  libuv1 \
  libuv1-dev \
  libxml2-dev \
  libcurl4-openssl-dev \
  libssl-dev \
  && rm -rf /var/lib/apt/lists/*

RUN mkdir -p /home/rstudio/project

WORKDIR /home/rstudio/project
COPY --from=base /home/rstudio/project .

ENV WHICH_CONFIG=default

COPY Makefile Makefile
COPY README.md README.md
COPY fetal_health.csv fetal_health.csv
COPY Edupuganti_550_final.Rmd Edupuganti_550_final.Rmd

RUN mkdir -p code
COPY code/01_table_output.R code/01_table_output.R
COPY code/02_scatterplot_output.R code/02_scatterplot_output.R
COPY code/03_render_output.R code/03_render_output.R

RUN mkdir -p output
RUN mkdir -p final_report

RUN apt-get update && apt-get install -y pandoc

ENTRYPOINT ["bash", "-c", "set -e; make; mv Edupuganti_550_final.html final_report/"]