#!/bin/sh

clear
if [ $# -eq 0 ]; then
    git status .
else
    git status "$@"
fi
