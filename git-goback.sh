#!/bin/sh

___FILE=
___HEAD=
if [ $# = 1 ];then
    ___FILE="$1"
    ___HEAD="HEAD"
elif [ $# = 2 ];then
    ___FILE="$1"
    ___HEAD="HEAD~$2"
else
    echo "Usage: $0 [NUM_COMMITS(HEAD by default)]"
    exit 1
fi


git checkout "$___HEAD" -- "$___FILE"
unset ___FILE
unset ___HEAD
