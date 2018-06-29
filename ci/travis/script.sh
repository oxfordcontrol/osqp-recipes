#!/bin/bash
set -ev

# Anaconda
source ${DEPS_DIR}/miniconda/bin/activate

echo "Creating conda package..."
cd ${TRAVIS_BUILD_DIR}/conda_recipe
conda build --python ${PYTHON_VERSION} osqp --output-folder conda-bld/
