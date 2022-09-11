@Echo off
echo *** *** *** *** ***
echo.
::print versions
set/p guiver=<"GUI Version.ini"
set/p cliver=<"CLI Version.ini"
echo GUI Version %guiver%
echo CLI Version %cliver%
echo.
::get inputs
set/p pingaddress=<"ping address.ini"
set/p pingcount=<"ping count.ini"
::ping command
echo Pinging...
echo.
PING %pingaddress% -n %pingcount% && set level=%errorlevel%
echo.
if level==0 (echo Return Value : Success!) else (echo Return Value : Failed!)
echo.
echo *** *** *** *** ***
exit