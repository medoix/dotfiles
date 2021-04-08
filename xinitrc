source /etc/X11/xinit/xinitrc.d/50-systemd-user.sh
export SSH_AUTH_SOCK
setxkbmap -layout us -variant intl
xbindkeys
exec i3
