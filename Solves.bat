:HOTSPOTPROBLEMS
::clear before outputs
cls
::credits
echo %CREDIT0%&echo %CREDIT1%&echo %CREDIT2%&echo %CREDIT4%&echo %CREDIT5%&echo %CREDIT6%&echo %CREDIT7%&echo %CREDIT8%

::tab title
echo [ Hotspot Problems ]
echo.
::instructions
echo --------------------------------------------------------------------------------
echo.
netsh wlan show drive
echo.
echo ## Check "Hosted network supported"
echo       - When "Hosted network supported : Yes" try next answer
echo       - When "Hosted network supported : No" you can't start the Hotspot :(
echo       - When show dialogue like 'The Wireless AutoConfig Service (wlansvc) is not running'
echo             goto 'advanced solves' using choices...
echo You can use a RJ-45 (Network cable) for make network (wired method).
echo.
echo --------------------------------------------------------------------------------
echo.
echo ## Make sure the Wi-Fi turned on...
echo       - When the Wi-Fi turned on try next answer
echo       - When the Wi-Fi turned off, turn it on and try again to start Hotspot
echo.
echo --------------------------------------------------------------------------------
echo.
echo ## Make sure you run this wizard using "Hotspot Maker-Admin.vbs"
echo      or "Hotspot Maker-Main.bat" as an Administrator.
echo       - When you ran this wizard as an Administartor 
echo              (or using "Hotspot Maker-Admin.vbs") try next answer
echo       - When you not ran this wizard as an Administrator 
echo             (or using "Hotspot Maker-Admin.vbs")start wizard as
echo      an Administartor (or using "Hotspot Maker-Admin.vbs") and try again
echo.
echo --------------------------------------------------------------------------------
echo.
echo Finaly...
echo Contact me, when you can't solve the problem...
echo (You can get contact details from Wizard Details)
echo.
echo --------------------------------------------------------------------------------
echo.
::user choicess
echo A - Home&echo B - Advanced Sloves&echo C - Details&echo D - Exit
echo.
set/p "hpcho=>"
if %hpcho%==A call "%nowpath%\Home.bat"
if %hpcho%==a call "%nowpath%\Home.bat"
if %hpcho%==B goto ADVANCEDSOLVES
if %hpcho%==b goto ADVANCEDSOLVES
if %hpcho%==C call "%nowpath%\Details.bat"
if %hpcho%==c call "%nowpath%\Details.bat"
if %hpcho%==D call "%nowpath%\Exit.bat"
if %hpcho%==d call "%nowpath%\Exit.bat"
echo invalid choice... Try again...
timeout 6
goto HOTSPOTPROBLEMS

:ADVANCEDSOLVES
::clear before outputs
cls
::credits
echo %CREDIT0%&echo %CREDIT1%&echo %CREDIT2%&echo %CREDIT4%&echo %CREDIT5%&echo %CREDIT6%&echo %CREDIT7%&echo %CREDIT8%
::tab title
echo [ Advanced Solves ]
::steps
::video saved url (google drive)
start https://drive.google.com/drive/folders/1gKPlth-Tm-pMlt-h3ACXEsS5cx0ZoS2E?usp=sharing
echo.
::little instructions
echo Watch the videos for solve your problems... Good Luck...!
echo.
::user choicess
echo A - Home&echo B - Details&echo C - Exit
echo.
set/p "hpcho=>"
if %hpcho%==A call "%nowpath%\Home.bat"
if %hpcho%==a call "%nowpath%\Home.bat"
if %hpcho%==B call "%nowpath%\Details.bat"
if %hpcho%==b call "%nowpath%\Details.bat"
if %hpcho%==C call "%nowpath%\Exit.bat"
if %hpcho%==c call "%nowpath%\Exit.bat"
echo invalid choice... Try again...
timeout 6
goto HOTSPOTPROBLEMS