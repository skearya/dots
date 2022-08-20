#!/usr/bin/env bash

# updates script, feel free to add support to your favorite operative system

# config

no_updates_text="Updated!"
# no_updates_text="0"

sufix="  Updates"
# sufix=""

updates=$(xbps-install -un | wc -l) # for void linux, don't need anything
# updates=$(checkupdates | wc -l) # for arch linux, needs pacman contrib
# updates=$(aptitude search '~U' | wc -l) # debian based, apt, needs aptitude

# prog

if [[ $updates == "0" ]]; then
  echo $no_updates_text
  exit 0
fi

echo "${updates}${sufix}"
