@echo off
title Push Updated DLLs to GitHub
cd /d "E:\Loader\shadow-modules-git"
echo [*] Checking for modified or new DLLs...
git add .
git commit -m "Update DLL modules"
echo [*] Pushing to GitHub...
git push origin main
echo.
echo [+] Done! GitHub shadow-modules is up to date.
pause
