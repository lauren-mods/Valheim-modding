echo off

:setup
if not exist "BepInEx\Bepswitch\profile-1" mkdir BepInEx\Bepswitch\profile-1
if not exist "BepInEx\Bepswitch\profile-2" mkdir BepInEx\Bepswitch\profile-2
if not exist "BepInEx\Bepswitch\profile-3" mkdir BepInEx\Bepswitch\profile-3

if not exist "BepInEx\Bepswitch\profile-1\files" echo List your files (.dll) here > BepInEx\Bepswitch\profile-1\files.txt
if not exist "BepInEx\Bepswitch\profile-2\files" echo List your files (.dll) here > BepInEx\Bepswitch\profile-2\files.txt
if not exist "BepInEx\Bepswitch\profile-3\files" echo List your files (.dll) here > BepInEx\Bepswitch\profile-3\files.txt

if not exist "BepInEx\Bepswitch\profile-1\folders" echo List your folders here > BepInEx\Bepswitch\profile-1\folders.txt
if not exist "BepInEx\Bepswitch\profile-2\folders" echo List your folders here > BepInEx\Bepswitch\profile-2\folders.txt
if not exist "BepInEx\Bepswitch\profile-3\folders" echo List your folders here > BepInEx\Bepswitch\profile-3\folders.txt

if not exist "BepInEx\Bepswitch\deleted" mkdir BepInEx\Bepswitch\deleted

if not exist "BepInEx\Bepswitch\plugins-master" mkdir BepInEx\Bepswitch\plugins-master

:start
echo =========================
echo What do you want to do?
echo =========================
echo -
echo 1) Clear plugins
echo 2) Load plugins from a list
echo 3) Switch BepInEx off (vanilla)
echo 4) Switch BepInEx on (modded)
echo 5) HELP
echo 6) Quit
echo -
set /p op=Please type the number and press 'return/enter':

if "%op%"=="1" goto clear
if "%op%"=="2" goto loadplugins
if "%op%"=="3" powershell -Command "(gc doorstop_config.ini) -replace 'enabled=true', 'enabled=false' | Out-File -encoding ASCII doorstop_config.ini" & goto vanilla
if "%op%"=="4" powershell -Command "(gc doorstop_config.ini) -replace 'enabled=false', 'enabled=true' | Out-File -encoding ASCII doorstop_config.ini" & goto modded
if "%op%"=="5" goto help
if "%op%"=="6" goto exit


echo =========================
echo That doesn't seem right! Please type 1, 2, or 3.
goto start

:help
echo =========================
echo this is help
goto start


:vanilla
echo =========================
echo You're now playing Vanilla Valheim!
goto exit

:modded
echo =========================
echo You're now playing modded Valheim!
goto exit

:clear
echo =========================
echo Your plugins have been cleared to Bepswitch\deleted.
echo Do you want to load a profile?
echo (y/n) 
set /p op=Please type y / n and press 'return/enter':
if "%op%"=="y" goto loadplugins
if "%op%"=="n" goto exit

:loadplugins
echo =========================
echo Bepswitch will DELETE your current plugins and COPY a list of files from plugins-master. Which list would you like to copy from?
echo 1) profile-1
echo 2) profile-2
echo 3) profile-3
echo 4) Go back to main menu!
echo -
set /p op=Please type the number and press 'return/enter':
if "%op%"=="1" set "selectedprofile=profile-1" & goto cont
if "%op%"=="2" set "selectedprofile=profile-2" & goto cont
if "%op%"=="3" set "selectedprofile=profile-3" & goto cont
if "%op%"=="4" goto start
echo =========================
echo That doesn't seem right! Please type 1, 2, 3, or 4.
goto loadplugins

:cont

MOVE /s /y "%~dp0\BepInEx\plugins" "%~dp0\BepInEx\Bepswitch\deleted"

set src_folder=BepInEx\Bepswitch\plugins-master
set dst_folder=%~dp0\BepInEx\plugins
set folder_list=BepInEx\Bepswitch\%selectedprofile%\folders.txt
set file_list=BepInEx\Bepswitch\%selectedprofile%\files.txt

for /f "delims=" %%f in (%dir_list%) do ( xcopy "%src_folder%\%%f\*.*" "%dst_folder%\%%f\" )

for /f "tokens=*" %%i in (%file_list%) DO (
xcopy /S/E "%src_folder%\%%i" "%dst_folder%"
)

goto exit

:exit
PAUSE
@exit