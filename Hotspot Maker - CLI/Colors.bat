:COLORCODES
::clear before outputs
cls
::title
title %title%
::credits
echo %CREDIT0%&echo %CREDIT1%&echo %CREDIT2%&echo %CREDIT4%&echo %CREDIT5%&echo %CREDIT6%&echo %CREDIT7%&echo %CREDIT8%
::tab title
echo [ Change Font Color ]
echo.
::import color code
set/p defcolorcode=<"%path%\colorcode.ini"
echo Choose a color for use as the default font color in wizard...
echo.
echo The default color using at this time is - %defcolorcode%
echo.
::user input color
echo A - Black&echo B - Blue&echo C - Green&echo D - Aqua&echo E - Red&echo F - Purple&echo G - Yellow&echo H - White
echo I - Gray&echo J - Light Blue&echo K - Light Green&echo L - Light Aqua&echo M - Light Red&echo N - Light Purple
echo O - Light Yellow&echo P - Bright White&echo.&echo Q - Back to Details&echo R - Exit
echo.
set/p "colorcho=>"
if %colorcho%==A echo 00 >"%path%\colorcode.ini" &echo %date%%time% - Choose color %colorcho%>>"%logger%"
if %colorcho%==a echo 00 >"%path%\colorcode.ini" &echo %date%%time% - Choose color %colorcho%>>"%logger%"
if %colorcho%==B echo 01 >"%path%\colorcode.ini" &echo %date%%time% - Choose color %colorcho%>>"%logger%"
if %colorcho%==b echo 01 >"%path%\colorcode.ini" &echo %date%%time% - Choose color %colorcho%>>"%logger%"
if %colorcho%==c echo 02 >"%path%\colorcode.ini" &echo %date%%time% - Choose color %colorcho%>>"%logger%"
if %colorcho%==C echo 02 >"%path%\colorcode.ini" &echo %date%%time% - Choose color %colorcho%>>"%logger%"
if %colorcho%==D echo 03 >"%path%\colorcode.ini" &echo %date%%time% - Choose color %colorcho%>>"%logger%"
if %colorcho%==d echo 03 >"%path%\colorcode.ini" &echo %date%%time% - Choose color %colorcho%>>"%logger%"
if %colorcho%==E echo 04 >"%path%\colorcode.ini" &echo %date%%time% - Choose color %colorcho%>>"%logger%"
if %colorcho%==e echo 04 >"%path%\colorcode.ini" &echo %date%%time% - Choose color %colorcho%>>"%logger%"
if %colorcho%==F echo 05 >"%path%\colorcode.ini" &echo %date%%time% - Choose color %colorcho%>>"%logger%"
if %colorcho%==f echo 05 >"%path%\colorcode.ini" &echo %date%%time% - Choose color %colorcho%>>"%logger%"
if %colorcho%==G echo 06 >"%path%\colorcode.ini" &echo %date%%time% - Choose color %colorcho%>>"%logger%"
if %colorcho%==g echo 06 >"%path%\colorcode.ini" &echo %date%%time% - Choose color %colorcho%>>"%logger%"
if %colorcho%==H echo 07 >"%path%\colorcode.ini" &echo %date%%time% - Choose color %colorcho%>>"%logger%"
if %colorcho%==h echo 07 >"%path%\colorcode.ini" &echo %date%%time% - Choose color %colorcho%>>"%logger%"
if %colorcho%==I echo 08 >"%path%\colorcode.ini" &echo %date%%time% - Choose color %colorcho%>>"%logger%"
if %colorcho%==i echo 08 >"%path%\colorcode.ini" &echo %date%%time% - Choose color %colorcho%>>"%logger%"
if %colorcho%==J echo 09 >"%path%\colorcode.ini" &echo %date%%time% - Choose color %colorcho%>>"%logger%"
if %colorcho%==j echo 09 >"%path%\colorcode.ini" &echo %date%%time% - Choose color %colorcho%>>"%logger%"
if %colorcho%==K echo 0A >"%path%\colorcode.ini" &echo %date%%time% - Choose color %colorcho%>>"%logger%"
if %colorcho%==k echo 0A >"%path%\colorcode.ini" &echo %date%%time% - Choose color %colorcho%>>"%logger%"
if %colorcho%==L echo 0B >"%path%\colorcode.ini" &echo %date%%time% - Choose color %colorcho%>>"%logger%"
if %colorcho%==l echo 0B >"%path%\colorcode.ini" &echo %date%%time% - Choose color %colorcho%>>"%logger%"
if %colorcho%==M echo 0C >"%path%\colorcode.ini" &echo %date%%time% - Choose color %colorcho%>>"%logger%"
if %colorcho%==m echo 0C >"%path%\colorcode.ini" &echo %date%%time% - Choose color %colorcho%>>"%logger%"
if %colorcho%==N echo 0D >"%path%\colorcode.ini" &echo %date%%time% - Choose color %colorcho%>>"%logger%"
if %colorcho%==n echo 0D >"%path%\colorcode.ini" &echo %date%%time% - Choose color %colorcho%>>"%logger%"
if %colorcho%==O echo 0E >"%path%\colorcode.ini" &echo %date%%time% - Choose color %colorcho%>>"%logger%"
if %colorcho%==o echo 0E >"%path%\colorcode.ini" &echo %date%%time% - Choose color %colorcho%>>"%logger%"
if %colorcho%==P echo 0F >"%path%\colorcode.ini" &echo %date%%time% - Choose color %colorcho%>>"%logger%"
if %colorcho%==p echo 0F >"%path%\colorcode.ini" &echo %date%%time% - Choose color %colorcho%>>"%logger%"
if %colorcho%==Q call "%nowpath%\Details.bat"
if %colorcho%==q call "%nowpath%\Details.bat"
if %colorcho%==R call "%nowpath%\Exit.bat"
if %colorcho%==r call "%nowpath%\Exit.bat"
echo.
if %errorlevel%==0 (echo Color Set Success! &echo %date%%time% - Errorlevel %errorlevel%>>"%logger%") else (echo Error! &echo %date%%time% - Errorlevel %errorlevel%>>"%logger%")
::import and set new color
set/p defCOLORCODEnum=<"%path%\colorcode.ini"
color %defCOLORCODEnum%
echo.
%timeout% 6
::switch to 'Details.bat'
call "%nowpath%\Details.bat"