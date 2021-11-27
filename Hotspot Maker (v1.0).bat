@Echo off
title Hotspot Creator
:UNLOCK
color 0C
echo )...............................................(
echo )...You must run this wizard as Administrator...(
echo )...............................................(
echo Enter password to access to the wi-fi hotspot craeting wizard...
set/p "pass=>"
if %pass%==hotspot goto WELCOME
if NOT %pass%==hotspot goto FAIL
:FAIL
echo Invalid password...
goto UNLOCK
:WELCOME
cls
echo          --------------------------------------------------------------
echo          **************************************************************
echo          ***                                                        ***
echo          ***                       -WELCOME-                        ***
echo          ***        Hotspot creating wizard for Windows 8/8.1       ***
echo          ***              Created by:Naveen Balasooriya             ***
echo          ***                                                        ***
echo          **************************************************************
echo          --------------------------------------------------------------
echo )...............................................(
echo )...You must run this wizard as Administrator...(
echo )...............................................(
echo.
echo A-Start Hotspot / B-Stop Hotspot / C-Exit / D-Details
set/p "cho=>"
if %cho%==A goto START
if %cho%==a goto START
if %cho%==B goto STOP
if %cho%==b goto STOP
if %cho%==C goto EXIT
if %cho%==c goto EXIT
if %cho%==D goto DETAILS
if %cho%==d goto DETAILS
echo invalid choice... Try again... (press ENTER)
set/p "cho=>"
goto WELCOME
:START
cls
echo          --------------------------------------------------------------
echo          **************************************************************
echo          ***                                                        ***
echo          ***                       -WELCOME-                        ***
echo          ***        Hotspot creating wizard for Windows 8/8.1       ***
echo          ***              Created by:Naveen Balasooriya             ***
echo          ***                                                        ***
echo          **************************************************************
echo          --------------------------------------------------------------
echo.
echo You are going to start hotspot as SSID (name)-MyHotspot Password-abcd@1234
echo A-Continue / B-Go to back / C-Go to start of wizard / D-Exit / E-Details
set/p "cho=>"
if %cho%==A goto STARTCONTINUE
if %cho%==a goto STARTCONTINUE
if %cho%==B goto WELCOME
if %cho%==b goto WELCOME
if %cho%==C goto WELCOME
if %cho%==c goto WELCOME
if %cho%==D goto EXIT
if %cho%==d goto EXIT
if %cho%==E goto DETAILS
if %cho%==e goto DETAILS
echo invalid choice... Try again... (press ENTER)
set/p "cho=>"
goto START
:STARTCONTINUE
cls
echo          --------------------------------------------------------------
echo          **************************************************************
echo          ***                                                        ***
echo          ***                       -WELCOME-                        ***
echo          ***        Hotspot creating wizard for Windows 8/8.1       ***
echo          ***              Created by:Naveen Balasooriya             ***
echo          ***                                                        ***
echo          **************************************************************
echo          --------------------------------------------------------------
echo.
echo Starting hotspot as SSID (name)-MyHotspot Password-abcd@1234
echo .........................................................
netsh wlan set hostednetwork mode=allow ssid=MyHotspot key=abcd@1234
netsh wlan start hostednetwork
echo Hotspot creating successfully...!
echo A-Go to start of wizard / B-Go to back / C-Stop hotspot / D-Exit / E-Details
set/p "cho=>"
if %cho%==A goto WELCOME
if %cho%==a goto WELCOME
if %cho%==B goto START
if %cho%==b goto START
if %cho%==C goto STOP
if %cho%==c goto STOP
if %cho%==D goto EXIT
if %cho%==d goto EXIT
if %cho%==E goto DETAILS
if %cho%==e goto DETAILS
echo invalid choice... Try again... (press ENTER)
set/p "cho=>"
goto START
:STOP
cls
echo          --------------------------------------------------------------
echo          **************************************************************
echo          ***                                                        ***
echo          ***                       -WELCOME-                        ***
echo          ***        Hotspot creating wizard for Windows 8/8.1       ***
echo          ***              Created by:Naveen Balasooriya             ***
echo          ***                                                        ***
echo          **************************************************************
echo          --------------------------------------------------------------
echo.
echo You are going to stop the hotspot...
echo A-Continue / B-Go to back / C-Exit / D-Details
set/p "cho=>"
if %cho%==A goto STOPCONTINUE
if %cho%==a goto STOPCONTINUE
if %cho%==B goto WELCOME
if %cho%==b goto WELCOME
if %cho%==C goto EXIT
if %cho%==c goto EXIT
if %cho%==D goto DETAILS
if %cho%==d goto DETAILS
echo invalid choice... Try again... (press ENTER)
set/p "cho=>"
goto STOP
:STOPCONTINUE
cls
echo          --------------------------------------------------------------
echo          **************************************************************
echo          ***                                                        ***
echo          ***                       -WELCOME-                        ***
echo          ***        Hotspot creating wizard for Windows 8/8.1       ***
echo          ***              Created by:Naveen Balasooriya             ***
echo          ***                                                        ***
echo          **************************************************************
echo          --------------------------------------------------------------
echo.
echo Stopping the hotspot...
netsh wlan stop hostednetwork
echo ..........................................................
echo Successfully stoped the hotspot...!
echo A-Go to start of wizard / B-Exit / C-Details
set/p "cho=>"
if %cho%==A goto WELCOME
if %cho%==a goto WELCOME
if %cho%==B goto EXIT
if %cho%==b goto EXIT
if %cho%==C goto DETAILS
if %cho%==c goto DETAILS
echo invalid choice... Try again... (press ENTER)
set/p "cho=>"
goto WELCOME
:EXIT
cls
echo          --------------------------------------------------------------
echo          **************************************************************
echo          ***                                                        ***
echo          ***                       -WELCOME-                        ***
echo          ***        Hotspot creating wizard for Windows 8/8.1       ***
echo          ***              Created by:Naveen Balasooriya             ***
echo          ***                                                        ***
echo          **************************************************************
echo          --------------------------------------------------------------
echo.
echo You are going to exit from the wizard...
echo A-Continue / B-Go to back / C-Details
set/p "cho=>"
if %cho%==A goto EXITCONTINUE
if %cho%==a goto EXITCONTINUE
if %cho%==B goto WELCOME
if %cho%==b goto WELCOME
if %cho%==C goto DETAILS
if %cho%==c goto DETAILS
echo invalid choice... Try again... (press ENTER)
set/p "cho=>"
goto STOP
:EXITCONTINUE
cls
echo          --------------------------------------------------------------
echo          **************************************************************
echo          ***                                                        ***
echo          ***                       -WELCOME-                        ***
echo          ***        Hotspot creating wizard for Windows 8/8.1       ***
echo          ***              Created by:Naveen Balasooriya             ***
echo          ***                                                        ***
echo          **************************************************************
echo          --------------------------------------------------------------
echo.
echo Press ENTER to exit from the wizard...
set/p "cho=>"
goto END
:DETAILS
cls
echo          --------------------------------------------------------------
echo          **************************************************************
echo          ***                                                        ***
echo          ***                       -WELCOME-                        ***
echo          ***        Hotspot creating wizard for Windows 8/8.1       ***
echo          ***              Created by:Naveen Balasooriya             ***
echo          ***                                                        ***
echo          **************************************************************
echo          --------------------------------------------------------------
echo.
echo Details about the wi-fi hotspot craeting wizard...
echo ..........................................................
echo.
echo ---------------------------v1.0---------------------------
echo.
echo ..........................................................
echo.
echo Created by: Naveen Balasooriya
echo Contact me: naveennbalasooriya2004@gmail.com (Email)
echo             t.me/NaveenB_2004 (Telegram)
echo.
echo ..........................................................
echo.
echo Are you want to edit the password to access the wizard?
echo edit 6 , 7 lines as-
echo if %pass%==(yourpassword) goto WELCOME
echo if NOT %pass%==(yourpassword) goto FAIL
echo.
echo ..........................................................
echo.
echo Are you want to edit your hotspot SSID (name) and password?
echo edit 50 , 78 , 80 lines as-
echo You are going to start hotspot as SSID (name)-(hotspotname) Password-(hotspotpassword)
echo Starting hotspot as SSID (name)-(hotspotname) Password-(hotspotpassword)
echo netsh wlan set hostednetwork mode=allow ssid=(hotspotname) key=(hotspotpassword)
echo.
echo ..........................................................
echo.
echo Are you want to change the color of wizard?
echo edit 4 line using this color cords as 'color (color cord)'
echo 00 = Black    08 = Gray
echo 01 = Blue     09 = Light Blue
echo 02 = Green    0A = Light Green
echo 03 = Aqua     0B = Light Aqua
echo 04 = Red      0C = Light Red
echo 05 = Purple   0D = Light Purple
echo 06 = Yellow   0E = Light Yellow
echo 07 = White    0F = Bright White
echo.
echo ..........................................................
echo Download new updates from: https://drive.google.com/drive/folders/1OmlB3fGA5nINPF0Se8TwTjELzBoX2-fB?usp=sharing
echo ..........................................................
echo.
echo A-Go to start of wizard / B-Exit
set/p "cho=>"
if %cho%==A goto WELCOME
if %cho%==a goto WELCOME
if %cho%==B goto EXIT
if %cho%==b goto EXIT
echo invalid choice... Try again... (press ENTER)
set/p "cho=>"
goto DETAILS
:END