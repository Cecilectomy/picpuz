@echo off

SET DBOX_CMD=

echo|set /p="Looking for DOSBox... "

IF NOT DEFINED DBOX_CMD (
	where dosbox-x.exe >nul 2>&1
	IF %errorlevel% equ 0 (
		set DBOX_CMD="dosbox-x.exe"
	)
)

IF NOT DEFINED DBOX_CMD (
	IF exist "C:\DOSBox-X\dosbox-x.exe" (
		SET DBOX_CMD="C:\DOSBox-X\dosbox-x.exe"
	)
)

IF NOT DEFINED DBOX_CMD (
	where dosbox.exe >nul 2>&1
	IF %errorlevel% equ 0 (
		set DBOX_CMD="dosbox.exe"
	)
)

IF NOT DEFINED DBOX_CMD (
	IF exist "C:\Program Files (x86)\DOSBox-0.74-3\dosbox.exe" (
		SET DBOX_CMD="C:\Program Files (x86)\DOSBox-0.74-3\dosbox.exe"
	)
)

IF DEFINED DBOX_CMD (
	echo found! ^(%DBOX_CMD%^)
) ELSE (
	echo not found!
	pause
	exit 1
)
