@Echo off
set scriptpath=%~dp0
SET version=1.7
title Hotspot Maker (v%version%)

if EXIST "C:\ProgramData\HotspotMakerData\colorcode.ini" goto WIZARDSTART
if NOT EXIST "C:\ProgramData\HotspotMakerData\colorcode.ini" goto COLORMAKE

:COLORMAKE
md "C:\ProgramData\HotspotMakerData"
echo A >"C:\ProgramData\HotspotMakerData\colorcode.ini"
echo %version% >"C:\ProgramData\HotspotMakerData\hmversion.ini"
goto WIZARDSTART

:WIZARDSTART
echo %version%>"C:\ProgramData\HotspotMakerData\hmversion.ini"
set/p defCOLORCODEnum=<"C:\ProgramData\HotspotMakerData\colorcode.ini"
color %defCOLORCODEnum%
SET CREDIT0=                 --------------------------------------------------------------
SET CREDIT1=                 **************************************************************
SET CREDIT2=                 ***                                                        ***
SET CREDIT3=                 ***                   (:  -WELCOME-  :)                    ***
SET CREDIT4=                 ***   : Hotspot Creating Wizard for Windows 8/10(v%version%)  :  ***
SET CREDIT5=                 ***                 - Open Source Project -                ***
SET CREDIT6=                 ***                                                        ***
SET CREDIT7=                 **************************************************************
SET CREDIT8=                 --------------------------------------------------------------
if EXIST "C:\ProgramData\HotspotMakerData\defuser.nnb" goto HOME
if NOT EXIST "C:\ProgramData\HotspotMakerData\defuser.nnb" goto SAVECREDITS

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
if %homecho%==A goto START
if %homecho%==a goto START
if %homecho%==B goto STOP
if %homecho%==b goto STOP
if %homecho%==C goto NETCONFIG
if %homecho%==c goto NETCONFIG
if %homecho%==D goto SAVECREDITS
if %homecho%==d goto SAVECREDITS
if %homecho%==E goto DETAILS
if %homecho%==e goto DETAILS
if %homecho%==F goto EXIT
if %homecho%==f goto EXIT
echo invalid choice... Try again...
timeout 6
goto HOME

