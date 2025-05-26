@echo off && cd %~dp0

CALL inc\finddosbox.bat

cd %~dp0\..

echo|set /p="Running DOSBox..."
CALL %DBOX_CMD% -conf .dosbox\conf\windows.conf -noconsole
