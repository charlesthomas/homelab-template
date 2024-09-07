#!/bin/bash

OPERATION=$1
ROOT=$2
REPO=$3
ANSWERSFILE=$4

if [[ "${OPERATION}" != "updating" ]]; then
    exit 0
fi

tmp=$(mktemp)

cd $ROOT/$REPO

cat $ANSWERSFILE | sed 's/_src_path: \/home/_src_path: \/Users/' > $tmp
mv $tmp $ANSWERSFILE

test -z "$(git status --porcelain)" && exit 0

git add $ANSWERSFILE
git commit -m "fix homelab-template _src_path"
