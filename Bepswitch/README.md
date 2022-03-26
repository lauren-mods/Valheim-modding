# Bepswitch

An on-off switch for Bepinex. Now with profiles!

## What's new in 4.0?

[Full changelog here](https://github.com/lauren-mods/Valheim-modding/blob/main/Bepswitch/changelogs.md)

Bepswitch 4.0 is a completely new version and install and use instructions have changed. It now looks at a list of files (and optionally a list of folders) to copy to your plugins directory.

If you prefer the old (3.0) version, it will remain available [here](https://github.com/lauren-mods/Valheim-modding/blob/main/Bepswitch/thunderstore-packs/bepswitch-3-1.zip), and the old readme is [here](https://github.com/lauren-mods/Valheim-modding/blob/main/Bepswitch/3-0-readme.md).

## What is Bepswitch?

This is a batch (.bat) file that you can use to:

- load a list of plugins
- switch Bepinex on and off

The options menu is:

```text
1) Clear plugins
2) Load plugins from a list
3) Switch BepInEx off (vanilla)
4) Switch BepInEx on (modded)
5) HELP
6) Quit
```

It is NOT a mod manager in the sense that it does not run in the background while you are playing, so if you have an old potato PC like me, it is very useful!

## How do I set it up?

### 1. Put bepswitch.bat in your MAIN Valheim folder

e.g. `D:\Steam\steamapps\common\Valheim\bepswitch.bat`

![img](https://github.com/lauren-mods/Valheim-modding/blob/main/Bepswitch/valheim-folder.jpg)

### 2. Run Bepswitch setup

Double click Bepswtich.bat to run and choose Quit (6) to exit (or just close the window).

It will create a folder called Bepswitch inside your Bepinex folder.

You only need to do this the first time.

### 3. Put all your plugins in the plugins-master folder

This is where they will be copied from. It should contain ALL the plugins for ALL profiles. When you update your plugins, make sure to update them here.

### 5. Create and edit profiles

Make a list of all the files (.dll) in your plugins folder in the list.txt file for your profile, and a list of any folders in the folders.txt file (some mods like Planbuild have folders).

You can repeat for profiles 1, 2 and 3. There are 3 max but you can edit this in the batch file or ask me.

## 6. Load a profile

Run (double click) bepswitch.bat.

Choose 1 to clear your old plugins.

Choose 2 to load from a profile and the plugins will be copied across from the master folder.

## How do I ask questions / give feedback?

Let me know in the Nexus comments or Github :)

## Why did you make it?

I made this because I prefer to manage mods manually rather than using a manager due to my potato pc, and did not want to have to edit files each time I wanted to play vanilla.

I also like learning new code-ish stuff, and figuring this out was fun :)

## Credits
The idea for this was from here:
https://steamcommunity.com/app/892970/discussions/0/3069740625181087689/?l=portuguese

Sample code for first iteration was from here:
https://stackoverflow.com/questions/4051294/how-to-overwrite-existing-files-in-batch

Thanks to LuxZg on Nexus who pointed me to here: https://stackoverflow.com/questions/60034/how-can-you-find-and-replace-text-in-a-file-using-the-windows-command-line-envir

LuxZg also explained to me about replacing strings, so if you like this version 2.0, maybe give them a kudos too :)
