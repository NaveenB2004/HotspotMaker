:UPHOME
::remove leftovers
if exist "C:\ProgramData\HotspotMakerData\NewVersion.rar" del "C:\ProgramData\HotspotMakerData\UnRAR.exe"
if exist "C:\ProgramData\HotspotMakerData\UnRAR.exe" del "C:\ProgramData\HotspotMakerData\NewVersion.rar"
::clear before outputs
cls
::credits
echo %CREDIT0%&echo %CREDIT1%&echo %CREDIT2%&echo %CREDIT4%&echo %CREDIT5%&echo %CREDIT6%&echo %CREDIT7%&echo %CREDIT8%
::tab title
echo [ Updater ]
echo.
::steps
::download files
echo [Step 1 of 3]
echo Downloading required files...
echo (This may take five seconds)
cd "C:\ProgramData\HotspotMakerData"
::get download links
::new version
For /f %%A in (
  'powershell -command "(Invoke-Webrequest "https://pastebin.com/raw/Asau8iwy").content"'
) Do Set NewVersionLink=%%A
::unrar
For /f %%A in (
  'powershell -command "(Invoke-Webrequest "https://pastebin.com/raw/rTVNmgSR").content"'
) Do Set UnRARLink=%%A
::download files
::new version
powershell -Command "Invoke-WebRequest %NewVersionLink% -Outfile NewVersion.rar"
::unrar
powershell -Command "Invoke-WebRequest %UnRARLink% -Outfile UnRAR.exe"
::error while downloading
if not exist "C:\ProgramData\HotspotMakerData\NewVersion.rar" goto UPHOME
if not exist "C:\ProgramData\HotspotMakerData\UnRAR.exe" goto UPHOME
::compleated
echo Download compleated!
echo.
::steps
echo [Step 2 of 3]
echo Removing previous installations...
echo (This may take five seconds)
::import installation path
set/p nowpath=<"C:\ProgramData\HotspotMakerData\nowpath.ini"
::copy Hotspot Maker.exe and unins000.exe to temp path
copy "%nowpath%\Hotspot Maker.exe" "C:\ProgramData\HotspotMakerData"
copy "%nowpath%\unins000.exe" "C:\ProgramData\HotspotMakerData"
::remove previous installation
del /s /q "%nowpath%"
del "C:\ProgramData\HotspotMakerData\nowpath.ini"
echo Remove compleated!
echo.
::steps
echo [Step 3 of 3]
echo Installing files...
echo (This may take five seconds)
::copy new version and unrar to installation path
copy "C:\ProgramData\HotspotMakerData\NewVersion.rar" "%nowpath%"
copy "C:\ProgramData\HotspotMakerData\UnRAR.exe" "%nowpath%"
::delete new version and unrar from temp path
del "C:\ProgramData\HotspotMakerData\NewVersion.rar"
del "C:\ProgramData\HotspotMakerData\UnRAR.exe"
cd "%nowpath%"
::extract new version files
UnRAR.exe x NewVersion.rar
::remove update leftovers
del "%nowpath%\NewVersion.rar"
del "UnRAR.exe"
::copy Hotspot Maker.exe and unins000.exe to installation path
::and remove from temp path
copy "C:\ProgramData\HotspotMakerData\Hotspot Maker.exe" "%nowpath%"
del "C:\ProgramData\HotspotMakerData\Hotspot Maker.exe"
copy "C:\ProgramData\HotspotMakerData\unins000.exe" "%nowpath%"
del "C:\ProgramData\HotspotMakerData\unins000.exe"
::comments
echo Installation Compleated!
echo.
echo (Redirecting to next step...)
echo.
timeout 20
goto FINALRESULT

:FINALRESULT
::clear befor outputs
cls
::credits
echo %CREDIT0%&echo %CREDIT1%&echo %CREDIT2%&echo %CREDIT4%&echo %CREDIT5%&echo %CREDIT6%&echo %CREDIT7%&echo %CREDIT8%
::tab title
echo [ Installation Compleated! ]
echo.
::comments
echo Installation successfully compleated!
echo Installed version is v%tempversion%
echo Redirecting...
echo.
timeout 20
::switch to 'Startup.bat'
call "%nowpath%\Startup.bat"