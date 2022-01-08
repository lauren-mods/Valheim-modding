echo off

:start
echo =========================
echo What do you want to do?
echo =========================
echo -
echo 1) Play Vanilla (disable Bepinex)
echo 2) Play Modded (enable Bepinex)
echo 3) Save Profile (also creates)
echo 4) Load Profile
echo 5) Save Plugins
echo 6) Load Plugins
echo 7) Save Configs
echo 8) Load Configs
echo 9) Create an Empty Profile
echo -
set /p op=Please type the number and press 'return/enter':

if "%op%"=="1" powershell -Command "(gc doorstop_config.ini) -replace 'enabled=true', 'enabled=false' | Out-File -encoding ASCII doorstop_config.ini" & goto vanilla
if "%op%"=="2" powershell -Command "(gc doorstop_config.ini) -replace 'enabled=false', 'enabled=true' | Out-File -encoding ASCII doorstop_config.ini" & goto modded
if "%op%"=="3" goto savefull
if "%op%"=="4" goto loadfull
if "%op%"=="5" goto saveplugins
if "%op%"=="6" goto loadplugins
if "%op%"=="7" goto saveconfigs
if "%op%"=="8" goto loadconfigs
if "%op%"=="9" goto create

echo =========================
echo That doesn't seem right! Please type 1, 2, 3, 4, or 5.
goto start

:vanilla
echo =========================
echo You're now playing Vanilla Valheim!
goto exit

:modded
echo =========================
echo You're now playing modded Valheim!
goto exit

:create
echo =========================
if not exist "BepInEx\Bepswitch-profiles" mkdir BepInEx\Bepswitch-profiles
echo You can create up to three profiles. Which profile would you like to create?

echo 1) profile-1
echo 2) profile-2
echo 3) profile-3

set /p op=Please type the number and press 'return/enter':

if "%op%"=="1" set "selectedprofile=profile-1" & goto cont
if "%op%"=="2" set "selectedprofile=profile-2" & goto cont
if "%op%"=="3" set "selectedprofile=profile-3" & goto cont
echo =========================
echo That doesn't seem right! Please type 1, 2, or 3.
goto start

:cont
mkdir BepInEx\Bepswitch-profiles\%selectedprofile%\plugins
mkdir BepInEx\Bepswitch-profiles\%selectedprofile%\config
echo %selectedprofile% has been created in BepInEx\Bepswitch-profiles\%selectedprofile%
xcopy BepInEx\config\BepInEx.cfg BepInEx\Bepswitch-profiles\%selectedprofile%\config\BepInEx.cfg /s/y/c/v/r/h
xcopy BepInEx\config\org.bepinex.valheim.displayinfo.cfg BepInEx\Bepswitch-profiles\%selectedprofile%\config\org.bepinex.valheim.displayinfo.cfg /s/y/c/v/r/h
goto exit

:savefull

echo =========================
echo Save profile will copy your current mods and config to a profile folder and overwrite its current files. Which folder would you like to save to?
echo 1) Profile-1
echo 2) Profile-2
echo 3) Profile-3
echo 4) Go back to main menu!
echo -
set /p op=Please type the number and press 'return/enter':
if "%op%"=="1" set "selectedprofile=profile-1" & goto cont
if "%op%"=="2" set "selectedprofile=profile-2" & goto cont
if "%op%"=="3" set "selectedprofile=profile-3" & goto cont
if "%op%"=="4" goto start
echo =========================
echo That doesn't seem right! Please type 1, 2, or 3.
goto start

:cont
if exist "BepInEx\Bepswitch-profiles\%selectedprofile%\plugins" del "BepInEx\Bepswitch-profiles\%selectedprofile%\plugins"
mkdir BepInEx\Bepswitch-profiles\%selectedprofile%\plugins
xcopy BepInEx\plugins BepInEx\Bepswitch-profiles\%selectedprofile%\plugins /s/y/c/v/r/h

