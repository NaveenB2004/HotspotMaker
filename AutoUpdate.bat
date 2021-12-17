::define automated or not
::dcho, from 'Detals.bat'
if %dcho%==C goto AUTOUPDATE
if %dcho%==c goto AUTOUPDATE
if not %dcho%==C goto CHECKNOW
if not %dcho%==c goto CHECKNOW

::For more about task schedul
::visit--->
::https://www.windowscentral.com/how-create-task-using-task-scheduler-command-prompt

:AUTOUPDATE
::check autoupdate setup
if EXIST "C:\ProgramData\HotspotMakerData\AutoUpdate.nnb" goto AUTOUPDATETRUE
if NOT EXIST "C:\ProgramData\HotspotMakerData\AutoUpdate.nnb" goto AUTOUPDATEFALSE

:AUTOUPDATEFALSE
::clear before outputs
cls
::credits
echo %CREDIT0%&echo %CREDIT1%&echo %CREDIT2%&echo %CREDIT4%&echo %CREDIT5%&echo %CREDIT6%&echo %CREDIT7%&echo %CREDIT8%
::tab title
echo [ Auto Update ]
echo.
::little instructions
echo Hotspot Maker Auto Update...
echo You can setup auto update option for Hotspot Maker.
echo If you setup this option,
echo    the Hotspot Maker will check and download updates the time you set.
echo.
echo Do you wish to continue...?
echo.
::user choicess
echo A - Continue&echo B - Cancle and back to Home&echo C - Exit
echo.
set/p "aufcho=>"
if %aufcho%==A goto AUSETUP
if %aufcho%==a goto AUSETUP
if %aufcho%==B call "%nowpath%\Home.bat"
if %aufcho%==b call "%nowpath%\Home.bat"
if %aufcho%==C call "%nowpath%\Exit.bat"
if %aufcho%==c call "%nowpath%\Exit.bat"
echo invalid choice... Try again...
timeout 6
goto AUTOUPDATEFALSE

:AUSETUP
::clear before outputs
cls
::credits
echo %CREDIT0%&echo %CREDIT1%&echo %CREDIT2%&echo %CREDIT4%&echo %CREDIT5%&echo %CREDIT6%&echo %CREDIT7%&echo %CREDIT8%
::tab title
echo [ Auto Update Setup ]
echo.
::steps
echo Setting Auto Update for Hotspot Maker...
echo (Please wait...)
::shedule task to run at computer startup
SCHTASKS /CREATE /SC ONSTART /TN "HotspotMaker\AutoUpdate" /TR "%nowpath%\AutoUpdate.bat"
::generate true file for this oparation
echo taskadded>"C:\ProgramData\HotspotMakerData\AutoUpdate.nnb"
echo Compleated!
echo.
::user choicess
echo A - Home&echo B - Exit
echo.
set/p "ausetupcho=>"
if %ausetupcho%==A call "%nowpath%\Home.bat"
if %ausetupcho%==a call "%nowpath%\Home.bat"
if %ausetupcho%==B call "%nowpath%\Exit.bat"
if %ausetupcho%==b call "%nowpath%\Exit.bat"
echo invalid choice... Try again...
timeout 6
call "%nowpath%\Home.bat"

:AUTOUPDATETRUE
::clear before outputs
cls
::credits
echo %CREDIT0%&echo %CREDIT1%&echo %CREDIT2%&echo %CREDIT4%&echo %CREDIT5%&echo %CREDIT6%&echo %CREDIT7%&echo %CREDIT8%
::tab title
echo [ Auto Update Change ]
echo.
::comments
echo Do you want to stop the Auto Update...?
echo.
::user choicess
echo A - Continue&echo B - Cancle and back to Home&echo C - Exit
echo.
set/p "autcho=>"
if %autcho%==A goto AUSTOP
if %autcho%==a goto AUSTOP
if %autcho%==B call "%nowpath%\Home.bat"
if %autcho%==b call "%nowpath%\Home.bat"
if %autcho%==C call "%nowpath%\Exit.bat"
if %autcho%==c call "%nowpath%\Exit.bat"
echo invalid choice... Try again...
timeout 6
goto AUTOUPDATETRUE

:AUSTOP
::clear before outputs
cls
::credits
echo %CREDIT0%&echo %CREDIT1%&echo %CREDIT2%&echo %CREDIT4%&echo %CREDIT5%&echo %CREDIT6%&echo %CREDIT7%&echo %CREDIT8%
::tab title
echo [ Auto Update Change Setup ]
echo.
::steps
echo Removing Auto Update for Hotspot Maker...
echo (Please wait...)
::remove sheduled task
SCHTASKS /DELETE /TN "HotspotMaker\AutoUpdate"
::remove generated true file for true oparation
del "C:\ProgramData\HotspotMakerData\AutoUpdate.nnb"
echo Compleated!
echo.
::user choicess
echo A - Home&echo B - Exit
echo.
set/p "ausetuptcho=>"
if %ausetuptcho%==A call "%nowpath%\Home.bat"
if %ausetuptcho%==a call "%nowpath%\Home.bat"
if %ausetuptcho%==B call "%nowpath%\Exit.bat"
if %ausetuptcho%==b call "%nowpath%\Exit.bat"
echo invalid choice... Try again...
timeout 6
call "%nowpath%\Home.bat"

:CHECKNOW
::switch to 'Updater.bat' for sheduled task
call "%nowpath%\Updater.bat"