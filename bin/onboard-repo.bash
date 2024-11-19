#!/bin/bash
set -e

TEMPLATRON_BIN=$(which templatron)
if [[ "${TEMPLATRON_BIN}" == "" ]]; then
    echo templatron not installed
    exit 1
fi

read -p "repo name: homelab-" repo
$TEMPLATRON_BIN --no-autoclean --clone-root ${HOME}/code/charlesthomas charlesthomas/homelab-template onboard charlesthomas/homelab-${repo}
