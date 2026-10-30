FROM registry.cloud.college.ucsb.edu/ucsb/rstudio-base:latest

LABEL maintainer="LSIT Systems <lsitops@ucsb.edu>"

USER root

#RUN R -e "install.packages(c('<library>', '<library>'), repos = 'https://cloud.r-project.org/', Ncpus = parallel::detectCores())"

RUN mamba install -y -c conda-forge -c r\
:x
    r-dslabs\
    r-estimatr\
    r-fixest\
    r-gt\
    r-islr\
    r-kableextra\
    r-modelsummary\
    r-rdrobust\
    r-tidysynth &&\
    conda clean -afy &&\
    /usr/local/bin/fix-permissions "${CONDA_DIR}" || true

USER $NB_USER

