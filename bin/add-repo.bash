#!/bin/bash
set -ex

GH_BIN=$(which gh)
if [[ "${GH_BIN}" == "" ]]; then
    echo gh not installed
    exit 1
fi

TEMPLATRON_BIN=$(which templatron)
if [[ "${TEMPLATRON_BIN}" == "" ]]; then
    echo templatron not installed
    exit 1
fi

read -p "repo name: homelab-" repo
$GH_BIN repo create charlesthomas/homelab-${repo} --license mit --public

read -p "category (for homelab/README.md): " category
$GH_BIN repo edit charlesthomas/homelab-${repo} --add-topic homelab
$GH_BIN repo edit charlesthomas/homelab-${repo} --add-topic homelab-${category}

$TEMPLATRON_BIN --no-autoclean --clone-root ${HOME}/code/charlesthomas charlesthomas/homelab-template onboard charlesthomas/homelab-${repo}
