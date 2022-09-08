@Echo off
echo.>>"C:\ProgramData\HotspotMakerData\HMLogger.log"
echo *** *** *** *** *** *** *** *** *** ***>>"C:\ProgramData\HotspotMakerData\HMLogger.log"
echo %date%%time% - MiniUpdater.bat working...>>"C:\ProgramData\HotspotMakerData\HMLogger.log"
::working path
set nowpath=%~dp0
::fix environmet errors
set rootpath=%SYSTEMROOT%\System32
::run update checker invisible
echo %date%%time% - Run silent update check>>"C:\ProgramData\HotspotMakerData\HMLogger.log"
%rootpath%\wscript.exe "%nowpath%\InvisibleUpdateChecker.vbs" "%nowpath%\MiniUpdaterWorker.bat" &echo %date%%time% - Errorlevel %errorlevel%>>"C:\ProgramData\HotspotMakerData\HMLogger.log"
exit