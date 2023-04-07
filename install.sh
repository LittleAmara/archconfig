#/usr/bin/env bash

set -e

REPO_PATH="$( cd -- "$(dirname "$0")" >/dev/null 2>&1 ; pwd -P )"
BACKUP_DIR="${HOME}/.dotfiles.backup/"
RED='\033[0;31m'
GREEN='\033[0;32m'
BLUE='\033[0;34m'

fatal() {
    echo -e "${RED}$*"
    exit 1
}

info() {
    echo -e "${BLUE}$*"
}

good() {
    echo -e "${GREEN}$*"
}

make_backup() {
    [[ "$#" -eq 0 ]] && fatal "You need to specify an absolute path to a directory/file you want to backup"

    local TARGET="$1"

    mkdir -p "$BACKUP_DIR"
    [[ -f "TARGET" ]] && mv "$TARGET" "$BACKUP_DIR"
    [[ -d "TARGET" ]] && mv "$TARGET" "$BACKUP_DIR"
    info "$TARGET is backed up in $BACKUP_DIR"
}

# Requires an argument : the subpath to the directory in this repo
install_config() {
    [[ "$#" -eq 0 ]] && fatal "You need to specify a config directory/file to install"

    local TARGET="${REPO_PATH}/$1"
    local DST="${HOME}/$1"

    ln -sivb "$TARGET" "$DST"
    good "$TARGET is installed in $DST"
}

# Setup the nvim config
make_backup ${HOME}/.config/nvim
install_config .config/nvim
