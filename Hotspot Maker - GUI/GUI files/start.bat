@Echo off
echo *** *** *** *** ***
echo.
::print versions
set/p ver=<"Version.ini"
echo Version %ver%
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
netsh wlan set hostednetwork mode=allow ssid="%ssid%" key="%psw%" && set level=%errorlevel%
echo.
echo Return Value : %level%
echo.
netsh wlan start hostednetwork && set level=%errorlevel%
echo.
echo Return Value : %level%
echo.
echo *** *** *** *** ***
exit