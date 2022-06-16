:SIZES
::clear before outputs
cls
::title
title %title%
::credits
echo %CREDIT0%&echo %CREDIT1%&echo %CREDIT2%&echo %CREDIT4%&echo %CREDIT5%&echo %CREDIT6%&echo %CREDIT7%&echo %CREDIT8%
::tab title
echo [ Window Resizer ]
echo.
echo Welcome to window sizes changer!
echo Please choose the below options for goto resizers and instructions!
echo.
::user choicess
echo A - Change Window Size&echo B - Go Back&echo C - Exit
echo.
set/p "sizecho=>"
if %sizecho%==A goto WINDOWSIZE
if %sizecho%==a goto WINDOWSIZE
if %sizecho%==B call "%nowpath%\Details.bat"
if %sizecho%==b call "%nowpath%\Details.bat"
if %sizecho%==C call "%nowpath%\Exit.bat"
if %sizecho%==c call "%nowpath%\Exit.bat"
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
if %sizecho%==A goto WINSIZEAPPLY
if %sizecho%==a goto WINSIZEAPPLY
if %sizecho%==B goto WINSAVE
if %sizecho%==b goto WINSAVE
if %sizecho%==C goto SIZES
if %sizecho%==c goto SIZES
if %sizecho%==D call "%nowpath%\Exit.bat"
if %sizecho%==d call "%nowpath%\Exit.bat"
echo invalid choice... Try again...
%timeout% 6
goto WINDOWSIZE

:WINSIZEAPPLY
echo @Echo off >"%path%\temp-size.bat"
echo echo Loading Windo Sizes... >>"%path%\temp-size.bat"
echo echo Please Wait... >>"%path%\temp-size.bat"
echo echo. >>"%path%\temp-size.bat"
echo echo Window Width: %winwidth% >>"%path%\temp-size.bat"
echo echo Window Height: %winheight% >>"%path%\temp-size.bat"
echo echo. >>"%path%\temp-size.bat"
echo set powershell=%SYSTEMROOT%\System32\WindowsPowerShell\v1.0\powershell.exe >>"%path%\temp-size.bat"
echo %powershell% -command "&{$w=(get-host).ui.rawui;$w.buffersize=@{width=%winwidth%;height=500};$w.windowsize=@{width=%winwidth%;height=%winheight%};}" >>"%path%\temp-size.bat"
echo pause >>"%path%\temp-size.bat"
call "%path%\temp-size.bat"
%timeout% 10 >nul
del "%path%\temp-size.bat"
goto WINDOWSIZE