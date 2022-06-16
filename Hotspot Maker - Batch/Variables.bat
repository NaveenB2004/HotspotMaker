cls
goto VARIABLES

:VARIABLES
::working path
echo Loading path variables...
set nowpath=%~dp0
::temp path
set path=C:\ProgramData\HotspotMakerData
::import version
echo Importing version details...
set/p version=<"%nowpath%\Version.ini"
::window title
echo Setting window titles...
set title=Hotspot Maker (v%version%)
::fix environmet errors
echo Loading environmet improvements...
set powershell=%SYSTEMROOT%\System32\WindowsPowerShell\v1.0\powershell.exe
set rootpath=%SYSTEMROOT%\System32
set timeout=%rootpath%\timeout.exe
::clean auto update leftovers
if exist "%path%\UpdateMsg.vbs" del /s /q "%path%\UpdateMsg.vbs"
::set window size
echo Setting window sizes...
%powershell% -command "&{$w=(get-host).ui.rawui;$w.buffersize=@{width=80;height=500};$w.windowsize=@{width=80;height=35};}"
::check and import color
echo Checking font colors...
if EXIST "%path%\colorcode.ini" goto WIZARDSTART
if NOT EXIST "%path%\colorcode.ini" goto COLORMAKE

:COLORMAKE
::make colors when it is not available
echo Generating colors...
md "%path%"
echo A>"%path%\colorcode.ini"
goto WIZARDSTART

:WIZARDSTART
::import and set color
echo Importing and setting font colors...
set/p defCOLORCODEnum=<"%path%\colorcode.ini"
set/p defbgCOLORnum=<"%path%\colorbg.ini"
color %defCOLORCODEnum%
::set credits
echo Setting credit variables...
SET CREDIT0=         --------------------------------------------------------------
SET CREDIT1=         **************************************************************
SET CREDIT2=         ***                                                        ***
SET CREDIT3=         ***                   (:  -WELCOME-  :)                    ***
SET CREDIT4=         ***   : Hotspot Creating Wizard for Windows 8/10(v%version%)  :  ***
SET CREDIT5=         ***                 - Open Source Project -                ***
SET CREDIT6=         ***                                                        ***
SET CREDIT7=         **************************************************************
SET CREDIT8=         --------------------------------------------------------------
::check default username and password
echo Checking default username and password...
echo Load compleated!
%timeout% 2 >nul
if EXIST "%path%\defuser.nnb" call "%nowpath%\Home.bat"
if NOT EXIST "%path%\defuser.nnb" call "%nowpath%\SaveCredits.bat"