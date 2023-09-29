#!/bin/sh

if [ "$#" -ne 1 ]; then
    echo "Usage: $(basename "$0") REF"
    exit 1
fi

git update-ref -d "$1"
