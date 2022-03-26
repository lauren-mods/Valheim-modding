echo off

:setup
if not exist "BepInEx\Bepswitch\list-1" mkdir BepInEx\Bepswitch\list-1
if not exist "BepInEx\Bepswitch\list-2" mkdir BepInEx\Bepswitch\list-2
if not exist "BepInEx\Bepswitch\list-3" mkdir BepInEx\Bepswitch\list-3

if not exist "BepInEx\Bepswitch\list-1\files" echo > BepInEx\Bepswitch\list-1\files.txt
if not exist "BepInEx\Bepswitch\list-2\files" echo > BepInEx\Bepswitch\list-2\files.txt
if not exist "BepInEx\Bepswitch\list-3\files" echo > BepInEx\Bepswitch\list-3\files.txt

if not exist "BepInEx\Bepswitch\list-1\folders" echo > BepInEx\Bepswitch\list-1\folders.txt
if not exist "BepInEx\Bepswitch\list-2\folders" echo > BepInEx\Bepswitch\list-2\folders.txt
if not exist "BepInEx\Bepswitch\list-3\folders" echo > BepInEx\Bepswitch\list-3\folders.txt

if not exist "BepInEx\Bepswitch\deleted" mkdir BepInEx\Bepswitch\deleted

if not exist "BepInEx\Bepswitch\plugins-master" mkdir BepInEx\Bepswitch\plugins-master

:start
echo =========================
echo What do you want to do?
echo =========================
echo -
echo 1) Play Vanilla
echo 2) Play Modded
echo 3) Load Plugins from List
echo 4) HELP
echo -
set /p op=Please type the number and press 'return/enter':

if "%op%"=="1" powershell -Command "(gc doorstop_config.ini) -replace 'enabled=true', 'enabled=false' | Out-File -encoding ASCII doorstop_config.ini" & goto vanilla
if "%op%"=="2" powershell -Command "(gc doorstop_config.ini) -replace 'enabled=false', 'enabled=true' | Out-File -encoding ASCII doorstop_config.ini" & goto modded
if "%op%"=="3" goto loadplugins
if "%op%"=="4" goto help

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

:loadplugins
echo =========================
echo Bepswitch will DELETE your current plugins and COPY a list of files from plugins-master. Which list would you like to copy from?
echo 1) list-1
echo 2) list-2
echo 3) list-3
echo 4) Go back to main menu!
echo -
set /p op=Please type the number and press 'return/enter':
if "%op%"=="1" set "selectedprofile=list-1" & goto cont
if "%op%"=="2" set "selectedprofile=list-2" & goto cont
if "%op%"=="3" set "selectedprofile=list-3" & goto cont
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