::convert this .bat to .exe
@Echo off
set nowpath=%~dp0
set logger=C:\ProgramData\HotspotMakerData\HMLogger.log
::set logger
if not exist "%logger%" echo %date%%time% - First Run>"%logger%"
::switch to Statup.bat
if exist "%nowpath%\Startup.bat" (call "%nowpath%\Startup.bat") else (goto LOADERROR)

:LOADERROR
echo %date%%time% - Couldn't find Statup.bat>>"%logger%"
echo Couldn't find the wizard files...
echo Please download and install the fresh standalone.
echo.
echo https://github.com/naveenb2004/HotspotMaker/releases
start https://github.com/naveenb2004/HotspotMaker/releases
echo.
pause
echo %date%%time% - Exit>>"%logger%"
goto END

:END
exit