:SAVECREDITS
cls
echo %CREDIT0%&echo %CREDIT1%&echo %CREDIT2%&echo %CREDIT4%&echo %CREDIT5%&echo %CREDIT6%&echo %CREDIT7%&echo %CREDIT8%
echo [ Set Default SSID and Password ]
echo.
echo You can save hotspot SSID(name) and password for easily start Hotspot with given data.
echo # You should input data for use this option. If you not input data, default ssid and password will not work.
echo.
echo Enter Network SSID (Name) for use as default:
set/p "defname=>"
echo %defname%>"C:\ProgramData\HotspotMakerData\defaultssid.ini"
echo.
echo Enter Network PASSWORD for use as default:
set/p "defpass=>"
echo %defpass%>"C:\ProgramData\HotspotMakerData\defaultpass.ini"
echo.
echo Success...!
echo defuser>"C:\ProgramData\HotspotMakerData\defuser.nnb"
echo.
echo A - Home&echo B - Details&echo C - Exit
echo.
set/p "svcredit=>"
if %svcredit%==A goto HOME
if %svcredit%==a goto HOME
if %svcredit%==B goto DETAILS
if %svcredit%==b goto DETAILS
if %svcredit%==C goto EXIT
if %svcredit%==c goto EXIT
echo invalid choice... Try again...
timeout 6
goto HOME

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
if %startcho%==B goto HOME
if %startcho%==b goto HOME
if %startcho%==C goto DETAILS
if %startcho%==c goto DETAILS
if %startcho%==D goto EXIT
if %startcho%==d goto EXIT
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
if %sccho%==A goto HOME
if %sccho%==a goto HOME
if %sccho%==B goto NETCONFIG
if %sccho%==b goto NETCONFIG
if %sccho%==C goto STOP
if %sccho%==c goto STOP
if %sccho%==D goto DETAILS
if %sccho%==d goto DETAILS
if %sccho%==E goto EXIT
if %sccho%==e goto EXIT
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
if %stopcho%==B goto HOME
if %stopcho%==b goto HOME
if %stopcho%==C goto DETAILS
if %stopcho%==c goto DETAILS
if %stopcho%==D goto EXIT
if %stopcho%==d goto EXIT
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
if %stccho%==A goto HOME
if %stccho%==a goto HOME
if %stccho%==B goto DETAILS
if %stccho%==b goto DETAILS
if %stccho%==C goto EXIT
if %stccho%==c goto EXIT
echo invalid choice... Try again...
timeout 6
goto HOME

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
if %netconfigcho%==A goto HOME
if %netconfigcho%==a goto HOME
if %netconfigcho%==B goto IPCONFIGURATION
if %netconfigcho%==b goto IPCONFIGURATION
if %netconfigcho%==C goto NETSTATUS
if %netconfigcho%==c goto NETSTATUS
if %netconfigcho%==D goto PINGTEST
if %netconfigcho%==d goto PINGTEST
if %netconfigcho%==E goto PUBIP
if %netconfigcho%==e goto PUBIP
if %netconfigcho%==F goto EXIT
if %netconfigcho%==f goto EXIT
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
if %ipconfigcho%==A goto HOME
if %ipconfigcho%==a goto HOME
if %ipconfigcho%==B goto NETCONFIG
if %ipconfigcho%==b goto NETCONFIG
if %ipconfigcho%==C goto EXIT
if %ipconfigcho%==c goto EXIT
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
if %ipconfigcho%==A goto HOME
if %ipconfigcho%==a goto HOME
if %ipconfigcho%==B goto NETCONFIG
if %ipconfigcho%==b goto NETCONFIG
if %ipconfigcho%==C goto EXIT
if %ipconfigcho%==c goto EXIT
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
if %netstatuscho%==A goto HOME
if %netstatuscho%==a goto HOME
if %netstatuscho%==B goto NETCONFIG
if %netstatuscho%==b goto NETCONFIG
if %netstatuscho%==C goto EXIT
if %netstatuscho%==c goto EXIT
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
if %netstatuscho%==A goto HOME
if %netstatuscho%==a goto HOME
if %netstatuscho%==B goto NETCONFIG
if %netstatuscho%==b goto NETCONFIG
if %netstatuscho%==C goto EXIT
if %netstatuscho%==c goto EXIT
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
if %netstatuscho%==A goto HOME
if %netstatuscho%==a goto HOME
if %netstatuscho%==B goto NETCONFIG
if %netstatuscho%==b goto NETCONFIG
if %netstatuscho%==C goto EXIT
if %netstatuscho%==c goto EXIT
echo invalid choice... Try again...
timeout 6
goto NETSTATUS

:EXIT
cls
echo %CREDIT0%&echo %CREDIT1%&echo %CREDIT2%&echo %CREDIT4%&echo %CREDIT5%&echo %CREDIT6%&echo %CREDIT7%&echo %CREDIT8%
echo [ Exit ]
echo.
echo You are going to exit from the wizard...
echo.
echo A - Continue&echo B - Home&echo C - Details
echo.
set/p "exitcho=>"
if %exitcho%==A goto END
if %exitcho%==a goto END
if %exitcho%==B goto HOME
if %exitcho%==b goto HOME
if %exitcho%==C goto DETAILS
if %exitcho%==c goto DETAILS
echo invalid choice... Try again...
timeout 6
goto STOP

