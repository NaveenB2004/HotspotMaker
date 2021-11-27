@Echo off
set scriptpath=%~dp0
title Hotspot Maker - Updater
set/p version=<"C:\ProgramData\HotspotMakerData\hmversion.ini"
goto HOME

:HOME
echo.
echo Make sure you have speed network connection...
echo If there show any error, Please reinvoke the update request...
timeout 6
goto DOWNLOADVER

:DOWNLOADVER
echo.
echo Please wait a moment...
powershell -Command "Invoke-WebRequest https://drive.google.com/uc?id=1qYJcY2uRnjdT_4AMtkXUySEvXByJstlH -Outfile C:\ProgramData\HotspotMakerData\TempVersion.ini"
if EXIST "C:\ProgramData\HotspotMakerData\TempVersion.ini" goto CHECKVER
if NOT EXIST "C:\ProgramData\HotspotMakerData\TempVersion.ini" goto DOWNLOADVER

:CHECKVER
set/p newversion=<"C:\ProgramData\HotspotMakerData\TempVersion.ini"
if %newversion%==%version% goto LASTVERTHIS
if NOT %newversion%==%version% goto NEWVERAVAIL

:LASTVERTHIS
echo Congratultions...!
echo You have the latest version of Hotspot Maker.
echo You are running on v%version%
echo.
pause
goto END

:NEWVERAVAIL
echo.
echo There is a new version of Hotspot Maker available...
echo Would you like to download and install it...?
echo.
echo A - Yes&echo B - No
echo.
set/p "newveravailcho=>"
if %newveravailcho%==A goto CONTINUEINSTALL
if %newveravailcho%==a goto CONTINUEINSTALL
if %newveravailcho%==B goto END
if %newveravailcho%==b goto END
echo invalid choice... Try again...
timeout 6
goto NEWVERAVAIL

:CONTINUEINSTALL
echo.
echo Please wait a moment...
echo Downloading files...
echo Downloading 'HotspotMakerLast.bat'...
powershell -Command "Invoke-WebRequest https://drive.google.com/uc?id=1umDSZvCWZ9XuVencsy7Wa_jx6WHlRlLR -Outfile C:\ProgramData\HotspotMakerData\HotspotMakerLast.bat"
if EXIST "C:\ProgramData\HotspotMakerData\HotspotMakerLast.bat" goto CONTINUEINSTALLA
if NOT EXIST "C:\ProgramData\HotspotMakerData\HotspotMakerLast.bat" goto CONTINUEINSTALL

:CONTINUEINSTALLA
echo.
echo Please wait a moment...
echo Downloading files...
echo Downloading 'ReadMeTemp.txt'...
powershell -Command "Invoke-WebRequest https://drive.google.com/uc?id=1SX9m0VNWiLVun3kvVwUBofmURNpKZcAR -Outfile C:\ProgramData\HotspotMakerData\ReadMeTemp.txt"
if EXIST "C:\ProgramData\HotspotMakerData\ReadMeTemp.txt" goto CONTINUEINSTALLB
if NOT EXIST "C:\ProgramData\HotspotMakerData\ReadMeTemp.txt" goto CONTINUEINSTALLA

:CONTINUEINSTALLB
echo.
echo Please wait a moment...
echo Downloading files...
echo Downloading 'RunAsAdminTemp.vbs'...
powershell -Command "Invoke-WebRequest https://drive.google.com/uc?id=1TCDVEd1b11Kh1HEW0TtajCz_JnBPuIk9 -Outfile C:\ProgramData\HotspotMakerData\RunAsAdminTemp.vbs"
if EXIST "C:\ProgramData\HotspotMakerData\RunAsAdminTemp.vbs" goto CONTINUEINSTALLC
if NOT EXIST "C:\ProgramData\HotspotMakerData\RunAsAdminTemp.vbs" goto CONTINUEINSTALLB

:CONTINUEINSTALLC
echo.
echo Installing Updates...
echo Please wait a moment...
echo Installing files...
del "%scriptpath%\Hotspot Maker-Admin.vbs"
copy "C:\ProgramData\HotspotMakerData\RunAsAdminTemp.vbs" "%scriptpath%\"
del "C:\ProgramData\HotspotMakerData\RunAsAdminTemp.vbs"
ren "%scriptpath%\RunAsAdminTemp.vbs" "Hotspot Maker-Admin.vbs"
del "%scriptpath%\Hotspot Maker-Main.bat"
copy "C:\ProgramData\HotspotMakerData\HotspotMakerLast.bat" "%scriptpath%\"
del "C:\ProgramData\HotspotMakerData\HotspotMakerLast.bat"
ren "%scriptpath%\HotspotMakerLast.bat" "Hotspot Maker-Main.bat"
del "%scriptpath%\Read Me.txt"
copy "C:\ProgramData\HotspotMakerData\ReadMeTemp.txt" "%scriptpath%\"
del "C:\ProgramData\HotspotMakerData\ReadMeTemp.txt"
ren "%scriptpath%\ReadMeTemp.txt" "Read Me.txt"
echo %newversion%>"C:\ProgramData\HotspotMakerData\hmversion.ini"
echo.
echo Installation Compleated...!
echo Uptodate version is v%newversion%
echo.
timeout 20
goto END

:END
cls
set/p version=<"C:\ProgramData\HotspotMakerData\hmversion.ini"
del "C:\ProgramData\HotspotMakerData\TempVersion.ini"
echo                 --------------------------------------------------------------
echo                 **************************************************************
echo                 ***                                                        ***
echo                 ***                   (:  -WELCOME-  :)                    ***
echo                 ***   : Hotspot Creating Wizard for Windows 8/10(v%version%)  :  ***
echo                 ***                 - Open Source Project -                ***
echo                 ***                                                        ***
echo                 **************************************************************
echo                 --------------------------------------------------------------
echo.
echo Thank you for choosing us!
timeout 6
call "%scriptpath%\Hotspot Maker-Main.bat"