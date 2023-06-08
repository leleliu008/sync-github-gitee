#!/bin/sh

set -ex

JSON_FILE_ALL='github-leleliu008-repos.txt'

if [ -f "$JSON_FILE_ALL" ] ; then
    mv  "$JSON_FILE_ALL" "$JSON_FILE_ALL.bak.$(date +%s)"
fi

for i in $(seq 5)
do
    JSON_FILE_I="github-leleliu008-repos-$i.json"
    curl -L -o "$JSON_FILE_I" "https://api.github.com/users/leleliu008/repos?page=$i"
    jq '.[].name' "$JSON_FILE_I"  | sed 's|"||g' | tee -a "$JSON_FILE_ALL"
done

wc -l "$JSON_FILE_ALL"
