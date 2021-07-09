@echo off
title version getter
color 0a 

echo Checking Version
IF EXIST C:\ProgramData\Ver\0.03.txt goto exist
IF NOT EXIST C:\ProgramData\Ver\0.03.txt goto notexist

:exist
echo. 
echo Exists
exit

:notexist
Taskkill /im MultiTool.exe
for /f "delims=" %%A in ('powershell "get-process MultiTool | select-object Path"') do set "var=%%A"
del %var%
cls
echo Would you like for me to manually download the newest version of the tool?
set /p choice= (Y/N): 
if %choice% == Y goto download
if %choice% == N goto ok
if not %choice% == Y exit
if not %choice% == N exit

:download
curl -L -o C:\Desktop\Ver\MultiTool.exe ""
if "%errorlevel%" == "0" (
    echo The Newest Version Of The MultiTool Has Been Placed On Your Desktop
) else (
    echo Error Has Occured Please Download The File From The Discord Server
)
start chrome https://discord.gg/uQtMzhQxrV
pause
exit