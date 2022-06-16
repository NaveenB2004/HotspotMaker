:SIZES
::clear before outputs
cls
::title
title %title%
::credits
echo %CREDIT0%&echo %CREDIT1%&echo %CREDIT2%&echo %CREDIT4%&echo %CREDIT5%&echo %CREDIT6%&echo %CREDIT7%&echo %CREDIT8%
::tab title
echo [ Window and Buffer Resizer ]
echo.
echo Welcome to window and buffer sizes changer!
echo Please choose the below options for goto resizers and instructions!
echo.
::user choicess
echo A - Change Window Size&echo B - Change Buffer Size&echo C - Go Back&echo D - Exit
echo.
set/p "sizecho=>"
if %sizecho%==A goto WINDOWSIZE
if %sizecho%==a goto WINDOWSIZE
if %sizecho%==B goto BUFFERSIZE
if %sizecho%==b goto BUFFERSIZE
if %sizecho%==C call "%nowpath%\Details.bat"
if %sizecho%==c call "%nowpath%\Details.bat"
if %sizecho%==D call "%nowpath%\Exit.bat"
if %sizecho%==d call "%nowpath%\Exit.bat"
echo invalid choice... Try again...
%timeout% 6
goto SIZES

:WINDOWSIZE
::clear before outputs
cls
::title
title %title%
::credits
echo %CREDIT0%&echo %CREDIT1%&echo %CREDIT2%&echo %CREDIT4%&echo %CREDIT5%&echo %CREDIT6%&echo %CREDIT7%&echo %CREDIT8%
::tab title
echo [ Window Resizer ]
echo.
echo Add values and select option apply to review changes. The option 'Apply' will not save changes permenantly.
echo After you decided the values, select option 'Save' to set changes permanantly.
echo.
echo Window Size Changer
set/p "winwidth=Window Width: "
set/p "winheight=Window Height: "
::user choicess
echo.
echo A - Apply&echo B - Save&echo C - Back&echo D - Exit
echo.
set/p "sizecho=>"
if %sizecho%==A goto WINAPPLY
if %sizecho%==a goto WINAPPLY
if %sizecho%==B goto WINSAVE
if %sizecho%==b goto WINSAVE
if %sizecho%==C goto SIZES
if %sizecho%==c goto SIZES
if %sizecho%==D call "%nowpath%\Exit.bat"
if %sizecho%==d call "%nowpath%\Exit.bat"
echo invalid choice... Try again...
%timeout% 6
goto WINDOWSIZE

:BUFFERSIZE
::clear before outputs
cls
::title
title %title%
::credits
echo %CREDIT0%&echo %CREDIT1%&echo %CREDIT2%&echo %CREDIT4%&echo %CREDIT5%&echo %CREDIT6%&echo %CREDIT7%&echo %CREDIT8%
::tab title
echo [ Window Resizer ]
echo.
echo Add values and select option apply to review changes. The option 'Apply' will not save changes permenantly.
echo After you decided the values, select option 'Save' to set changes permanantly.
echo.
echo Window Size Changer
set/p "bufferwidth=Buffer Width: "
set/p "bufferheight=Buffer Height: "
::user choicess
echo.
echo A - Apply&echo B - Save&echo C - Back&echo D - Exit
echo.
set/p "sizecho=>"
if %sizecho%==A goto BUFFERAPPLY
if %sizecho%==a goto BUFFERAPPLY
if %sizecho%==B goto BUFFERSAVE
if %sizecho%==b goto BUFFERSAVE
if %sizecho%==C goto SIZES
if %sizecho%==c goto SIZES
if %sizecho%==D call "%nowpath%\Exit.bat"
if %sizecho%==d call "%nowpath%\Exit.bat"
echo invalid choice... Try again...
%timeout% 6
goto BUFFERSIZE