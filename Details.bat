:DETAILS
::clear before outputs
cls
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
echo ........................(11.12.2021)......................
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
echo # v2.1 - Bugs fixed (minor bugs). Remove direct call for variables and add startup script. Add auto update checker on computer starts. Add code breaks (comments) for easy editings. Add operator for compare new versions when updating.
echo.
echo ..........................................................
echo.
::little instructions
echo Have you a problem when starting the hostspot?
echo Choose "Hotspot Problems" option to get help.
echo.
::user choicess
echo A - Home&echo B - Check Updates&echo C - Setup Auto Update&echo D - Change Font Color&echo E - Hotspot Problems&echo F - Full Version History&echo G - Exit
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