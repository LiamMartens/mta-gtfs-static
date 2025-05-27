#!/bin/bash
for f in $(find ./gtfs_raw -name "*.txt"); do
  echo "Processing $f"

  FILE_BASENAME=$(basename $f)
  FILE_DIRNAME=$(basename $(dirname $f))

  # generate json file
  JSON_FILENAME="./gtfs_json/${FILE_DIRNAME}/${FILE_BASENAME%.txt}.json"
  mkdir -p $(dirname $JSON_FILENAME)
  npm exec csv2json -- -d $f $JSON_FILENAME
  node ./scripts/generate-dts-for-json.mjs $JSON_FILENAME "$JSON_FILENAME.d.ts"

  # generate js files
  JS_FILENAME="./gtfs_js/${FILE_DIRNAME}/${FILE_BASENAME%.txt}.js"
  JS_DTS_FILENAME="./gtfs_js/${FILE_DIRNAME}/${FILE_BASENAME%.txt}.d.ts"
  mkdir -p $(dirname $JS_FILENAME)
  echo "export default $(cat $JSON_FILENAME)" > $JS_FILENAME
  node ./scripts/generate-dts-for-json.mjs $JSON_FILENAME $JS_DTS_FILENAME

  # add to JSON exports
  PKGJSON_EXPORTS_JSON_NAME="./gtfs_json/${FILE_DIRNAME}/${FILE_BASENAME%.txt}"
  PKGJSON_EXPORTS_JSON_TARGET="./gtfs_json/${FILE_DIRNAME}/${FILE_BASENAME%.txt}.json"
  jq --arg PKGJSON_EXPORTS_JSON_NAME $PKGJSON_EXPORTS_JSON_NAME --arg PKGJSON_EXPORTS_JSON_TARGET $PKGJSON_EXPORTS_JSON_TARGET \
    '.exports[$PKGJSON_EXPORTS_JSON_NAME] = $PKGJSON_EXPORTS_JSON_TARGET' \
    ./package.json > ./package.json.tmp && mv ./package.json.tmp ./package.json

  PKGJSON_EXPORTS_JS_NAME="./gtfs_js/${FILE_DIRNAME}/${FILE_BASENAME%.txt}"
  PKGJSON_EXPORTS_JS_TARGET="./gtfs_js/${FILE_DIRNAME}/${FILE_BASENAME%.txt}.js"
  jq --arg PKGJSON_EXPORTS_JS_NAME $PKGJSON_EXPORTS_JS_NAME --arg PKGJSON_EXPORTS_JS_TARGET $PKGJSON_EXPORTS_JS_TARGET \
    '.exports[$PKGJSON_EXPORTS_JS_NAME] = $PKGJSON_EXPORTS_JS_TARGET' \
    ./package.json > ./package.json.tmp && mv ./package.json.tmp ./package.json

  echo "Processed $f -> $JSON_FILENAME and $JS_FILENAME"
done