::For more about task schedul
::visit--->
::https://docs.microsoft.com/en-us/windows-server/administration/windows-commands/schtasks

:AUTOUPDATE
::check autoupdate setup
if EXIST "%path%\AutoUpdate.nnb" set/p autupdatesavecho=<"%path%\AutoUpdate.nnb" &goto AUTOUPDATETRUE
if NOT EXIST "%path%\AutoUpdate.nnb" goto AUTOUPDATEFALSE

:AUTOUPDATEFALSE
::clear before outputs
cls
::title
title %title%
::credits
echo %CREDIT0%&echo %CREDIT1%&echo %CREDIT2%&echo %CREDIT4%&echo %CREDIT5%&echo %CREDIT6%&echo %CREDIT7%&echo %CREDIT8%
::tab title
echo [ Auto Update ]
echo.
::little instructions
echo Hotspot Maker Auto Update...
echo You can setup auto update option for Hotspot Maker.
echo If you setup this option,
echo    the Hotspot Maker will check and download updates when you loged in.
echo THE UPDATER WILL NOT WORK WHILE YOU ARE WORKING ON BATTERY POWER
echo.
echo Do you wish to continue...?
echo.
::user choicess
echo A - Every Computer Starts&echo B - Daily (set time)&echo C - Weekly (set date and time)&echo D - Monthly (set date and time)&echo E - Cancle and back to Home&echo F - Exit
echo.
set/p "aufcho=>"
if %aufcho%==A goto ECS
if %aufcho%==a goto ECS
if %aufcho%==B goto DAILY
if %aufcho%==b goto DAILY
if %aufcho%==C goto WEEKLY
if %aufcho%==c goto WEEKLY
if %aufcho%==D goto MONTHLY
if %aufcho%==d goto MONTHLY
if %aufcho%==E call "%nowpath%\Home.bat"
if %aufcho%==e call "%nowpath%\Home.bat"
if %aufcho%==F call "%nowpath%\Exit.bat"
if %aufcho%==f call "%nowpath%\Exit.bat"
echo invalid choice... Try again...
timeout 6
goto AUTOUPDATEFALSE

:ECS
::clear before outputs
cls
::credits
echo %CREDIT0%&echo %CREDIT1%&echo %CREDIT2%&echo %CREDIT4%&echo %CREDIT5%&echo %CREDIT6%&echo %CREDIT7%&echo %CREDIT8%
::tab title
echo [ Auto Update Setup ]
echo Every Computer Starts Update Check
echo.
::steps
echo Setting Auto Update for Hotspot Maker...
echo (Please wait...)
::shedule task to run at computer startup
SCHTASKS /CREATE /SC ONLOGON /TN "HotspotMaker\AutoUpdate" /TR "%nowpath%\MiniUpdater.bat" /RL HIGHEST
::generate true file for this oparation
if %errorlevel% equ 0 echo ECS>"%path%\AutoUpdate.nnb"
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

:DAILY
::clear before outputs
cls
::credits
echo %CREDIT0%&echo %CREDIT1%&echo %CREDIT2%&echo %CREDIT4%&echo %CREDIT5%&echo %CREDIT6%&echo %CREDIT7%&echo %CREDIT8%
::tab title
echo [ Auto Update Setup ]
echo Daily Update Check
echo.
::steps
echo Enter time using 24 hours clock to start update check...
echo (Ex: @ 8 PM input as 20:00)
set/p "dailyuptime=>"
echo.
echo Enter update intervel...
echo (Ex: When you want to check updates every 3 days,
echo   --Sunday after Wednesday input as 3)
set/p "dailyupintervel=>"
echo.
echo Setting Auto Update for Hotspot Maker...
echo (Please wait...)
::shedule task to run at computer startup
SCHTASKS /CREATE /SC DAILY /ST %dailyuptime% /MO %dailyupintervel% /TN "HotspotMaker\AutoUpdate" /TR "%nowpath%\MiniUpdater.bat" /RL HIGHEST
::generate true file for this oparation
if %errorlevel% equ 0 echo DAILY>"%path%\AutoUpdate.nnb"
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

