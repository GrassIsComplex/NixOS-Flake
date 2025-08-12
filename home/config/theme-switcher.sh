#!/usr/bin/env bash

if [[ "$1" == "lain" ]]; then
        hyprlandcol="$HOME/.config/hypr/laincolors.conf"
        waybarcol="$HOME/.config/waybar/laincolors.css"
        wallpaper="$HOME/.config/hypr/wallpapers/lain.png"
elif [[ "$1" == "p3" ]]; then
        hyprlandcol="$HOME/.config/hypr/p3colors.conf"
        waybarcol="$HOME/.config/waybar/p3colors.css"
        wallpaper="$HOME/.config/hypr/wallpapers/p3.png"
elif [[ "$1" == "p5" ]]; then
        hyprlandcol="$HOME/.config/hypr/p5colors.conf"
        waybarcol="$HOME/.config/waybar/p5colors.css"
        wallpaper="$HOME/.config/hypr/wallpapers/p5.png"
else
        echo "Invalid argument"
        exit 1
fi

cp -f $hyprlandcol "$HOME/.config/hypr/colors.conf"
cp -f $waybarcol "$HOME/.config/waybar/colors.css"

killall -SIGUSR2 waybar
hyprctl reload config-only
hyprctl keyword source $hyprlandcol
hyprctl hyprpaper wallpaper ",$wallpaper" &

