:UPHOME
::remove leftovers
if exist "%path%\NewVersion.rar" del "%path%\UnRAR.exe"
if exist "%path%\UnRAR.exe" del "%path%\NewVersion.rar"
::clear before outputs
cls
::title
title %title%
::credits
echo %CREDIT0%&echo %CREDIT1%&echo %CREDIT2%&echo %CREDIT4%&echo %CREDIT5%&echo %CREDIT6%&echo %CREDIT7%&echo %CREDIT8%
::tab title
echo [ Updater ]
echo.
::licesnce
echo UnRAR Licence (copy) @
echo https://pastebin.com/raw/9y3G331h
timeout 6
::steps
::download files
echo [Step 1 of 3]
echo Downloading required files...
echo (This may take five seconds)
cd "%path%"
::get download links
::new version
For /f %%A in (
  'powershell -command "(Invoke-Webrequest -UseBasicParsing "https://pastebin.com/raw/Asau8iwy").content"'
) Do Set NewVersionLink=%%A
::unrar
For /f %%A in (
  'powershell -command "(Invoke-Webrequest -UseBasicParsing "https://pastebin.com/raw/rTVNmgSR").content"'
) Do Set UnRARLink=%%A
::download files
::new version
powershell -Command "Invoke-WebRequest -UseBasicParsing %NewVersionLink% -Outfile NewVersion.rar"
::unrar
powershell -Command "Invoke-WebRequest -UseBasicParsing %UnRARLink% -Outfile UnRAR.exe"
::error while downloading
if not exist "%path%\NewVersion.rar" goto UPHOME
if not exist "%path%\UnRAR.exe" goto UPHOME
::compleated
echo Download compleated!
::title
title %title%
echo.
::steps
echo [Step 2 of 3]
echo Removing previous installations...
echo (This may take five seconds)
::copy Hotspot Maker.exe and unins000.exe to temp path
copy "%nowpath%\Hotspot Maker.exe" "%path%"
copy "%nowpath%\unins000.exe" "%path%"
::remove previous installation
del /s /q "%nowpath%"
del "%path%\nowpath.ini"
echo Remove compleated!
echo.
::steps
echo [Step 3 of 3]
echo Installing files...
echo (This may take five seconds)
::copy new version and unrar to installation path
copy "%path%\NewVersion.rar" "%nowpath%"
copy "%path%\UnRAR.exe" "%nowpath%"
::delete new version and unrar from temp path
del "%path%\NewVersion.rar"
del "%path%\UnRAR.exe"
cd "%nowpath%"
::extract new version files
UnRAR.exe x NewVersion.rar
::remove update leftovers
del "%nowpath%\NewVersion.rar"
del "UnRAR.exe"
::copy Hotspot Maker.exe and unins000.exe to installation path
::and remove from temp path
copy "%path%\Hotspot Maker.exe" "%nowpath%"
del "%path%\Hotspot Maker.exe"
copy "%path%\unins000.exe" "%nowpath%"
del "%path%\unins000.exe"
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
echo.
pause
::switch to 'Startup.bat'
call "%nowpath%\Startup.bat"