#!/bin/sh
unknown_switch(){
    echo "error: unknown switch \`$1'"
}
too_many_opts(){
    echo "error: too many options"
}

USAGE="usage: git nuke [<options>]

    -n, --no-checkout       do not checkout default branch (much faster, does not require internet)
    -h, -?, --help          print this message
    "

if [ "$#" -eq 0 ]; then
    CHECK_DEFAULT=1
elif [ "$#" -eq 1 ]; then
    case $1 in
        "-n"|"--no-checkout")
            CHECK_DEFAULT=
            ;;
        "-h"|"-?"|"--help")
            echo "$USAGE"
            exit 1
            ;;
        *)
            unknown_switch "$1"
            echo "$USAGE"
            exit 1
            ;;
    esac
else
    too_many_opts
    echo "$USAGE"
    exit 1
fi

git reset --hard
git submodule foreach --recursive 'git reset HEAD . || :'
git submodule foreach --recursive 'git checkout -- . || :'
[ -z "$CHECK_DEFAULT" ] || git submodule foreach --recursive 'git checkout "$(git get-default)" || :'
git submodule update --init --recursive
[ -z "$CHECK_DEFAULT" ] || git checkout "$(git get-default)"
git clean -d -f -f -x
git submodule foreach --recursive git clean -d -f -f -x
