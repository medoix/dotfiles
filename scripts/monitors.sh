#!/bin/bash
intern=eDP-1
extern=HDMI-1

if xrandr | grep "Virtual1 connected"; then
    xrandr --output "Virtual1" --mode 1920x1200 --dpi 115
elif xrandr | grep "$extern disconnected"; then
    xrandr --output "$extern" --off --output "$intern" --auto
else
    xrandr --output "$intern" --off --output "$extern" --auto
fi
