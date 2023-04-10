#/usr/bin/env bash

set -e

REPO_PATH="$( cd -- "$(dirname "$0")" >/dev/null 2>&1 ; pwd -P )"
CONFIGS="$(ls -d ${REPO_PATH}/*)"
CURRENT_CONFIG=

BACKUP_DIR="${HOME}/.dotfiles.backup/"
mkdir -p "$BACKUP_DIR"

RED='\033[0;31m'
GREEN='\033[0;32m'
BLUE='\033[0;34m'
RESET='\033[0m'

fatal() {
    echo -e "${RED}[${CURRENT_CONFIG}]$2"
    exit 1
}

info() {
    echo -e "${BLUE}[${GREEN}${CURRENT_CONFIG}${BLUE}]: $*${RESET}"
}

good() {
    echo -e "${GREEN}[${BLUE}${CURRENT_CONFIG}${GREEN}]: $*${RESET}"
}

make_backup() {
    [[ "$#" -eq 0 ]] && fatal "You need to specify an absolute path to a directory/file you want to backup"

    local TARGET="$1"

    [[ -L "$TARGET" ]] && info "$1 is a already a symlink, skipping it\n" && return 1
    [ \( -f "$TARGET" \) -o \( -d "$TARGET" \) ] \
        && mv --backup=numbered "$TARGET" "$BACKUP_DIR" \
        && info "$TARGET is backed up in $BACKUP_DIR" \
        || info "$1 doesn't exists, skipping backup" && return 0
}

install_config() {
    [[ "$#" -eq 0 ]] && fatal "You need to specify a config directory/file to install"

    local FILENAME=$(basename "$1")
    CURRENT_CONFIG=$FILENAME

    info "$FILENAME" "Installing configuration"

    local TARGET="$1"
    local DST="${HOME}/.config/$FILENAME"

    make_backup "$DST"
    [[ "$?" -eq "1" ]] && echo && exit 0

    ln -sivb --no-target-directory "$TARGET" "$DST"
    good "Configuration is installed in $DST!"
    echo
}

for CONFIG in $CONFIGS
do
    [[ -d "$CONFIG" ]] && install_config "$CONFIG"
done
