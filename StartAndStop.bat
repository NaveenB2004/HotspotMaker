::get right direction
if %homecho%==A goto START
if %homecho%==a goto START
if %homecho%==B goto STOP
if %homecho%==b goto STOP

:START
::clear before outputs
cls
::title
title %title%
::credits
echo %CREDIT0%&echo %CREDIT1%&echo %CREDIT2%&echo %CREDIT4%&echo %CREDIT5%&echo %CREDIT6%&echo %CREDIT7%&echo %CREDIT8%
::tab title
echo [ Start Hotspot ]
echo.
::import default username and password
set/p hotspotname=<"%path%\defaultssid.ini"
set/p hotspotpassword=<"%path%\defaultpass.ini"
::steps (for defalt ssid and password)
echo Do you want to use default SSID and Password? (Y/N)
echo SSID: %hotspotname%     Password: %hotspotpassword%
echo.
set/p "defcredittru=>"
if %defcredittru%==Y goto DEFSTART
if %defcredittru%==y goto DEFSTART
echo.
::steps (for one time user input ssid and password)
echo Enter a name use as the HOTSPOT SSID (name):
set/p "hotspotname=>"
echo.
echo Enter a password use as the HOTSPOT PASSWORD:
echo #(Password must be contain 8 to 64 charactors)#
set/p "hotspotpassword=>"
echo.
::user choicess
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
::defalt ssid and password connecting bridge
goto STARTCONTINUE

:STARTCONTINUE
::clear before outputs
cls
::credits
echo %CREDIT0%&echo %CREDIT1%&echo %CREDIT2%&echo %CREDIT4%&echo %CREDIT5%&echo %CREDIT6%&echo %CREDIT7%&echo %CREDIT8%
::tab title
echo [ Continue Hotspot Start ]
echo.
::steps
echo Starting hotspot as SSID (name)- %hotspotname% Password- %hotspotpassword%
echo .........................................................
::set ssid and password
netsh wlan set hostednetwork mode=allow ssid="%hotspotname%" key="%hotspotpassword%"
::start hotspot
netsh wlan start hostednetwork
echo.
::little instructions
echo # Go to Details when wizard shows network starting problems #
echo.
::user choicess
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
::clear before outputs
cls
::credits
echo %CREDIT0%&echo %CREDIT1%&echo %CREDIT2%&echo %CREDIT4%&echo %CREDIT5%&echo %CREDIT6%&echo %CREDIT7%&echo %CREDIT8%
::tab titles
echo [ Stop Hotspot ]
echo.
::steps
echo You are going to stop the hotspot...
echo.
::user choices
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
::clear before outputs
cls
::credits
echo %CREDIT0%&echo %CREDIT1%&echo %CREDIT2%&echo %CREDIT4%&echo %CREDIT5%&echo %CREDIT6%&echo %CREDIT7%&echo %CREDIT8%
::tab title
echo [ Continue Hotspot Stop ]
echo.
::steps
echo Stopping the hotspot...
::stop hotspot
netsh wlan stop hostednetwork
echo.
::user choicess
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