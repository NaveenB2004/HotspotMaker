@Echo off
echo *** *** *** *** ***
echo.
::print versions
set/p ver=<"Version.ini"
echo Version %ver%
echo.
::print details and stop hostednetwork
echo Stopping Hotspot...
echo.
netsh wlan stop hostednetwork && set level=%errorlevel%
echo.
echo Return Value : %level%
echo.
echo *** *** *** *** ***
exit