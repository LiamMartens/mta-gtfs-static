#!/bin/bash
for f in $(find ./gtfs_raw -name "*.txt"); do
  FILE_BASENAME=$(basename $f)
  FILE_DIRNAME=$(basename $(dirname $f))
  JSON_FILENAME="./gtfs_json/${FILE_DIRNAME}/${FILE_BASENAME%.txt}.json"
  mkdir -p $(dirname $JSON_FILENAME)
  npm exec csv2json -- -d $f $JSON_FILENAME
done