:DETAILS
cls
echo %CREDIT0%&echo %CREDIT1%&echo %CREDIT2%&echo %CREDIT4%&echo %CREDIT5%&echo %CREDIT6%&echo %CREDIT7%&echo %CREDIT8%
echo [ Details ]
echo.
echo Details about the wi-fi hotspot craeting wizard...
echo ..........................................................
echo ---------------------{Stable Edition}---------------------
echo.
echo --------------------------(v%version%)--------------------------
echo.
echo ..................(31.10.2021 @ 11:26 AM).................
echo.
echo Created by: Naveen Balasooriya
echo Contact me: naveennbalasooriya2004@gmail.com      (Email)
echo             https://t.me/NaveenB2004              (Telegram)
echo             https://wa.me/message/KP75DUMMIKMTC1  (Whatsapp)
echo Visit my website: https://sites.google.com/sites/naveenb2004
echo ..........................................................
echo.
echo Version Notes...
echo.
echo # v1.0 - Hosted network start, stop options with default SSID and Password. Editing details for Editors.
echo.
echo # v1.1 - Add Windows IP Configuration option into main interface(Add IP codes). Remove EXITCONTINUE codes and modify FAIL codes. Change some codes for easy editing. Add Chech Updates option and UPDATECHECK codes (primary level code).
echo.
echo # v1.2 - Remove access password. Setup user-friendly start for hotspot(START tab). Short some codes. Remove code breaks. Manage menu items as a cascade. Add font color easy adding option.
echo.
echo # v1.3 - Change Network Configuration to 2 options(ipconfiguration and netstatus). Fix hotspot name and password enter problem. Add network problems offline FAQ. Make changes for run with Windows 10. Make an installable file for an easy install.
echo.
echo # v1.4 - Bugs fixed (Programme Data, Color Settings). Add the 'advanced solves' button for some network start problems (online videos). Short color editing codes. Add default SSID and Password adding option for easy hosted-network starting. Fix menu items. Add pinging option (in Network Configuration Tab). Fix tab name mistakes. Fix some spellings mistakes. Add update setup wizard (beta).
echo.
echo # v1.5 - Bugs fixed (main wizard version read, updater wizard). Remove size formattings. Change directry variables for advanced accessing.
echo.
echo # v1.6 - Bugs Fixed (NETCONFIG error with network start, updater wizard, variables writting). Add interface line for setting default SSID. Add instructions for SAVECREDITS tab while not input data. Made a new wizard for online install (latest versions).
echo.
echo # v1.7 - Bugs fixed (Color settings). Renew updater codes and online installer codes(this wizards will not update after this version). Solve version notes mistakes. Add hotspot security details to Hotspot Status tab. New option added to Hotspot Status tab for get Public/External IP.
echo.
echo ..........................................................
echo.
echo Have you a problem when starting the hostspot?
echo Choose "Hotspot Problems" option to get help.
echo.
echo A - Home&echo B - Check Updates&echo C - Change Font Color&echo D - Hotspot Problems&echo E - Exit
echo.
set/p "dcho=>"
if %dcho%==A goto HOME
if %dcho%==a goto HOME
if %dcho%==B goto UPDATECHECK
if %dcho%==b goto UPDATECHECK
if %dcho%==C goto COLORCODES
if %dcho%==c goto COLORCODES
if %dcho%==D goto HOTSPOTPROBLEMS
if %dcho%==d goto HOTSPOTPROBLEMS
if %dcho%==E goto EXIT
if %dcho%==e goto EXIT
echo invalid choice... Try again...
timeout 6
goto DETAILS

:UPDATECHECK
cls
echo %CREDIT0%&echo %CREDIT1%&echo %CREDIT2%&echo %CREDIT4%&echo %CREDIT5%&echo %CREDIT6%&echo %CREDIT7%&echo %CREDIT8%
echo [ Check Updates ]
echo.
ver
echo Checking Updates...
echo (You are running on v%version%)
echo Please wait a moment...
echo (If there a problem with start the Update request, manually open
echo    the Hotspot Maker-Updater.bat from directry.)
call "%scriptpath%\Hotspot Maker-Updater.bat"