if exist BepInEx\Bepswitch-profiles\%selectedprofile%\config del "BepInEx\Bepswitch-profiles\%selectedprofile%\config"
mkdir BepInEx\Bepswitch-profiles\%selectedprofile%\config
xcopy BepInEx\config BepInEx\Bepswitch-profiles\%selectedprofile%\config /s/y/c/v/r/h

echo Your plugins and config have been copied to %selectedprofile%
goto exit

:saveconfigs

echo =========================
echo Save configs will copy your current config files to a profile folder and overwrite its current files. Which folder would you like to save to?
echo 1) Profile-1
echo 2) Profile-2
echo 3) Profile-3
echo 4) Go back to main menu!
echo -
set /p op=Please type the number and press 'return/enter':
if "%op%"=="1" set "selectedprofile=profile-1" & goto cont
if "%op%"=="2" set "selectedprofile=profile-2" & goto cont
if "%op%"=="3" set "selectedprofile=profile-3" & goto cont
if "%op%"=="4" goto start
echo =========================
echo That doesn't seem right! Please type 1, 2, or 3.
goto start

:cont

if exist BepInEx\Bepswitch-profiles\%selectedprofile%\config del "BepInEx\Bepswitch-profiles\%selectedprofile%\config"
mkdir BepInEx\Bepswitch-profiles\%selectedprofile%\config
xcopy BepInEx\config BepInEx\Bepswitch-profiles\%selectedprofile%\config /s/y/c/v/r/h

echo Your configs have been copied to %selectedprofile%
goto exit

:saveplugins

echo =========================
echo Save plugins will copy your current mod plugin files to a profile folder and overwrite its current files. Which folder would you like to save to?
echo 1) Profile-1
echo 2) Profile-2
echo 3) Profile-3
echo 4) Go back to main menu!
echo -
set /p op=Please type the number and press 'return/enter':
if "%op%"=="1" set "selectedprofile=profile-1" & goto cont
if "%op%"=="2" set "selectedprofile=profile-2" & goto cont
if "%op%"=="3" set "selectedprofile=profile-3" & goto cont
if "%op%"=="4" goto start
echo =========================
echo That doesn't seem right! Please type 1, 2, or 3.
goto start

:cont
if exist "BepInEx\Bepswitch-profiles\%selectedprofile%\plugins" del "BepInEx\Bepswitch-profiles\%selectedprofile%\plugins"
mkdir BepInEx\Bepswitch-profiles\%selectedprofile%\plugins
xcopy BepInEx\plugins BepInEx\Bepswitch-profiles\%selectedprofile%\plugins /s/y/c/v/r/h

echo Your plugins have been copied to %selectedprofile%
goto exit

:loadfull
echo =========================
echo Load profile will delete your current plugins and configs and load from a saved profile folder. Which folder would you like to load from?
echo 1) Profile-1
echo 2) Profile-2
echo 3) Profile-3
echo 4) Go back to main menu!
echo -
set /p op=Please type the number and press 'return/enter':
if "%op%"=="1" set "selectedprofile=profile-1" & goto cont
if "%op%"=="2" set "selectedprofile=profile-2" & goto cont
if "%op%"=="3" set "selectedprofile=profile-3" & goto cont
if "%op%"=="4" goto start
echo =========================
echo That doesn't seem right! Please type 1, 2, or 3.
goto start

:cont
if not exist "BepInEx\Bepswitch-profiles\%selectedprofile%" goto loaderror

if not exist "BepInEx\Bepswitch-profiles\oldfiles\plugins" mkdir BepInEx\Bepswitch-profiles\oldfiles\plugins
if not exist "BepInEx\Bepswitch-profiles\oldfiles\config" mkdir BepInEx\Bepswitch-profiles\oldfiles\config

xcopy BepInEx\config\BepInEx.cfg BepInEx\Bepswitch-profiles\%selectedprofile%\config\BepInEx.cfg /s/y/c/v/r/h
xcopy BepInEx\config\org.bepinex.valheim.displayinfo.cfg BepInEx\Bepswitch-profiles\%selectedprofile%\config\org.bepinex.valheim.displayinfo.cfg /s/y/c/v/r/h

