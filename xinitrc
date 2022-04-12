source /etc/X11/xinit/xinitrc.d/50-systemd-user.sh
xrdb -merge ~/.Xresources
export SSH_AUTH_SOCK
xbindkeys
exec i3
