@echo off
setlocal enabledelayedexpansion
title Push Updated DLLs to GitHub
cd /d "E:\Loader\shadow-modules-git"

echo ========================================================
echo        SHADOW CHEATS - GITHUB DLL SYNC AND UPLOAD
echo ========================================================
echo.

:: Auto-copy latest built DLL from UPDATED BY ERNESTO if present
set "BUILD_DLL=E:\Panel\UPDATED BY ERNESTO\UPDATED BY ERNESTO\examples\example_win32_directx11\Build\GREJ AIM.dll"
if exist "!BUILD_DLL!" (
    echo [*] Checking latest build from Panel...
    copy /y "!BUILD_DLL!" "E:\Loader\shadow-modules-git\dll\Internal.dll" >nul 2>&1
    echo [+] Synced GREJ AIM.dll -^> dll\Internal.dll
)

:: Sync to local loader Release\src for local testing parity
echo [*] Syncing to local loader Release\src folder...
if exist "E:\Loader\ORGINIAL LOADER\ORGINIAL LOADER\examples\example_win32_directx11\Release\src\" (
    copy /y "dll\Internal.dll" "E:\Loader\ORGINIAL LOADER\ORGINIAL LOADER\examples\example_win32_directx11\Release\src\Internal.dll" >nul 2>&1
    copy /y "dll\Internal Plus.dll" "E:\Loader\ORGINIAL LOADER\ORGINIAL LOADER\examples\example_win32_directx11\Release\src\Internal Plus.dll" >nul 2>&1
    copy /y "dll\Internal.dll" "E:\Loader\ORGINIAL LOADER\ORGINIAL LOADER\examples\example_win32_directx11\Release\src\SHADOW CHEATS AIM DONE.dll" >nul 2>&1
    echo [+] Local loader files updated!
)

echo.
echo [*] Staging DLLs for Git...
git add dll\*.dll

echo [*] Current Git Status:
git status --short

echo.
echo [*] Creating commit...
git commit -m "Update DLL modules - %date% %time%"

echo.
echo [*] Pushing to GitHub (origin main)...
git push --force origin main

echo.
if %ERRORLEVEL% equ 0 (
    echo ========================================================
    echo  [+] SUCCESS! All DLLs are uploaded and LIVE on GitHub!
    echo ========================================================
) else (
    echo ========================================================
    echo  [-] ERROR! Git push encountered an issue. Check connection.
    echo ========================================================
)

echo.
pause
