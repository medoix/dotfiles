#!/bin/bash

RESOLUTION='2560x1440'
BASE_URL="https://source.unsplash.com/featured/RESOLUTION/"
BASE_WALLPAPER=~/.images/wallpaper_RESOLUTION.jpeg

function wallpaper_downloader() {
    URL=${BASE_URL/RESOLUTION/$i}
    WALLPAPER=${BASE_WALLPAPER/RESOLUTION/$i}
    RES=$(curl -L "$URL" -o "$WALLPAPER" --create-dirs)

    # Use feh to set WALLPAPER as background before multilockscreen applies affects to it
    feh --bg-scale "$WALLPAPER"
    # Multilockscreen uses the .config/multilock/config settings on WALLPAPER
    betterlockscreen -u "$WALLPAPER"
}

wallpaper_downloader
