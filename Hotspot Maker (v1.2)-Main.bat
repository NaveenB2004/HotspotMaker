@Echo off
:: version info <start>
SET version=1.2
:: version info <end>
title Hotspot Maker (v%version%)

if EXIST "C:\ProgramData\HotspotMaker(v1.2)\*.colorcode" goto WIZARDSTART
if NOT EXIST "C:\ProgramData\HotspotMaker(v1.2)\*.colorcode" goto COLORMAKE

:COLORMAKE
md "C:\ProgramData\HotspotMaker(v1.2)"
echo color>>"C:\ProgramData\HotspotMaker(v1.2)\M.colorcode"
goto WIZARDSTART

:WIZARDSTART
if EXIST "C:\ProgramData\HotspotMaker(v1.2)\A.colorcode" SET defCOLORCODEnum=0
if EXIST "C:\ProgramData\HotspotMaker(v1.2)\B.colorcode" SET defCOLORCODEnum=1
if EXIST "C:\ProgramData\HotspotMaker(v1.2)\C.colorcode" SET defCOLORCODEnum=2
if EXIST "C:\ProgramData\HotspotMaker(v1.2)\D.colorcode" SET defCOLORCODEnum=3
if EXIST "C:\ProgramData\HotspotMaker(v1.2)\E.colorcode" SET defCOLORCODEnum=4
if EXIST "C:\ProgramData\HotspotMaker(v1.2)\F.colorcode" SET defCOLORCODEnum=5
if EXIST "C:\ProgramData\HotspotMaker(v1.2)\G.colorcode" SET defCOLORCODEnum=6
if EXIST "C:\ProgramData\HotspotMaker(v1.2)\H.colorcode" SET defCOLORCODEnum=7
if EXIST "C:\ProgramData\HotspotMaker(v1.2)\I.colorcode" SET defCOLORCODEnum=8
if EXIST "C:\ProgramData\HotspotMaker(v1.2)\J.colorcode" SET defCOLORCODEnum=9
if EXIST "C:\ProgramData\HotspotMaker(v1.2)\K.colorcode" SET defCOLORCODEnum=A
if EXIST "C:\ProgramData\HotspotMaker(v1.2)\L.colorcode" SET defCOLORCODEnum=B
if EXIST "C:\ProgramData\HotspotMaker(v1.2)\M.colorcode" SET defCOLORCODEnum=C
if EXIST "C:\ProgramData\HotspotMaker(v1.2)\N.colorcode" SET defCOLORCODEnum=D
if EXIST "C:\ProgramData\HotspotMaker(v1.2)\O.colorcode" SET defCOLORCODEnum=E
if EXIST "C:\ProgramData\HotspotMaker(v1.2)\P.colorcode" SET defCOLORCODEnum=F
color %defCOLORCODEnum%
SET CREDIT0=          --------------------------------------------------------------
SET CREDIT1=          **************************************************************
SET CREDIT2=          ***                                                        ***
SET CREDIT3=          ***                   (:  -WELCOME-  :)                    ***
SET CREDIT4=          ***   : Hotspot Creating Wizard for Windows 8/8.1(v%version%) :  ***
SET CREDIT5=          ***              Created by:Naveen Balasooriya             ***
SET CREDIT6=          ***                                                        ***
SET CREDIT7=          **************************************************************
SET CREDIT8=          --------------------------------------------------------------
goto HOME

:HOME
cls
echo %CREDIT0%&echo %CREDIT1%&echo %CREDIT2%&echo %CREDIT3%&echo %CREDIT4%&echo %CREDIT5%&echo %CREDIT6%&echo %CREDIT7%&echo %CREDIT8%
echo -Home-
echo.
echo #Go to Details for Check new versions and change the Font color of the Wizard#
echo.
echo A - Start Hotspot&echo B - Stop Hotspot&echo C - Network Configuration&echo D - Exit&echo E - Details
echo.
set/p "homecho=>"
if %homecho%==A goto START
if %homecho%==a goto START
if %homecho%==B goto STOP
if %homecho%==b goto STOP
if %homecho%==C goto IP
if %homecho%==c goto IP
if %homecho%==D goto EXIT
if %homecho%==d goto EXIT
if %homecho%==E goto DETAILS
if %homecho%==e goto DETAILS
echo invalid choice... Try again...
timeout 6
goto HOME

