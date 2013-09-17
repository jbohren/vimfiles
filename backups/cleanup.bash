#!/usr/bin/env bash

# Get the path to this file
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd)"

BACKUP_FILES="$(find $DIR -maxdepth 1 -name '*~' -print -quit)"

if test -n "$BACKUP_FILES"
then
  rm $DIR/*~
  echo "[cleanup] All vim backup files removed."
else
  echo "[cleanup] No vim backup files to remove."
fi

