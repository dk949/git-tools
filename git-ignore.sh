#!/bin/sh
failMsg() {
    printf "fatal: not a git repository (or any parent up to mount point \/)\nStopping at filesystem boundary (GIT_DISCOVERY_ACROSS_FILESYSTEM not set)."
    exit 1
}

CURRENT=$PWD
GIT="$(git rev-parse --git-dir 2> /dev/null)" || failMsg
GIT=$(cd "$GIT/.." || exit 1; pwd)
cd "$GIT" || exit 1

if [ -z "${CURRENT#$GIT}" ]; then
    echo "$1" >> ./.gitignore
else
    echo "${CURRENT#$GIT}"/"$1" >> ./.gitignore
fi

cd "$CURRENT" || exit 1
