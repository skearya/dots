#!/bin/bash

symbol() {
    [ $(cat /sys/class/net/w*/operstate) = down ] && echo 睊  && exit
    echo 
}

name() {
  iwgetid -r
}

[ "$1" = "icon" ] && symbol

if [[ $1 == "name" || $1 == "class" ]]; then
  wifiname=$(name)
  if [[ $wifiname == "" ]]; then
    if [[ $1 == "name" ]]; then
      echo "Disconnected"
    elif [[ $1 == "class" ]]; then
      echo "disconnected"
    fi
  else
    if [[ $1 == "name" ]]; then
      echo "Connected to $wifiname"
    elif [[ $1 == "class" ]]; then
      echo "connected"
    fi
  fi
fi

if [[ $1 == "status" ]]; then
  name=$(name)
  if [[ $name != "Disconnected" ]]; then
    echo "Connected"
  else
    echo $name
  fi
fi

radio_status () {
  radio_status=$(nmcli radio wifi)
  if [[ $radio_status == "enabled" ]]; then
    echo "on"
  else
  
    echo "off"
  fi
}

if [[ $1 == "radio-status" ]]; then
  radio_status
fi

if [[ $1 == "toggle-radio" ]]; then
  stat=$(radio_status)
  if [[ $stat == "on" ]]; then
    nmcli radio wifi off
  else
    nmcli radio wifi on
  fi
fi
