@echo off

set PATH=%~dp0..\bin;%PATH%

call java2smali "%~dp0.\1-src" "%~dp0.\2-dst" "Main"

echo.
pause