:START
cls
echo %CREDIT0%&echo %CREDIT1%&echo %CREDIT2%&echo %CREDIT3%&echo %CREDIT4%&echo %CREDIT5%&echo %CREDIT6%&echo %CREDIT7%&echo %CREDIT8%
echo -Start-
echo.
echo Enter a name use as the HOTSPOT SSID (name):
set/p "hotspotname=>"
echo.
echo Enter a password use as the HOTSPOT PASSWORD:
echo #(Password must be contain 8 to 64 charactors)#
set/p "hotspotpassword=>"
echo.
echo A - Continue&echo B - Home&echo C - Exit&echo D - Details
echo.
set/p "startcho=>"
if %startcho%==A goto STARTCONTINUE
if %startcho%==a goto STARTCONTINUE
if %startcho%==B goto HOME
if %startcho%==b goto HOME
if %startcho%==C goto EXIT
if %startcho%==c goto EXIT
if %startcho%==D goto DETAILS
if %startcho%==d goto DETAILS
echo invalid choice... Try again...
timeout 6
goto START

:STARTCONTINUE
cls
echo %CREDIT0%&echo %CREDIT1%&echo %CREDIT2%&echo %CREDIT3%&echo %CREDIT4%&echo %CREDIT5%&echo %CREDIT6%&echo %CREDIT7%&echo %CREDIT8%
echo.
echo Starting hotspot as SSID (name)- %hotspotname% Password- %hotspotpassword%
echo .........................................................
netsh wlan set hostednetwork mode=allow ssid=%hotspotname% key=%hotspotpassword%
netsh wlan start hostednetwork
echo.
echo A - Home&echo B - Network Configuration&echo C - Stop Hotspot&echo D - Exit&echo E - Details
echo.
set/p "sccho=>"
if %sccho%==A goto HOME
if %sccho%==a goto HOME
if %sccho%==B goto IP
if %sccho%==b goto IP
if %sccho%==C goto STOP
if %sccho%==c goto STOP
if %sccho%==D goto EXIT
if %sccho%==d goto EXIT
if %sccho%==E goto DETAILS
if %sccho%==e goto DETAILS
echo invalid choice... Try again...
timeout 6
goto START

:STOP
cls
echo %CREDIT0%&echo %CREDIT1%&echo %CREDIT2%&echo %CREDIT3%&echo %CREDIT4%&echo %CREDIT5%&echo %CREDIT6%&echo %CREDIT7%&echo %CREDIT8%
echo -Stop-
echo.
echo You are going to stop the hotspot...
echo A - Continue&echo B - Home&echo C - Exit&echo D - Details
echo.
set/p "stopcho=>"
if %stopcho%==A goto STOPCONTINUE
if %stopcho%==a goto STOPCONTINUE
if %stopcho%==B goto HOME
if %stopcho%==b goto HOME
if %stopcho%==C goto EXIT
if %stopcho%==c goto EXIT
if %stopcho%==D goto DETAILS
if %stopcho%==d goto DETAILS
echo invalid choice... Try again...
timeout 6
goto STOP

:STOPCONTINUE
cls
echo %CREDIT0%&echo %CREDIT1%&echo %CREDIT2%&echo %CREDIT3%&echo %CREDIT4%&echo %CREDIT5%&echo %CREDIT6%&echo %CREDIT7%&echo %CREDIT8%
echo.
echo Stopping the hotspot...
netsh wlan stop hostednetwork
echo.
echo A - Home&echo B - Exit&echo C - Details
echo.
set/p "stccho=>"
if %stccho%==A goto HOME
if %stccho%==a goto HOME
if %stccho%==B goto EXIT
if %stccho%==b goto EXIT
if %stccho%==C goto DETAILS
if %stccho%==c goto DETAILS
echo invalid choice... Try again...
timeout 6
goto HOME

:IP
cls
echo %CREDIT0%&echo %CREDIT1%&echo %CREDIT2%&echo %CREDIT3%&echo %CREDIT4%&echo %CREDIT5%&echo %CREDIT6%&echo %CREDIT7%&echo %CREDIT8%
echo.
echo Loading Windows IP Configuration...
echo.
ipconfig /all
echo.
echo A - Home&echo B - Exit
echo.
set/p "ipcho=>"
if %ipcho%==A goto HOME
if %ipcho%==a goto HOME
if %ipcho%==B goto EXIT
if %ipcho%==b goto EXIT
echo invalid choice... Try again...
timeout 6
goto IP

