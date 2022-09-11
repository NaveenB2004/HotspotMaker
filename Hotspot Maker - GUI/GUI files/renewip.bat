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
ipconfig /release && set level=%errorlevel%
echo.
echo Return Value : %level%
echo.
::renew ip
ipconfig /renew && set level=%errorlevel%
echo.
echo Return Value : %level%
echo.
::ipconfig
ipconfig && set level=%errorlevel%
echo.
echo Return Value : %level%
echo.
echo *** *** *** *** ***
exit