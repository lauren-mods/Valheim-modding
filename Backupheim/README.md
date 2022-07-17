# Backupheim

A batch file to quickly backup local character and world save files.
[Github](https://github.com/lauren-aka-proudunicornmods/Backupheim)
[Nexus](https://www.nexusmods.com/valheim/mods/1325)

[Click here to see what's new.](https://github.com/lauren-mods/Valheim-modding/blob/main/Backupheim/Changelogs.md)

## What does it do?

Backupheim is a batch file that you run (double click) to update either your world files, your character files, or both.

It **does not work while the game is running**. You must close the game to run Backupheim.

It **does not currently back up cloud saves**. There is a beta which may or may not work. If you can help with testing, please respond to the issue [here](https://github.com/lauren-mods/Valheim-modding/issues/2).

It copies files from the **default save-game location** on Windows PCs to a backup folder in the **same location as the batch file**.  

It is a ***manual backup not automatic*** so you will need to ***run backupheim.bat every time you want to back up!***

## How do I install it?

1. Put backupheim.bat anywhere on your computer.
2. Double click to run.
    *Note: When you first run backupheim.bat, a folder will be created next to it called Valheim-Backups. This is where your backups will go. If you do not like the location, either move backupheim.bat and run it again, or [#editing-the-batch-file](edit the batch file).*

3. Backupheim will give you four options, type the number for the option you want, and then press return/enter.

*You should now see alll the files being copied over.*

You're done!

## Editing the batch file

### Source locations

If backupheim is not finding your files, you may need to edit the source locations.  
Right-click on backupheim.bat and select 'open with' a text editor of your choice (Notepad is fine).  
Find the section that looks like this:

```batch
rem Source folder setup. You can edit these if they don't work for you!

set "worldsource=C:\Users\%username%\AppData\LocalLow\IronGate\Valheim\worlds"
set "charsource=C:\Users\%username%\AppData\LocalLow\IronGate\Valheim\characters"
```

and edit the paths ```C:\Users\%username%\AppData\LocalLow\IronGate\Valheim\worlds``` and ```C:\Users\%username%\AppData\LocalLow\IronGate\Valheim\characters``` so they match your folder locations. If you need help, contact me on the Nexus forums :)

Be careful with the quotation marks - it is easy to delete one by accident!

### Destination locations

For destination locations, you will need the section that looks like this:

```batch
rem Edit 'Valheim-Backups' here (2x) to change the folder name.
mkdir %~dp0\Valheim-Backups\%datestring%
set "destination=%~dp0\Valheim-Backups\%datestring%"
```

You can see `%~dp0\Valheim-Backups\` is written 2 times. Edit this, and make sure it is the same both times.
Do not remove `%datestring%` at the end of the path. This is what creates a dated backup folder!

Again, if you need help, you can contact me on the Nexus page :)
