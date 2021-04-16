===================================================
# STEP 1 => FOR LOGIN SCREEN
===================================================
#Permanently adding undetected resolutions

Once a suitable resolution is found using xrandr, the mode can be permanently added by creating an entry in /etc/X11/xorg.conf.d/:

/etc/X11/xorg.conf.d/10-monitor.conf

Section "Monitor"
    Identifier "VGA1"
    Modeline "1280x1024_60.00"  109.00  1280 1368 1496 1712  1024 1027 1034 1063 -hsync +vsync
    Option "PreferredMode" "1280x1024_60.00"
EndSection

Section "Screen"
    Identifier "Screen0"
    Monitor "VGA1"
    DefaultDepth 24
    SubSection "Display"
        Modes "1280x1024_60.00"
    EndSubSection
EndSection

Section "Device"
    Identifier "Device0"
    Driver "intel"
EndSection

===================================================
# STEP 2 => FOR DESKTOP
===================================================
Edit: ~/.config/xfce4/xfconf/xfce-perchannel-xml/displays.xml
and remove all undesired resolutions.
===================================================
# STEP 3 => Reboot System
===================================================
======================================================================================================
# STEP 4 => Go to Menu > Display > Change Resolution to 1280 x 1024 and save new configuration. (Until you dont save config for desired resolution. The problem won't fix)
======================================================================================================
