:UNINSTALL
::clear before outputs
cls
::title
title %title%
::credits
echo %CREDIT0%&echo %CREDIT1%&echo %CREDIT2%&echo %CREDIT4%&echo %CREDIT5%&echo %CREDIT6%&echo %CREDIT7%&echo %CREDIT8%
::tab title
echo [ Uninstaller ]
echo.
::interface
echo You are going to uninstall the 'Hothspot Maker (v%version%)'...
echo Do you wish to continue...?
::user choicess
echo A - Continue Uninstallation&echo B - Cancle Uninstallation&echo C - Check Updates
echo.
set/p "uninscho=>"
if %uninscho%==A goto UNINSCON
if %uninscho%==a goto UNINSCON
if %uninscho%==B goto END
if %uninscho%==b goto END
if %uninscho%==C call "%nowpath%\Update.bat"
if %uninscho%==c call "%nowpath%\Update.bat"
echo invalid choice... Try again...
timeout 6
goto UNINSTALL


:UNINSCON
::clear before outputs
cls
::credits
echo %CREDIT0%&echo %CREDIT1%&echo %CREDIT2%&echo %CREDIT4%&echo %CREDIT5%&echo %CREDIT6%&echo %CREDIT7%&echo %CREDIT8%
::tab title
echo [ Uninstallation ]
echo.
::interface
echo Please wait for load the uninstallation information...
echo.
echo Making temp files...
echo Loading temp files...
copy "%nowpath%\FileList.ini" "%path%"
set temppath="C:\ProgramData\HotspotMakerData\uninstaller-temp.bat"
echo.
if EXIST "%path%\uninstaller-temp.bat" del "%path%\uninstaller-temp.bat"
echo :FILECHECKER 																												>>%temppath%
echo ::clear before outputs 																									>>%temppath%
echo cls 																														>>%temppath%
echo ::credits 																													>>%temppath%
echo echo %CREDIT0%&echo %CREDIT1%&echo %CREDIT2%&echo %CREDIT4%&echo %CREDIT5%&echo %CREDIT6%&echo %CREDIT7%&echo %CREDIT8% 	>>%temppath%
echo ::tab title 																												>>%temppath%
echo echo [ Uninstalling ] 																										>>%temppath%
echo echo. 																														>>%temppath%
echo ::interface 																												>>%temppath%
echo echo Please wait for load the uninstallation information... 																>>%temppath%
echo echo Uninstalling... 																										>>%temppath%
echo echo. 																														>>%temppath%
echo ::math 																													>>%temppath%
echo for /f "tokens=*" %%a in (C:\ProgramData\HotspotMakerData\FileList.ini) do call :processline %%a 							>>%temppath%
echo :processline 																												>>%temppath%
echo echo %* 																													>>%temppath%
echo del %* 																													>>%temppath%
echo echo. 																														>>%temppath%
echo echo Uninstallation success! 																								>>%temppath%
echo echo Thank you! 																											>>%temppath%
echo pause 																														>>%temppath%
call "C:\ProgramData\HotspotMakerData\uninstaller-temp.bat"

:END
::clear before outputs
cls
::credits
echo %CREDIT0%&echo %CREDIT1%&echo %CREDIT2%&echo %CREDIT4%&echo %CREDIT5%&echo %CREDIT6%&echo %CREDIT7%&echo %CREDIT8%
::tab title
echo [ Exit ]
echo.
::interface
echo Thank you for choosing us!
echo.
timeout 8
exit