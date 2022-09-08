:NETCONFIG
::clear before outputs
cls
::title
title %title%
::credits
echo %CREDIT0%&echo %CREDIT1%&echo %CREDIT2%&echo %CREDIT4%&echo %CREDIT5%&echo %CREDIT6%&echo %CREDIT7%&echo %CREDIT8%
::tab title
echo [ Network Configuration ]
echo.
::welcome note
echo Welcome to Network Configuration...
echo.
::user choicess
echo A - Home&echo B - IP Configuration&echo C - Hotspot Status&echo D - Ping (IP/Domain)&echo E - View Public IP (External IP)&echo F - Network Connections Window&echo G - Renew/Refresh Network IP Addresses&echo H - View Computer Hotstname&echo I - Exit
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
if %netconfigcho%==E goto GETPUBIP
if %netconfigcho%==e goto GETPUBIP
if %netconfigcho%==F goto NCWINDOW
if %netconfigcho%==f goto NCWINDOW
if %netconfigcho%==G goto RNIA
if %netconfigcho%==g goto RNIA
if %netconfigcho%==H goto CHOSTNAME
if %netconfigcho%==h goto CHOSTNAME
if %netconfigcho%==I call "%nowpath%\Exit.bat"
if %netconfigcho%==i call "%nowpath%\Exit.bat"
echo invalid choice... Try again...
%timeout% 6
goto NETCONFIG

:CHOSTNAME
::clear before outputs
cls
::credits
echo %CREDIT0%&echo %CREDIT1%&echo %CREDIT2%&echo %CREDIT4%&echo %CREDIT5%&echo %CREDIT6%&echo %CREDIT7%&echo %CREDIT8%
::tab title
echo [ Computer Hostname ]
echo.
::comment
echo Working...
echo.
echo %date%%time% - Get computer host name>>"%logger%"
::command
%rootpath%\HOSTNAME.EXE>"%path%\chostname.ini"
set/p hostname=<"%path%\chostname.ini"
del "%path%\chostname.ini"
echo Computer Hostname: %hostname%
::comment
echo.
if %errorlevel%==0 (echo %date%%time% - Errorlevel %errorlevel%>>"%logger%" &echo Compleated!) else (echo %date%%time% - Errorlevel %errorlevel%>>"%logger%" &echo Error!)
echo.
::user choicess
echo A - Home&echo B - Back to Network Configuration&echo C - Exit
echo.
set/p "rniacho=>"
if %rniacho%==A call "%nowpath%\Home.bat"
if %rniacho%==a call "%nowpath%\Home.bat"
if %rniacho%==B goto NETCONFIG
if %rniacho%==b goto NETCONFIG
if %rniacho%==C call "%nowpath%\Exit.bat"
if %rniacho%==c call "%nowpath%\Exit.bat"
echo invalid choice... Try again...
%timeout% 6
goto CHOSTNAME

:RNIA
::clear before outputs
cls
::credits
echo %CREDIT0%&echo %CREDIT1%&echo %CREDIT2%&echo %CREDIT4%&echo %CREDIT5%&echo %CREDIT6%&echo %CREDIT7%&echo %CREDIT8%
::tab title
echo [ Renew Network IP ]
echo.
::comments
echo Working...
echo %date%%time% - Renew network ip>>"%logger%"
::release ip
%rootpath%\ipconfig /release
if %errorlevel%==0 (echo %date%%time% - Errorlevel %errorlevel%>>"%logger%" &echo Release Compleated!) else (echo %date%%time% - Errorlevel %errorlevel%>>"%logger%" &echo Error!)
::renew ip
%rootpath%\ipconfig /renew
if %errorlevel%==0 (echo %date%%time% - Errorlevel %errorlevel%>>"%logger%" &echo Renew Compleated!) else (echo %date%%time% - Errorlevel %errorlevel%>>"%logger%" &echo Error!)
echo.
::user choicess
echo A - Home&echo B - Back to Network Configuration&echo C - Exit
echo.
set/p "rniacho=>"
if %rniacho%==A call "%nowpath%\Home.bat"
if %rniacho%==a call "%nowpath%\Home.bat"
if %rniacho%==B goto NETCONFIG
if %rniacho%==b goto NETCONFIG
if %rniacho%==C call "%nowpath%\Exit.bat"
if %rniacho%==c call "%nowpath%\Exit.bat"
echo invalid choice... Try again...
%timeout% 6
goto NETCONFIG

