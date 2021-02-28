#!/usr/bin/bash

convert $(ls $1-*.png | sort -n -k 1.$(expr length "$1-" + 1)) -delay 5 -density 600 $1.gif
