#!/bin/sh
REMOTE=$(git remote)
BRANCH=$(git branch --show-current)
if [ "$(echo "$REMOTE" | wc -l)" -gt 1 ]; then
    echo "Too many remotes"
    exit 1
fi

git push -u "$REMOTE" "$BRANCH"