:NCWINDOW
::clear before outputs
cls
::credits
echo %CREDIT0%&echo %CREDIT1%&echo %CREDIT2%&echo %CREDIT4%&echo %CREDIT5%&echo %CREDIT6%&echo %CREDIT7%&echo %CREDIT8%
::tab title
echo [ Network Connections ]
echo.
::comments
echo Please wait for open the Network Connection window...
echo %date%%time% - Open network connections window>>"%logger%"
::network connection windows command
%rootpath%\ncpa.cpl
if %errorlevel%==0 (echo %date%%time% - Errorlevel %errorlevel%>>"%logger%" &echo Compleated!) else (echo %date%%time% - Errorlevel %errorlevel%>>"%logger%" &echo Error!)
echo.
::user choicess
echo A - Home&echo B - Back to Network Configuration&echo C - Exit
echo.
set/p "ncwindowcho=>"
if %ncwindowcho%==A call "%nowpath%\Home.bat"
if %ncwindowcho%==a call "%nowpath%\Home.bat"
if %ncwindowcho%==B goto NETCONFIG
if %ncwindowcho%==b goto NETCONFIG
if %ncwindowcho%==C call "%nowpath%\Exit.bat"
if %ncwindowcho%==c call "%nowpath%\Exit.bat"
echo invalid choice... Try again...
%timeout% 6
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
::ping command
echo %date%%time% - Send Ping>>"%logger%"
echo %date%%time% - (Address - %pingaddress%) , (Count - %pingcount%)>>"%logger%"
%rootpath%\PING.EXE %pingaddress% -n %pingcount%
if %errorlevel%==0 (echo %date%%time% - Errorlevel %errorlevel%>>"%logger%" &echo Compleated!) else (echo %date%%time% - Errorlevel %errorlevel%>>"%logger%" &echo Error!)
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
%timeout% 6
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
echo %date%%time% - Ipconfiguration>>"%logger%"
::ipconfig command
%systemroot%\system32\ipconfig /all
if %errorlevel%==0 (echo %date%%time% - Errorlevel %errorlevel%>>"%logger%" &echo Compleated!) else (echo %date%%time% - Errorlevel %errorlevel%>>"%logger%" &echo Error!)
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
%timeout% 6
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
echo %date%%time% - Get network status>>"%logger%"
::hostednetwork details command
%rootpath%\netsh.exe wlan show hostednetwork && set level1=%errorlevel%
if %errorlevel%==0 (echo %date%%time% - Errorlevel %errorlevel%>>"%logger%" &echo Compleated!) else (echo %date%%time% - Errorlevel %errorlevel%>>"%logger%" &echo Error!)
::hostednetwork details command (security)
%rootpath%\netsh.exe wlan show hostednetwork setting=security && set level2=%errorlevel%
if %errorlevel%==0 (echo %date%%time% - Errorlevel %errorlevel%>>"%logger%" &echo Compleated!) else (echo %date%%time% - Errorlevel %errorlevel%>>"%logger%" &echo Error!)
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
%timeout% 6
goto NETSTATUS

:GETPUBIP
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
echo %date%%time% - Get public ip>>"%logger%"
::internet check
echo Please wait for check the internet connection...
For /f %%A in (
  '%powershell% -command "(Invoke-Webrequest "https://pastebin.com/raw/3Tgw3Eid").content"'
) Do Set intcheck=%%A
if %intcheck%==2004 goto PUBIPSTART
echo.
echo %date%%time% - Network error>>"%logger%"
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
%timeout% 6
goto PUBIP

:PUBIPSTART
echo %date%%time% - Connection ok>>"%logger%"
echo Connected to the internet!
echo Please wait for get your public IP...
echo.
::get public ip
:: web - http://api.ipify.org
For /f %%A in (
  '%powershell% -command "(Invoke-Webrequest "http://api.ipify.org").content"'
) Do Set ExtIP=%%A
echo Your Public IP is : %ExtIP%
echo %date%%time% - Ip got>>"%logger%"
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
%timeout% 6
goto PUBIP