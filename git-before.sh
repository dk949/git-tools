#!/bin/sh

echo " $* " | grep " --help " -q || echo " $* " | grep " -h " -q && {
    echo "git before DATE [REV]
    
    Print the last commit SHA *before* the given date.

    REV can be used to specify branch/tag to start from (HEAD by default)
    
    This is mostly useful with git diff and git log
    "
    exit 0
}

before=$1
[ -z "$before" ] && { echo "DATE required, see --help for help"; exit 1; }
rev=$2
[ -z "$rev" ] && rev=HEAD

git rev-list -n 1 --first-parent --before="$before" "$rev"
