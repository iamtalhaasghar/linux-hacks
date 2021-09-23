Problem: Pywal is unable to change background wallpaper on linux mint xfce due to some reason. Here is the hack i previously used.


NOTE: use colorz (pip3 install colorz) as a backend for pywal

-----------------------------------------------------
How to change wallpaper on xfce from terminal?
-----------------------------------------------------

Xfce uses the Xfconf configuration system. To access the xfconf there is a CLI tool xfconf-query. https://docs.xfce.org/xfce/xfconf/xfconf-query

To find out what property is changed when the backgound changes, run the following command in a terminal window:

xfconf-query -c xfce4-desktop -m

...and then change the background using the Settings Manager > Desktop.

The command monitors channel xfce4-desktop for changes. It will tell which property on channel xfce4-desktop is changed.

Then the command to change that property would be like this

 xfconf-query -c xfce4-desktop -p insert_property_here -s path/image

Change propery and path to image accordingly.

======================================================

randomwall.sh

Add this file to crontab or startup applications like this:
bash /path/to/randomwall.sh
otherwise it will not work as it calls subshells in the second line

======================================================
```

$HOME/.local/bin/wal --backend colorz -n -i /mnt/88BC2582BC256C3E/Wallpapers/Wallpapers
/usr/bin/xfconf-query -c xfce4-desktop -p /backdrop/screen0/monitorVGA1/workspace0/last-image -s "$(< "${HOME}/.cache/wal/wal")"
```
