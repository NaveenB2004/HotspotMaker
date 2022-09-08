:STARTUP
set nowpath=%~dp0
echo.>>"%logger%"
echo *** *** *** *** *** *** *** *** *** ***>>"%logger%"
echo %date%%time% - New session Started>>"%logger%"
::check modules per 5 runs
if not exist "C:\ProgramData\HotspotMakerData\modules.ini" md C:\ProgramData\HotspotMakerData &echo 4 >"C:\ProgramData\HotspotMakerData\modules.ini"
set/p checkcount=<"C:\ProgramData\HotspotMakerData\modules.ini"
goto TESTING

:TESTING
cls
if not %checkcount% LEQ 9 set %checkcount%=9 &echo %checkcount% >"C:\ProgramData\HotspotMakerData\modules.ini"
if %checkcount%==9 (goto MODULECHECK) else (goto TESTPASS)

:MODULECHECK
::title
title Hotspot Maker - Modules Check
echo Checking modules...
::error count set 0
set errors=0
echo.
::chek modules
if exist "%nowpath%\AutoUpdate.bat" (echo %date%%time% - AutoUpdate.bat found!>>"%logger%") else (echo %date%%time% - AutoUpdate.bat not found!>>%logger% &set/a errors=%errors%+1)	
if exist "%nowpath%\Colors.bat" (echo %date%%time% - Colors.bat found!>>"%logger%") else (echo %date%%time% - Colors.bat not found!>>%logger% &set/a errors=%errors%+1)
if exist "%nowpath%\Details.bat" (echo %date%%time% - Details.bat found!>>"%logger%") else (echo %date%%time% - Details.bat not found!>>%logger% &set/a errors=%errors%+1)
if exist "%nowpath%\Exit.bat" (echo %date%%time% - Exit.bat found!>>"%logger%") else (echo %date%%time% - Exit.bat not found!>>%logger% &set/a errors=%errors%+1)
if exist "%nowpath%\Home.bat" (echo %date%%time% - Home.bat found!>>"%logger%") else (echo %date%%time% - Home.bat not found!>>%logger% &set/a errors=%errors%+1)
if exist "%nowpath%\MiniUpdater.bat" (echo %date%%time% - MiniUpdater.bat found!>>"%logger%") else (echo %date%%time% - MiniUpdater.bat not found!>>%logger% &set/a errors=%errors%+1)
if exist "%nowpath%\MiniUpdaterWorker.bat" (echo %date%%time% - MiniUpdaterWorker.bat found!>>"%logger%") else (echo %date%%time% - MiniUpdaterWorker.bat not found!>>%logger% &set/a errors=%errors%+1)
if exist "%nowpath%\NetworkConfiguration.bat" (echo %date%%time% - NetworkConfiguration.bat found!>>"%logger%") else (echo %date%%time% - NetworkConfiguration.bat not found!>>%logger%	&set/a errors=%errors%+1)
if exist "%nowpath%\PreviousVerNotes.bat" (echo %date%%time% - PreviouseVerNotes.bat found!>>"%logger%") else (echo %date%%time% - PreviouseVerNotes.bat not found!>>%logger% &set/a errors=%errors%+1)
if exist "%nowpath%\SaveCredits.bat" (echo %date%%time% - SaveCredits.bat found!>>"%logger%") else (echo %date%%time% - SaveCredits.bat not found!>>%logger% &set/a errors=%errors%+1)
if exist "%nowpath%\Solves.bat" (echo %date%%time% - Solves.bat found!>>"%logger%") else (echo %date%%time% - Solves.bat not found!>>%logger% &set/a errors=%errors%+1)
if exist "%nowpath%\StartAndStop.bat" (echo %date%%time% - StartAndStop.bat found!>>"%logger%") else (echo %date%%time% - StartAndStop.bat not found!>>%logger% &set/a errors=%errors%+1)
if exist "%nowpath%\Update.bat" (echo %date%%time% - Update.bat found!>>"%logger%") else (echo %date%%time% - Update.bat not found!>>%logger% &set/a errors=%errors%+1)
if exist "%nowpath%\Updater.bat" (echo %date%%time% - Updater.bat found!>>"%logger%") else (echo %date%%time% - Updater.bat not found!>>%logger% &set/a errors=%errors%+1)
if exist "%nowpath%\Variables.bat" (echo %date%%time% - Variables.bat found!>>"%logger%") else (echo %date%%time% - Variables.bat not found!>>%logger% &set/a errors=%errors%+1)
if exist "%nowpath%\Version.ini" (echo %date%%time% - Version.ini found!>>"%logger%") else (echo %date%%time% - Version.ini not found!>>%logger% &set/a errors=%errors%+1)
echo %date%%time% - Total errors found %errors%>>%logger%
"%SYSTEMROOT%\System32\timeout.exe" 3 >nul
if %errors%==0 (goto TESTPASS) else (goto TESTFAIL)

:TESTFAIL
echo.
echo.
::error msg
echo Some files are missing to start the Hotspot Maker...
echo (Missed files count : %errors%)
echo Please download and install full application from:
echo           https://github.com/naveenb2004/HotspotMaker/releases
start https://github.com/naveenb2004/HotspotMaker/releases
echo.
echo.
echo %date%%time% - Exit>>%logger%
pause
goto END

:TESTPASS
::check count
::check 10th time of wizard start
if %checkcount%==9 (set checkcount=0) else (set/a checkcount=%checkcount%+1)
echo %checkcount% >"C:\ProgramData\HotspotMakerData\modules.ini"
::switch to Variables.bat
call "%nowpath%\Variables.bat"

:END
exit