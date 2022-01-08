echo off

rem Source folder setup. You can edit these if they don't work for you!

set "worldsource=C:\Users\%username%\AppData\LocalLow\IronGate\Valheim\worlds"
set "charsource=C:\Users\%username%\AppData\LocalLow\IronGate\Valheim\characters"

rem Destination folder setup

set "datestring=%date:~-4,4%"-"%date:~-7,2%"-"%date:~-10,2%"
mkdir %~dp0\Valheim-Backups\%datestring%
set "destination=%~dp0\Valheim-Backups\%datestring%"

rem Backup process

echo =========================
echo What do you want to back up?
echo =========================
echo -
echo 1) Everything - world and character files
echo 2) World files only
echo 3) Character files only
echo 4) Nothing, quit please!
echo -
set /p op=Please type the number and press 'return/enter':

if "%op%"=="1" xcopy %worldsource% %destination% /s/y/c/v/r/h
if "%op%"=="1" xcopy %charsource% %destination% /s/y/c/v/r/h
if "%op%"=="1" goto everythingbackedup

if "%op%"=="2" xcopy %worldsource% %destination% /s/y/c/v/r/h
if "%op%"=="2" goto worldsbackedup

if "%op%"=="3" xcopy %charsource% %destination% /s/y/c/v/r/h
if "%op%"=="3" goto charactersbackedup

if "%op%"=="4" goto exit

echo =========================
echo That doesn't seem right! Please type 1, 2, 3, or 4.
goto start

:everythingbackedup
echo =========================
echo Everything's backed up!
goto exit

:worldsbackedup
echo =========================
echo Your world files are backed up!
goto exit

:charactersbackedup
echo =========================
echo Your character files are backed up!
goto exit

:exit
echo -
echo This window will now close.
PAUSE
@exit