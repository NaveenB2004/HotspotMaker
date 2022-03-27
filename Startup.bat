:STARTUP
::working path
set nowpath=%~dp0
::some variables for easy editings
set pastbin=https://pastebin.com/raw/
set gdrivelink=https://drive.google.com/uc?id=%downloadlink%
::check modules per 5 runs
if not exist "C:\ProgramData\HotspotMakerData\modules.ini" echo 4 >"C:\ProgramData\HotspotMakerData\modules.ini"
set/p checkcount=<"C:\ProgramData\HotspotMakerData\modules.ini"

:TESTING
cls
if %checkcount%==4 (goto MODULECHECK) else (set/a %checkcount%=%checkcount%+1&echo %checkcount%>"C:\ProgramData\HotspotMakerData\modules.ini")

:MODULECHECK
title Hotspot Maker - Modules Check
echo Checking modules...
set errors=0
echo.

if exist "%nowpath%\AutoUpdate.bat"				(echo AutoUpdate.bat found!)			else (echo AutoUpdate.bat not found!			&set/a %errors%=%errors%+1)	
if exist "%nowpath%\Colors.bat"					(echo Colors.bat found!)				else (echo Colors.bat not found!				&set/a %errors%=%errors%+1)
if exist "%nowpath%\Details.bat"				(echo Details.bat found!)				else (echo Details.bat not found!				&set/a %errors%=%errors%+1)
if exist "%nowpath%\Exit.bat"					(echo Exit.bat found!)					else (echo Exit.bat not found!					&set/a %errors%=%errors%+1)
if exist "%nowpath%\Home.bat"					(echo Home.bat found!)					else (echo Home.bat not found!					&set/a %errors%=%errors%+1)
if exist "%nowpath%\MiniUpdater.bat"			(echo MiniUpdater.bat found!)			else (echo MiniUpdater.bat not found!			&set/a %errors%=%errors%+1)
if exist "%nowpath%\MiniUpdaterWorker.bat"		(echo MiniUpdaterWorker.bat found!)		else (echo MiniUpdaterWorker.bat not found!		&set/a %errors%=%errors%+1)
if exist "%nowpath%\NetworkConfiguration.bat"	(echo NetworkConfiguration.bat found!)	else (echo NetworkConfiguration.bat not found!	&set/a %errors%=%errors%+1)
if exist "%nowpath%\PreviouseVerNotes.bat"		(echo PreviouseVerNotes.bat found!)		else (echo PreviouseVerNotes.bat not found!		&set/a %errors%=%errors%+1)
if exist "%nowpath%\SaveCredits.bat"			(echo SaveCredits.bat found!)			else (echo SaveCredits.bat not found!			&set/a %errors%=%errors%+1)
if exist "%nowpath%\Solves.bat"					(echo Solves.bat found!)				else (echo Solves.bat not found!				&set/a %errors%=%errors%+1)
if exist "%nowpath%\StartAndStop.bat"			(echo StartAndStop.bat found!)			else (echo StartAndStop.bat not found!			&set/a %errors%=%errors%+1)
if exist "%nowpath%\Update.bat"					(echo Update.bat found!)				else (echo Update.bat not found!				&set/a %errors%=%errors%+1)
if exist "%nowpath%\Updater.bat"				(echo Updater.bat found!)				else (echo Updater.bat not found!				&set/a %errors%=%errors%+1)
if exist "%nowpath%\Variables.bat"				(echo Variables.bat found!)				else (echo Variables.bat not found!				&set/a %errors%=%errors%+1)
if exist "%nowpath%\Version.ini"				(echo Version.ini found!)				else (echo Version.ini not found!				&set/a %errors%=%errors%+1)
































































	if %fixneed%==1
		For /f %%A in (
  		'%powershell% -command "(Invoke-Webrequest -UseBasicParsing "%pastbin%We125R88").content"'
		) Do Set downloadlink=%%A
		%powershell% -Command "Invoke-WebRequest -UseBasicParsing %gdrivelink% -Outfile AutoUpdate.bat"



	if %fixneed%==1 
	(
		For /f %%A in (
  		'%powershell% -command "(Invoke-Webrequest -UseBasicParsing "%pastbin%Xts71fdy").content"'
		) Do Set downloadlink=%%A
		%powershell% -Command "Invoke-WebRequest -UseBasicParsing %gdrivelink% -Outfile Colors.bat"
	)
)

	if %fixneed%==1 
	(
		For /f %%A in (
  		'%powershell% -command "(Invoke-Webrequest -UseBasicParsing "%pastbin%h0kESSW5").content"'
		) Do Set downloadlink=%%A
		%powershell% -Command "Invoke-WebRequest -UseBasicParsing %gdrivelink% -Outfile Details.bat"
	)
)

	if %fixneed%==1 
	(
		For /f %%A in (
  		'%powershell% -command "(Invoke-Webrequest -UseBasicParsing "%pastbin%vANUySWp").content"'
		) Do Set downloadlink=%%A
		%powershell% -Command "Invoke-WebRequest -UseBasicParsing %gdrivelink% -Outfile Exit.bat"
	)
)

	if %fixneed%==1 
	(
		For /f %%A in (
  		'%powershell% -command "(Invoke-Webrequest -UseBasicParsing "%pastbin%TrguzZZc").content"'
		) Do Set downloadlink=%%A
		%powershell% -Command "Invoke-WebRequest -UseBasicParsing %gdrivelink% -Outfile Home.bat"
	)
)

	if %fixneed%==1 
	(
		For /f %%A in (
  		'%powershell% -command "(Invoke-Webrequest -UseBasicParsing "%pastbin%SxvQWvhL").content"'
		) Do Set downloadlink=%%A
		%powershell% -Command "Invoke-WebRequest -UseBasicParsing %gdrivelink% -Outfile MiniUpdater.bat"
	)
)

	if %fixneed%==1 
	(
		For /f %%A in (
  		'%powershell% -command "(Invoke-Webrequest -UseBasicParsing "%pastbin%7zFWPxah").content"'
		) Do Set downloadlink=%%A
		%powershell% -Command "Invoke-WebRequest -UseBasicParsing %gdrivelink% -Outfile MiniUpdaterWorker.bat"
	)
)

	if %fixneed%==1 
	(
		For /f %%A in (
  		'%powershell% -command "(Invoke-Webrequest -UseBasicParsing "%pastbin%KEY8syCM").content"'
		) Do Set downloadlink=%%A
		%powershell% -Command "Invoke-WebRequest -UseBasicParsing %gdrivelink% -Outfile NetworkConfiguration.bat"
	)
)

	if %fixneed%==1 
	(
		For /f %%A in (
  		'%powershell% -command "(Invoke-Webrequest -UseBasicParsing "%pastbin%vn5LLDM0").content"'
		) Do Set downloadlink=%%A
		%powershell% -Command "Invoke-WebRequest -UseBasicParsing %gdrivelink% -Outfile PreviouseVerNotes.bat"
	)
)

	if %fixneed%==1 
	(
		For /f %%A in (
  		'%powershell% -command "(Invoke-Webrequest -UseBasicParsing "%pastbin%YBrDAyQq").content"'
		) Do Set downloadlink=%%A
		%powershell% -Command "Invoke-WebRequest -UseBasicParsing %gdrivelink% -Outfile SaveCredits.bat"
	)
)

	if %fixneed%==1 
	(
		For /f %%A in (
  		'%powershell% -command "(Invoke-Webrequest -UseBasicParsing "%pastbin%UsgznHZN").content"'
		) Do Set downloadlink=%%A
		%powershell% -Command "Invoke-WebRequest -UseBasicParsing %gdrivelink% -Outfile Solves.bat"
	)
)

	if %fixneed%==1 
	(
		For /f %%A in (
  		'%powershell% -command "(Invoke-Webrequest -UseBasicParsing "%pastbin%Gkv9ne5U").content"'
		) Do Set downloadlink=%%A
		%powershell% -Command "Invoke-WebRequest -UseBasicParsing %gdrivelink% -Outfile StartAndStop.bat"
	)
)

	if %fixneed%==1 
	(
		For /f %%A in (
  		'%powershell% -command "(Invoke-Webrequest -UseBasicParsing "%pastbin%BYthk5S8").content"'
		) Do Set downloadlink=%%A
		%powershell% -Command "Invoke-WebRequest -UseBasicParsing %gdrivelink% -Outfile Update.bat"
	)
)

	if %fixneed%==1 
	(
		For /f %%A in (
  		'%powershell% -command "(Invoke-Webrequest -UseBasicParsing "%pastbin%37vBiyUX").content"'
		) Do Set downloadlink=%%A
		%powershell% -Command "Invoke-WebRequest -UseBasicParsing %gdrivelink% -Outfile Updater.bat"
	)
)

	if %fixneed%==1 
	(
		For /f %%A in (
  		'%powershell% -command "(Invoke-Webrequest -UseBasicParsing "%pastbin%NWCHi4Az").content"'
		) Do Set downloadlink=%%A
		%powershell% -Command "Invoke-WebRequest -UseBasicParsing %gdrivelink% -Outfile Variables.bat"
	)
)

	if %fixneed%==1 
	(
		For /f %%A in (
  		'%powershell% -command "(Invoke-Webrequest -UseBasicParsing "%pastbin%wYwr12JH").content"'
		) Do Set downloadlink=%%A
		%powershell% -Command "Invoke-WebRequest -UseBasicParsing %gdrivelink% -Outfile Version.ini"
	)
)
echo.
if %fixneed%==1 goto TESTING
echo Total modules errors found - %errors%
if %errors%==0 (echo 0 >"C:\ProgramData\HotspotMakerData\modules.ini") else (goto FIX)

:FIX
echo.
echo Recommend fixing...
echo You need to connect to the internet for continue.
echo When you continue, please update the wizard immediately.
echo Do you want to continue the fix process?
echo.
::user choicess
echo A - Continue&echo B - Exit
echo.
set/p "startupcho=>"
if %startupcho%==A goto FIXCONT
if %startupcho%==a goto FIXCONT
if %startupcho%==B goto END
if %startupcho%==b goto END
echo invalid choice... Try again...
goto FIX

:FIXCONT
set fixneed=1
goto TESTING

:ALLOK
::switch to Variables.bat
call "%nowpath%\Variables.bat"

:END
exit