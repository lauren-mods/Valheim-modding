echo off

rem Source folder setup. You can edit these if they don't work for you!

set worldsource="%UserProfile%\AppData\LocalLow\IronGate\Valheim\worlds_local"
set charsource="%UserProfile%\AppData\LocalLow\IronGate\Valheim\characters_local"

rem Destination folder setup

set datestring=%DATE:~6,4%-%DATE:~3,2%-%DATE:~0,2%_%TIME:~0,2%-%TIME:~3,2%-%TIME:~6,2%
set datestring=%datestring: =0%

rem Edit 'Valheim-Backups' here (2x) to change the folder name.
mkdir %~dp0\Valheim-Backups\%datestring%
set destination="%~dp0\Valheim-Backups\%datestring%"

rem Backup process

echo =========================
echo What do you want to back up?
echo =========================
echo -
echo 1) All Local files
echo 2) Local World files only
echo 3) Local Character files only
echo 4) Nothing, quit please!
echo -
set /p op=Please type the number and press 'return/enter':


if "%op%"=="1" xcopy %worldsource% %destination% /s/y/c/v/r/h
if "%op%"=="1" xcopy %charsource% %destination% /s/y/c/v/r/h
if "%op%"=="1" goto alllocalbackedup

if "%op%"=="2" xcopy %worldsource% %destination% /s/y/c/v/r/h
if "%op%"=="2" goto localworldsbackedup

if "%op%"=="3" xcopy %charsource% %destination% /s/y/c/v/r/h
if "%op%"=="3" goto localcharactersbackedup

if "%op%"=="4" goto exit

echo =========================
echo That doesn't seem right! Please type 1, 2, 3, or 4.
goto start

:alllocalbackedup
echo =========================
echo Your local world and character files are backed up!
goto exit

:localworldsbackedup
echo =========================
echo Your local world files are backed up!
goto exit

:localcharactersbackedup
echo =========================
echo Your local character files are backed up!
goto exit

:exit
echo -
echo This window will now close.
PAUSE
@exit