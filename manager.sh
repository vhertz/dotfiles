#!/bin/bash
set -euo pipefail

# variables
DOTFILES_DIR="$(realpath "$(dirname "$(realpath "${0}")")")"
DEPLOY_LIST="${DOTFILES_DIR}/DEPLOY_LIST"
mapfile -t DOTFILES < "${DEPLOY_LIST}"
SCRIPT_NAME=$(basename "${0}")

# default target
help() {
    echo "Usage: ${0} {list|deploy|clean|init|help}" >&2
    echo
    echo "Commands:" >&2
    echo "  list    Show the dotfiles to deploy." >&2
    echo "  deploy  Create symlink to the dotfiles." >&2
    echo "  clean   Remove the symlinks." >&2
    echo "  init    Initialize to deploy the dotfiles." >&2
    echo "  help    Display this help message." >&2
}

# show the dotfiles to deploy
list() {
    echo "[${SCRIPT_NAME}] List of dotfiles to deploy:"
    for DOTFILE in "${DOTFILES[@]}"; do
        /bin/ls -dF "${DOTFILE}"
    done
}

# create symlink to the dotfiles
deploy() {
    echo "[${SCRIPT_NAME}] Deploy the dotfiles to your home directory."
    for DOTFILE in "${DOTFILES[@]}"; do
        "${DOTFILES_DIR}/etc/deploy.sh" "${DOTFILES_DIR}/${DOTFILE}" "${HOME}/${DOTFILE}"
    done
    echo "[${SCRIPT_NAME}] Deployment completed."
}

# remove the symlinks
clean() {
    echo "[${SCRIPT_NAME}] Remove symlinks in your home directory."
    for DOTFILE in "${DOTFILES[@]}"; do
        "${DOTFILES_DIR}/etc/clean.sh" "${HOME}/${DOTFILE}"
    done
    echo "[${SCRIPT_NAME}] Remove completed."
}

# initialize to deploy the dotfiles
init() {
    echo "[${SCRIPT_NAME}] Initialization started."
    echo "[${SCRIPT_NAME}] Create directories to deploy the dotfiles."
    for DOTFILE in "${DOTFILES[@]}"; do
        "${DOTFILES_DIR}/etc/init.sh" "${HOME}/${DOTFILE}"
    done
    echo "[${SCRIPT_NAME}] Initialization completed."
}

# main script logic to call the appropriate function based on the input
case "${1}" in
    list)
        list
        ;;
    deploy)
        deploy
        ;;
    clean)
        clean
        ;;
    init)
        init
        ;;
    help|*)
        help
        ;;
esac
