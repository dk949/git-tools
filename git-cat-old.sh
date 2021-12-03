#!/bin/sh

if [ $# -ne 2 ]; then
    echo "Usage: $(basename "$0") REVISION FILE"
    exit 1
fi

___REV="$1"
___FILE="$2"

git cat-file blob "${___REV}:${___FILE}"
