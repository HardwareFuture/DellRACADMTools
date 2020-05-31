@echo off
echo have you installed racadm? (https://dl.dell.com/FOLDER05171522M/1/OM-DRAC-Dell-Web-WINX64-9.2.0-3142_A00.exe)
echo Enter action to perform (ON/OFF/POWER)
set /p input=""
cls
if "%input%"=="ON" GOTO :ON
if "%input%"=="OFF" GOTO :OFF
if "%input%"=="POWER" GOTO :POWER
:ON
ECHO Powering on...
racadm -r 192.168.178.29 -u root -p calvin serveraction powerup
goto :end
PAUSE
:POWER
ECHO Measuring Power Consumption...
racadm -r 192.168.178.29 -u root -p calvin get system.power
PAUSE
goto:end
pause
:OFF
ECHO Shutting down
racadm -r 192.168.178.29 -u root -p calvin serveraction powerdown
goto :end
PAUSE

goto :end
:end
