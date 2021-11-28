A goto START
if %homecho%==a goto START
if %homecho%==B goto STOP
if %homecho%==b goto STOP

:START
cls
echo %CREDIT0%&echo %CREDIT1%&echo %CREDIT2%&echo %CREDIT4%&echo %CREDIT5%&echo %CREDIT6%&echo %CREDIT7%&echo %CREDIT8%
echo [ Start Hotspot ]
echo.
set/p hotspotname=<"C:\ProgramData\HotspotMakerData\defaultssid.ini"
set/p hotspotpassword=<"C:\ProgramData\HotspotMakerData\defaultpass.ini"
echo Do you want to use default SSID and Password? (Y/N)
echo SSID: %hotspotname%     Password: %hotspotpassword%
echo.
set/p "defcredittru=>"
if %defcredittru%==Y goto DEFSTART
if %defcredittru%==y goto DEFSTART
echo.
echo Enter a name use as the HOTSPOT SSID (name):
set/p "hotspotname=>"
echo.
echo Enter a password use as the HOTSPOT PASSWORD:
echo #(Password must be contain 8 to 64 charactors)#
set/p "hotspotpassword=>"
echo.
echo A - Continue&echo B - Home&echo C - Details&echo D - Exit
echo.
set/p "startcho=>"
if %startcho%==A goto STARTCONTINUE
if %startcho%==a goto STARTCONTINUE
if %startcho%==B call "%nowpath%\Home.bat"
if %startcho%==b call "%nowpath%\Home.bat"
if %startcho%==C call "%nowpath%\Details.bat"
if %startcho%==c call "%nowpath%\Details.bat"
if %startcho%==D call "%nowpath%\Exit.bat"
if %startcho%==d call "%nowpath%\Exit.bat"
echo invalid choice... Try again...
timeout 6
goto START

:DEFSTART
goto STARTCONTINUE

:STARTCONTINUE
cls
echo %CREDIT0%&echo %CREDIT1%&echo %CREDIT2%&echo %CREDIT4%&echo %CREDIT5%&echo %CREDIT6%&echo %CREDIT7%&echo %CREDIT8%
echo [ Continue Hotspot Start ]
echo.
echo Starting hotspot as SSID (name)- %hotspotname% Password- %hotspotpassword%
echo .........................................................
netsh wlan set hostednetwork mode=allow ssid="%hotspotname%" key="%hotspotpassword%"
netsh wlan start hostednetwork
echo.
echo # Go to Details when wizard shows network starting problems #
echo.
echo A - Home&echo B - Network Configuration&echo C - Stop Hotspot&echo D - Details&echo E - Exit
echo.
set/p "sccho=>"
if %sccho%==A call "%nowpath%\Home.bat"
if %sccho%==a call "%nowpath%\Home.bat"
if %sccho%==B call "%nowpath%\NetworkConfiguration.bat"
if %sccho%==b call "%nowpath%\NetworkConfiguration.bat"
if %sccho%==C goto STOP
if %sccho%==c goto STOP
if %sccho%==D call "%nowpath%\Details.bat"
if %sccho%==d call "%nowpath%\Details.bat"
if %sccho%==E call "%nowpath%\Exit.bat"
if %sccho%==e call "%nowpath%\Exit.bat"
echo invalid choice... Try again...
timeout 6
goto START

:STOP
cls
echo %CREDIT0%&echo %CREDIT1%&echo %CREDIT2%&echo %CREDIT4%&echo %CREDIT5%&echo %CREDIT6%&echo %CREDIT7%&echo %CREDIT8%
echo [ Stop Hotspot ]
echo.
echo You are going to stop the hotspot...
echo.
echo A - Continue&echo B - Home&echo C - Details&echo D - Exit
echo.
set/p "stopcho=>"
if %stopcho%==A goto STOPCONTINUE
if %stopcho%==a goto STOPCONTINUE
if %stopcho%==B call "%nowpath%\Home.bat"
if %stopcho%==b call "%nowpath%\Home.bat"
if %stopcho%==C call "%nowpath%\Details.bat"
if %stopcho%==c call "%nowpath%\Details.bat"
if %stopcho%==D call "%nowpath%\Exit.bat"
if %stopcho%==d call "%nowpath%\Exit.bat"
echo invalid choice... Try again...
timeout 6
goto STOP

:STOPCONTINUE
cls
echo %CREDIT0%&echo %CREDIT1%&echo %CREDIT2%&echo %CREDIT4%&echo %CREDIT5%&echo %CREDIT6%&echo %CREDIT7%&echo %CREDIT8%
echo [ Continue Hotspot Stop ]
echo.
echo Stopping the hotspot...
netsh wlan stop hostednetwork
echo.
echo A - Home&echo B - Details&echo C - Exit
echo.
set/p "stccho=>"
if %stccho%==A call "%nowpath%\Home.bat"
if %stccho%==a call "%nowpath%\Home.bat"
if %stccho%==B call "%nowpath%\Details.bat"
if %stccho%==b call "%nowpath%\Details.bat"
if %stccho%==C call "%nowpath%\Exit.bat"
if %stccho%==c call "%nowpath%\Exit.bat"
echo invalid choice... Try again...
timeout 6
call "%nowpath%\Home.bat"