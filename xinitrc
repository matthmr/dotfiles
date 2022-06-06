### KEYBOARD / MOUSEKEYS ###
# `xkbset ma` syntax:
#    [mk-delay> <mk_interval> <mk_time_to_max mk-max_speed> <mk_curve]
xkbset ma 30 10 25 15 2 &
xset b off &
xrdb /home/mh/.Xresources &

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
