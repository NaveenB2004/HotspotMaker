:PVNOTES
::clear before outputs
cls
::title
title %title%
::credits
echo %CREDIT0%&echo %CREDIT1%&echo %CREDIT2%&echo %CREDIT4%&echo %CREDIT5%&echo %CREDIT6%&echo %CREDIT7%&echo %CREDIT8%
::tab title
echo [ Full Version History ]
echo.
echo ..........................................................
echo.
echo # v1.1 - Add Windows IP Configuration option into main interface(Add IP codes). Remove EXITCONTINUE codes and modify FAIL codes. Change some codes for easy editing. Add Chech Updates option and UPDATECHECK codes (primary level code).
echo.
echo # v1.2 - Remove access password. Setup user-friendly start for hotspot(START tab). Short some codes. Remove code breaks. Manage menu items as a cascade. Add font color easy adding option.
echo.
echo # v1.3 - Change Network Configuration to 2 options(ipconfiguration and netstatus). Fix hotspot name and password enter problem. Add network problems offline FAQ. Make changes for run with Windows 10. Make an installable file for an easy install.
echo.
echo # v1.4 - Bugs fixed (Programme Data, Color Settings). Add the 'advanced solves' button for some network start problems (online videos). Short color editing codes. Add default SSID and Password adding option for easy hosted-network starting. Fix menu items. Add pinging option (in Network Configuration Tab). Fix tab name mistakes. Fix some spellings mistakes. Add update setup wizard (beta).
echo.
echo # v1.5 - Bugs fixed (main wizard version read, updater wizard). Remove size formattings. Change directry variables for advanced accessing.
echo.
echo # v1.6 - Bugs Fixed (NETCONFIG error with network start, updater wizard, variables writting). Add interface line for setting default SSID. Add instructions for SAVECREDITS tab while not input data. Made a new wizard for online install (latest versions).
echo.
echo # v1.7 - Bugs fixed (Color settings). Renew updater codes and online installer codes(this wizards will not update after this version). Solve version notes mistakes. Add hotspot security details to Hotspot Status tab. New option added to Hotspot Status tab for get Public/External IP.
echo.
echo # v1.8 - Break tabs to it's own files. Use pastebin for get updates and web requestes (UnRAR and New Version updates are currently via google drive). Remove 'Hotspot Maker-Admin.vbs'.
echo.
echo # v1.9 - Bugs fixed (Showing 'Launcher' as a virus, Updater Errors, Other minor bugs), Break Launcher to Launcher.exe and Variables.bat. Use Pastebin for get fast webrequests. Use google drive for store updater files.
echo.
echo # v2.0 - Bugs fixed (Pulic IP tab-remove pre existed code line, error while uninstall after a update, other minor bugs).
echo.
echo # v2.1 - Bugs fixed (minor bugs). Remove direct call for variables and add a startup script. Add auto-update checker on computer starts. Add code breaks (comments) for easy editings. Add operator for comparing new versions when updating. Add new options to the Network Configuration tab (Open network connection window, renew network IP addresses, view computer hostname).
echo.
echo ..........................................................
echo.
::user choicess
echo A - Home&echo B - Details&echo C - Exit
echo.
set/p "pvncho=>"
if %pvncho%==A call "%nowpath%\Home.bat"
if %pvncho%==a call "%nowpath%\Home.bat"
if %pvncho%==B call "%nowpath%\Details.bat"
if %pvncho%==b call "%nowpath%\Details.bat"
if %pvncho%==C call "%nowpath%\Exit.bat"
if %pvncho%==c call "%nowpath%\Exit.bat"
echo invalid choice... Try again...
timeout 6
goto PVNOTES