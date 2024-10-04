#!/bin/bash

rm gcms-default-theme.zip
rm -rf dist
mkdir dist
cp -R * dist/.

(
  cd dist

  # build css
  (
    cd assets/css
    sass style.scss style.css
    minify --type=css style.css -o style.min.css
    sass maintenance.scss maintenance.css
    minify --type=css maintenance.css -o maintenance.min.css
    rm -rf .sass-cache
  )

  # copy js assets
  cp -r vendor/twbs/bootstrap/dist/js/bootstrap.bundle.min.js assets/js/.
  cp -r vendor/components/jquery/jquery.min.js assets/js/.

  # remove unneeded stuff
  rm build.sh
  rm -rf dist
  rm -rf vendor

  # zip
  zip -r ../gcms-default-theme.zip *
)
rm -rf dist
