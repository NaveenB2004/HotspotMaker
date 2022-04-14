::convert this .bat to .exe
@Echo off
set nowpath=%~dp0
::switch to Statup.bat
if exist "%nowpath%\Startup.bat" (call "%nowpath%\Startup.bat") else (goto LOADERROR)

:LOADERROR
echo Couldn't find the wizard files...
echo Please download and install the fresh standalone.
echo.
echo https://github.com/naveenb2004/HotspotMaker/releases
start https://github.com/naveenb2004/HotspotMaker/releases
echo.
pause
goto END

:END
exit