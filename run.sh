#!/bin/bash

YARN=yarn

if [ "$WERCKER_YARN_NO_CACHE" != "true" ]; then
  YARN="HOME=$WERCKER_CACHE_DIR $YARN"
fi

if [ "$WERCKER_YARN_PRODUCTION" == "true" ]; then
  YARN="$YARN --prod"
fi

if [ "$WERCKER_YARN_PURE_LOCKFILE" == "true" ]; then
  YARN="$YARN --pure-lockfile"
fi

$YARN
