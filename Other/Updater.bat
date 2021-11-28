@echo off
title Hotspot Maker - Updater
set scriptpath=%~dp0
set/p thisversion=<"C:\ProgramData\HotspotMakerData\hmversion.ini"
set/p defCOLORCODEnum=<"C:\ProgramData\HotspotMakerData\colorcode.ini"
color %defCOLORCODEnum%
SET CREDIT0=                 --------------------------------------------------------------
SET CREDIT1=                 **************************************************************
SET CREDIT2=                 ***                                                        ***
SET CREDIT3=                 ***                   (:  -WELCOME-  :)                    ***
SET CREDIT4=                 ***      : Hotspot Creating Wizard for Windows 8/10  :     ***
SET CREDIT5=                 ***                 - Open Source Project -                ***
SET CREDIT6=                 ***                                                        ***
SET CREDIT7=                 **************************************************************
SET CREDIT8=                 --------------------------------------------------------------
goto HOME

:HOME
cls
echo %CREDIT0%&echo %CREDIT1%&echo %CREDIT2%&echo %CREDIT3%&echo %CREDIT4%&echo %CREDIT5%&echo %CREDIT6%&echo %CREDIT7%&echo %CREDIT8%
echo [ Updater Home ]
echo.
echo Make sure you connected to internet...
echo Please wait for check the internet connection...
cd "C:\ProgramData\HotspotMakerData"

:NETCHECK
set count=0
set/a count=%count%+1
if %count%==4 goto NETCHECKFAIL
powershell -Command "Invoke-WebRequest https://drive.google.com/uc?id=1-lzdK4ggifiQLe_bNxvBprTjGtX7smPI -Outfile TempVersion.ini"
if exist "C:\ProgramData\HotspotMakerData\TempVersion.ini" goto NETCHECKPASS
if not exist "C:\ProgramData\HotspotMakerData\TempVersion.ini" goto NETCHECK

