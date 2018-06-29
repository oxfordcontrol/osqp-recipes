#!/bin/bash
set -ev

# Create deps dir
mkdir ${DEPS_DIR}
cd ${DEPS_DIR}

# Use the miniconda installer for faster download / install of conda
# itself
if [[ $TRAVIS_OS_NAME == 'osx' ]]; then
    wget http://repo.continuum.io/miniconda/Miniconda3-latest-MacOSX-x86_64.sh -O miniconda.sh;
else
    wget http://repo.continuum.io/miniconda/Miniconda3-latest-Linux-x86_64.sh -O miniconda.sh;
fi
chmod +x miniconda.sh && ./miniconda.sh -b -p ${DEPS_DIR}/miniconda
source ${DEPS_DIR}/miniconda/bin/activate
conda config --set always_yes yes --set changeps1 no
conda update --yes -q conda
conda install conda-build anaconda-client
