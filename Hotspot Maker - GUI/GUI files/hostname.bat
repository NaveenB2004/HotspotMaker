@Echo off
echo *** *** *** *** ***
echo.
::print versions
set/p guiver=<"GUI Version.ini"
set/p cliver=<"CLI Version.ini"
echo GUI Version %guiver%
echo CLI Version %cliver%
echo.
::print hostname
echo.
hostname && set level=%errorlevel%
echo.
if level==0 (echo Return Value : Success!) else (echo Return Value : Failed!)
echo.
echo *** *** *** *** ***
exit