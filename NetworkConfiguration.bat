:NETCONFIG
::clear before outputs
cls

::credits
echo %CREDIT0%&echo %CREDIT1%&echo %CREDIT2%&echo %CREDIT4%&echo %CREDIT5%&echo %CREDIT6%&echo %CREDIT7%&echo %CREDIT8%

::tab title
echo [ Network Configuration ]
echo.

::welcome note
echo Welcome to Network Configuration...
echo.

::user choicess
echo A - Home&echo B - IP Configuration&echo C - Hotspot Status&echo D - Ping (IP/Domain)&echo E - View Public IP (External IP)&echo F - Exit
echo.
set/p "netconfigcho=>"
if %netconfigcho%==A call "%nowpath%\Home.bat"
if %netconfigcho%==a call "%nowpath%\Home.bat"
if %netconfigcho%==B goto IPCONFIGURATION
if %netconfigcho%==b goto IPCONFIGURATION
if %netconfigcho%==C goto NETSTATUS
if %netconfigcho%==c goto NETSTATUS
if %netconfigcho%==D goto PINGTEST
if %netconfigcho%==d goto PINGTEST
if %netconfigcho%==E goto PUBIP
if %netconfigcho%==e goto PUBIP
if %netconfigcho%==F call "%nowpath%\Exit.bat"
if %netconfigcho%==f call "%nowpath%\Exit.bat"
echo invalid choice... Try again...
timeout 6
goto NETCONFIG

:PINGTEST
::clear before outputs
cls

::credits
echo %CREDIT0%&echo %CREDIT1%&echo %CREDIT2%&echo %CREDIT4%&echo %CREDIT5%&echo %CREDIT6%&echo %CREDIT7%&echo %CREDIT8%

::tab title
echo [ Ping (IP/Domain) ]
echo.

::steps
echo Enter IP (or Domain):
set/p "pingaddress=>"
echo.
echo Enter count:
echo # Value 0 to 4294967295 #
set/p "pingcount=>"
echo.
ping %pingaddress% -n %pingcount%
echo.

::user choicess
echo A - Home&echo B - Back to Network Configuration&echo C - Exit
echo.
set/p "ipconfigcho=>"
if %ipconfigcho%==A call "%nowpath%\Home.bat"
if %ipconfigcho%==a call "%nowpath%\Home.bat"
if %ipconfigcho%==B goto NETCONFIG
if %ipconfigcho%==b goto NETCONFIG
if %ipconfigcho%==C call "%nowpath%\Exit.bat"
if %ipconfigcho%==c call "%nowpath%\Exit.bat"
echo invalid choice... Try again...
timeout 6
goto PINGTEST

:IPCONFIGURATION
::clear before outputs
cls

::credits
echo %CREDIT0%&echo %CREDIT1%&echo %CREDIT2%&echo %CREDIT4%&echo %CREDIT5%&echo %CREDIT6%&echo %CREDIT7%&echo %CREDIT8%

::tab title
echo [ IP Configuration ]
echo.

::steps
echo Starting IP Configuration...
ipconfig /all
echo Compleated.
echo.

::user choicess
echo A - Home&echo B - Back to Network Configuration&echo C - Exit
echo.
set/p "ipconfigcho=>"
if %ipconfigcho%==A call "%nowpath%\Home.bat"
if %ipconfigcho%==a call "%nowpath%\Home.bat"
if %ipconfigcho%==B goto NETCONFIG
if %ipconfigcho%==b goto NETCONFIG
if %ipconfigcho%==C call "%nowpath%\Exit.bat"
if %ipconfigcho%==c call "%nowpath%\Exit.bat"
echo invalid choice... Try again...
timeout 6
goto IPCONFIGURATION

:NETSTATUS
::clear before outputs
cls

::credits
echo %CREDIT0%&echo %CREDIT1%&echo %CREDIT2%&echo %CREDIT4%&echo %CREDIT5%&echo %CREDIT6%&echo %CREDIT7%&echo %CREDIT8%

::tab title
echo [ Hotspot Status ]
echo.

::steps
echo Starting network status...
netsh wlan show hostednetwork
netsh wlan show hostednetwork setting=security
echo Compleated.
echo.

::user choicess
echo A - Home&echo B - Back to Network Configuration&echo C - Exit
echo.
set/p "netstatuscho=>"
if %netstatuscho%==A call "%nowpath%\Home.bat"
if %netstatuscho%==a call "%nowpath%\Home.bat"
if %netstatuscho%==B goto NETCONFIG
if %netstatuscho%==b goto NETCONFIG
if %netstatuscho%==C call "%nowpath%\Exit.bat"
if %netstatuscho%==c call "%nowpath%\Exit.bat"
echo invalid choice... Try again...
timeout 6
goto NETSTATUS

:PUBIP
::clear before outputs
cls

::credits
echo %CREDIT0%&echo %CREDIT1%&echo %CREDIT2%&echo %CREDIT4%&echo %CREDIT5%&echo %CREDIT6%&echo %CREDIT7%&echo %CREDIT8%

::tab title
echo [ PUBLIC IP ]
echo.

::steps
echo This tab made for show your public IP address.
echo (You need to connect to the internet to get a public IP)
echo.

::internet check
echo Please wait for check the internet connection...
For /f %%A in (
  'powershell -command "(Invoke-Webrequest "https://pastebin.com/raw/3Tgw3Eid").content"'
) Do Set intcheck=%%A
if %intcheck%==2004 goto PUBIPSTART
echo.
echo Error white connect to the internet. Please check your internet connection and try again.
echo.

::user choicess
echo A - Home&echo B - Back to Network Configuration&echo C - Exit
echo.
set/p "netstatuscho=>"
if %netstatuscho%==A call "%nowpath%\Home.bat"
if %netstatuscho%==a call "%nowpath%\Home.bat"
if %netstatuscho%==B goto NETCONFIG
if %netstatuscho%==b goto NETCONFIG
if %netstatuscho%==C call "%nowpath%\Exit.bat"
if %netstatuscho%==c call "%nowpath%\Exit.bat"
echo invalid choice... Try again...
timeout 6
goto PUBIP

:PUBIPSTART
echo Connected to the internet!
echo Please wait for get your public IP...
echo.

::get public ip
For /f %%A in (
  'powershell -command "(Invoke-Webrequest "http://api.ipify.org").content"'
) Do Set ExtIP=%%A
echo Your Public IP is : %ExtIP%
echo.

::user choicess
echo A - Home&echo B - Back to Network Configuration&echo C - Exit
echo.
set/p "netstatuscho=>"
if %netstatuscho%==A call "%nowpath%\Home.bat"
if %netstatuscho%==a call "%nowpath%\Home.bat"
if %netstatuscho%==B goto NETCONFIG
if %netstatuscho%==b goto NETCONFIG
if %netstatuscho%==C call "%nowpath%\Exit.bat"
if %netstatuscho%==c call "%nowpath%\Exit.bat"
echo invalid choice... Try again...
timeout 6
goto PUBIP