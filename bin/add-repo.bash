#!/bin/bash
set -ex

GH_BIN=$(which gh)
if [[ "${GH_BIN}" == "" ]]; then
    echo gh not installed
    exit 1
fi

read -p "repo name: homelab-" repo

if [ $(gh repo list -L 999 --json name --jq .[].name | grep $repo | wc -l) -gt 0 ]; then
    exit 0
fi

$GH_BIN repo create charlesthomas/homelab-${repo} --license mit --public

read -p "category (for homelab/README.md): " category
$GH_BIN repo edit charlesthomas/homelab-${repo} --add-topic homelab
$GH_BIN repo edit charlesthomas/homelab-${repo} --add-topic homelab-${category}
