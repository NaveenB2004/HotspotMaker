:COLORCODES
::clear before outputs
cls

::credits
echo %CREDIT0%&echo %CREDIT1%&echo %CREDIT2%&echo %CREDIT4%&echo %CREDIT5%&echo %CREDIT6%&echo %CREDIT7%&echo %CREDIT8%

::tab title
echo [ Change Font Color ]
echo.

::import color code
set/p defcolorcode=<"C:\ProgramData\HotspotMakerData\colorcode.ini"
echo Choose a color for use as the default font color in wizard...
echo.
echo The default color using at this time is - %defcolorcode%
echo.

::user input color
echo A - Black&echo B - Blue&echo C - Green&echo D - Aqua&echo E - Red&echo F - Purple&echo G - Yellow&echo H - White&echo I - Gray&echo J - Light Blue&echo K - Light Green&echo L - Light Aqua&echo M - Light Red&echo N - Light Purple&echo O - Light Yellow&echo P - Bright White&echo.&echo Q - Back to Details&echo R - Exit
echo.
set/p "colorcho=>"
if %colorcho%==A echo 0 >"C:\ProgramData\HotspotMakerData\colorcode.ini"
if %colorcho%==a echo 0 >"C:\ProgramData\HotspotMakerData\colorcode.ini"
if %colorcho%==B echo 1 >"C:\ProgramData\HotspotMakerData\colorcode.ini"
if %colorcho%==b echo 1 >"C:\ProgramData\HotspotMakerData\colorcode.ini"
if %colorcho%==c echo 2 >"C:\ProgramData\HotspotMakerData\colorcode.ini"
if %colorcho%==C echo 2 >"C:\ProgramData\HotspotMakerData\colorcode.ini"
if %colorcho%==D echo 3 >"C:\ProgramData\HotspotMakerData\colorcode.ini"
if %colorcho%==d echo 3 >"C:\ProgramData\HotspotMakerData\colorcode.ini"
if %colorcho%==E echo 4 >"C:\ProgramData\HotspotMakerData\colorcode.ini"
if %colorcho%==e echo 4 >"C:\ProgramData\HotspotMakerData\colorcode.ini"
if %colorcho%==F echo 5 >"C:\ProgramData\HotspotMakerData\colorcode.ini"
if %colorcho%==f echo 5 >"C:\ProgramData\HotspotMakerData\colorcode.ini"
if %colorcho%==G echo 6 >"C:\ProgramData\HotspotMakerData\colorcode.ini"
if %colorcho%==g echo 6 >"C:\ProgramData\HotspotMakerData\colorcode.ini"
if %colorcho%==H echo 7 >"C:\ProgramData\HotspotMakerData\colorcode.ini"
if %colorcho%==h echo 7 >"C:\ProgramData\HotspotMakerData\colorcode.ini"
if %colorcho%==I echo 8 >"C:\ProgramData\HotspotMakerData\colorcode.ini"
if %colorcho%==i echo 8 >"C:\ProgramData\HotspotMakerData\colorcode.ini"
if %colorcho%==J echo 9 >"C:\ProgramData\HotspotMakerData\colorcode.ini"
if %colorcho%==j echo 9 >"C:\ProgramData\HotspotMakerData\colorcode.ini"
if %colorcho%==K echo A >"C:\ProgramData\HotspotMakerData\colorcode.ini"
if %colorcho%==k echo A >"C:\ProgramData\HotspotMakerData\colorcode.ini"
if %colorcho%==L echo B >"C:\ProgramData\HotspotMakerData\colorcode.ini"
if %colorcho%==l echo B >"C:\ProgramData\HotspotMakerData\colorcode.ini"
if %colorcho%==M echo C >"C:\ProgramData\HotspotMakerData\colorcode.ini"
if %colorcho%==m echo C >"C:\ProgramData\HotspotMakerData\colorcode.ini"
if %colorcho%==N echo D >"C:\ProgramData\HotspotMakerData\colorcode.ini"
if %colorcho%==n echo D >"C:\ProgramData\HotspotMakerData\colorcode.ini"
if %colorcho%==O echo E >"C:\ProgramData\HotspotMakerData\colorcode.ini"
if %colorcho%==o echo E >"C:\ProgramData\HotspotMakerData\colorcode.ini"
if %colorcho%==P echo F >"C:\ProgramData\HotspotMakerData\colorcode.ini"
if %colorcho%==p echo F >"C:\ProgramData\HotspotMakerData\colorcode.ini"
if %colorcho%==Q call "%nowpath%\Details.bat"
if %colorcho%==q call "%nowpath%\Details.bat"
if %colorcho%==R call "%nowpath%\Exit.bat"
if %colorcho%==r call "%nowpath%\Exit.bat"
echo.
echo Color Set Successed...

::import and set new color
set/p defCOLORCODEnum=<"C:\ProgramData\HotspotMakerData\colorcode.ini"
color %defCOLORCODEnum%
echo.
timeout 6

::switch to 'Details.bat'
call "%nowpath%\Details.bat"