@echo off
title VEIN Server Monitor
mode 100,7

C:
cd\DS\VEIN

goto TRYAGAIN

:START
c:\ds\steamcmd\steamcmd.exe +force_install_dir C:\DS\VEIN +login anonymous +app_update 2131400 validate +quit
start C:\DS\VEIN\VeinServer.exe -QueryPort=28715 -Port=7778 -log

:TRYAGAIN
cls
SET LOGDATE=%date:~6,4%%date:~3,2%%date:~0,2%
timeout /t 60
tasklist /fi "ImageName eq VeinServer.exe" /fo csv 2>NUL | find /I /N "VeinServer.exe">NUL
if "%ERRORLEVEL%"=="0" (goto TRYAGAIN) else (goto START)
end
