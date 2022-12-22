#!/usr/bin/env bash

# The sole purpose of this script is to be execute by starship
echo $buildInputs | tr ' ' '\n' | sed 's#^/nix/store/[a-z0-9]\+-##' \
    | tr -d '0-9-.' | tr '\n' ' ' | awk '{$1=$1;print}'
