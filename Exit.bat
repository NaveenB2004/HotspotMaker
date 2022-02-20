:EXIT
::clear before outputs
cls
::title
title %title%
::credits
echo %CREDIT0%&echo %CREDIT1%&echo %CREDIT2%&echo %CREDIT4%&echo %CREDIT5%&echo %CREDIT6%&echo %CREDIT7%&echo %CREDIT8%
::tab title
echo [ Exit ]
echo.
::user choicess
echo You are going to exit from the wizard...
echo.
echo A - Continue&echo B - Home&echo C - Details
echo.
set/p "exitcho=>"
if %exitcho%==A goto END
if %exitcho%==a goto END
if %exitcho%==B call "%nowpath%\Home.bat"
if %exitcho%==b call "%nowpath%\Home.bat"
if %exitcho%==C call "%nowpath%\Details.bat"
if %exitcho%==c call "%nowpath%\Details.bat"
echo invalid choice... Try again...
%timeout% 6
goto EXIT

:END
::exit
exit