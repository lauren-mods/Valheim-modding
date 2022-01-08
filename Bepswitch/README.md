# Bepswitch
An on-off switch for Bepinex. Now with profiles!

## What's new?

- 3.1 Added the ability to save and/or load ***only*** configs or plugins.

This should make it easier to maintain profiles if you don't need to update configs or plugins.

- 3.0 Now with profiles to save and load plugin and configs.

## What is Bepswitch?

This is a batch (.bat) file that switches Bepinex on and off so you can play either vanilla or modded easily. As of 3.0, it also allows you to save loadouts to a profile and load profiles so you can more easily switch between loadouts. This is useful if you are in different servers or like diferent mods for different worlds.

It is NOT a mod manager in the sense that it does not run in the background while you are playing, so if you have an old potato PC like me, it is very useful!

## How do I install it?

Download the mod and put bepswitch.bat in your Valheim folder.
Depending on your install, this should look like:

D:\Steam\steamapps\common\Valheim

The contents of your folder should look something like this:

![img](https://i.ibb.co/r6CkjN5/valheim-folder.jpg)
I suggest creating a shortcut of the file and putting it in a more easy to find location such as your desktop.


## How do I use it?

Double click on bepswitch.bat to run. You will see this menu:

```
What do you want to do?
-
1) Play Vanilla (disable Bepinex)
2) Play Modded (enable Bepinex)
3) Save a Profile (also creates)
4) Load a Profile
5) Create an Empty Profile
```

**Options 1) & 2) allow you to enable or disable mods (BepInEx only).**
Press 1 to disable mods, press 2 to enable mods. You can do this each time you want to switch.

**Options 3), 4), and 5) let you work with 'profiles' or loadouts.**
***'Save'*** copies all your plugins and config files to a profile folder which is saved in BepInEx\Bepswitch-profiles
***'Load'*** clears your current plugins and configs and copies files ***from*** a profile folder. You must ***save a profile first*** to use ***'Load'***
***'Create'*** will make an empty profile folder for you to manually copy plugins and config to. Useful if you are making a modpack for example.

**NOTE: there are currently 3 profiles available. If you would like me to add more, please message in the comments on nexus or create an issue in Github**

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
