#!/bin/bash
set -euo pipefail

DEPLOY_SRC="${1}"
DEPLOY_DST="${2}"
SCRIPT_NAME=$(basename "${0}")

# check the existence of the target file
if [ -e "${DEPLOY_DST}" ]; then
    printf "[${SCRIPT_NAME}] %s is already exists.\n" "${DEPLOY_DST}"

    # check whether the target file is a symbolic link
    if [ -L "${DEPLOY_DST}" ]; then
        # Ask users whether we can overwrite the symlink
        ln -snvi "${DEPLOY_SRC}" "${DEPLOY_DST}" || true
    else
        # Save the original files by appending the "*.dotbak" suffix.
        printf "[${SCRIPT_NAME}] Rename %s to %s.dotbak\n" "${DEPLOY_DST}" "${DEPLOY_DST}"
        mv -iv "${DEPLOY_DST}" "${DEPLOY_DST}.dotbak"
        ln -snv "${DEPLOY_SRC}" "${DEPLOY_DST}"
    fi
else
    ln -snv "${DEPLOY_SRC}" "${DEPLOY_DST}"
fi
