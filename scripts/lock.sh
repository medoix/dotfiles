#!/bin/bash

MUTEX="${HOME}/.config/i3/i3-lock"
LOG="${HOME}/.config/i3/lock-log"
NOLOCK="${HOME}/.config/i3/NOLOCK"

VERSION="0.5"

log () {
  when=$(date "+%Y-%m-%d %H:%M:%S")
  msg="[lock ${VERSION}] ${when} $1"
  echo "${msg}" >> "${LOG}"
}

lock () {
  if [ ! -f "${NOLOCK}" ]; then
    multilockscreen -l dimblur
  else
    log "${NOLOCK} found, not locking"
  fi
}

if [ "$1" = force ]; then
  log "Forcing lock, removing ${NOLOCK} and ${MUTEX}"
  rm -rf "${NOLOCK}"
  rm -rf "${MUTEX}"
fi

# See https://mywiki.wooledge.org/BashFAQ/045
if /bin/mkdir "$MUTEX"; then
  log "Successfully acquired lock"

  trap 'rm -rf "$MUTEX"' 0  # remove mutex when script finishes

  lock
else
  log "cannot acquire lock, giving up on $MUTEX"
  exit 0
fi
