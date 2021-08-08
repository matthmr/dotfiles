# Root's .bashrc

# If not running interactively, don't do anything << who the fuck wrote this?
[[ $- != *i* ]] && return
. ~/.bash_aliases

# Pretty colours go k21uj09edu1w0duhbw189bdud91d
# Uncomment this to have a 'normal' prompt
PS1='[\[\e[32m\]mh\[\e[0m\]@\[\e[32m\]arch\[\e[0m\] \[\e[34m\]\w\[\e[0m\]]$ '
# PS1='[\[\e[32m\]mh\[\e[0m\]@\[\e[32m\]arch\[\e[0m\] \[\e[34m\]\w\[\e[0m\]]$' | sed -e "s/\/mnt\/hdd\/home/\*/g"
HD="/mnt/hdd"

# * Functions
# Function to change the path to include more directories :)
function update_path() {
	PATH="$PATH:/mnt/hdd/bin/usr/bin"
}

function clock_now() {
	xsetroot -name "$(date)"
}

update_path
export PATH
