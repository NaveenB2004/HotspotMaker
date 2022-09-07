@Echo off

echo *** *** *** *** ***
echo.

::print versions
set/p guiver=<"GUI Version.ini"
set/p cliver=<"CLI Version.ini"
echo GUI Version %guiver%
echo CLI Version %cliver%
echo.

echo Working...
::release ip
ipconfig /release
::renew ip
ipconfig /renew
::ipconfig
ipconfig

echo.
echo *** *** *** *** ***

exit