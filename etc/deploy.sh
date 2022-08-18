#!/bin/sh

DEPLOY_SRC="$1"
DEPLOY_DST="$2"

if [ -e "$DEPLOY_DST" ]; then
    printf "[+] %s is already exists.\n" "$DEPLOY_DST"
    if [ -L "$DEPLOY_DST" ]; then
        # Ask users whether we can overwrite the symlink
        ln -snvi "$DEPLOY_SRC" "$DEPLOY_DST"
    else
        # Save the original files by appending the "*.dotbak" suffix.
        printf "[+] Rename %s to %s.dotbak\n" "$DEPLOY_DST" "$DEPLOY_DST"
        mv -iv "$DEPLOY_DST" "${DEPLOY_DST}.dotbak"
        ln -snv "$DEPLOY_SRC" "$DEPLOY_DST"
    fi
else
    ln -snv "$DEPLOY_SRC" "$DEPLOY_DST"
fi
