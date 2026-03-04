#!/bin/sh

set -ex

JSON_FILE_ALL='github-leleliu008-repos.txt'

if [ -f "$JSON_FILE_ALL" ] ; then
    mv  "$JSON_FILE_ALL" "$JSON_FILE_ALL.bak.$(date +%s)"
fi

I=0

while true
do
    I=$(($I + 1))
    f="github-leleliu008-repos-$I.json"

    curl -L -o "$f" "https://api.github.com/users/leleliu008/repos?page=$I"

    X="$(jq -r '.[].name' "$f")"

    [ -z "$X" ] && break

    printf '%s\n' "$X" >> "$JSON_FILE_ALL"
done

wc -l "$JSON_FILE_ALL"
