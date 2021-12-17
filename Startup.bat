:STARTUP
::working path
set nowpath=%~dp0
goto AUPCHECK

:AUPCHECK
::auto update check

::switch to 'Variables.bat'
call "%nowpath%\Variables.bat"