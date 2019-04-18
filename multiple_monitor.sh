#!/bin/sh

# list the current state and displays
# ]$ xrandr --query 

xrandr --output DP-4 --mode 1920x1080 --pos 0x0 --rotate normal \
       --output DP-5 --mode 1920x1080 --pos 1920x0 --rotate normal \
       --output DP-6 --mode 1920x1080 --pos 3840x0 --rotate left
