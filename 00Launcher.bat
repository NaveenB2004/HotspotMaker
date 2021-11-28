@Echo off
set nowpath=%~dp0
set/p version=<"%nowpath%\Main\05.Version.ini"
title Hotspot Maker (v%version%)

if EXIST "C:\ProgramData\HotspotMakerData\colorcode.ini" goto WIZARDSTART
if NOT EXIST "C:\ProgramData\HotspotMakerData\colorcode.ini" goto COLORMAKE

:COLORMAKE
md "C:\ProgramData\HotspotMakerData"
echo A>"C:\ProgramData\HotspotMakerData\colorcode.ini"
goto WIZARDSTART

:WIZARDSTART
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
if EXIST "C:\ProgramData\HotspotMakerData\defuser.nnb" call "%nowpath%\Main\00.Home.bat"
if NOT EXIST "C:\ProgramData\HotspotMakerData\defuser.nnb" call "%nowpath%\Main\02.SaveCredits.bat"