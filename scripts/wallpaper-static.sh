#!/bin/bash

WALLPAPER=~/.images/wallpaper.jpeg

# Use feh to set WALLPAPER as background before multilockscreen applies affects to it
feh --bg-scale "$WALLPAPER"
# Multilockscreen uses the .config/multilock/config settings on WALLPAPER
multilockscreen -u "$WALLPAPER"
