#!/bin/sh

if [ "$#" -ne 1 ]; then
    echo "takes ref name as parameter"
    exit 1
fi

git update-ref -d "$1"
