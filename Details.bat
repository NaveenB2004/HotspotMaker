:DETAILS
::clear before outputs
cls
::title
title %title%
::credits
echo %CREDIT0%&echo %CREDIT1%&echo %CREDIT2%&echo %CREDIT4%&echo %CREDIT5%&echo %CREDIT6%&echo %CREDIT7%&echo %CREDIT8%
::tab title
echo [ Details ]
echo.
::version information
echo Details about the wi-fi hotspot craeting wizard...
echo ..........................................................
echo ---------------------{Stable Edition}---------------------
echo.
echo --------------------------(v%version%)--------------------------
echo.
echo .......................(11.02.2022).......................
echo.
::contack information
echo Created by: Naveen Balasooriya
echo Contact me: naveennbalasooriya2004@gmail.com      (Email)
echo             https://t.me/NaveenB2004              (Telegram)
echo             https://wa.me/message/KP75DUMMIKMTC1  (Whatsapp)
echo Visit my website: https://sites.google.com/sites/naveenb2004
echo ..........................................................
echo.
::version notes
echo Version Notes...
echo.
echo # v2.2 - Fix error while getting infomation from internet on some computers (Internet Explorer Engine not available or Internet Explorer's first-launch configuration is not compleate error). Add variables for temp file location for easy accessing. Other minor improvements.
echo.
echo ..........................................................
echo.
::little instructions
echo Have you a problem when starting the hostspot?
echo Choose "Hotspot Problems" option to get help.
echo.
::autoupdate status read
if EXIST "%path%\AutoUpdate.nnb" set autupdatestat=YES
if NOT EXIST "%path%\AutoUpdate.nnb" set autupdatestat=NO
::user choicess
echo A - Home&echo B - Check Updates&echo C - Setup Auto Update (Status: %autupdatestat%)&echo D - Change Font Color&echo E - Hotspot Problems&echo F - Full Version History&echo G - Exit
echo.
set/p "dcho=>"
if %dcho%==A call "%nowpath%\Home.bat"
if %dcho%==a call "%nowpath%\Home.bat"
if %dcho%==B call "%nowpath%\Update.bat"
if %dcho%==b call "%nowpath%\Update.bat"
::when you change the dcho, look AutoUpdate.bat and change it
if %dcho%==C call "%nowpath%\AutoUpdate.bat"
if %dcho%==c call "%nowpath%\AutoUpdate.bat"
if %dcho%==D call "%nowpath%\Colors.bat"
if %dcho%==d call "%nowpath%\Colors.bat"
if %dcho%==E call "%nowpath%\Solves.bat"
if %dcho%==e call "%nowpath%\Solves.bat"
if %dcho%==F call "%nowpath%\PreviousVerNotes.bat"
if %dcho%==f call "%nowpath%\PreviousVerNotes.bat"
if %dcho%==G call "%nowpath%\Exit.bat"
if %dcho%==g call "%nowpath%\Exit.bat"
echo invalid choice... Try again...
timeout 6
goto DETAILS