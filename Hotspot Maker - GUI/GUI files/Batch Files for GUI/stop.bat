@Echo off

echo *** *** *** *** ***
echo.

::print versions
set/p guiver=<"GUI Version.ini"
set/p cliver=<"CLI Version.ini"
echo GUI Version %guiver%
echo CLI Version %cliver%
echo.

::print details and stop hostednetwork
echo Stopping Hotspot...
echo.
netsh wlan stop hostednetwork

echo.
echo *** *** *** *** ***

exit