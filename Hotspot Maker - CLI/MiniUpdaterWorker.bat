@Echo off
::this file will run in invisible mode
::working path
set nowpath=%~dp0
::temp path
set path=C:\ProgramData\HotspotMakerData
::fix environmet errors
echo %date%%time% - MiniUpdaterWorker.bat working...>>"C:\ProgramData\HotspotMakerData\HMLogger.log"
echo %date%%time% - Setting variables>>"C:\ProgramData\HotspotMakerData\HMLogger.log"
set powershell=%SYSTEMROOT%\System32\WindowsPowerShell\v1.0\powershell.exe
set rootpath=%SYSTEMROOT%\System32
set timeout=%rootpath%\timeout.exe
::import current version
echo %date%%time% - Check current version>>"C:\ProgramData\HotspotMakerData\HMLogger.log"
set/p version=<"%nowpath%\Version.ini"
echo %date%%time% - Current version is %version%>>"C:\ProgramData\HotspotMakerData\HMLogger.log"
::check updates
goto NETCHECK

:NETCHECK
::network check fail counting
set count=0
set/a count=%count%+1
if %count%==4 goto NETCHECKFAIL
echo %date%%time% - Connection check count %count%>>"C:\ProgramData\HotspotMakerData\HMLogger.log"
::network check and getting tempversion
For /f %%A in (
  '%powershell% -command "(Invoke-Webrequest -UseBasicParsing "https://pastebin.com/raw/RmwHLAQ6").content"'
) Do Set tempversion=%%A
if %tempversion%==okeWebRequestCommand echo %date%%time% - Check Failed>>"C:\ProgramData\HotspotMakerData\HMLogger.log" &goto NETCHECKFAIL
if not %tempversion%==okeWebRequestCommand echo %date%%time% - Check Passed>>"C:\ProgramData\HotspotMakerData\HMLogger.log" &goto NETCHECKPASS

:NETCHECKFAIL
exit

:NETCHECKPASS
::new version check (compare)
if %tempversion% LEQ %version% goto THSISILAST
if not %tempversion% LEQ %version% goto NEWAVILABLE

:THSISILAST
echo %date%%time% - This version is last>>"C:\ProgramData\HotspotMakerData\HMLogger.log"
echo %date%%time% - Exit>>"C:\ProgramData\HotspotMakerData\HMLogger.log"
exit

:NEWAVILABLE
echo %date%%time% - New version availabale and show msg dialogues>>"C:\ProgramData\HotspotMakerData\HMLogger.log"
echo x=msgbox("New version of Hotspot Maker available! Your version: v%version% New version: v%tempversion%" ,0, "Hotspot Maker") >"%path%\UpdateMsg.vbs"
echo x=msgbox("Goto Hotspot Maker details for install the new update!" ,0, "Hotspot Maker") >>"%path%\UpdateMsg.vbs"
"%path%\UpdateMsg.vbs"
echo %date%%time% - Exit>>"C:\ProgramData\HotspotMakerData\HMLogger.log"
exit