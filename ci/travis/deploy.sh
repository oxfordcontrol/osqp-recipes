#!/bin/bash
set -ev

# Anaconda
source ${DEPS_DIR}/miniconda/bin/activate

echo "Deploying to Anaconda.org..."
anaconda -t $ANACONDA_TOKEN upload conda-bld/**/osqp-*.tar.bz2 --user oxfordcontrol --force

echo "Successfully deployed to Anaconda.org."

exit 0
