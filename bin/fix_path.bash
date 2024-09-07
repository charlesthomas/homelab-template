#!/bin/bash
set -ex

OPERATION=$1
ROOT=$2
REPO=$3
ANSWERSFILE=$4

cd $ROOT/$REPO

yq -i '._src_path="/Users/crthomas/code/charlesthomas/homelab-template"' $ANSWERSFILE
test -z "$(git status --porcelain)" && exit 0

git add $ANSWERSFILE
git commit -m "fix homelab-template _src_path"
