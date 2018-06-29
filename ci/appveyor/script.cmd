@echo on

REM Anaconda
cd %APPVEYOR_BUILD_FOLDER%\conda_recipe

call conda build --python %PYTHON_VERSION% osqp --output-folder conda-bld\
if errorlevel 1 exit /b 1

@echo off
