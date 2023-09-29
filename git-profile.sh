#!/bin/sh
set -e

DIR_NAME=949-git-tools
FILE_NAME=profiles

die() {
    echo "$@" 2> /dev/null
    exit 1
}

get_config_dir() {
    if [ -n "$XDG_CONFIG_HOME" ]; then
        echo "$XDG_CONFIG_HOME/$DIR_NAME"
    elif [ -d "$HOME/.config" ]; then
        echo "$HOME/.config/$DIR_NAME"
    else
        echo "$HOME/.$DIR_NAME"
    fi
}

usage() {
    [ -n "$2" ] && echo "$2" && echo
    echo "Usage: $(basename "$0") PROFILE [OPTIONS]

        -c|--config FILE    use FILE instead of the defautl config

        -y|--yes            do not prompt, just apply the profile

        -l|--list           list availabel profiles
           --list-full      list profiles along with their rules (print config file)

        --global            set profile globally (default local)
        --local             set profile locally

        -h|--help           print this message and exit
"
    exit "$1"
}

list() {
    if [ "$LIST" = 1 ];then
        awk '/\[/ {$0 = gensub(/^[[:space:]]*\[([^\]]*)\][[:space:]]*$/, "\\1","g", $0); print $0}' "$CONFIG"
    else
        cat "$CONFIG"
    fi
    exit 0
}

SCOPE=--local

while [ $# -ne 0 ]; do
    case "$1" in
        -h|--help)
            usage 0
            ;;
        --global)
            SCOPE=--global
            shift
            ;;
        --local)
            SCOPE=--local
            shift
            ;;
        -c|--config)
            shift
            [ -z "$1" ] && die "expected a value after -c/--config"
            CONFIG=$1
            shift
            ;;
        -y|--yes)
            YES=1
            shift
            ;;
        -l|--list)
            LIST=1
            shift
            ;;
        --list-full)
            LIST=2
            shift
            ;;
        *)
            if [ -z "$PROFILE" ]; then
                PROFILE=$1
            else
                usage 1 "Can only specify one profile"
            fi
            shift
    esac
done

if [ -z "$LIST" ]; then
    [ -n "$PROFILE" ] || usage 1 "Please specify a profile to use"
fi

[ -z "$CONFIG" ] && CONFIG="$(get_config_dir)/$FILE_NAME"
[ -f "$CONFIG" ] || die "could not locate config file '$CONFIG'"

[ -n "$LIST" ] && list

DATA=$(awk -v prof="$PROFILE" '
function rm_comments_and_space(str) {
    sub(/[[:space:]]*(#.*)?$/,"", str)
    sub(/^[[:space:]]*/,"", str)
    return str
}

/\[/ {
    line = rm_comments_and_space($0)
    regex = "^\\[" prof "\\]$"
    if (line ~ regex) do_print = 1
    else do_print = 0
}

do_print {
    if ($0 !~ /^[[:space:]]*$/ && $0 !~ /^[[:space:]]*#/) {
        line = rm_comments_and_space($0)
        print line
    }
}

' "$CONFIG")

[ -n "$DATA" ] || die "Could not find profile '$PROFILE' in config '$CONFIG'"
DATA=$(echo "$DATA" | tail -n +2)

echo "The following settings will be changed $(echo "$SCOPE" | cut -c3-)ly:

$DATA"

while [ -z "$YES" ] && true; do
    printf "Apply? [y/N]: "
    read -r yn
    case $yn in
        [yY])
            break
            ;;
        [nN]|"")
            die "Profile '$PROFILE' will NOT be applied"
            ;;
        *)
            echo "Please select either y or n"
            ;;
    esac
done

IFS='
'
for i in $DATA; do
    KEY="$(echo "$i" | awk '{print $1}')"
    VAL="$(echo "$i" | awk '{for(i=2;i <NF;i++) printf $i " " ; print $NF}')"
    git config "$SCOPE" "$KEY" "$VAL"
done
