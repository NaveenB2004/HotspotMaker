@Echo off
::working path
set nowpath=%~dp0
::fix environmet errors
set rootpath=%SYSTEMROOT%\System32
::run update checker invisible
%rootpath%\wscript.exe "%nowpath%\InvisibleUpdateChecker.vbs" "%nowpath%\MiniUpdaterWorker.bat"
exit