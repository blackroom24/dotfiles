#!/bin/sh
#
# ~/.xinitrc
#
# Executed by startx (run your window manager from here)

userresources=$HOME/.config/X11/Xresources
usermodmap=$HOME/.config/X11/Xmodmap
xprofile=$HOME/.xprofile

[ -f "$userresources" ] && xrdb -merge "$userresources"

[ -f "$usermodmap" ] && xmodmap "$usermodmap"

[ -f "$xprofile" ] && . "$xprofile"

# exec openbox-session
exec dwm
# exec awesome
