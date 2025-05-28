@Echo Off

PushD .

CD %~dp0

Call inc\findqb64.bat

CD ..

If Not Exist build Mkdir build

Echo|Set /p _="Building... "
Call %QB64_CMD% -c picpuz.qb64.bas -o build\PICPUZ.QB64.exe >NUL 2>&1 && (Echo done) || (
    Echo failed!
    Pause
    Exit 1
)

Echo|Set /p _="Copying Assets... "
Echo d | XCopy /q/s/e/h/y assets build\assets >NUL 2>&1 && (Echo done) || (
    Echo failed!
    Pause
    Exit 1
)

PopD
