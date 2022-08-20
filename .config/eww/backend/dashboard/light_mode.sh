#!/usr/bin/env bash

LIGHT_THEME='light-decay'
DARK_THEME='dark-decay'
status=$(bluetoothctl show | grep "Powered:")

get_theme () {
  # create if neccesary the file that define the actual theme by themer
  local actual_theme_file="$HOME/.config/themes/actual_theme"
  if ! test -f $actual_theme_file; then
    echo $DARK_THEME > $actual_theme_file
  fi
  cat $actual_theme_file
}

get_status () {
    [ "${status##* }" = "yes" ] && icon="on" || icon="off"
    echo $icon
}

switch_to () {
  local theme=$1
  ~/.local/bin/themer -s "$theme"
}

toggle () {
  local status=$(get_status)
  if [[ $status == "on" ]]; then
    switch_to $DARK_THEME
  else
    switch_to $LIGHT_THEME
  fi
}

if [[ $1 == "status" ]]; then
  get_status
fi

if [[ $1 == "toggle" ]]; then
  toggle
fi