:WEEKLY
::clear before outputs
cls
::credits
echo %CREDIT0%&echo %CREDIT1%&echo %CREDIT2%&echo %CREDIT4%&echo %CREDIT5%&echo %CREDIT6%&echo %CREDIT7%&echo %CREDIT8%
::tab title
echo [ Auto Update Setup ]
echo Weekly Update Check
echo.
::steps
echo Enter day to start update check...
echo (Ex: for set Monday input as MON)
echo (Specify days: MON, TUE, WED, THU, FRI, SAT, SUN)
set/p "weeklyupday=>"
echo.
echo Enter update intervel...
echo (Ex: When you want to check updates every 3 weeks,
echo   --5th week after 8th week input as 3)
set/p "weeklyupintervel=>"
echo.
echo Setting Auto Update for Hotspot Maker...
echo (Please wait...)
::shedule task to run at computer startup
SCHTASKS /CREATE /SC WEEKLY /D %weeklyupday% /MO %weeklyupintervel% /TN "HotspotMaker\AutoUpdate" /TR "%nowpath%\MiniUpdater.bat" /RL HIGHEST
::generate true file for this oparation
if %errorlevel% equ 0 echo WEEKLY>"%path%\AutoUpdate.nnb"
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

:MONTHLY
::clear before outputs
cls
::credits
echo %CREDIT0%&echo %CREDIT1%&echo %CREDIT2%&echo %CREDIT4%&echo %CREDIT5%&echo %CREDIT6%&echo %CREDIT7%&echo %CREDIT8%
::tab title
echo [ Auto Update Setup ]
echo Monthly Update Check
echo.
::steps
echo Enter day of month to start update check...
echo (Ex: 19th day of month input as 19)
set/p "monthlyupdate=>"
echo.
echo Enter update intervel...
echo (Ex: When you want to check updates every 3 months,
echo   --2nd month after 5th month input as 3)
set/p "monthupintervel=>"
echo.
echo Setting Auto Update for Hotspot Maker...
echo (Please wait...)
::shedule task to run at computer startup
SCHTASKS /CREATE /SC MONTHLY /D %monthlyupdate% /MO %monthupintervel% /TN "HotspotMaker\AutoUpdate" /TR "%nowpath%\MiniUpdater.bat" /RL HIGHEST
::generate true file for this oparation
if %errorlevel% equ 0 echo MONTHLY>"%path%\AutoUpdate.nnb"
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
echo [ Auto Update Change/Remove ]
echo.
::comments
echo Do you want to change or stop the Auto Update...?
echo.
::user choicess
echo A - Change Auto Update Settings&echo B - Remove Auto Update&echo C - Cancle and back to Home&echo D - Exit
echo.
set/p "autcho=>"
if %autcho%==A goto AUSTOP
if %autcho%==a goto AUSTOP
if %autcho%==B goto AUSTOP
if %autcho%==b goto AUSTOP
if %autcho%==C call "%nowpath%\Home.bat"
if %autcho%==c call "%nowpath%\Home.bat"
if %autcho%==D call "%nowpath%\Exit.bat"
if %autcho%==d call "%nowpath%\Exit.bat"
echo invalid choice... Try again...
timeout 6
goto AUTOUPDATETRUE

:AUSTOP
::for happy the user!
if %autcho%==A set rorc=Changing
if %autcho%==a set rorc=Changing
if %autcho%==B set rorc=Removing
if %autcho%==b set rorc=Removing
::clear before outputs
cls
::credits
echo %CREDIT0%&echo %CREDIT1%&echo %CREDIT2%&echo %CREDIT4%&echo %CREDIT5%&echo %CREDIT6%&echo %CREDIT7%&echo %CREDIT8%
::tab title
echo [ Auto Update Change/Remove Setup ]
echo.
::steps
echo Processing...!
echo %rorc% Auto Update for Hotspot Maker...
echo (Please wait...)
::remove sheduled task
echo Press [Y] and [ENTER] to continue...
SCHTASKS /DELETE /TN "HotspotMaker\AutoUpdate"
::remove generated true file for true oparation
del "%path%\AutoUpdate.nnb"
timeout 5
if %autcho%==A goto AUTOUPDATE
if %autcho%==a goto AUTOUPDATE
if %autcho%==B echo Compleated!
if %autcho%==b echo Compleated!
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