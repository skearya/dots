#!/usr/bin/env bash

if [[ $1 == "prev" ]]; then
  playerctl -p spotify previous
fi

if [[ $1 == "play-pause" ]]; then
  playerctl -p spotify play-pause
fi

if [[ $1 == "next" ]]; then
  playerctl -p spotify next
fi
