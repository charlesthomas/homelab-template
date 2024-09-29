#!/bin/bash

OPERATION=$1
ROOT=$2
REPO=$3
ANSWERSFILE=$4

mkdir -p $ROOT/$REPO/.git/hooks/

for hook in $(ls $ROOT/$REPO/hooks); do
    if [ ! -e $ROOT/$REPO/.git/hooks/$hook ]; then
        ln -s $ROOT/$REPO/hooks/$hook $ROOT/$REPO/.git/hooks/$hook
    fi
done
