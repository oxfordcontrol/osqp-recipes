@echo on

REM Anaconda
cd %APPVEYOR_BUILD_FOLDER%\conda_recipe

call conda build --python %PYTHON_VERSION% osqp --output-folder conda-bld\
if errorlevel 1 exit /b 1

REM  :: Perform Python tests
REM  :: -------------------------------------------------------
REM  :: Install python interface
REM  cd %APPVEYOR_BUILD_FOLDER%
REM  python setup.py install
REM
REM  :: Test python interface
REM  cd %APPVEYOR_BUILD_FOLDER%
REM  python -m pytest
REM  if errorlevel 1 exit /b 1

@echo off
