#! /bin/bash

compton &
nitrogen --restore &
unclutter &
dunst &
"/usr/lib/polkit-gnome/polkit-gnome-authentication-agent-1" & \
    "eval$(gnome-eyring-daemon -s --components=pkcs11,secrets,ssh,gpg)" &
