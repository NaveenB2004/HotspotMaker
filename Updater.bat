:UPHOME
cls
echo %CREDIT0%&echo %CREDIT1%&echo %CREDIT2%&echo %CREDIT3%&echo %CREDIT4%&echo %CREDIT5%&echo %CREDIT6%&echo %CREDIT7%&echo %CREDIT8%
echo [ Updater Home ]
echo.
echo Make sure you connected to internet...
echo Please wait for check the internet connection...

:NETCHECK
set count=0
set/a count=%count%+1
if %count%==4 goto NETCHECKFAIL
For /f %%A in (
  'powershell -command "(Invoke-Webrequest "https://pastebin.com/raw/DLZuNDbJ").content"'
) Do Set tempversion=%%A
if %tempversion%==okeWebRequestCommand goto NETCHECKFAIL
if not %tempversion%==okeWebRequestCommand goto NETCHECKPASS

:NETCHECKFAIL
cls
echo %CREDIT0%&echo %CREDIT1%&echo %CREDIT2%&echo %CREDIT3%&echo %CREDIT4%&echo %CREDIT5%&echo %CREDIT6%&echo %CREDIT7%&echo %CREDIT8%
echo [ Internet Check Fail ]
echo.
echo We can not reach the internet :(
echo Please check your internet connection and try again.
echo.
echo A - Retrry&echo B - Exit to Hotspot Maker
echo.
set/p "netcheckfailcho=>"
if %netcheckfailcho%==A goto UPHOME
if %netcheckfailcho%==a goto UPHOME
if %netcheckfailcho%==B call "%nowpath%\Main\00.Home.bat"
if %netcheckfailcho%==b call "%nowpath%\Main\00.Home.bat"
echo invalid choice... Try again...
timeout 6
goto NETCHECKFAIL

:NETCHECKPASS
cls
echo %CREDIT0%&echo %CREDIT1%&echo %CREDIT2%&echo %CREDIT3%&echo %CREDIT4%&echo %CREDIT5%&echo %CREDIT6%&echo %CREDIT7%&echo %CREDIT8%
echo [ Check Updates ]
echo.
echo Internet connection : OK!
echo.
echo Checking new versions...
echo.
timeout 5
if %version%==%tempversion% goto THSISILAST
if not %version%==%tempversion% goto NEWAVILABLE

:THSISILAST
cls
echo %CREDIT0%&echo %CREDIT1%&echo %CREDIT2%&echo %CREDIT3%&echo %CREDIT4%&echo %CREDIT5%&echo %CREDIT6%&echo %CREDIT7%&echo %CREDIT8%
echo [ This is the Latest Version ]
echo.
echo Congratulations!
echo You are using the latest version of Hotspot Maker...
echo This version is v%version%
echo.
echo A - Back to Hotspot Maker&echo B - Exit
echo.
set/p "thisislastcho=>"
if %thisislastcho%==A call "%nowpath%\Main\00.Home.bat"
if %thisislastcho%==a call "%nowpath%\Main\00.Home.bat"
if %thisislastcho%==B goto END
if %thisislastcho%==b goto END
echo invalid choice... Try again...
timeout 6
goto THSISILAST

:NEWAVILABLE
cls
echo %CREDIT0%&echo %CREDIT1%&echo %CREDIT2%&echo %CREDIT3%&echo %CREDIT4%&echo %CREDIT5%&echo %CREDIT6%&echo %CREDIT7%&echo %CREDIT8%
echo [ New version Available ]
echo.
echo New version of Hotspot Maker available...
echo You are running on v%version%
echo Available version is v%tempversion%
echo.
echo Do you wish to download and install the latest version?
echo.
echo A - Install&echo B - Back to Hotspot Maker&echo C - Exit
echo.
set/p "newversioncho=>"
if %newversioncho%==A goto INSTALLATION
if %newversioncho%==a goto INSTALLATION
if %newversioncho%==B call "%nowpath%\Main\00.Home.bat"
if %newversioncho%==b call "%nowpath%\Main\00.Home.bat"
if %newversioncho%==C goto END
if %newversioncho%==c goto END
echo invalid choice... Try again...
timeout 6
goto NEWAVILABLE

:INSTALLATION
cls
echo %CREDIT0%&echo %CREDIT1%&echo %CREDIT2%&echo %CREDIT3%&echo %CREDIT4%&echo %CREDIT5%&echo %CREDIT6%&echo %CREDIT7%&echo %CREDIT8%
echo [ Installation ]
echo.
echo Downloading script files...
echo (This may take five seconds)
echo %nowpath%>"C:\ProgramData\HotspotMakerData\nowpath.ini"
cd "C:\ProgramData\HotspotMakerData"
powershell -Command "Invoke-WebRequest https://pastebin.com/raw/NSHb9Mrv -Outfile updateinstaller.bat"
timeout 5 /nobreak
call "C:\ProgramData\HotspotMakerData\updateinstaller.bat"

:END
exit