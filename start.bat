@echo off
setlocal
set CWD=%~dp0
cd %CWD%
set CWD=%CWD%latex-env
call .\latex-env\miktex-portable.cmd
start cmd /k "set PATH=%CWD%\pandoc-2.17.1.1;%CWD%\texmfs\install\miktex\bin\x64;%CWD%\rsvg-convert-2.40.19;%PATH% && call .\compile.bat && if %ERRORLEVEL% EQU 0 exit"
endlocal
