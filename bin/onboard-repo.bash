#!/bin/bash
set -e

read -p "repo name: homelab-" repo
templatron --no-autoclean --clone-root ${HOME}/code/charlesthomas charlesthomas/homelab-template onboard charlesthomas/homelab-${repo}
