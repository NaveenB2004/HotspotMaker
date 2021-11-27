@Echo off
title Hotspot Creator Wizard (v1.1)
color 0C

:LOCK
cls
echo -Lock-
echo.
echo /..................................................\
echo -...You must run this wizard as an Administrator...-
echo \................................................../
echo.
echo Enter password to access to the wi-fi hotspot craeting wizard...
set/p "pass=>"
if %pass%==hotspot goto HOME
if NOT %pass%==hotspot goto FAIL

:FAIL
cls
echo -- ): Invalid Password :( --
echo.
echo Read the 'HCW ReadMe' text file first...!
echo (You can find that text file in the wizard directry)
echo When you can't find it, visit our website(Details- Defalt Wizard Password.txt)
echo.
echo https://drive.google.com/drive/folders/1OmlB3fGA5nINPF0Se8TwTjELzBoX2-fB
echo.
echo A-Go Back/ B-Exit
set/p "cho=>"
if %cho%==A goto LOCK
if %cho%==a goto LOCK
if %cho%==B goto EXIT
if %cho%==b goto EXIT

:HOME
cls
echo          --------------------------------------------------------------
echo          **************************************************************
echo          ***                                                        ***
echo          ***                   (:  -WELCOME-  :)                    ***
echo          ***     Hotspot Creating Wizard for Windows 8/8.1(v1.1)    ***
echo          ***              Created by:Naveen Balasooriya             ***
echo          ***                                                        ***
echo          **************************************************************
echo          --------------------------------------------------------------
echo -Home-
echo.
echo /..................................................\
echo -...You must run this wizard as an Administrator...-
echo \................................................../
echo ## Go to Details for Check new versions of Hotspot Creating Wizard ##
echo.
echo A-Start Hotspot/B-Stop Hotspot/C-Network Configuration/D-Exit/E-Details/F-Lock
set/p "cho=>"
if %cho%==A goto START
if %cho%==a goto START
if %cho%==B goto STOP
if %cho%==b goto STOP
if %cho%==C goto IP
if %cho%==c goto IP
if %cho%==D goto EXIT
if %cho%==d goto EXIT
if %cho%==E goto DETAILS
if %cho%==e goto DETAILS
if %cho%==F goto LOCK
if %cho%==f goto LOCK
echo invalid choice... Try again... (press ENTER)
set/p "cho=>"
goto HOME

:START
cls
echo          --------------------------------------------------------------
echo          **************************************************************
echo          ***                                                        ***
echo          ***                       -WELCOME-                        ***
echo          ***     Hotspot Creating Wizard for Windows 8/8.1(v1.1)    ***
echo          ***              Created by:Naveen Balasooriya             ***
echo          ***                                                        ***
echo          **************************************************************
echo          --------------------------------------------------------------
echo -Start-
echo.
echo You are going to start hotspot as SSID (name)-MyHotspot Password-abcd@1234
echo # When you want to change the SSID (name) and password of the hotspot, 
echo look Details #
echo.
echo A-Continue/ B-Home/ C-Exit/ D-Details
set/p "cho=>"
if %cho%==A goto STARTCONTINUE
if %cho%==a goto STARTCONTINUE
if %cho%==B goto HOME
if %cho%==b goto HOME
if %cho%==C goto EXIT
if %cho%==c goto EXIT
if %cho%==D goto DETAILS
if %cho%==d goto DETAILS
echo invalid choice... Try again... (press ENTER)
set/p "cho=>"
goto START

:STARTCONTINUE
cls
echo          --------------------------------------------------------------
echo          **************************************************************
echo          ***                                                        ***
echo          ***                       -WELCOME-                        ***
echo          ***     Hotspot Creating Wizard for Windows 8/8.1(v1.1)    ***
echo          ***              Created by:Naveen Balasooriya             ***
echo          ***                                                        ***
echo          **************************************************************
echo          --------------------------------------------------------------
echo.
echo Starting hotspot as SSID (name)-MyHotspot Password-abcd@1234
echo .........................................................
netsh wlan set hostednetwork mode=allow ssid=MyHotspot key=abcd@1234
netsh wlan start hostednetwork
echo.
echo A-Home/ B-Stop Hotspot/ C-Exit/ D-Details
set/p "cho=>"
if %cho%==A goto HOME
if %cho%==a goto HOME
if %cho%==B goto STOP
if %cho%==b goto STOP
if %cho%==C goto EXIT
if %cho%==c goto EXIT
if %cho%==D goto DETAILS
if %cho%==d goto DETAILS
echo invalid choice... Try again... (press ENTER)
set/p "cho=>"
goto START

:STOP
cls
echo          --------------------------------------------------------------
echo          **************************************************************
echo          ***                                                        ***
echo          ***                       -WELCOME-                        ***
echo          ***     Hotspot Creating Wizard for Windows 8/8.1(v1.1)    ***
echo          ***              Created by:Naveen Balasooriya             ***
echo          ***                                                        ***
echo          **************************************************************
echo          --------------------------------------------------------------
echo -Stop-
echo.
echo You are going to stop the hotspot...
echo A-Continue/ B-Home/ C-Exit/ D-Details
set/p "cho=>"
if %cho%==A goto STOPCONTINUE
if %cho%==a goto STOPCONTINUE
if %cho%==B goto HOME
if %cho%==b goto HOME
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
echo          ***     Hotspot Creating Wizard for Windows 8/8.1(v1.1)    ***
echo          ***              Created by:Naveen Balasooriya             ***
echo          ***                                                        ***
echo          **************************************************************
echo          --------------------------------------------------------------
echo.
echo Stopping the hotspot...
netsh wlan stop hostednetwork
echo.
echo A-Home/ B-Exit/ C-Details
set/p "cho=>"
if %cho%==A goto HOME
if %cho%==a goto HOME
if %cho%==B goto EXIT
if %cho%==b goto EXIT
if %cho%==C goto DETAILS
if %cho%==c goto DETAILS
echo invalid choice... Try again... (press ENTER)
set/p "cho=>"
goto HOME

:IP
cls
echo          --------------------------------------------------------------
echo          **************************************************************
echo          ***                                                        ***
echo          ***                       -WELCOME-                        ***
echo          ***     Hotspot Creating Wizard for Windows 8/8.1(v1.1)    ***
echo          ***              Created by:Naveen Balasooriya             ***
echo          ***                                                        ***
echo          **************************************************************
echo          --------------------------------------------------------------
echo.
echo Loading Windows IP Configuration...
echo.
ipconfig /all
echo.
echo A-Home/ B-Exit
set/p "cho=>"
if %cho%==A goto HOME
if %cho%==a goto HOME
if %cho%==B goto EXIT
if %cho%==b goto EXIT
echo invalid choice... Try again... (press ENTER)
set/p "cho=>"
goto IP

:EXIT
cls
echo          --------------------------------------------------------------
echo          **************************************************************
echo          ***                                                        ***
echo          ***                       -WELCOME-                        ***
echo          ***     Hotspot Creating Wizard for Windows 8/8.1(v1.1)    ***
echo          ***              Created by:Naveen Balasooriya             ***
echo          ***                                                        ***
echo          **************************************************************
echo          --------------------------------------------------------------
echo -Exit-
echo.
echo You are going to exit from the wizard...
echo A-Continue/ B-Home/ C-Details
set/p "cho=>"
if %cho%==A goto END
if %cho%==a goto END
if %cho%==B goto HOME
if %cho%==b goto HOME
if %cho%==C goto DETAILS
if %cho%==c goto DETAILS
echo invalid choice... Try again... (press ENTER)
set/p "cho=>"
goto STOP

:DETAILS
cls
echo          --------------------------------------------------------------
echo          **************************************************************
echo          ***                                                        ***
echo          ***                       -WELCOME-                        ***
echo          ***     Hotspot Creating Wizard for Windows 8/8.1(v1.1)    ***
echo          ***              Created by:Naveen Balasooriya             ***
echo          ***                                                        ***
echo          **************************************************************
echo          --------------------------------------------------------------
echo.
echo Details about the wi-fi hotspot craeting wizard...
echo ..........................................................
echo.
echo --------------------------(v1.1)--------------------------
echo.
echo ..................(2021.04.18 @07:43 PM)..................
echo.
echo Created by: Naveen Balasooriya
echo Contact me: naveennbalasooriya2004@gmail.com (Email)
echo             t.me/NaveenB_2004 (Telegram)
echo.
echo ..........................................................
echo.
echo # I recomond 'Sublime Text' software for edit this wizard #
echo.
echo ..........................................................
echo.
echo Are you want to edit the password to access the wizard?
echo edit 15 and 16 lines as-
echo.
echo if %pass%==(yournewpassword) goto HOME
echo if NOT %pass%==(yournewpassword) goto FAIL
echo.
echo Are you want to remove the password to access the wizad?
echo remove 5 to 33 code lines.
echo ..........................................................
echo.
echo Are you want to edit your hotspot SSID (name) and password?
echo edit 84 , 114 , 116 lines as-
echo.
echo - You are going to start hotspot as SSID (name)-(newhotspotname) Password-(newhotspotpassword)
echo.
echo - Starting hotspot as SSID (name)-(newhotspotname) Password-(newhotspotpassword)
echo.
echo - netsh wlan set hostednetwork mode=allow ssid=(newhotspotname) key=(newhotspotpassword)
echo.
echo ..........................................................
echo.
echo Are you want to change the color of wizard?
echo edit line 3 using this color cords as 'color (color cord)'
echo.
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
echo.
echo Version Notes...
echo.
echo # v1.0 - Hosted network start, stop options with defalt SSID and Password. Editing details for Editors.
echo.
echo # v1.1 - Add Windows IP Configuration option into main interface(Add IP codes). Remove EXITCONTINUE codes and modify FAIL codes. Change some codes for easy editing. Add Chech Updates option and UPDATECHECK codes (primary level code).
echo.
echo ..........................................................
echo.
echo A-Home/ B-Exit/ C-Check Updates
set/p "cho=>"
if %cho%==A goto HOME
if %cho%==a goto HOME
if %cho%==B goto EXIT
if %cho%==b goto EXIT
if %cho%==C goto UPDATECHECK
if %cho%==c goto UPDATECHECK
echo invalid choice... Try again... (press ENTER)
set/p "cho=>"
goto DETAILS

:UPDATECHECK
cls
echo          --------------------------------------------------------------
echo          **************************************************************
echo          ***                                                        ***
echo          ***                       -WELCOME-                        ***
echo          ***     Hotspot Creating Wizard for Windows 8/8.1(v1.1)    ***
echo          ***              Created by:Naveen Balasooriya             ***
echo          ***                                                        ***
echo          **************************************************************
echo          --------------------------------------------------------------
echo.
ver
echo Checking Updates...
echo (You are running on v1.1)
echo # When this Update Check is not working,
echo Please visit our website #
echo.
echo https://drive.google.com/drive/folders/1OmlB3fGA5nINPF0Se8TwTjELzBoX2-fB
start https://drive.google.com/drive/folders/1OmlB3fGA5nINPF0Se8TwTjELzBoX2-fB
echo.
echo A-Home/ B-Exit/ C-Details
set/p "cho=>"
if %cho%==A goto HOME
if %cho%==a goto HOME
if %cho%==B goto EXIT
if %cho%==b goto EXIT
if %cho%==C goto DETAILS
if %cho%==c goto DETAILS
echo invalid choice... Try again... (press ENTER)
set/p "cho=>"
goto DETAILS

:END