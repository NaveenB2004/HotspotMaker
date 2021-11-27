@Echo off
mode 100
title Hotspot Maker - Updater
goto HOME
set/p version=<"C:\ProgramData\HotspotMakerData\hmversion.ini"

:HOME
echo Make sure you have speed network connection...
echo If there show any error, Please re invoke the update request...
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

:NEWVERAVAIL
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
powershell -Command "Invoke-WebRequest https://drive.google.com/uc?id=1umDSZvCWZ9XuVencsy7Wa_jx6WHlRlLR -Outfile C:\ProgramData\HotspotMakerData\HotspotMakerLast.bat"
if EXIST "C:\ProgramData\HotspotMakerData\HotspotMakerLast.bat" goto CONTINUEINSTALLA
if NOT EXIST "C:\ProgramData\HotspotMakerData\HotspotMakerLast.bat" goto CONTINUEINSTALL

:CONTINUEINSTALLA
echo.
echo Please wait a moment...
powershell -Command "Invoke-WebRequest https://drive.google.com/uc?id=1SX9m0VNWiLVun3kvVwUBofmURNpKZcAR -Outfile C:\ProgramData\HotspotMakerData\ReadMeTemp.txt"
if EXIST "C:\ProgramData\HotspotMakerData\ReadMeTemp.txt" goto CONTINUEINSTALLB
if NOT EXIST "C:\ProgramData\HotspotMakerData\ReadMeTemp.txt" goto CONTINUEINSTALLA

:CONTINUEINSTALLB
echo.
echo Installing Updates...
echo Please wait a moment...
del "C:\Hotspot Maker\Hotspot Maker-Main.bat"
copy "C:\ProgramData\HotspotMakerData\HotspotMakerLast.bat" "C:\Hotspot Maker\"
del "C:\ProgramData\HotspotMakerData\HotspotMakerLast.bat"
ren "C:\Hotspot Maker\HotspotMakerLast.bat" "C:\Hotspot Maker\Hotspot Maker-Main.bat"
del "C:\Hotspot Maker\Read Me.txt"
copy "C:\ProgramData\HotspotMakerData\ReadMeTemp.txt" "C:\Hotspot Maker\"
del "C:\ProgramData\HotspotMakerData\ReadMeTemp.txt"
ren "C:\Hotspot Maker\ReadMeTemp.txt" "C:\Hotspot Maker\Read Me.txt"
echo %newversion% >"C:\ProgramData\HotspotMakerData\hmversion.ini"
echo.
echo Installation Compleated...!
echo Uptodate version is v%newversion%
echo Please close the opend Hotspot Maker Wizard and reopen it...
echo.
timeout 20
goto END

:END
cls
echo Thank you for choosing us!
pause
exit