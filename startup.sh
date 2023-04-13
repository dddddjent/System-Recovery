#!/bin/bash

# Display Edge on virtual desktop 1
wmctrl -s 1
microsoft-edge-stable &
sleep 5

# Switch back to desktop 0
wmctrl -s 0

/usr/bin/emacs --daemon
