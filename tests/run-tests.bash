#!/usr/bin/env bash
set -eu
HERE=$(dirname "$0")
export PATH="$PATH:$HERE/.."
for f in $(find -name test -type f)
do
  echo "= Running test $f..."
  rm -rf "$HOME/.cache/app-"*
  ./"$f" || exit $?
done
