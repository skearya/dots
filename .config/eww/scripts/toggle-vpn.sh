#!/bin/bash

eww="eww -c $HOME/.config/eww"

if [[ $($eww windows | grep '*vpn') == "" ]]; then
  # closed, opening
  $eww open vpn
else
  # open, closing
  $eww close vpn
fi
