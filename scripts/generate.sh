#!/bin/bash
for f in $(find ./gtfs_raw -name "*.txt"); do
  FILE_BASENAME=$(basename $f)
  FILE_DIRNAME=$(basename $(dirname $f))
  JSON_FILENAME="./gtfs_json/${FILE_DIRNAME}/${FILE_BASENAME%.txt}.json"
  mkdir -p $(dirname $JSON_FILENAME)
  npm exec csv2json -- -d $f $JSON_FILENAME

  # add to JSON exports
  PKGJSON_EXPORTS_NAME="./gtfs/$FILE_DIRNAME/${FILE_BASENAME%.txt}.json"
  PKGJSON_EXPORTS_TARGET="./gtfs_json/${FILE_DIRNAME}/${FILE_BASENAME%.txt}.json"
  jq --arg PKGJSON_EXPORTS_NAME $PKGJSON_EXPORTS_NAME --arg PKGJSON_EXPORTS_TARGET $PKGJSON_EXPORTS_TARGET \
    '.exports[$PKGJSON_EXPORTS_NAME] = $PKGJSON_EXPORTS_TARGET' \
    ./package.json > ./package.json.tmp && mv ./package.json.tmp ./package.json
done