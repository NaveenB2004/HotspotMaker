:UPDATECHECK
::clear before outputs
cls
::title
title %title%
::credits
echo %CREDIT0%&echo %CREDIT1%&echo %CREDIT2%&echo %CREDIT4%&echo %CREDIT5%&echo %CREDIT6%&echo %CREDIT7%&echo %CREDIT8%
::tab title
echo [ Check Updates ]
echo.
echo ----------------------------------------------
echo - THIS WIZARD ONLY CONTAINS OFFICIAL UPDATES -
echo ----------------------------------------------
echo.
echo Standalones available at https://github.com/naveenb2004/HotspotMaker
echo.
::MS-DOS running version
ver
::steps
echo Checking Updates...
echo (You are running on v%version%)
echo.
%timeout% 10
::switch to 'Updater.bat'
call "%nowpath%\Updater.bat"