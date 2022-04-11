:STARTUP
::working path
set nowpath=%~dp0
::check modules per 5 runs
if not exist "C:\ProgramData\HotspotMakerData\modules.ini" md C:\ProgramData\HotspotMakerData &echo 4 >"C:\ProgramData\HotspotMakerData\modules.ini"
set/p checkcount=<"C:\ProgramData\HotspotMakerData\modules.ini"
goto TESTING

:TESTING
cls
if not %checkcount% LEQ 5 set %checkcount%=4 &echo %checkcount% >"C:\ProgramData\HotspotMakerData\modules.ini"
if %checkcount%==4 (goto MODULECHECK) else (goto TESTPASS)

:MODULECHECK
title Hotspot Maker - Modules Check
echo Checking modules...
set errors=0
echo.
if exist "%nowpath%\AutoUpdate.bat"				(echo AutoUpdate.bat found!			 ) else (echo AutoUpdate.bat not found!				&set/a errors=%errors%+1)	
if exist "%nowpath%\Colors.bat"					(echo Colors.bat found!				 ) else (echo Colors.bat not found!					&set/a errors=%errors%+1)
if exist "%nowpath%\Details.bat"				(echo Details.bat found!			 ) else (echo Details.bat not found!					&set/a errors=%errors%+1)
if exist "%nowpath%\Exit.bat"					(echo Exit.bat found!				 ) else (echo Exit.bat not found!					&set/a errors=%errors%+1)
if exist "%nowpath%\Home.bat"					(echo Home.bat found!				 ) else (echo Home.bat not found!					&set/a errors=%errors%+1)
if exist "%nowpath%\MiniUpdater.bat"			(echo MiniUpdater.bat found!		 ) else (echo MiniUpdater.bat not found!				&set/a errors=%errors%+1)
if exist "%nowpath%\MiniUpdaterWorker.bat"		(echo MiniUpdaterWorker.bat found!	 ) else (echo MiniUpdaterWorker.bat not found!		&set/a errors=%errors%+1)
if exist "%nowpath%\NetworkConfiguration.bat"	(echo NetworkConfiguration.bat found!) else (echo NetworkConfiguration.bat not found!	&set/a errors=%errors%+1)
if exist "%nowpath%\PreviousVerNotes.bat"		(echo PreviouseVerNotes.bat found!	 ) else (echo PreviouseVerNotes.bat not found!		&set/a errors=%errors%+1)
if exist "%nowpath%\SaveCredits.bat"			(echo SaveCredits.bat found!		 ) else (echo SaveCredits.bat not found!				&set/a errors=%errors%+1)
if exist "%nowpath%\Solves.bat"					(echo Solves.bat found!				 ) else (echo Solves.bat not found!					&set/a errors=%errors%+1)
if exist "%nowpath%\StartAndStop.bat"			(echo StartAndStop.bat found!		 ) else (echo StartAndStop.bat not found!			&set/a errors=%errors%+1)
if exist "%nowpath%\Update.bat"					(echo Update.bat found!				 ) else (echo Update.bat not found!					&set/a errors=%errors%+1)
if exist "%nowpath%\Updater.bat"				(echo Updater.bat found!			 ) else (echo Updater.bat not found!					&set/a errors=%errors%+1)
if exist "%nowpath%\Variables.bat"				(echo Variables.bat found!			 ) else (echo Variables.bat not found!				&set/a errors=%errors%+1)
if exist "%nowpath%\Version.ini"				(echo Version.ini found!			 ) else (echo Version.ini not found!					&set/a errors=%errors%+1)
echo.
echo.
"%SYSTEMROOT%\System32\timeout.exe" 3 >nul
if %errors%==0 (goto TESTPASS) else (goto TESTFAIL)

:TESTFAIL
echo Some files are missing to start the Hotspot Maker...
echo (Missed files count : %errors%)
echo Please download and install full application from:
echo           https://github.com/naveenb2004/HotspotMaker/releases
start https://github.com/naveenb2004/HotspotMaker/releases
echo.
echo.
pause
goto END

:TESTPASS
if %checkcount%==4 (set checkcount=0) else (set/a checkcount=%checkcount%+1)
echo %checkcount% >"C:\ProgramData\HotspotMakerData\modules.ini"
::switch to Variables.bat
call "%nowpath%\Variables.bat"

:END
exit