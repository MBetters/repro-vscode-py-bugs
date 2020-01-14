#!/bin/bash

# Show commands and outputs
set -xe

# Install Miniconda3 if you don't already have it
conda --version
if [ $? -ne 0 ]; then
    wget https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh
    bash Miniconda3-latest-Linux-x86_64.sh
    echo "Conda was just installed. Now close your terminal and rerun this script."
    exit 0
fi

# Build the Conda environment for this project if you haven't already
if [ ! -d /home/vagrant/miniconda3/envs/${PWD##*/} ]; then
    conda config --add channels conda-forge
    conda update pip
    conda create -y -n ${PWD##*/} python=3.7.4 -f condaenv.yml
    conda activate ${PWD##*/}
fi