:EXIT
cls
echo %CREDIT0%&echo %CREDIT1%&echo %CREDIT2%&echo %CREDIT3%&echo %CREDIT4%&echo %CREDIT5%&echo %CREDIT6%&echo %CREDIT7%&echo %CREDIT8%
echo -Exit-
echo.
echo You are going to exit from the wizard...
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
echo %CREDIT0%&echo %CREDIT1%&echo %CREDIT2%&echo %CREDIT3%&echo %CREDIT4%&echo %CREDIT5%&echo %CREDIT6%&echo %CREDIT7%&echo %CREDIT8%
echo.
echo Details about the wi-fi hotspot craeting wizard...
echo ..........................................................
echo ----------------------Stable Edition----------------------
echo.
echo --------------------------(v%version%)--------------------------
echo.
echo ..................(17.06.2021 @ 07:08 PM).................
echo.
echo Created by: Naveen Balasooriya
echo Contact me: naveennbalasooriya2004@gmail.com (Email)
echo             t.me/NaveenB_2004 (Telegram)
echo             https://wa.me/message/KP75DUMMIKMTC1 (Whatsapp)
echo Visit my website: https://sites.google.com/sites/naveenb2004
echo ..........................................................
echo.
echo Version Notes...
echo.
echo # v1.0 - Hosted network start, stop options with default SSID and Password. Editing details for Editors.
echo.
echo # v1.1 - Add Windows IP Configuration option into main interface(Add IP codes). Remove EXITCONTINUE codes and modify FAIL codes. Change some codes for easy editing. Add Chech Updates option and UPDATECHECK codes (primary level code).
echo.
echo # v1.2 - Remove access password. Setup user friendly start for hotspot(START tab). Short some codes. Remove code breaks. Mannage menu items as cascade. Add font color easy adding option.
echo.
echo ..........................................................
echo.
echo A - Home&echo B - Check Updates&echo C - Change Font Color&echo D - Exit
echo.
set/p "dcho=>"
if %dcho%==A goto HOME
if %dcho%==a goto HOME
if %dcho%==B goto UPDATECHECK
if %dcho%==b goto UPDATECHECK
if %dcho%==C goto COLORCODES
if %dcho%==c goto COLORCODES
if %dcho%==D goto EXIT
if %dcho%==d goto EXIT
echo invalid choice... Try again...
timeout 6
goto DETAILS

:UPDATECHECK
cls
echo %CREDIT0%&echo %CREDIT1%&echo %CREDIT2%&echo %CREDIT3%&echo %CREDIT4%&echo %CREDIT5%&echo %CREDIT6%&echo %CREDIT7%&echo %CREDIT8%
echo.
ver
echo Checking Updates...
echo (You are running on v%version%)
echo (Check and download when there is a version above v%version%)
timeout 3
start https://drive.google.com/drive/folders/1OmlB3fGA5nINPF0Se8TwTjELzBoX2-fB
echo.
echo A - Home&echo B - Exit&echo C - Details
echo.
set/p "uccho=>"
if %uccho%==A goto HOME
if %uccho%==a goto HOME
if %uccho%==B goto EXIT
if %uccho%==b goto EXIT
if %uccho%==C goto DETAILS
if %uccho%==c goto DETAILS
echo invalid choice... Try again...
timeout 6
goto DETAILS

