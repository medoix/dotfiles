source /etc/X11/xinit/xinitrc.d/50-systemd-user.sh
xrdb -merge ~/.Xresources
xbindkeys
#xss-lock -- ~/.scripts/lock.sh
exec i3
