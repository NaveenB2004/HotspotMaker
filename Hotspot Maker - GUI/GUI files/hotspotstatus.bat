@Echo off
echo *** *** *** *** ***
echo.
::print versions
set/p guiver=<"GUI Version.ini"
set/p cliver=<"CLI Version.ini"
echo GUI Version %guiver%
echo CLI Version %cliver%
echo.
::print network status
echo Getting network status...
::hostednetwork details command
netsh wlan show hostednetwork && set level=%errorlevel%
echo.
echo Return Value : %level%
echo.
::hostednetwork details command (security)
netsh wlan show hostednetwork setting=security && set level=%errorlevel%
echo.
echo Return Value : %level%
echo.
echo *** *** *** *** ***
exit