@Echo off
::this file will run in invisible mode
::working path
set nowpath=%~dp0
::temp path
set path=C:\ProgramData\HotspotMakerData
::fix environmet errors
set powershell=%SYSTEMROOT%\System32\WindowsPowerShell\v1.0\powershell.exe
set rootpath=%SYSTEMROOT%\System32
set timeout=%rootpath%\timeout.exe
::import current version
set/p version=<"%nowpath%\Version.ini"
::check updates
goto NETCHECK

:NETCHECK
::network check fail counting
set count=0
set/a count=%count%+1
if %count%==4 goto NETCHECKFAIL
::network check and getting tempversion
For /f %%A in (
  '%powershell% -command "(Invoke-Webrequest -UseBasicParsing "https://pastebin.com/raw/RmwHLAQ6").content"'
) Do Set tempversion=%%A
if %tempversion%==okeWebRequestCommand goto NETCHECKFAIL
if not %tempversion%==okeWebRequestCommand goto NETCHECKPASS

:NETCHECKFAIL
exit

:NETCHECKPASS
::new version check (compare)
if %tempversion% LEQ %version% goto THSISILAST
if not %tempversion% LEQ %version% goto NEWAVILABLE

:THSISILAST
exit

:NEWAVILABLE
echo x=msgbox("New version of Hotspot Maker available! Your version: v%version% New version: v%tempversion%" ,0, "Hotspot Maker") >"%path%\UpdateMsg.vbs"
echo x=msgbox("Goto Hotspot Maker details for install the new update!" ,0, "Hotspot Maker") >>"%path%\UpdateMsg.vbs"
"%path%\UpdateMsg.vbs"
exit