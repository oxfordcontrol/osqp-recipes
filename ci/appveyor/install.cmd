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
call conda config --set auto_update_conda false
call conda install conda conda-build --yes

:: Fix the 64-bit, Python 2.7 case
IF "%PLATFORM%"=="x64" (
	IF "%PYTHON_VERSION%"=="2.7" (
		call conda create -n vs2008 -c conda-forge vs2008_express_vc_python_patch --yes
		call %MINICONDA_PATH%\envs\vs2008\Scripts\setup_x64.bat
	)
)

@echo off
