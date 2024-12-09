#!/bin/bash

set -e

declare -a pass_through_args
retry_limit=3
retry_delay=300s

while [ $# -ne 0 ]; do
    case "$1" in
        -l|--retry-limit)
            shift
            retry_limit=$1
            [ -z "$retry_limit" ] && { echo "retry limit requires an argument"; exit 1; }
            shift
            ;;
        -r|--retry-delay)
            shift
            retry_delay=$1
            [ -z "$retry_delay" ] && { echo "retry delay requires an argument"; exit 1; }
            shift
            ;;
        -C)
            shift
            git_C="-C $1"
            shift
            ;;
        -h|--help)
            echo "Usage: $(basename "$0") [-r] [-l] [OPTIONS]


    -r, --retry-delay DELAY             how long to wait between retries
                                        (default 300s)
    -l, --retry-limit LIMIT             maximum number of retries
                                        (default 3)

    -C DIRNAME                          passed through to git

    -h, --help

    All other arguments are passed thought to 'git push'
"
            exit 0
            ;;
        *)
            pass_through_args+=("$1")
            shift
            ;;
    esac
done

for i in $(seq "$retry_limit"); do
    if ! git $git_C push "${pass_through_args[@]}"; then
        echo "'git${git_C:+ $git_C} push${pass_through_args[*]:+ ${pass_through_args[*]}}' failed ($i/$retry_limit)"
    else
        exit 0
    fi
    sleep "$retry_delay"
done
exit 1
