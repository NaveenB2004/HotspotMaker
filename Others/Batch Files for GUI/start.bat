@Echo off

echo --------------------------------------------------
echo.

::print versions
echo Main Version 2.6
echo GUI Version 1.0
echo CLI Version 1.0

::get ssid and password
set/p ssid=<"ssid.ini"
set/p psw=<"psw.ini"

::print details
echo Starting Hotspot...
echo Name (SSID): %ssid%
echo Password: %psw%

::start hostednetwork by given details
netsh wlan set hostednetwork mode=allow ssid="%ssid%" key="%psw%"
echo.
netsh wlan start hostednetwork

echo.
echo --------------------------------------------------

exit