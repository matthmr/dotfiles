### KEYBOARD / MOUSEKEYS ###
xset r rate 220 25
xset b off
# xinput set-prop 11 'libinput Left Handed Enabled' 1
# `xkbset ma` syntax:
#    [mk-delay> <mk_interval> <mk_time_to_max mk-max_speed> <mk_curve]
xkbset ma 30 10 25 15 2
xrdb /home/mh/.Xresources

### DAEMONS ###
# [-z `pidof xbindkeys` ] && xbindkeys &
# [ -z `pidof xcompmgr` ] && xcompmgr &
# [ -z `pidof dunst` ] && dunst &
[ -z `pidof clipmenud` ] && \
	CM_LAUNCHER=dmenu \
	CM_HISTLENGTH=20 \
	CM_MAX_CLIPS=20 \
	CM_SELECTIONS=clipboard \
	clipmenud &
[ -z `pidof nitrogen` ] && nitrogen --restore &

### WINDOW MANAGER ###
exec dbus-launch --exit-with-session $wm
