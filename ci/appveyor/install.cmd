@echo on

:: Make sure all the submodules are updated correctly
cd %APPVEYOR_BUILD_FOLDER%
git submodule update --init --recursive

:: Activate test environment anaconda
IF "%PLATFORM%"=="x86" (
	set MINICONDA_PATH=%MINICONDA%
) ELSE (
	set MINICONDA_PATH=%MINICONDA%-%PLATFORM%
)

call %MINICONDA_PATH%\Scripts\activate
conda config --set always_yes yes --set changeps1 no
conda config --set auto_update_conda false
conda install conda conda-build
if errorlevel 1 exit /b 1

@echo off
