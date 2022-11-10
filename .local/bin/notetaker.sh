#!/usr/bin/env bash

NOTESPATH="$HOME/notes/general/note-$(date +%Y-%m-%d).md"

if [ ! -f $NOTESPATH ]; then
  echo "# Notes for $(date +%Y-%m-%d)" > $NOTESPATH
fi

nvim -c "norm Go" \
  -c "norm Go## $(date +%H:%M)" \
  -c "norm G2o" \
  -c "norm zz" \
  -c "startinsert" $NOTESPATH
