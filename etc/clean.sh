#!/bin/bash
set -euo pipefail

REMOVE_TARGET="${1}"
SCRIPT_NAME=$(basename "${0}")

# check the existence of the target file
if [ -e "${REMOVE_TARGET}" ]; then
    # check whether the target file is a symbolic link
    if [ -L "${REMOVE_TARGET}" ]; then
        # remove the symbolic link
        rm -iv "${REMOVE_TARGET}"
    else
        printf "[${SCRIPT_NAME}] We won't remove %s bacause this file is not a symbolic link.\n"\
               "${REMOVE_TARGET}"
    fi
else
    printf "[${SCRIPT_NAME}] %s doesn't exist.\n" "${REMOVE_TARGET}"
fi
