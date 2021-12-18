:UPHOME
::clear before outputs
cls
::title
title %title%
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
::title
title %title%
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
echo A - Retry&echo B - Exit to Hotspot Maker
echo.
set/p "netcheckfailcho=>"
if %netcheckfailcho%==A goto UPHOME
if %netcheckfailcho%==a goto UPHOME
if %netcheckfailcho%==B call "%nowpath%\Home.bat"
if %netcheckfailcho%==b call "%nowpath%\Home.bat"
echo invalid choice... Try again...
timeout 6
goto NETCHECKFAIL

:NETCHECKPASS
::clear before outputs
cls
::title
title %title%
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
::user choicess
echo A - Back to Hotspot Maker&echo B - Exit
echo.
set/p "thisislastcho=>"
if %thisislastcho%==A call "%nowpath%\Home.bat"
if %thisislastcho%==a call "%nowpath%\Home.bat"
if %thisislastcho%==B call "%nowpath%\Exit.bat"
if %thisislastcho%==b call "%nowpath%\Exit.bat"
echo invalid choice... Try again...
timeout 6
goto THSISILAST

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
echo Do you wish to download and install the latest version?
echo.
::user choicess
echo A - Install&echo B - Back to Hotspot Maker&echo C - Exit
echo.
set/p "newversioncho=>"
if %newversioncho%==A goto INSTALLATION
if %newversioncho%==a goto INSTALLATION
if %newversioncho%==B call "%nowpath%\Home.bat"
if %newversioncho%==b call "%nowpath%\Home.bat"
if %newversioncho%==C call "%nowpath%\Exit.bat"
if %newversioncho%==c call "%nowpath%\Exit.bat"
echo invalid choice... Try again...
timeout 6
goto NEWAVILABLE

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
timeout 12
call "%nowpath%\Home.bat"