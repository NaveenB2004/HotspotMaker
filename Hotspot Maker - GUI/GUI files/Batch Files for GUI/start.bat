@Echo off

echo *** *** *** *** ***
echo.

::print versions
set/p guiver=<"GUI Version.ini"
set/p cliver=<"CLI Version.ini"
echo GUI Version %guiver%
echo CLI Version %cliver%
echo.

::get ssid and password
set/p ssid=<"ssid.ini"
set/p psw=<"psw.ini"

::print details
echo Starting Hotspot...
echo Name (SSID): %ssid%
echo Password: %psw%

::start hostednetwork by given details
echo.
netsh wlan set hostednetwork mode=allow ssid="%ssid%" key="%psw%"
echo.
netsh wlan start hostednetwork

echo.
echo *** *** *** *** ***

exit