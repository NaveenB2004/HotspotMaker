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
if level==0 (echo Return Value : Success!>status.ini) else (echo Return Value : Failed!>status.ini)
::renew ip
ipconfig /renew && set level=%errorlevel%
if level==0 (echo Return Value : Success!>status.ini) else (echo Return Value : Failed!>status.ini)
::ipconfig
ipconfig
echo.
echo *** *** *** *** ***
exit