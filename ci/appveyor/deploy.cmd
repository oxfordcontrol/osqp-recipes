@echo on

REM Anaconda deploy
cd %APPVEYOR_BUILD_FOLDER%\conda_recipe

REM  call conda build --python %PYTHON_VERSION% osqp --output-folder conda-bld\
REM  if errorlevel 1 exit /b 1

call anaconda -t %ANACONDA_TOKEN% upload conda-bld/**/osqp-*.tar.bz2 --user oxfordcontrol --force
if errorlevel 1 exit /b 1

@echo off

