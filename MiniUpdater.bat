@Echo off
::Window title
title Auto Update
::set credits
SET CREDIT0=                 --------------------------------------------------------------
SET CREDIT1=                 **************************************************************
SET CREDIT2=                 ***                                                        ***
SET CREDIT3=                 ***                   (:  -WELCOME-  :)                    ***
SET CREDIT4=                 ***   : Hotspot Creating Wizard for Windows 8/10(v%version%)  :  ***
SET CREDIT5=                 ***                 - Open Source Project -                ***
SET CREDIT6=                 ***                                                        ***
SET CREDIT7=                 **************************************************************
SET CREDIT8=                 --------------------------------------------------------------
::working path
set nowpath=%~dp0
:UPHOME
::clear before outputs
cls
::credits
echo %CREDIT0%&echo %CREDIT1%&echo %CREDIT2%&echo %CREDIT4%&echo %CREDIT5%&echo %CREDIT6%&echo %CREDIT7%&echo %CREDIT8%
::tab title
echo [ Updater Home ]
echo.
::little instructions
echo Make sure you connected to internet...
echo Please wait for check the internet connection...

:NETCHECK
::network check fail counting
set count=0
set/a count=%count%+1
if %count%==4 goto NETCHECKFAIL
::network check and getting tempversion
For /f %%A in (
  'powershell -command "(Invoke-Webrequest "https://pastebin.com/raw/RmwHLAQ6").content"'
) Do Set tempversion=%%A
if %tempversion%==okeWebRequestCommand goto NETCHECKFAIL
if not %tempversion%==okeWebRequestCommand goto NETCHECKPASS

:NETCHECKFAIL
::clear before outputs
cls
::credits
echo %CREDIT0%&echo %CREDIT1%&echo %CREDIT2%&echo %CREDIT4%&echo %CREDIT5%&echo %CREDIT6%&echo %CREDIT7%&echo %CREDIT8%
::tab title
echo [ Internet Check Fail ]
echo.
::steps
echo We can not reach the internet :(
echo Please check your internet connection and try again.
echo.
::user choicess
echo A - Retry&echo B - Exit
echo.
set/p "netcheckfailcho=>"
if %netcheckfailcho%==A goto UPHOME
if %netcheckfailcho%==a goto UPHOME
if %netcheckfailcho%==B goto END
if %netcheckfailcho%==b goto END
echo invalid choice... Try again...
timeout 6
goto NETCHECKFAIL

:NETCHECKPASS
::clear before outputs
cls
::credits
echo %CREDIT0%&echo %CREDIT1%&echo %CREDIT2%&echo %CREDIT4%&echo %CREDIT5%&echo %CREDIT6%&echo %CREDIT7%&echo %CREDIT8%
::tab title
echo [ Check Updates ]
echo.
::steps
echo Internet connection : OK!
echo.
echo Checking new versions...
echo.
timeout 5
set/p version=<"%nowpath%\Version.ini"
::new version check (compare)
if %tempversion% LEQ %version% goto THSISILAST
if not %tempversion% LEQ %version% goto NEWAVILABLE

:THSISILAST
::clear before outputs
cls
::credits
echo %CREDIT0%&echo %CREDIT1%&echo %CREDIT2%&echo %CREDIT4%&echo %CREDIT5%&echo %CREDIT6%&echo %CREDIT7%&echo %CREDIT8%
::tab title
echo [ This is the Latest Version ]
echo.
::steps (no new versions)
echo Congratulations!
echo You are using the latest version of Hotspot Maker...
echo This version is v%version%
echo.
timeout 10
goto END

:NEWAVILABLE
::clear before outputs
cls
::credits
echo %CREDIT0%&echo %CREDIT1%&echo %CREDIT2%&echo %CREDIT4%&echo %CREDIT5%&echo %CREDIT6%&echo %CREDIT7%&echo %CREDIT8%
::tab title
echo [ New version Available ]
echo.
::steps (new version)
echo New version of Hotspot Maker available...
echo You are running on v%version%
echo Available version is v%tempversion%
echo.
timeout 10
goto INSTALLATION

:INSTALLATION
::clear before outputs
cls
::credits
echo %CREDIT0%&echo %CREDIT1%&echo %CREDIT2%&echo %CREDIT4%&echo %CREDIT5%&echo %CREDIT6%&echo %CREDIT7%&echo %CREDIT8%
::tab title
echo [ Installation ]
echo.
::steps (get link to download updater scripts file)
echo Downloading script files...
echo (This may take five seconds)
::save working path for post update use
echo %nowpath%>"C:\ProgramData\HotspotMakerData\nowpath.ini"
cd "C:\ProgramData\HotspotMakerData"
::get download link
For /f %%A in (
  'powershell -command "(Invoke-Webrequest "https://pastebin.com/raw/yfPgsENY").content"'
) Do Set UpdaterDownLink=%%A
::download script file
powershell -Command "Invoke-WebRequest %UpdaterDownLink% -Outfile updateinstaller.bat"
timeout 5 /nobreak
::switch to 'updateinstaller.bat' (new downloaded)
call "C:\ProgramData\HotspotMakerData\updateinstaller.bat"
::when calling error, steps
echo Error while starting the updater...
echo Please download the standalone version and install it...
start https://github.com/naveenb2004/HotspotMaker/releases
timeout 20
goto END

:END
exit