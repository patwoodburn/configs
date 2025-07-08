#!/bin/bash

LIST_OF_PACMAN_SOFTWARE="\
  thefuck \
  base-devel \
  zig \
  unzip \
  yay \
  clang \
  qemu-full \
  zellij \
  virt-manager \
  gcc \
  binutils \
  ttf-font-awesome \
  neovim \
  alacritty \
  otf-opendyslexic-nerd \
"
LIST_OF_YAY_SOFTWARE="\
  discord \
  steam \
"

sudo -S pacman -Syu $LIST_OF_PACMAN_SOFTWARE
yay -Syu $LIST_OF_YAY_SOFTWARE
