@Echo off

echo *** *** *** *** ***
echo.

::print versions
set/p guiver=<"GUI Version.ini"
set/p cliver=<"CLI Version.ini"
echo GUI Version %guiver%
echo CLI Version %cliver%
echo.

::ipconfig start and details
echo Starting IP Configuration...
echo.
ipconfig /all

echo.
echo *** *** *** *** ***

exit