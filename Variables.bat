:VARIABLES
echo Loading path variables...
::working path
set nowpath=%~dp0
::temp path
set path=C:\ProgramData\HotspotMakerData
echo Importing version details...
::import version
set/p version=<"%nowpath%\Version.ini"
echo Setting window titles...
::window title
set title=Hotspot Maker (v%version%)
echo Loading environmet improvements...
::fix environmet errors
set powershell=%SYSTEMROOT%\System32\WindowsPowerShell\v1.0\powershell.exe
set rootpath=%SYSTEMROOT%\System32
set timeout=%rootpath%\timeout.exe
::clean auto update leftovers
if exist "%path%\UpdateMsg.vbs" del /s /q "%path%\UpdateMsg.vbs"
echo Setting window sizes...
::set window size
%powershell% -command "&{$w=(get-host).ui.rawui;$w.buffersize=@{width=100;height=300};$w.windowsize=@{width=100;height=50};}"
echo Checking font colors...
::check and import color
if EXIST "%path%\colorcode.ini" goto WIZARDSTART
if NOT EXIST "%path%\colorcode.ini" goto COLORMAKE

:COLORMAKE
echo Generating colors...
::make colors when it is not available
md "%path%"
echo A>"%path%\colorcode.ini"
goto WIZARDSTART

:WIZARDSTART
echo Importing and setting font colors...
::import and set color
set/p defCOLORCODEnum=<"%path%\colorcode.ini"
set/p defbgCOLORnum=<"%path%\colorbg.ini"
color %defCOLORCODEnum%
echo Setting credit variables...
::set credits
SET CREDIT0=                   --------------------------------------------------------------
SET CREDIT1=                   **************************************************************
SET CREDIT2=                   ***                                                        ***
SET CREDIT3=                   ***                   (:  -WELCOME-  :)                    ***
SET CREDIT4=                   ***   : Hotspot Creating Wizard for Windows 8/10(v%version%)  :  ***
SET CREDIT5=                   ***                 - Open Source Project -                ***
SET CREDIT6=                   ***                                                        ***
SET CREDIT7=                   **************************************************************
SET CREDIT8=                   --------------------------------------------------------------
echo Checking default username and password...
echo Load compleated!
%timeout% 2 >nul
::check default username and password
if EXIST "%path%\defuser.nnb" call "%nowpath%\Home.bat"
if NOT EXIST "%path%\defuser.nnb" call "%nowpath%\SaveCredits.bat"