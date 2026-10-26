@echo off
setlocal
title Galaxy Castle

rem Always run from the folder that contains this script.
cd /d "%~dp0"

if exist "GalaxyCastle.exe" goto run

echo Preparing Galaxy Castle for its first launch, one moment...

for %%P in (001 002 003 004) do (
    if not exist "data\GalaxyCastle.exe.%%P" goto missing
)

copy /b "data\GalaxyCastle.exe.001"+"data\GalaxyCastle.exe.002"+"data\GalaxyCastle.exe.003"+"data\GalaxyCastle.exe.004" "GalaxyCastle.exe" >nul 2>nul
if not exist "GalaxyCastle.exe" goto failed

:run
start "" "GalaxyCastle.exe"
exit /b 0

:missing
echo.
echo Part of the game is missing.
echo The files data\GalaxyCastle.exe.001 ... .004 must sit next to this script.
echo Please download or extract the demo again.
echo.
pause
exit /b 1

:failed
echo.
echo Could not start Galaxy Castle.
echo Check that this folder is writable and has about 250 MB of free disk space.
echo.
pause
exit /b 1
