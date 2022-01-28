:VARIABLES
::working path
set nowpath=%~dp0
::temp path
set path=C:\ProgramData\HotspotMakerData
::import version
set/p version=<"%nowpath%\Version.ini"
::window title
set title=Hotspot Maker (v%version%)
::check and remove update leftovers
if EXIST "%path%\updateinstaller.bat" del "%path%\updateinstaller.bat"
::check and import color
if EXIST "%path%\colorcode.ini" goto WIZARDSTART
if NOT EXIST "%path%\colorcode.ini" goto COLORMAKE

:COLORMAKE
::make colors when it is not available
md "%path%"
echo A>"%path%\colorcode.ini"
goto WIZARDSTART

:WIZARDSTART
::import and set color
set/p defCOLORCODEnum=<"%path%\colorcode.ini"
color %defCOLORCODEnum%
::set credits
SET CREDIT0=                 --------------------------------------------------------------
SET CREDIT1=                 **************************************************************
SET CREDIT2=                 ***                                                        ***
SET CREDIT3=                 ***                   (:  -WELCOME-  :)                    ***
SET CREDIT4=                 ***   : Hotspot Creating Wizard for Windows 8/10(v%version%)  :  ***
SET CREDIT5=                 ***                 - Open Source Project -                ***
SET CREDIT6=                 ***                                                        ***
SET CREDIT7=                 **************************************************************
SET CREDIT8=                 --------------------------------------------------------------
::check uninstaller
if %unins%==1 call "%nowpath%\Uninstaller.bat"
::check default username and password
if EXIST "%path%\defuser.nnb" call "%nowpath%\Home.bat"
if NOT EXIST "%path%\defuser.nnb" call "%nowpath%\SaveCredits.bat"