### DEPRECATED ###
# xrandr --setprovideroutputsource modesetting NVIDIA-0

### XINPUT CONFIGS ###
xset r rate 220 25
xkbset ma 60 10 10 5 2
xrdb /home/mh/.Xresources
# xinput --set-prop 11 'libinput Left Handed Enabled' 1

### DAEMONS ###
# [-z `pidof xbindkeys` ] && xbindkeys &
# [ -z `pidof picom` ] && picom &
[ -z `pidof nitrogen` ] && nitrogen --restore &

BASH=`pidof bash`

if [ -z $BASH ]; then
	clock &
else

	ZOMBIE_SLEEP_PID=`pgrep sleep --list-full | grep 'sleep 90' | cut -f 1 -d ' '`
	[ ! -z $ZOMBIE_SLEEP_PID ] && kill -KILL $ZOMBIE_SLEEP_PID
	
	clock &
fi

[ -z `pidof clipmenud` ] && clipmenud &

### WINDOW MANAGER ###
if [[ $WM = 'dwm' ]]
then
	exec dwm
elif [[ $WM = 'awesome' ]]
	exec awesome
else
	# fallback
	exec twm
fi
