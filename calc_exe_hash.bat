@echo off
setlocal
title Compute SHA-256 for Loader Binary
color 0E

set "TARGET_EXE=%~1"
if "%TARGET_EXE%"=="" (
    set "TARGET_EXE=E:\Loader\ORGINIAL LOADER\ORGINIAL LOADER\examples\example_win32_directx11\Release\Premuim.exe"
)

echo =======================================================================
echo     SHADOW CHEATS - COMPUTE EXE SHA-256 HASH
echo =======================================================================
echo [*] Target: %TARGET_EXE%
echo.

if not exist "%TARGET_EXE%" (
    color 0C
    echo [-] Error: Target file not found!
    pause
    exit /b 1
)

powershell -NoProfile -Command "$hash = (Get-FileHash -Algorithm SHA256 '%TARGET_EXE%').Hash; Write-Host 'SHA-256 Hash: ' -NoNewline; Write-Host $hash -ForegroundColor Green; Set-Clipboard -Value $hash; Write-Host '`n[+] Hash automatically copied to clipboard!' -ForegroundColor Yellow"

echo.
pause
