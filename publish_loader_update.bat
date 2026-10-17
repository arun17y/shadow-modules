@echo off
setlocal enabledelayedexpansion
title Publish Loader Update (manifest.json) to GitHub
cd /d "E:\Loader\shadow-modules-git"
color 0B

echo =======================================================================
echo     SHADOW CHEATS - PUBLISH LOADER UPDATE (MANIFEST.JSON)
echo =======================================================================
echo.
echo [*] Target file: E:\Loader\shadow-modules-git\manifest.json
echo [*] Staging manifest.json...
git add manifest.json

echo.
echo [*] Committing...
git commit -m "Update loader manifest - %date% %time%"

echo.
echo [*] Uploading to GitHub cloud (origin main)...
git push origin main

echo.
if %ERRORLEVEL% equ 0 (
    color 0A
    echo =======================================================================
    echo  [+] SUCCESS! Loader manifest is LIVE on GitHub!
    echo =======================================================================
) else (
    color 0C
    echo =======================================================================
    echo  [-] ERROR! Failed to push manifest to GitHub.
    echo =======================================================================
)

echo.
pause
