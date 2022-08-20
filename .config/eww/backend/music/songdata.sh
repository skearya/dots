#!/usr/bin/env bash

if [[ $1 == "title" ]]; then
  playerctl -p spotify metadata --format "{{title}}" || echo "Not playing"
fi

if [[ $1 == "artist" ]]; then
  playerctl -p spotify metadata --format "{{artist}}" || echo "No artist"
fi

if [[ $1 == "status" ]]; then
  playerctl -p spotify status
fi
