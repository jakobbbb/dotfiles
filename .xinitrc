export XDG_CONFIG_HOME=$HOME/.config
export GTK_THEME="Arc-Dark"
export GTK2_RC_FILES="$HOME/.gtkrc-2.0"
export QT_QPA_PLATFORMTHEME=gtk2

# export XMODIFIERS=@im=fcitx
# export GTK_IM_MODULE=fcitx
# export QT_IM_MODULE=fcitx
# export QT5_IM_MODULE=fcitx
# fcitx5 -dr

xrandr --setprovideroutputsource modesetting NVIDIA-0
xrandr --auto

i3

xrdb -merge ~/.Xresources

