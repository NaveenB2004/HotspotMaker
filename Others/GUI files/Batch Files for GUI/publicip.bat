@Echo off

echo *** *** *** *** ***
echo.

::print versions
set/p guiver=<"GUI Version.ini"
set/p cliver=<"CLI Version.ini"
echo GUI Version %guiver%
echo CLI Version %cliver%
echo.

::internet check
echo Please wait for check the internet connection...
For /f %%A in (
  'powershell -command "(Invoke-Webrequest "https://pastebin.com/raw/3Tgw3Eid").content"'
) Do Set intcheck=%%A
if %intcheck%==2004 goto PUBIPSTART
echo.
echo Error white connect to the internet. Please check your internet connection and try again.

:PUBIPSTART
echo Connected to the internet!
echo Please wait for get your public IP...
echo.
::get public ip
:: web - http://api.ipify.org
For /f %%A in (
  'powershell -command "(Invoke-Webrequest "http://api.ipify.org").content"'
) Do Set ExtIP=%%A
echo Your Public IP is : %ExtIP%

echo.
echo *** *** *** *** ***

exit