# Thumbnail generator script for gnome for Universal VTT file format

## Overview

The [Universal Virtual Tabletop file format](https://arkenforge.com/universal-vtt-files/) is used to package a map and additional details such as lighting, walls, etc for use by Virtual Tabletop (VTT) programs such as [Fantasy Grounds](https://www.fantasygrounds.com/), [FoundryVTT](https://foundryvtt.com/), [RPTools Maptool](https://github.com/RPTools/maptool), [Roll20](https://roll20.net/), etc. These files are typically generated with map/scene authoring tools such as [DungeonDraft](https://dungeondraft.net/), [Dungeon Fog](https://www.dungeonfog.com/), [Master's Toolkit](https://arkenforge.com/), etc.

## How to use this

NOTE: Due to the way that nautilus uses `bwrap` to call thumbnailers, I struggled to install this for only one user. So this is machine-wide configuration/install.

To setup/install this tool in your system settings (/share):

1. Install [jq](https://jqlang.github.io/jq/) and [ImageMagick](https://imagemagick.org/index.php) on your system using the package manager of choice for your install. Or download them from the providers. Or get the source and build them yourself, if appropriate and possible. The `jq` and `convert` commands from these tools must be on your PATH.
1. Register the mime type `text/x-universal-vtt-file` for your system like:
    ```
    xdg-mime install --novendor register-uvtt-mime-type-xdg-mime.xml
    ```
1. Put the included shell script `uvtt-thumbnailer.sh` in `/usr/local/bin` and ensure the ownership/permissions are correct like:
    ```
    sudo cp uvtt-thumbnailer.sh /usr/local/bin
    sudo chown root.root /usr/local/bin/uvtt-thumbnailer.sh
    sudo chmod 755 /usr/local/bin/uvtt-thumbnailer.sh
    ```
1. Install the `universal-vtt-file.thumbnailer` on your system in /usr/share/thumbnailers` like:
    ```
    sudo mkdir -p /usr/share/thumbnailers
    sudo cp ./universal-vtt-file.thumbnailer /usr/share/thumbnailers
    ```
1. Clear your failed thumbnail cache like:
    ```
    rm -rf $HOME/.cache/thumbnails/fail/*
    ```
1. Shutdown and restart nautilus to pickup these changes:
    ```
    nautilus -q && nautilus &
    ````