MOVE /y "%~dp0\BepInEx\plugins" "%~dp0\BepInEx\Bepswitch-profiles\oldfiles\plugins\"

MOVE /y "%~dp0\BepInEx\config" "%~dp0\BepInEx\Bepswitch-profiles\oldfiles\config\"


xcopy BepInEx\Bepswitch-profiles\%selectedprofile%\plugins BepInEx\plugins /s/y/c/v/r/h
xcopy BepInEx\Bepswitch-profiles\%selectedprofile%\config BepInEx\config /s/y/c/v/r/h

echo Your plugins and configs in profile %selectedprofile% have been loaded and old files have been moved to BepInEx\Bepswitch-profiles\oldfiles. Please trash these manually whenever you want.

goto exit

:loadplugins
echo =========================
echo Load plugins will delete your current plugins and load from a saved profile folder. Which folder would you like to load from?
echo 1) Profile-1
echo 2) Profile-2
echo 3) Profile-3
echo 4) Go back to main menu!
echo -
set /p op=Please type the number and press 'return/enter':
if "%op%"=="1" set "selectedprofile=profile-1" & goto cont
if "%op%"=="2" set "selectedprofile=profile-2" & goto cont
if "%op%"=="3" set "selectedprofile=profile-3" & goto cont
if "%op%"=="4" goto start
echo =========================
echo That doesn't seem right! Please type 1, 2, or 3.
goto start

:cont
if not exist "BepInEx\Bepswitch-profiles\%selectedprofile%" goto loaderror

if not exist "BepInEx\Bepswitch-profiles\oldfiles\plugins" mkdir BepInEx\Bepswitch-profiles\oldfiles\plugins

MOVE /y "%~dp0\BepInEx\plugins" "%~dp0\BepInEx\Bepswitch-profiles\oldfiles\plugins\"

xcopy BepInEx\Bepswitch-profiles\%selectedprofile%\plugins BepInEx\plugins /s/y/c/v/r/h

echo Your plugins from profile %selectedprofile% have been loaded and old files have been moved to BepInEx\Bepswitch-profiles\oldfiles. Please trash these manually whenever you want.

goto exit

:loadconfigs
echo =========================
echo Load configs will delete your current configs and load from a saved profile folder. Which folder would you like to load from?
echo 1) Profile-1
echo 2) Profile-2
echo 3) Profile-3
echo 4) Go back to main menu!
echo -
set /p op=Please type the number and press 'return/enter':
if "%op%"=="1" set "selectedprofile=profile-1" & goto cont
if "%op%"=="2" set "selectedprofile=profile-2" & goto cont
if "%op%"=="3" set "selectedprofile=profile-3" & goto cont
if "%op%"=="4" goto start
echo =========================
echo That doesn't seem right! Please type 1, 2, or 3.
goto start

:cont
if not exist "BepInEx\Bepswitch-profiles\%selectedprofile%" goto loaderror

if not exist "BepInEx\Bepswitch-profiles\oldfiles\config" mkdir BepInEx\Bepswitch-profiles\oldfiles\config

xcopy BepInEx\config\BepInEx.cfg BepInEx\Bepswitch-profiles\%selectedprofile%\config\BepInEx.cfg /s/y/c/v/r/h
xcopy BepInEx\config\org.bepinex.valheim.displayinfo.cfg BepInEx\Bepswitch-profiles\%selectedprofile%\config\org.bepinex.valheim.displayinfo.cfg /s/y/c/v/r/h

MOVE /y "%~dp0\BepInEx\config" "%~dp0\BepInEx\Bepswitch-profiles\oldfiles\config\"

xcopy BepInEx\Bepswitch-profiles\%selectedprofile%\config BepInEx\config /s/y/c/v/r/h

echo Your plugins from profile %selectedprofile% have been loaded and old files have been moved to BepInEx\Bepswitch-profiles\oldfiles. Please trash these manually whenever you want.

goto exit

:loaderror
echo =========================
echo The profile you have selected has't been found. Please either create or save the profile.
goto start

:exit
echo -
echo This window will now close.
PAUSE
@exit