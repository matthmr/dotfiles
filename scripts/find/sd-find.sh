#!/usr/bin/sh

sd_find() {
	grep -rwin "$1" /home/mh/Git/MH/sd/ --exclude='tags' --exclude='Doxyfile' --exclude='*.[oa]' --exclude='*.html' --exclude-dir=.git --color
}

sd_find "$1"
