# /etc/profile

# Set our umask
umask 022

# Append "$1" to $PATH when not already in.
# This function API is accessible to scripts in /etc/profile.d
append_path () {
    case ":$PATH:" in
        *:"$1":*)
            ;;
        *)
            PATH="${PATH:+$PATH:}$1"
    esac
}

# Append our default paths
# append_path '/usr/local/sbin'
# append_path '/usr/local/bin'
append_path '/usr/bin'

# Append our custom paths
append_path '/mnt/ssd/root/bin'
append_path '/mnt/ssd/root/source/bin'
append_path '/home/mh/Source/bin'

# Force PATH to be environment
export PATH

# Load profiles from /etc/profile.d
if test -d /etc/profile.d/; then
	for profile in /etc/profile.d/*.sh; do
		test -r "$profile" && . "$profile"
	done
	unset profile
fi

# Unload our profile API functions
unset -f append_path

# Source global bash config, when interactive but not posix or sh mode
if test "$BASH" &&\
   test "$PS1" &&\
   test -z "$POSIXLY_CORRECT" &&\
   test "${0#-}" != sh &&\
   test -r /etc/bash.bashrc
then
	. /etc/bash.bashrc
fi

# Termcap is outdated, old, and crusty, kill it.
unset TERMCAP

# Man is much better than us at figuring this out
unset MANPATH

# Sets qt5ct variable
export QT_QPA_PLATFORMTHEME=qt5ct 

# Clipmenu daemon
export CM_SELECTIONS="clipboard"
export CM_MAX_CLIPS=5
export CM_LAUNCHER="rofi"

# Editor fix
export EDITOR=vim
