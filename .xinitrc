export XDG_CONFIG_HOME=$HOME/.config
export GTK_THEME="Arc-Dark"
export GTK2_RC_FILES="$HOME/.gtkrc-2.0"
export QT_QPA_PLATFORMTHEME=gtk2

# export XMODIFIERS=@im=fcitx
# export GTK_IM_MODULE=fcitx
# export QT_IM_MODULE=fcitx
# export QT5_IM_MODULE=fcitx
# fcitx5 -dr

/usr/lib/xdg-desktop-portal-gtk &

source /etc/X11/xinit/xinitrc.d/50-systemd-user.sh

eval $(/usr/bin/gnome-keyring-daemon --start --components=secrets)
export GNOME_KEYRING_CONTROL GNOME_KEYRING_PID


i3

xrdb -merge ~/.Xresources

