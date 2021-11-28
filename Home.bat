:HOME
cls
echo %CREDIT0%&echo %CREDIT1%&echo %CREDIT2%&echo %CREDIT3%&echo %CREDIT4%&echo %CREDIT5%&echo %CREDIT6%&echo %CREDIT7%&echo %CREDIT8%
echo [ Home ]
echo.
echo #Go to Details for Check new versions and change the Font color of the Wizard#
echo.
echo A - Start Hotspot&echo B - Stop Hotspot&echo C - Network Configuration&echo D - Set Default SSID and Password&echo E - Details&echo F - Exit
echo.
set/p "homecho=>"
if %homecho%==A call "%nowpath%\Main\01.StartAndStop.bat"
if %homecho%==a call "%nowpath%\Main\01.StartAndStop.bat"
if %homecho%==B call "%nowpath%\Main\01.StartAndStop.bat"
if %homecho%==b call "%nowpath%\Main\01.StartAndStop.bat"
if %homecho%==C call "%nowpath%\Other\01.NetworkConfiguration.bat"
if %homecho%==c call "%nowpath%\Other\01.NetworkConfiguration.bat"
if %homecho%==D call "%nowpath%\Main\02.SaveCredits.bat"
if %homecho%==d call "%nowpath%\Main\02.SaveCredits.bat"
if %homecho%==E call "%nowpath%\Main\03.Details.bat"
if %homecho%==e call "%nowpath%\Main\03.Details.bat"
if %homecho%==F call "%nowpath%\Main\04.Exit.bat"
if %homecho%==f call "%nowpath%\Main\04.Exit.bat"
echo invalid choice... Try again...
timeout 6
goto HOME