#!/bin/sh

usage() {
    echo "Usage: $(basename "$0") PATH [LOC]
    PATH            file to ignore
    LOC             location of the gitignore file (local|base)
"
    exit "$1"
}

echo " $* " | grep " --help " -q || echo " $* " | grep " -h " -q && usage 0

path="$1"
[ -z "$path" ] && usage 1
loc=base
[ -n "$2" ] && loc="$2"

dot_git_dir="$(git rev-parse --git-dir 2> /dev/null)" || {
    echo "Not a git directory"
    exit 1
}

base_dir=$(realpath "$dot_git_dir"/..)

case $loc in
    base) work_dir=$base_dir;;
    local) work_dir=$PWD;;
    *) usage 1
esac

[ -e "$path" ] || echo "Warning: $path does not exist, but will be added to gitignore"

realpath -s --relative-to="$work_dir" "$path" >> "$work_dir/.gitignore"
