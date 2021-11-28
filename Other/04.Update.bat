:UPDATECHECK
cls
echo %CREDIT0%&echo %CREDIT1%&echo %CREDIT2%&echo %CREDIT4%&echo %CREDIT5%&echo %CREDIT6%&echo %CREDIT7%&echo %CREDIT8%
echo [ Check Updates ]
echo.
ver
echo Checking Updates...
echo (You are running on v%version%)
echo Please wait a moment...
timeout 10
call "%nowpath%\Other\Updater.bat"