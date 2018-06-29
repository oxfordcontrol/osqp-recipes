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
conda install conda conda-build --yes
if errorlevel 1 exit /b 1

@echo off
