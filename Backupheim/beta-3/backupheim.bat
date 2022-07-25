echo off

rem Steam ID setup. Replace 'here' with your steam id.

set "steamid=here"

rem Local source folder setup.

set worldsource="%UserProfile%\AppData\LocalLow\IronGate\Valheim\worlds_local"
set charsource="%UserProfile%\AppData\LocalLow\IronGate\Valheim\characters_local"

rem Cloud source folder setup.

set worldcloud="C:Program~1\Steam\userdata\%steamid%\892970\remote\worlds"
set charcloud="C:Program~1\Steam\userdata\%steamid%\892970\remote\characters"

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
echo 1) Everything
echo 2) All local files
echo 3) All cloud files
echo 4) Local world files only
echo 5) Local character files only
echo 6) Cloud world files
echo 7) Cloud character files
echo 8) Quit
echo -
set /p op=Please type the number and press 'return/enter':

if "%op%"=="1" xcopy %worldsource% %destination% /s/y/c/v/r/h
if "%op%"=="1" xcopy %charsource% %destination% /s/y/c/v/r/h
if "%op%"=="1" xcopy %worldcloud% %destination% /s/y/c/v/r/h
if "%op%"=="1" xcopy %charcloud% %destination% /s/y/c/v/r/h
if "%op%"=="1" goto everythingbackedup

if "%op%"=="2" xcopy %worldsource% %destination% /s/y/c/v/r/h
if "%op%"=="2" xcopy %charsource% %destination% /s/y/c/v/r/h
if "%op%"=="2" goto alllocalbackedup

if "%op%"=="3" xcopy %worldcloud% %destination% /s/y/c/v/r/h
if "%op%"=="3" xcopy %charcloud% %destination% /s/y/c/v/r/h
if "%op%"=="3" goto allcloudbackedup

if "%op%"=="4" xcopy %worldsource% %destination% /s/y/c/v/r/h
if "%op%"=="4" goto localworldsbackedup

if "%op%"=="5" xcopy %charsource% %destination% /s/y/c/v/r/h
if "%op%"=="5" goto localcharactersbackedup

if "%op%"=="4" xcopy %worldcloud% %destination% /s/y/c/v/r/h
if "%op%"=="4" goto cloudworldsbackedup

if "%op%"=="5" xcopy %charcloud% %destination% /s/y/c/v/r/h
if "%op%"=="5" goto cloudcharactersbackedup

if "%op%"=="8" goto exit

echo =========================
echo That doesn't seem right! Please type 1, 2, 3, 4, 5, 6, 7, or 8.
goto start

:everythingbackedup
echo =========================
echo All files are backed up!
goto exit

:alllocalbackedup
echo =========================
echo All local files are backed up!
goto exit

:allcloudbackedup
echo =========================
echo All local files are backed up!
goto exit

:localworldsbackedup
echo =========================
echo Your local world files are backed up!
goto exit

:localcharactersbackedup
echo =========================
echo Your local character files are backed up!
goto exit

:cloudworldsbackedup
echo =========================
echo Your local world files are backed up!
goto exit

:cloudcharactersbackedup
echo =========================
echo Your local character files are backed up!
goto exit

:exit
echo -
echo This window will now close.
PAUSE
@exit
