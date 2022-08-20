#!/usr/bin/env bash

name () {
  username=$(whoami)
  echo ${username^}
}

os () {
  . /etc/os-release
  echo $PRETTY_NAME
}

kernel () {
  kernelname=$(uname)
  kernelvers=$(uname -r)
  echo "${kernelname} ${kernelvers}"
}

if [[ $1 == "name" ]]; then
  name
fi

if [[ $1 == "os" ]]; then
  os
fi

if [[ $1 == "kernel" ]]; then
  kernel
fi
