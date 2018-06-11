#!/bin/bash
set -ev


# Update variables from install
# CMake
if [[ "${TRAVIS_OS_NAME}" == "linux" ]]; then
    export PATH=${DEPS_DIR}/cmake/bin:${PATH}
fi
# Anaconda
export PATH=${DEPS_DIR}/miniconda/bin:$PATH
hash -r
source activate testenv


# Add MKL shared libraries to the path
MKL_SHARED_LIB_DIR=`ls -d ${DEPS_DIR}/miniconda/pkgs/*/lib | grep mkl-2 | tail -1`
OPENMP_SHARED_LIB_DIR=`ls -d ${DEPS_DIR}/miniconda/pkgs/*/lib | grep openmp | tail -1`
if [[ "${TRAVIS_OS_NAME}" == "linux" ]]; then
    export LD_LIBRARY_PATH=${MKL_SHARED_LIB_DIR}:${OPENMP_SHARED_LIB_DIR}:${LD_LIBRARY_PATH}
else if [[ "$TRAVIS_OS_NAME" == "osx" ]]; then
    export DYLD_LIBRARY_PATH=${MKL_SHARED_LIB_DIR}:${OPENMP_SHARED_LIB_DIR}:${DYLD_LIBRARY_PATH}
fi
fi


# Anaconda
cd ${TRAVIS_BUILD_DIR}/conda_recipe

# echo "Creating conda package..."
# conda build --python ${PYTHON_VERSION} osqp --output-folder conda-bld/

echo "Deploying to Anaconda.org..."
anaconda -t $ANACONDA_TOKEN upload conda-bld/**/osqp-*.tar.bz2 --user oxfordcontrol --force

echo "Successfully deployed to Anaconda.org."

exit 0
