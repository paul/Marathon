#!/bin/bash

if ! jq --version
then
  echo "please install jq"
  exit 1
fi
  
VERSION=`cat info.json | jq -r '.version'`
CURDIR=`pwd`
TMPDIR=`mktemp -d /tmp/temp.XXXX`
MODNAME=marathon-continued
echo "$TMPDIR"
mkdir -p "$TMPDIR"/"$MODNAME"_"$VERSION"
cp -r . "$TMPDIR"/"$MODNAME"_"$VERSION"
rm -rf "$TMPDIR"/"$MODNAME"_"$VERSION"/.git
rm -rf "$TMPDIR"/"$MODNAME"_"$VERSION"/*.zip
cd "$TMPDIR"
zip -r "$MODNAME"_"$VERSION".zip "$MODNAME"_"$VERSION"
cp "$MODNAME"_"$VERSION".zip "$CURDIR"
if ! test "$FACTORIO_MOD_PATH" = "";
then
  cp "$MODNAME"_"$VERSION".zip "$FACTORIO_MOD_PATH"
fi



