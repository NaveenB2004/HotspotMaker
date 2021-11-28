:NETCONFIG
cls
echo %CREDIT0%&echo %CREDIT1%&echo %CREDIT2%&echo %CREDIT4%&echo %CREDIT5%&echo %CREDIT6%&echo %CREDIT7%&echo %CREDIT8%
echo [ Network Configuration ]
echo.
echo Welcome to Network Configuration...
echo.
echo A - Home&echo B - IP Configuration&echo C - Hotspot Status&echo D - Ping (IP/Domain)&echo E - View Public IP (External IP)&echo F - Exit
echo.
set/p "netconfigcho=>"
if %netconfigcho%==A call "%nowpath%\Main\00.Home.bat"
if %netconfigcho%==a call "%nowpath%\Main\00.Home.bat"
if %netconfigcho%==B goto IPCONFIGURATION
if %netconfigcho%==b goto IPCONFIGURATION
if %netconfigcho%==C goto NETSTATUS
if %netconfigcho%==c goto NETSTATUS
if %netconfigcho%==D goto PINGTEST
if %netconfigcho%==d goto PINGTEST
if %netconfigcho%==E goto PUBIP
if %netconfigcho%==e goto PUBIP
if %netconfigcho%==F call "%nowpath%\Main\04.Exit.bat"
if %netconfigcho%==f call "%nowpath%\Main\04.Exit.bat"
echo invalid choice... Try again...
timeout 6
goto NETCONFIG

:PINGTEST
cls
echo %CREDIT0%&echo %CREDIT1%&echo %CREDIT2%&echo %CREDIT4%&echo %CREDIT5%&echo %CREDIT6%&echo %CREDIT7%&echo %CREDIT8%
echo [ Ping (IP/Domain) ]
echo.
echo Enter IP (or Domain):
set/p "pingaddress=>"
echo.
echo Enter count:
echo # Value 0 to 4294967295 #
set/p "pingcount=>"
echo.
ping %pingaddress% -n %pingcount%
echo.
echo A - Home&echo B - Back to Network Configuration&echo C - Exit
echo.
set/p "ipconfigcho=>"
if %ipconfigcho%==A call "%nowpath%\Main\00.Home.bat"
if %ipconfigcho%==a call "%nowpath%\Main\00.Home.bat"
if %ipconfigcho%==B goto NETCONFIG
if %ipconfigcho%==b goto NETCONFIG
if %ipconfigcho%==C call "%nowpath%\Main\04.Exit.bat"
if %ipconfigcho%==c call "%nowpath%\Main\04.Exit.bat"
echo invalid choice... Try again...
timeout 6
goto PINGTEST

:IPCONFIGURATION
cls
echo %CREDIT0%&echo %CREDIT1%&echo %CREDIT2%&echo %CREDIT4%&echo %CREDIT5%&echo %CREDIT6%&echo %CREDIT7%&echo %CREDIT8%
echo [ IP Configuration ]
echo.
echo Starting IP Configuration...
ipconfig /all
echo Compleated.
echo.
echo A - Home&echo B - Back to Network Configuration&echo C - Exit
echo.
set/p "ipconfigcho=>"
if %ipconfigcho%==A call "%nowpath%\Main\00.Home.bat"
if %ipconfigcho%==a call "%nowpath%\Main\00.Home.bat"
if %ipconfigcho%==B goto NETCONFIG
if %ipconfigcho%==b goto NETCONFIG
if %ipconfigcho%==C call "%nowpath%\Main\04.Exit.bat"
if %ipconfigcho%==c call "%nowpath%\Main\04.Exit.bat"
echo invalid choice... Try again...
timeout 6
goto IPCONFIGURATION

:NETSTATUS
cls
echo %CREDIT0%&echo %CREDIT1%&echo %CREDIT2%&echo %CREDIT4%&echo %CREDIT5%&echo %CREDIT6%&echo %CREDIT7%&echo %CREDIT8%
echo [ Hotspot Status ]
echo.
echo Starting network status...
netsh wlan show hostednetwork
netsh wlan show hostednetwork setting=security
echo Compleated.
echo.
echo A - Home&echo B - Back to Network Configuration&echo C - Exit
echo.
set/p "netstatuscho=>"
if %netstatuscho%==A call "%nowpath%\Main\00.Home.bat"
if %netstatuscho%==a call "%nowpath%\Main\00.Home.bat"
if %netstatuscho%==B goto NETCONFIG
if %netstatuscho%==b goto NETCONFIG
if %netstatuscho%==C call "%nowpath%\Main\04.Exit.bat"
if %netstatuscho%==c call "%nowpath%\Main\04.Exit.bat"
echo invalid choice... Try again...
timeout 6
goto NETSTATUS

:PUBIP
cls
echo %CREDIT0%&echo %CREDIT1%&echo %CREDIT2%&echo %CREDIT4%&echo %CREDIT5%&echo %CREDIT6%&echo %CREDIT7%&echo %CREDIT8%
echo [ PUBLIC IP ]
echo.
echo This tab made for show your public IP address.
echo (You need to connect to the internet to get a public IP)
echo.
echo Please wait for check the internet connection...
powershell -Command "Invoke-WebRequest https://drive.google.com/uc?id=13UVCvO6IZDrXD4d_zs-b7sCFOOaqX4VJ -Outfile C:\ProgramData\HotspotMakerData\IntCheck.ini"
if EXIST "C:\ProgramData\HotspotMakerData\IntCheck.ini" goto PUBIPSTART
echo.
echo Error white connect to the internet. Please check your internet connection and try again.
echo.
echo A - Home&echo B - Back to Network Configuration&echo C - Exit
echo.
set/p "netstatuscho=>"
if %netstatuscho%==A call "%nowpath%\Main\00.Home.bat"
if %netstatuscho%==a call "%nowpath%\Main\00.Home.bat"
if %netstatuscho%==B goto NETCONFIG
if %netstatuscho%==b goto NETCONFIG
if %netstatuscho%==C call "%nowpath%\Main\04.Exit.bat"
if %netstatuscho%==c call "%nowpath%\Main\04.Exit.bat"
echo invalid choice... Try again...
timeout 6
goto PUBIP

:PUBIPSTART
del "C:\ProgramData\HotspotMakerData\IntCheck.ini"
echo Connected to the internet!
echo Please wait for get your public IP...
echo.
For /f %%A in (
  'powershell -command "(Invoke-Webrequest "http://api.ipify.org").content"'
) Do Set ExtIP=%%A
Echo Your Public IP is : %ExtIP%
echo.
echo A - Home&echo B - Back to Network Configuration&echo C - Exit
echo.
set/p "netstatuscho=>"
if %netstatuscho%==A call "%nowpath%\Main\00.Home.bat"
if %netstatuscho%==a call "%nowpath%\Main\00.Home.bat"
if %netstatuscho%==B goto NETCONFIG
if %netstatuscho%==b goto NETCONFIG
if %netstatuscho%==C call "%nowpath%\Main\04.Exit.bat"
if %netstatuscho%==c call "%nowpath%\Main\04.Exit.bat"
echo invalid choice... Try again...
timeout 6
goto PUBIP