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
if level==0 (echo Return Value : Success!>status.ini) else (echo Return Value : Failed!>status.ini)
echo.
echo *** *** *** *** ***
exit