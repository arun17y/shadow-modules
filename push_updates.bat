@echo off
title Push Updated DLLs to GitHub
cd /d "E:\Loader\shadow-modules-git"

echo [*] Checking for modified or new DLLs in dll\ folder...
git add .
git commit -m "Update DLL modules" 2>nul

echo [*] Pushing to GitHub (force update)...
git push --force origin main

echo.
echo ========================================================
echo [+] SUCCESS! All DLLs are uploaded and live on GitHub!
echo ========================================================
pause
