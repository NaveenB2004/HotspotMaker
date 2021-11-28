:DETAILS
cls
echo %CREDIT0%&echo %CREDIT1%&echo %CREDIT2%&echo %CREDIT4%&echo %CREDIT5%&echo %CREDIT6%&echo %CREDIT7%&echo %CREDIT8%
echo [ Details ]
echo.
echo Details about the wi-fi hotspot craeting wizard...
echo ..........................................................
echo ---------------------{Stable Edition}---------------------
echo.
echo --------------------------(v%version%)--------------------------
echo.
echo ..................(28.11.2021 @ 10:33 PM).................
echo.
echo Created by: Naveen Balasooriya
echo Contact me: naveennbalasooriya2004@gmail.com      (Email)
echo             https://t.me/NaveenB2004              (Telegram)
echo             https://wa.me/message/KP75DUMMIKMTC1  (Whatsapp)
echo Visit my website: https://sites.google.com/sites/naveenb2004
echo ..........................................................
echo.
echo Version Notes...
echo.
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
echo # v1.8 - Bug fixed (error while network checking on getting public IP).Break tabs to it's own files. Use pastebin for get updates and web requestes (UnRAR and New Version updates are currently via google drive). Remove 'Hotspot Maker-Admin.vbs'.
echo.
echo ..........................................................
echo.
echo Have you a problem when starting the hostspot?
echo Choose "Hotspot Problems" option to get help.
echo.
echo A - Home&echo B - Check Updates&echo C - Change Font Color&echo D - Hotspot Problems&echo E - Exit
echo.
set/p "dcho=>"
if %dcho%==A call "%nowpath%\Home.bat"
if %dcho%==a call "%nowpath%\Home.bat"
if %dcho%==B call "%nowpath%\Update.bat"
if %dcho%==b call "%nowpath%\Update.bat"
if %dcho%==C call "%nowpath%\Colors.bat"
if %dcho%==c call "%nowpath%\Colors.bat"
if %dcho%==D call "%nowpath%\Solves.bat"
if %dcho%==d call "%nowpath%\Solves.bat"
if %dcho%==E call "%nowpath%\Exit.bat"
if %dcho%==e call "%nowpath%\Exit.bat"
echo invalid choice... Try again...
timeout 6
goto DETAILS
