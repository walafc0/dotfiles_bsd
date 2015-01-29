#!/bin/sh

setxkbmap -model latitude -layout us -variant intl terminate:ctrl_alt_bksp
xrdb -merge ~/.Xresources            # Read rxvt configuration
xset b 0                             # Turn off beep
urxvtd -q -f -o                      # Start xrvt in daemon mode
feh --bg-fill   ~/Pictures/wallpaper # Set wallpaper
wmname LG3D                          # Usefull for Java application

SUDO_ASKPASS="$HOME/bin/dmenu_passwd"
export SUDO_ASKPASS

while [ true ]; do
    TIME=$(localtime)
    PLAYER=$(cmusinfo)
    VOL=$(volumeinfo)
    POWER=$(powerinfo)
    RESOURCES=$(resourcesinfo)

    xsetroot -name "$POWER | $VOL | $TIME;$RESOURCES | $PLAYER"
    sleep 1
done &

exec dwm 2> ~/.dwm/log

