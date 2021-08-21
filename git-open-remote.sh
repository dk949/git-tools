#!/bin/sh

if [ "$#" -ne 1 ]; then
    echo "remote origin"
    REMOTE_NAME="origin"
else
    echo "remote $1"
    REMOTE_NAME="$1"
fi


REMOTE_URL=$(git remote get-url "$REMOTE_NAME")

case "$REMOTE_URL" in
  *@*)
      REMOTE_URL="https://$(echo "$REMOTE_URL" | cut -d'@' -f2 | sed 's/:/\//')"
    ;;
esac


eval nohup "$BROWSER" "$REMOTE_URL" 1>/dev/null 2>/dev/null </dev/null  &
