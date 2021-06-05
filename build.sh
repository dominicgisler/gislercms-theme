#!/bin/bash

rm gcms-default-theme.zip
rm -rf dist
mkdir dist
cp -R * dist/.

rm dist/build.sh
rm -rf dist/dist

(
  cd dist
  zip -r ../gcms-default-theme.zip *
)
rm -rf dist