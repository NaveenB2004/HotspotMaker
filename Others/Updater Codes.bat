@Echo off
goto UPHOME

:UPHOME
if exist "C:\ProgramData\HotspotMakerData\NewVersion.rar" del "C:\ProgramData\HotspotMakerData\UnRAR.exe"
if exist "C:\ProgramData\HotspotMakerData\UnRAR.exe" del "C:\ProgramData\HotspotMakerData\NewVersion.rar"
cls
echo                 --------------------------------------------------------------
echo                 **************************************************************
echo                 ***                                                        ***
echo                 ***                   (:  -WELCOME-  :)                    ***
echo                 ***      : Hotspot Creating Wizard for Windows 8/10     :  ***
echo                 ***                 - Open Source Project -                ***
echo                 ***                                                        ***
echo                 **************************************************************
echo                 --------------------------------------------------------------
echo [ Updater ]
echo.
echo [Step 1 of 3]
echo Downloading required files...
echo (This may take five seconds)
cd "C:\ProgramData\HotspotMakerData"
For /f %%A in (
  'powershell -command "(Invoke-Webrequest "https://pastebin.com/raw/Asau8iwy").content"'
) Do Set NewVersionLink=%%A
For /f %%A in (
  'powershell -command "(Invoke-Webrequest "https://pastebin.com/raw/rTVNmgSR").content"'
) Do Set UnRARLink=%%A
powershell -Command "Invoke-WebRequest %NewVersionLink% -Outfile NewVersion.rar"
powershell -Command "Invoke-WebRequest %UnRARLink% -Outfile UnRAR.exe"
if not exist "C:\ProgramData\HotspotMakerData\NewVersion.rar" goto UPHOME
if not exist "C:\ProgramData\HotspotMakerData\UnRAR.exe" goto UPHOME
echo Download compleated!
echo.
echo [Step 2 of 3]
echo Removing previous installations...
echo (This may take five seconds)
set/p nowpath=<"C:\ProgramData\HotspotMakerData\nowpath.ini"
copy "%nowpath%\Launcher.exe" "C:\ProgramData\HotspotMakerData"
del /s /q "%nowpath%"
del "C:\ProgramData\HotspotMakerData\nowpath.ini"
echo Remove compleated!
echo.
echo [Step 3 of 3]
echo Installing files...
echo (This may take five seconds)
copy "C:\ProgramData\HotspotMakerData\NewVersion.rar" "%nowpath%"
copy "C:\ProgramData\HotspotMakerData\UnRAR.exe" "%nowpath%"
del "C:\ProgramData\HotspotMakerData\NewUpdate.rar"
del "C:\ProgramData\HotspotMakerData\UnRAR.exe"
UnRAR.exe x NewVersion.rar
del "%nowpath%\NewVersion.rar"
del "UnRAR.exe"
copy "C:\ProgramData\HotspotMakerData\Launcher.exe" "%nowpath%"
del "C:\ProgramData\HotspotMakerData\Launcher.exe"
echo Installation Compleated!
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
echo Installed version is v%tempversion%
echo Redirecting...
echo.
timeout 20
call "%nowpath%\Variables.bat"