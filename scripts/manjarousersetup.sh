#!/bin/bash

LIST_OF_PACMAN_SOFTWARE="\
  base-devel \
  zig \
  unzip \
  yay \
  clang \
  qemu \
  zellij \
  vict-manager \
  gcc \
  binutils \
  ttf-font-awesome
"
LIST_OF_YAY_SOFTWARE="\
  discord \
  steam \
"

echo "password promtp:"
read -s PASSWORD

echo "$PASSWORD" | sudo -S pacman -Syu $LIST_OF_PACMAN_SOFTWARE
yay -Syu LIST_OF_YAY_SOFTWARE
