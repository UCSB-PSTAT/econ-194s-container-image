FROM registry.cloud.college.ucsb.edu/ucsb/rstudio-base:latest

LABEL maintainer="LSIT Systems <lsitops@ucsb.edu>"

USER root

RUN R -e "install.packages(c('AER', 'dslabs', 'estimatr', 'fixest', 'gt', 'ISLR', 'kableExtra', 'modelsummary', 'rdrobust', 'tidysynth'), repos = 'https://cloud.r-project.org/', Ncpus = parallel::detectCores())" &&\
    /usr/local/bin/fix-permissions "${CONDA_DIR}" || true

#RUN mamba install -y -c conda-forge -c r\
#    r-dslabs\
#    r-estimatr\
#    r-fixest\
#    r-gt\
#    r-islr\
#    r-kableextra\
#    r-modelsummary\
#    r-rdrobust\
#    r-tidysynth &&\
#    conda clean -afy &&\
#    /usr/local/bin/fix-permissions "${CONDA_DIR}" || true

USER $NB_USER

