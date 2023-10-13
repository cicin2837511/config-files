#!/bin/bash

picom -b &
nitrogen --set-zoom-fill wallpapers-catppuccin/landscapes/forrest.png
/usr/bin/emacs --daemon &
xrandr --output DVI-D-0 --right-of HDMI-0
