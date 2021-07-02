#!/bin/sh

if [ "$#" -ne 1 ]; then
    REMOTE_NAME="origin"
else
    REMOTE_NAME="$1"
fi

git remote show "$REMOTE_NAME" | sed -n '/HEAD branch/s/.*: //p'
