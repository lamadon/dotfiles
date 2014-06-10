#!/bin/sh

/usr/bin/VBoxClient-all &
xrdb -merge ~/.Xresources
exec awesome
