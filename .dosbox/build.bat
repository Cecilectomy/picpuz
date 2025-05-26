@echo off && cd %~dp0

CALL inc\finddosbox.bat

cd ..

IF NOT exist build mkdir build
IF NOT exist dist mkdir dist

SET SDL_VIDEODRIVER=dummy

echo|set /p="Compiling... "
CALL %DBOX_CMD% -conf .dosbox\conf\windows.conf -noconsole -exit -c "BC /O /T picpuz.bas,build\picpuz.obj;" && echo done || { echo failed; pause; exit 1; }

echo|set /p="Linking... "
CALL %DBOX_CMD% -conf .dosbox\conf\windows.conf -noconsole -exit -c "LINK build\picpuz.obj,dist\picpuz.exe;" && echo done || { echo failed; pause; exit 1; }

echo|set /p="Copying Assets... "
echo d | xcopy /q/s/e/h/y assets dist\assets >NUL 2>&1 && echo done || { echo failed; pause; exit 1; }

timeout /t 2 /nobreak > NUL
