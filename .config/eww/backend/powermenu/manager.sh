#!/usr/bin/env bash

# i'm using doas, change the next commands to your commands
# if you're using doas too, add the next to `/etc/doas.conf`

# permit nopass :wheel cmd poweroff
# permit nopass :wheel cmd reboot

# then create the group wheel, and add your user to that group

if [[ $1 == "shutdown" ]]; then
  doas poweroff
elif [[ $1 == "reboot" ]]; then
  doas reboot
elif [[ $1 == "logout" ]]; then
  bspc quit
fi
