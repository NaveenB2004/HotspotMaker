@Echo off
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
  'powershell -command "(Invoke-Webrequest "https://pastebin.com/raw/Hgbf9SdC").content"'
) Do Set downloadfrom=%%A
powershell -Command "Invoke-WebRequest %downloadfrom% -Outfile NewUpdate.rar"
For /f %%A in (
  'powershell -command "(Invoke-Webrequest "https://pastebin.com/raw/AGtXA9Fe").content"'
) Do Set downloadunrar=%%A
powershell -Command "Invoke-WebRequest %downloadunrar% -Outfile UnRAR.exe"
echo Download compleated!
echo.
echo [Step 2 of 3]
echo Removing previous installations...
echo (This may take five seconds)
echo Press [Y] and [ENTER] to continue...
set/p nowpath=<"C:\ProgramData\HotspotMakerData\nowpath.ini"
del "%nowpath%"
del "C:\ProgramData\HotspotMakerData\nowpath.ini"
echo Remove compleated!
echo.
echo [Step 3 of 3]
echo Installing files...
echo (This may take five seconds)
copy "C:\ProgramData\HotspotMakerData\NewUpdate.rar" "%nowpath%"
copy "C:\ProgramData\HotspotMakerData\UnRAR.exe" "%nowpath%"
del "C:\ProgramData\HotspotMakerData\NewUpdate.rar"
del "C:\ProgramData\HotspotMakerData\UnRAR.exe"
UnRAR.exe x NewUpdate.rar
del "%nowpath%\NewUpdate.rar"
del "UnRAR.exe"
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
call "%nowpath%\Main\00.Home.bat"