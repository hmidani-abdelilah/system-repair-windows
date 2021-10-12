@echo off 

@rem ----[ This code block detects if the script is being running with admin PRIVILEGES If it isn't it pauses and then quits]-------
@echo OFF
NET SESSION >nul 2>&1
IF %ERRORLEVEL% EQU 0 (
    ECHO Administrator PRIVILEGES Detected! 
) ELSE (
   echo ######## ########  ########   #######  ########  
   echo ##       ##     ## ##     ## ##     ## ##     ## 
   echo ##       ##     ## ##     ## ##     ## ##     ## 
   echo ######   ########  ########  ##     ## ########  
   echo ##       ##   ##   ##   ##   ##     ## ##   ##   
   echo ##       ##    ##  ##    ##  ##     ## ##    ##  
   echo ######## ##     ## ##     ##  #######  ##     ## 
   echo.
   echo.
   echo ####### ERROR: ADMINISTRATOR PRIVILEGES REQUIRED #########
   echo This script must be run as administrator to work properly!  
   echo If you're seeing this after clicking on a start menu icon, then right click on the shortcut and select "Run As Administrator".
   echo ##########################################################
   echo.
   PAUSE
   EXIT /B 1
)
@echo ON

setlocal
SET Logfile=C:\Windows\Logs\CBS\CBS.log
SET logdism=C:\log-dism.log

sfc /scannow

echo file log sfc in (%logfile%)
echo type number 1 to open file log
set /p N=Enter number :
call :one
echo.
call :two
echo.

goto :efo

 :one
echo open file (%logfile%)

if %N%==1 (
notepad C:\Windows\Logs\CBS\CBS.log 
) ELSE (
echo skip ......
)

pause

DISM.exe /Online /Cleanup-image /RestoreHealth /LogPath:C:\log-dism.log

echo file log DISM in (%logdism%)
echo type number 1 to open file log
set /p N=Enter number :
call :one
echo.
call :two
echo.

goto :efo

 :one
echo open file (%logfile%)

if %N%==1 (
notepad C:\Windows\Logs\CBS\CBS.log 
) ELSE (
echo skip ......
)

echo check disk next press any key or crtrl+c to exit 
pause 

chkdsk /f /r /v c:

echo defrag all volumes in hard disk 

pause 

defrag /D /H /V
