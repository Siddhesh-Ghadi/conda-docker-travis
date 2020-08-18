#!/bin/bash
yum update -y
yum install python3 wget gcc g++ make -y
wget https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-ppc64le.sh -O miniconda.sh
bash miniconda.sh -b -p $HOME/miniconda
source "$HOME/miniconda/etc/profile.d/conda.sh"
hash -r
conda config --set always_yes yes --set changeps1 no
conda update -q conda
conda info -a
conda create -q -n test-environment python="3.6"
conda activate test-environment
conda install -y git
echo "INSTALLED"
conda config --prepend channels https://public.dhe.ibm.com/ibmdl/export/pub/software/server/ibm-ai/conda/
export IBM_POWERAI_LICENSE_ACCEPT=yes
conda install --yes --quiet conda-forge-ci-setup=2 conda-build=3.19.2 -c conda-forge
