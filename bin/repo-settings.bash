#!/bin/bash
set -ex

repo=$1
if [[ "${repo}" == "" ]]; then
    echo "usage: $0 <repo name>"
    exit 1
fi

gh repo edit charlesthomas/${repo} \
    --enable-wiki=false \
    --enable-issues=false \
    --enable-discussions=false \
    --enable-projects=false \
    --enable-merge-commit=false \
    --enable-squash-merge=false \
    --enable-rebase-merge=true \
    --delete-branch-on-merge=true
