#!/bin/zsh

export XDG_CURRENT_DESKTOP=sway
[ "$(tty)" = "/dev/tty1" ] && exec dbus-run-session sway
