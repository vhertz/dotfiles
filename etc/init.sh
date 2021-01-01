#!/bin/sh

DEPLOY_FILE="$1"
DEPLOY_DEST=$(dirname "$1")

if [ ! -d "$DEPLOY_DEST" ]; then
    printf "[+] %s: %s doesn't exist, so we create that.\n"\
           "$DEPLOY_FILE" "$DEPLOY_DEST"
    mkdir -pv "$DEPLOY_DEST"
else
    printf "[+] %s: %s is already exists, so skipped.\n" "$DEPLOY_FILE" "$DEPLOY_DEST"
fi