:NETCHECKFAIL
cls
echo %CREDIT0%&echo %CREDIT1%&echo %CREDIT2%&echo %CREDIT3%&echo %CREDIT4%&echo %CREDIT5%&echo %CREDIT6%&echo %CREDIT7%&echo %CREDIT8%
echo [ Internet Check Fail ]
echo.
echo We can not reach the internet :(
echo Please check your internet connection and try again.
echo.
echo A - Updater Home&echo B - Exit to Hotspot Maker
echo.
set/p "netcheckfailcho=>"
if %netcheckfailcho%==A goto HOME
if %netcheckfailcho%==a goto HOME
if %netcheckfailcho%==B call "%scriptpath%\Hotspot Maker-Main.bat"
if %netcheckfailcho%==b call "%scriptpath%\Hotspot Maker-Main.bat"
echo invalid choice... Try again...
timeout 6
goto NETCHECKFAIL

:NETCHECKPASS
cls
echo %CREDIT0%&echo %CREDIT1%&echo %CREDIT2%&echo %CREDIT3%&echo %CREDIT4%&echo %CREDIT5%&echo %CREDIT6%&echo %CREDIT7%&echo %CREDIT8%
echo [ Check Updates ]
echo.
echo Internet connection : OK!
echo.
echo Checking new versions...
echo.
timeout 5
cd "C:\ProgramData\HotspotMakerData"
set/p tempversion=<"C:\ProgramData\HotspotMakerData\TempVersion.ini"
del "C:\ProgramData\HotspotMakerData\TempVersion.ini"
if %thisversion%==%tempversion% goto THSISILAST
if not %thisversion%==%tempversion% goto NEWAVILABLE

:THSISILAST
cls
echo %CREDIT0%&echo %CREDIT1%&echo %CREDIT2%&echo %CREDIT3%&echo %CREDIT4%&echo %CREDIT5%&echo %CREDIT6%&echo %CREDIT7%&echo %CREDIT8%
echo [ This is the Latest Version ]
echo.
echo Congratulations!
echo You are using the latest version of Hotspot Maker...
echo This version is v%thisversion%
echo.
echo A - Back to Hotspot Maker&echo B - Exit
echo.
set/p "thisislastcho=>"
if %thisislastcho%==A call "%scriptpath%\Hotspot Maker-Main.bat"
if %thisislastcho%==a call "%scriptpath%\Hotspot Maker-Main.bat"
if %thisislastcho%==B goto END
if %thisislastcho%==b goto END
echo invalid choice... Try again...
timeout 6
goto THSISILAST

:NEWAVILABLE
cls
echo %CREDIT0%&echo %CREDIT1%&echo %CREDIT2%&echo %CREDIT3%&echo %CREDIT4%&echo %CREDIT5%&echo %CREDIT6%&echo %CREDIT7%&echo %CREDIT8%
echo [ New version Available ]
echo.
echo New version of Hotspot Maker available...
echo You are running on v%thisversion%
echo Available version is v%tempversion%
echo.
echo Do you wish to download and install the latest version?
echo.
echo A - Install&echo B - Back to Hotspot Maker&echo C - Exit
echo.
set/p "newversioncho=>"
if %newversioncho%==A goto INSTALLATION
if %newversioncho%==a goto INSTALLATION
if %newversioncho%==B call "%scriptpath%\Hotspot Maker-Main.bat"
if %newversioncho%==b call "%scriptpath%\Hotspot Maker-Main.bat"
if %newversioncho%==C goto END
if %newversioncho%==c goto END
echo invalid choice... Try again...
timeout 6
goto NEWAVILABLE

:INSTALLATION
cls
echo %CREDIT0%&echo %CREDIT1%&echo %CREDIT2%&echo %CREDIT3%&echo %CREDIT4%&echo %CREDIT5%&echo %CREDIT6%&echo %CREDIT7%&echo %CREDIT8%
echo [ Installation ]
echo.
echo [Step 1 of 2]
echo Downloading required files...
echo (This may take five seconds)
cd "C:\ProgramData\HotspotMakerData"
powershell -Command "Invoke-WebRequest https://drive.google.com/uc?id=1Ohmig1l1_ufbO34l0kSvE7rnB1_cJc_q -Outfile TempUpdaterLink.ini"
set/p updaterlink=<"C:\ProgramData\HotspotMakerData\TempUpdaterLink.ini"
powershell -Command "Invoke-WebRequest https://drive.google.com/uc?id=%updaterlink% -Outfile TempUpdater.rar"
powershell -Command "Invoke-WebRequest https://drive.google.com/uc?id=19z8J_whlBss5CpcMic7rm6VQVlO0yHaN -Outfile UnRAR.exe"
echo Download compleated!
echo.
echo [Step 2 of 2]
echo Installing files...
echo (This may take five seconds)
cd "C:\ProgramData\HotspotMakerData"
UnRAR x TempUpdater.rar
del "%scriptpath%\Hotspot Maker-Admin.vbs"
del "%scriptpath%\Hotspot Maker-Main.bat"
del "%scriptpath%\LOGO.jpg"
del "%scriptpath%\Read ME.txt"
copy "C:\ProgramData\HotspotMakerData\Hotspot Maker-Admin.vbs" "%scriptpath%"
copy "C:\ProgramData\HotspotMakerData\Hotspot Maker-Main.bat" "%scriptpath%"
copy "C:\ProgramData\HotspotMakerData\LOGO.jpg" "%scriptpath%"
copy "C:\ProgramData\HotspotMakerData\Read ME.txt" "%scriptpath%"
del "C:\ProgramData\HotspotMakerData\Hotspot Maker-Admin.vbs"
del "C:\ProgramData\HotspotMakerData\Hotspot Maker-Main.bat"
del "C:\ProgramData\HotspotMakerData\LOGO.jpg"
del "C:\ProgramData\HotspotMakerData\Read ME.txt"
del "C:\ProgramData\HotspotMakerData\TempUpdaterLink.ini"
del "C:\ProgramData\HotspotMakerData\TempUpdater.rar"
del "C:\ProgramData\HotspotMakerData\UnRAR.exe"
echo Compleated!
echo.
echo (Redirecting to next step...)
echo.
timeout 20
goto FINALRESULT

:FINALRESULT
cls
echo %CREDIT0%&echo %CREDIT1%&echo %CREDIT2%&echo %CREDIT3%&echo %CREDIT4%&echo %CREDIT5%&echo %CREDIT6%&echo %CREDIT7%&echo %CREDIT8%
echo [ Installation Compleated! ]
echo.
echo Installation successfully compleated!
echo Installer version is v%tempversion%
echo Redirecting...
echo.
timeout 20
call "%scriptpath%\Hotspot Maker-Main.bat"

:END
exit