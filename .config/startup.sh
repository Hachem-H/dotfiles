#!/usr/bin/env sh

WALLPAPER="rita.jpg"

xrandr --output HDMI-0 --right-of eDP-1-1 --dpi 96 --auto --primary \
       --output eDP-1-1 --dpi 96 --auto
feh --bg-fill --no-fehbg $HOME/Pictures/Wallpapers/$WALLPAPER

dunst &
picom -b

flameshot &
blueman-applet &
mailspring --password-store="gnome-libsecret" -b &

rogauracore white
rogauracore brightness 3

xset -dpms
xset s off

sh $HOME/.config/polybar/launch.sh

sleep 1

