:SAVECREDITS
::clear before outputs
cls
::credits
echo %CREDIT0%&echo %CREDIT1%&echo %CREDIT2%&echo %CREDIT4%&echo %CREDIT5%&echo %CREDIT6%&echo %CREDIT7%&echo %CREDIT8%
::tab title
echo [ Set Default SSID and Password ]
echo.
::little instructions
echo You can save hotspot SSID(name) and password for easily start Hotspot with given data.
echo # You should input data for use this option. If you not input data, default ssid and password will not work.
echo.
::steps
echo Enter Network SSID (Name) for use as default:
set/p "defname=>"
echo %defname%>"C:\ProgramData\HotspotMakerData\defaultssid.ini"
echo.
echo Enter Network PASSWORD for use as default:
set/p "defpass=>"
echo %defpass%>"C:\ProgramData\HotspotMakerData\defaultpass.ini"
echo.
echo Success...!
::generate default username and password information
echo defuser>"C:\ProgramData\HotspotMakerData\defuser.nnb"
echo.
::user choicess
echo A - Home&echo B - Details&echo C - Exit
echo.
set/p "svcredit=>"
if %svcredit%==A call "%nowpath%\Home.bat"
if %svcredit%==a call "%nowpath%\Home.bat"
if %svcredit%==B call "%nowpath%\Details.bat"
if %svcredit%==b call "%nowpath%\Details.bat"
if %svcredit%==C call "%nowpath%\Exit.bat"
if %svcredit%==c call "%nowpath%\Exit.bat"
echo invalid choice... Try again...
timeout 6
call "%nowpath%\Home.bat"