#!/bin/bash

USE_EWW_WIDGET=false
USE_NOTIFICATION=true

EWW_BIN="/usr/bin/eww"

LAYOUT_WIDGET="layout"

eww () {
  ${EWW_BIN} -c ~/.config/eww ${@}
}

if ! eww ping 2>&1 > /dev/null; then
  eww daemon
fi

declare -a acts=('get' 'cycle')

layouts="tiled,wide,monocle"

help () {
  echo "valid actions: ${acts[@]}"
}

act=$1

spwn_get () {
  desktop=$(bspc query -D -d --names)
  layout=$(bsp-layout get $desktop)
  if [[ $layout == '-' ]]; then
    layout=$(echo $layouts | tr "," " " | awk "{print \$1}")
  fi
  echo $layout
  return 0
}

open_eww () {
  if [[ $(eww windows | grep "^*layout") == "" ]]; then
    eww open layout
    sleep 0.8
    eww close layout
  fi
}

spwn_cycle () {
  bsp-layout cycle --layouts $layouts
  $USE_EWW_WIDGET && open_eww &
  $USE_NOTIFICATION && notify-send "Layout" "$(spwn_get)"
  return $?
}

for posact in ${acts[@]}; do
  if [[ $act == $posact ]]; then
    spwn_$act
    exit $?
  fi
done

help
exit 1
