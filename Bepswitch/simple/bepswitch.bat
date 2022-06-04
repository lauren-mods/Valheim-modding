echo off

:start
echo =========================
echo What do you want to do?
echo =========================
echo -
echo 1) Switch BepInEx off (vanilla)
echo 2) Switch BepInEx on (modded)
echo 3) Quit
echo -
set /p op=Please type the number and press 'return/enter':
if "%op%"=="1" powershell -Command "(gc doorstop_config.ini) -replace 'enabled=true', 'enabled=false' | Out-File -encoding ASCII doorstop_config.ini" & goto vanilla
if "%op%"=="2" powershell -Command "(gc doorstop_config.ini) -replace 'enabled=false', 'enabled=true' | Out-File -encoding ASCII doorstop_config.ini" & goto modded
if "%op%"=="3" goto exit
echo =========================
echo That doesn't seem right! Please type 1, 2, or 3.
goto start

:vanilla
echo =========================
echo You're now playing Vanilla Valheim!
goto exit

:modded
echo =========================
echo You're now playing modded Valheim!
goto exit

:exit
PAUSE
@exit