:COLORCODES
cls
echo %CREDIT0%&echo %CREDIT1%&echo %CREDIT2%&echo %CREDIT4%&echo %CREDIT5%&echo %CREDIT6%&echo %CREDIT7%&echo %CREDIT8%
echo [ Change Font Color ]
echo.
set/p defcolorcode=<"C:\ProgramData\HotspotMakerData\colorcode.ini"
echo Choose a color for use as the default font color in wizard...
echo.
echo The default color using at this time is - %defcolorcode%
echo.
echo A - Black&echo B - Blue&echo C - Green&echo D - Aqua&echo E - Red&echo F - Purple&echo G - Yellow&echo H - White&echo I - Gray&echo J - Light Blue&echo K - Light Green&echo L - Light Aqua&echo M - Light Red&echo N - Light Purple&echo O - Light Yellow&echo P - Bright White&echo.&echo Q - Go Back&echo R - Exit
echo.
set/p "colorcho=>"
if %colorcho%==A echo 0 >"C:\ProgramData\HotspotMakerData\colorcode.ini"
if %colorcho%==a echo 0 >"C:\ProgramData\HotspotMakerData\colorcode.ini"
if %colorcho%==B echo 1 >"C:\ProgramData\HotspotMakerData\colorcode.ini"
if %colorcho%==b echo 1 >"C:\ProgramData\HotspotMakerData\colorcode.ini"
if %colorcho%==c echo 2 >"C:\ProgramData\HotspotMakerData\colorcode.ini"
if %colorcho%==C echo 2 >"C:\ProgramData\HotspotMakerData\colorcode.ini"
if %colorcho%==D echo 3 >"C:\ProgramData\HotspotMakerData\colorcode.ini"
if %colorcho%==d echo 3 >"C:\ProgramData\HotspotMakerData\colorcode.ini"
if %colorcho%==E echo 4 >"C:\ProgramData\HotspotMakerData\colorcode.ini"
if %colorcho%==e echo 4 >"C:\ProgramData\HotspotMakerData\colorcode.ini"
if %colorcho%==F echo 5 >"C:\ProgramData\HotspotMakerData\colorcode.ini"
if %colorcho%==f echo 5 >"C:\ProgramData\HotspotMakerData\colorcode.ini"
if %colorcho%==G echo 6 >"C:\ProgramData\HotspotMakerData\colorcode.ini"
if %colorcho%==g echo 6 >"C:\ProgramData\HotspotMakerData\colorcode.ini"
if %colorcho%==H echo 7 >"C:\ProgramData\HotspotMakerData\colorcode.ini"
if %colorcho%==h echo 7 >"C:\ProgramData\HotspotMakerData\colorcode.ini"
if %colorcho%==I echo 8 >"C:\ProgramData\HotspotMakerData\colorcode.ini"
if %colorcho%==i echo 8 >"C:\ProgramData\HotspotMakerData\colorcode.ini"
if %colorcho%==J echo 9 >"C:\ProgramData\HotspotMakerData\colorcode.ini"
if %colorcho%==j echo 9 >"C:\ProgramData\HotspotMakerData\colorcode.ini"
if %colorcho%==K echo A >"C:\ProgramData\HotspotMakerData\colorcode.ini"
if %colorcho%==k echo A >"C:\ProgramData\HotspotMakerData\colorcode.ini"
if %colorcho%==L echo B >"C:\ProgramData\HotspotMakerData\colorcode.ini"
if %colorcho%==l echo B >"C:\ProgramData\HotspotMakerData\colorcode.ini"
if %colorcho%==M echo C >"C:\ProgramData\HotspotMakerData\colorcode.ini"
if %colorcho%==m echo C >"C:\ProgramData\HotspotMakerData\colorcode.ini"
if %colorcho%==N echo D >"C:\ProgramData\HotspotMakerData\colorcode.ini"
if %colorcho%==n echo D >"C:\ProgramData\HotspotMakerData\colorcode.ini"
if %colorcho%==O echo E >"C:\ProgramData\HotspotMakerData\colorcode.ini"
if %colorcho%==o echo E >"C:\ProgramData\HotspotMakerData\colorcode.ini"
if %colorcho%==P echo F >"C:\ProgramData\HotspotMakerData\colorcode.ini"
if %colorcho%==p echo F >"C:\ProgramData\HotspotMakerData\colorcode.ini"
if %colorcho%==Q goto DETAILS
if %colorcho%==q goto DETAILS
if %colorcho%==R goto EXIT
if %colorcho%==r goto EXIT
echo.
echo Color Set Successed...
set/p defCOLORCODEnum=<"C:\ProgramData\HotspotMakerData\colorcode.ini"
color %defCOLORCODEnum%
echo.
timeout 6
goto DETAILS

