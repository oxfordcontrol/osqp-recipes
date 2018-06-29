#!/bin/bash
set -ev

# Anaconda
cd ${TRAVIS_BUILD_DIR}/conda_recipe

echo "Creating conda package..."
conda build --python ${PYTHON_VERSION} osqp --output-folder conda-bld/