:COLORCODES
cls
echo %CREDIT0%&echo %CREDIT1%&echo %CREDIT2%&echo %CREDIT3%&echo %CREDIT4%&echo %CREDIT5%&echo %CREDIT6%&echo %CREDIT7%&echo %CREDIT8%
echo.
if EXIST "C:\ProgramData\HotspotMaker(v1.2)\A.colorcode" SET defCOLORCODE="Black"
if EXIST "C:\ProgramData\HotspotMaker(v1.2)\B.colorcode" SET defCOLORCODE="Blue"
if EXIST "C:\ProgramData\HotspotMaker(v1.2)\C.colorcode" SET defCOLORCODE="Green"
if EXIST "C:\ProgramData\HotspotMaker(v1.2)\D.colorcode" SET defCOLORCODE="Aqua"
if EXIST "C:\ProgramData\HotspotMaker(v1.2)\E.colorcode" SET defCOLORCODE="Red"
if EXIST "C:\ProgramData\HotspotMaker(v1.2)\F.colorcode" SET defCOLORCODE="Purple"
if EXIST "C:\ProgramData\HotspotMaker(v1.2)\G.colorcode" SET defCOLORCODE="Yellow"
if EXIST "C:\ProgramData\HotspotMaker(v1.2)\H.colorcode" SET defCOLORCODE="White"
if EXIST "C:\ProgramData\HotspotMaker(v1.2)\I.colorcode" SET defCOLORCODE="Gray"
if EXIST "C:\ProgramData\HotspotMaker(v1.2)\J.colorcode" SET defCOLORCODE="Light Blue"
if EXIST "C:\ProgramData\HotspotMaker(v1.2)\K.colorcode" SET defCOLORCODE="Light Green"
if EXIST "C:\ProgramData\HotspotMaker(v1.2)\L.colorcode" SET defCOLORCODE="Light Aqua"
if EXIST "C:\ProgramData\HotspotMaker(v1.2)\M.colorcode" SET defCOLORCODE="Light Red"
if EXIST "C:\ProgramData\HotspotMaker(v1.2)\N.colorcode" SET defCOLORCODE="Light Purple"
if EXIST "C:\ProgramData\HotspotMaker(v1.2)\O.colorcode" SET defCOLORCODE="Light Yellow"
if EXIST "C:\ProgramData\HotspotMaker(v1.2)\P.colorcode" SET defCOLORCODE="Bright White"
echo Choose a color for use as the default font color in wizard...
echo.
echo The default color using in this time is - %defcolorcode%
echo.
echo A - Black&echo B - Blue&echo C - Green&echo D - Aqua&echo E - Red&echo F - Purple&echo G - Yellow&echo H - White&echo I - Gray&echo J - Light Blue&echo K - Light Green&echo L - Light Aqua&echo M - Light Red&echo N - Light Purple&echo O - Light Yellow&echo P - Bright White&echo.&echo Q - Go Back&echo R - Exit
echo.
set/p "colorcho=>"
if %colorcho%==A ren "C:\ProgramData\HotspotMaker(v1.2)\*.colorcode" "A.colorcode"
if %colorcho%==a ren "C:\ProgramData\HotspotMaker(v1.2)\*.colorcode" "A.colorcode"
if %colorcho%==B ren "C:\ProgramData\HotspotMaker(v1.2)\*.colorcode" "B.colorcode"
if %colorcho%==b ren "C:\ProgramData\HotspotMaker(v1.2)\*.colorcode" "B.colorcode"
if %colorcho%==C ren "C:\ProgramData\HotspotMaker(v1.2)\*.colorcode" "C.colorcode"
if %colorcho%==c ren "C:\ProgramData\HotspotMaker(v1.2)\*.colorcode" "C.colorcode"
if %colorcho%==D ren "C:\ProgramData\HotspotMaker(v1.2)\*.colorcode" "D.colorcode"
if %colorcho%==d ren "C:\ProgramData\HotspotMaker(v1.2)\*.colorcode" "D.colorcode"
if %colorcho%==E ren "C:\ProgramData\HotspotMaker(v1.2)\*.colorcode" "E.colorcode"
if %colorcho%==e ren "C:\ProgramData\HotspotMaker(v1.2)\*.colorcode" "E.colorcode"
if %colorcho%==F ren "C:\ProgramData\HotspotMaker(v1.2)\*.colorcode" "F.colorcode"
if %colorcho%==f ren "C:\ProgramData\HotspotMaker(v1.2)\*.colorcode" "F.colorcode"
if %colorcho%==G ren "C:\ProgramData\HotspotMaker(v1.2)\*.colorcode" "G.colorcode"
if %colorcho%==g ren "C:\ProgramData\HotspotMaker(v1.2)\*.colorcode" "G.colorcode"
if %colorcho%==H ren "C:\ProgramData\HotspotMaker(v1.2)\*.colorcode" "H.colorcode"
if %colorcho%==h ren "C:\ProgramData\HotspotMaker(v1.2)\*.colorcode" "H.colorcode"
if %colorcho%==I ren "C:\ProgramData\HotspotMaker(v1.2)\*.colorcode" "I.colorcode"
if %colorcho%==i ren "C:\ProgramData\HotspotMaker(v1.2)\*.colorcode" "I.colorcode"
if %colorcho%==J ren "C:\ProgramData\HotspotMaker(v1.2)\*.colorcode" "J.colorcode"
if %colorcho%==j ren "C:\ProgramData\HotspotMaker(v1.2)\*.colorcode" "J.colorcode"
if %colorcho%==K ren "C:\ProgramData\HotspotMaker(v1.2)\*.colorcode" "K.colorcode"
if %colorcho%==k ren "C:\ProgramData\HotspotMaker(v1.2)\*.colorcode" "K.colorcode"
if %colorcho%==L ren "C:\ProgramData\HotspotMaker(v1.2)\*.colorcode" "L.colorcode"
if %colorcho%==l ren "C:\ProgramData\HotspotMaker(v1.2)\*.colorcode" "L.colorcode"
if %colorcho%==M ren "C:\ProgramData\HotspotMaker(v1.2)\*.colorcode" "M.colorcode"
if %colorcho%==m ren "C:\ProgramData\HotspotMaker(v1.2)\*.colorcode" "M.colorcode"
if %colorcho%==N ren "C:\ProgramData\HotspotMaker(v1.2)\*.colorcode" "N.colorcode"
if %colorcho%==n ren "C:\ProgramData\HotspotMaker(v1.2)\*.colorcode" "N.colorcode"
if %colorcho%==O ren "C:\ProgramData\HotspotMaker(v1.2)\*.colorcode" "O.colorcode"
if %colorcho%==o ren "C:\ProgramData\HotspotMaker(v1.2)\*.colorcode" "O.colorcode"
if %colorcho%==P ren "C:\ProgramData\HotspotMaker(v1.2)\*.colorcode" "P.colorcode"
if %colorcho%==p ren "C:\ProgramData\HotspotMaker(v1.2)\*.colorcode" "P.colorcode"
if %colorcho%==Q goto DETAILS
if %colorcho%==q goto DETAILS
if %colorcho%==R goto EXIT
if %colorcho%==r goto EXIT
echo.
echo Color Set Successfully...
if EXIST "C:\ProgramData\HotspotMaker(v1.2)\A.colorcode" SET defCOLORCODEnum=0
if EXIST "C:\ProgramData\HotspotMaker(v1.2)\B.colorcode" SET defCOLORCODEnum=1
if EXIST "C:\ProgramData\HotspotMaker(v1.2)\C.colorcode" SET defCOLORCODEnum=2
if EXIST "C:\ProgramData\HotspotMaker(v1.2)\D.colorcode" SET defCOLORCODEnum=3
if EXIST "C:\ProgramData\HotspotMaker(v1.2)\E.colorcode" SET defCOLORCODEnum=4
if EXIST "C:\ProgramData\HotspotMaker(v1.2)\F.colorcode" SET defCOLORCODEnum=5
if EXIST "C:\ProgramData\HotspotMaker(v1.2)\G.colorcode" SET defCOLORCODEnum=6
if EXIST "C:\ProgramData\HotspotMaker(v1.2)\H.colorcode" SET defCOLORCODEnum=7
if EXIST "C:\ProgramData\HotspotMaker(v1.2)\I.colorcode" SET defCOLORCODEnum=8
if EXIST "C:\ProgramData\HotspotMaker(v1.2)\J.colorcode" SET defCOLORCODEnum=9
if EXIST "C:\ProgramData\HotspotMaker(v1.2)\K.colorcode" SET defCOLORCODEnum=A
if EXIST "C:\ProgramData\HotspotMaker(v1.2)\L.colorcode" SET defCOLORCODEnum=B
if EXIST "C:\ProgramData\HotspotMaker(v1.2)\M.colorcode" SET defCOLORCODEnum=C
if EXIST "C:\ProgramData\HotspotMaker(v1.2)\N.colorcode" SET defCOLORCODEnum=D
if EXIST "C:\ProgramData\HotspotMaker(v1.2)\O.colorcode" SET defCOLORCODEnum=E
if EXIST "C:\ProgramData\HotspotMaker(v1.2)\P.colorcode" SET defCOLORCODEnum=F
color %defCOLORCODEnum%
echo.
timeout 6
goto DETAILS

:END
exit