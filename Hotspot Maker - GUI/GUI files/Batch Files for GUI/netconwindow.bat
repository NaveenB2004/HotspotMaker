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
ncpa.cpl
echo Done!

echo.
echo *** *** *** *** ***

exit