@Echo off

echo --------------------------------------------------
echo.

::print versions
echo Main Version 2.6
echo GUI Version 1.0
echo CLI Version 1.0

::print details and stop hostednetwork
echo Stopping Hotspot...
netsh wlan stop hostednetwork

echo.
echo --------------------------------------------------

exit