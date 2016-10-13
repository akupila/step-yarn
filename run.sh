#!/bin/bash

YARN=yarn

if ! hash yarn 2>/dev/null; then
  echo "Installing yarn..."
  npm install -g --loglevel warn yarn
fi

if [ "$WERCKER_YARN_CACHE" == "true" ]; then
  YARN="HOME=$WERCKER_CACHE_DIR $YARN"
fi

if [ "$WERCKER_YARN_PRODUCTION" == "true" ]; then
  YARN="$YARN --prod"
fi

if [ "$WERCKER_YARN_PURE_LOCKFILE" == "true" ]; then
  YARN="$YARN --pure-lockfile"
fi

echo "$YARN"
eval $YARN
