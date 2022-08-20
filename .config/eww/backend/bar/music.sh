#!/usr/bin/env bash

function backend () {
  $HOME/.config/eww/backend/main.sh ${@}
}

function is_running () {
  output=$(echo $(playerctl -p spotify status 2>&1 > /dev/null))
  if [[ $output == "No players found" || $output == "No player could handle this command" ]]; then
    echo no
  else
    echo yes
  fi
}

if [[ $1 == "is_running" ]]; then
  is_running
fi

if [[ $1 == "get-spotify-info" ]]; then
  title=$(backend music.songdata title)
  artist=$(backend music.songdata artist)
  notify-send "$title" "By $artist"
fi
