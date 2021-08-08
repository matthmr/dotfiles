#!/bin/sh
echo "Mounting /dev/sda1 onto /mnt/hdd . . ."
([ -e /mnt/hdd/home ] && echo "HDD is already mounted at /mnt/hdd") || mount /dev/sda1 /mnt/hdd && echo "Done!"

echo "Changing keyboard layout . . ."
setxkbmap br
echo "Done!"

HISTSIZE=200
PATH="$PATH:/mnt/hdd/bin:/mnt/hdd/bin/usr/bin"
export PATH

echo "Press any key to boot . . ."
read tmp

startx