:HOTSPOTPROBLEMS
cls
echo %CREDIT0%&echo %CREDIT1%&echo %CREDIT2%&echo %CREDIT4%&echo %CREDIT5%&echo %CREDIT6%&echo %CREDIT7%&echo %CREDIT8%
echo [ Hotspot Problems ]
echo.
echo --------------------------------------------------------------------------------
echo.
netsh wlan show drive
echo.
echo ## Check "Hosted network supported"
echo       - When "Hosted network supported : Yes" try next answer
echo       - When "Hosted network supported : No" you can't start the Hotspot :(
echo       - When show dialogue like 'The Wireless AutoConfig Service (wlansvc) is not running'
echo             goto 'advanced solves' using choices...
echo You can use a RJ-45 (Network cable) for make network (wired method).
echo.
echo --------------------------------------------------------------------------------
echo.
echo ## Make sure the Wi-Fi turned on...
echo       - When the Wi-Fi turned on try next answer
echo       - When the Wi-Fi turned off, turn it on and try again to start Hotspot
echo.
echo --------------------------------------------------------------------------------
echo.
echo ## Make sure you run this wizard using "Hotspot Maker-Admin.vbs"
echo      or "Hotspot Maker-Main.bat" as an Administrator.
echo       - When you ran this wizard as an Administartor 
echo              (or using "Hotspot Maker-Admin.vbs") try next answer
echo       - When you not ran this wizard as an Administrator 
echo             (or using "Hotspot Maker-Admin.vbs")start wizard as
echo      an Administartor (or using "Hotspot Maker-Admin.vbs") and try again
echo.
echo --------------------------------------------------------------------------------
echo.
echo Finaly...
echo Contact me, when you can't solve the problem...
echo (You can get contact details from Wizard Details)
echo.
echo --------------------------------------------------------------------------------
echo.
echo A - Home&echo B - Advanced Sloves&echo C - Details&echo D - Exit
echo.
set/p "hpcho=>"
if %hpcho%==A goto HOME
if %hpcho%==a goto HOME
if %hpcho%==B goto ADVANCEDSOLVES
if %hpcho%==b goto ADVANCEDSOLVES
if %hpcho%==C goto DETAILS
if %hpcho%==c goto DETAILS
if %hpcho%==D goto EXIT
if %hpcho%==d goto EXIT
echo invalid choice... Try again...
timeout 6
goto HOTSPOTPROBLEMS

:ADVANCEDSOLVES
cls
echo %CREDIT0%&echo %CREDIT1%&echo %CREDIT2%&echo %CREDIT4%&echo %CREDIT5%&echo %CREDIT6%&echo %CREDIT7%&echo %CREDIT8%
echo [ Advanced Solves ]
start https://drive.google.com/drive/folders/1gKPlth-Tm-pMlt-h3ACXEsS5cx0ZoS2E?usp=sharing
echo.
echo Watch the videos for solve your problems... Good Luck...!
echo.
echo A - Home&echo B - Details&echo C - Exit
echo.
set/p "hpcho=>"
if %hpcho%==A goto HOME
if %hpcho%==a goto HOME
if %hpcho%==B goto DETAILS
if %hpcho%==b goto DETAILS
if %hpcho%==C goto EXIT
if %hpcho%==c goto EXIT
echo invalid choice... Try again...
timeout 6
goto HOTSPOTPROBLEMS

:END
exit