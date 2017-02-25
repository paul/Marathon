#!/bin/bash

VERSION=0.1.0
CURDIR=`pwd`
TMPDIR=`mktemp -d /tmp/temp.XXXX`
echo "$TMPDIR"
mkdir -p "$TMPDIR"/marathomaton_"$VERSION"
cp -r . "$TMPDIR"/marathomaton_"$VERSION"
rm -rf "$TMPDIR"/marathomaton_"$VERSION"/.git
cd "$TMPDIR"
zip -r marathomaton_"$VERSION".zip marathomaton_"$VERSION"
cp marathomaton_"$VERSION".zip "$CURDIR"
if ! test "$FACTORIO_MOD_PATH" = "";
then
  cp marathomaton_"$VERSION".zip "$FACTORIO_MOD_PATH"
fi



