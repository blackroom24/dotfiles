#! /bin/sh
userresources="$HOME/.config/X11/Xresources"
usermodmap="$HOME/.config/X11/Xmodmap"
xprofile="$HOME/.config/X11/xprofile"

[ -f "$userresources" ] && xrdb -merge "$userresources"
[ -f "$usermodmap" ] && xmodmap "$usermodmap"
[ -f "$xprofile" ] && . "$xprofile"


# start wm
exec dwm
