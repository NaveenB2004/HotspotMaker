:: Learn from--->
:: https://www.tutorialspoint.com/batch_script/index.htm

:HOME
::check and remove update leftovers
if EXIST "C:\ProgramData\HotspotMakerData\updateinstaller.bat" del "C:\ProgramData\HotspotMakerData\updateinstaller.bat"
::clear before outputs
cls
::title
title %title%
::credits
echo %CREDIT0%&echo %CREDIT1%&echo %CREDIT2%&echo %CREDIT3%&echo %CREDIT4%&echo %CREDIT5%&echo %CREDIT6%&echo %CREDIT7%&echo %CREDIT8%
::tab title
echo [ Home ]
echo.
::little instructions
echo #Go to Details for Check new versions and change the Font color of the Wizard#
echo.
::user choicess
echo A - Start Hotspot&echo B - Stop Hotspot&echo C - Network Configuration&echo D - Set Default SSID and Password&echo E - Details&echo F - Exit
echo.
set/p "homecho=>"
if %homecho%==A call "%nowpath%\StartAndStop.bat"
if %homecho%==a call "%nowpath%\StartAndStop.bat"
if %homecho%==B call "%nowpath%\StartAndStop.bat"
if %homecho%==b call "%nowpath%\StartAndStop.bat"
if %homecho%==C call "%nowpath%\NetworkConfiguration.bat"
if %homecho%==c call "%nowpath%\NetworkConfiguration.bat"
if %homecho%==D call "%nowpath%\SaveCredits.bat"
if %homecho%==d call "%nowpath%\SaveCredits.bat"
if %homecho%==E call "%nowpath%\Details.bat"
if %homecho%==e call "%nowpath%\Details.bat"
if %homecho%==F call "%nowpath%\Exit.bat"
if %homecho%==f call "%nowpath%\Exit.bat"
echo invalid choice... Try again...
timeout 6
goto HOME