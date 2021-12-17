:UPDATECHECK
::clear before outputs
cls
::credits
echo %CREDIT0%&echo %CREDIT1%&echo %CREDIT2%&echo %CREDIT4%&echo %CREDIT5%&echo %CREDIT6%&echo %CREDIT7%&echo %CREDIT8%
::tab title
echo [ Check Updates ]
echo.
echo --------------------------------------------
echo  THIS WIZARD ONLY CONTAINS OFFICIAL UPDATES 
echo --------------------------------------------
echo.
::MS-DOS running version
ver
::steps
echo Checking Updates...
echo (You are running on v%version%)
echo Please wait a moment...
timeout 10
::switch to 'Updater.bat'
call "%nowpath%\Updater.bat"