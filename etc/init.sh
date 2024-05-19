#!/bin/bash
set -euo pipefail

DEPLOY_FILE="${1}"
DEPLOY_DEST=$(dirname "${1}")
SCRIPT_NAME=$(basename "${0}")

# check the existence of the target file
if [ ! -d "${DEPLOY_DEST}" ]; then
    printf "[${SCRIPT_NAME}] %s: %s doesn't exist, so we create that.\n"\
           "${DEPLOY_FILE}" "${DEPLOY_DEST}"
    # create the directory
    mkdir -pv "${DEPLOY_DEST}"
else
    printf "[${SCRIPT_NAME}] %s: %s is already exists, so skipped.\n" "${DEPLOY_FILE}" "${DEPLOY_DEST}"
fi
