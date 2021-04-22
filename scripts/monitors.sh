#!/bin/bash
virtual=Virtual1
intern=eDP-1
extern1=DP-1
extern2=DP-2

if xrandr | grep "$virtual connected"; then
    xrandr --output "$virtual" --mode 1920x1200 --dpi 115
elif xrandr | grep "$extern1 connected"; then
    xrandr --output "$intern" --mode 1920x1080 --dpi 115
    #xrandr --output "$extern1" --scale 0.7 --above "$intern" --auto
    xrandr --output "$extern1" --scale 1 --above "$intern" --mode 2560x1440
elif xrandr | grep "$extern2 connected"; then
    xrandr --output "$intern" --mode 1920x1080 --dpi 115 
    xrandr --output "$extern2" --above "$intern" --auto
else
    xrandr --output "$intern" --mode 1920x1080 --dpi 115
fi
