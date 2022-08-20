#!/usr/bin/env bash

query=$1
argv=$(echo ${@} | sed "s/$query//g")
filename=$(echo $query | sed 's/\./\//g')
filename=$(echo $filename.sh)

cd $HOME/.config/eww/backend

./$filename $argv
