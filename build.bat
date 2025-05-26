@echo Off
mkdir dist
bc.exe /O /T picpuz.bas,dist\picpuz.obj;
link.exe dist\picpuz.obj,dist\picpuz.exe;
