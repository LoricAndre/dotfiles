#!/bin/sh

if [ ! -x "$(which paru)" ]; then
  cd /tmp
  sudo pacman -S --noconfirm --needed base-devel
  git clone https://aur.archlinux.org/paru.git
  cd paru
  makepkg -si --noconfirm

  paru -R --noconfirm paru-debug || true
fi

CHEZMOI_MARKER="### Added by chezmoi ###"

if [ -z "$(grep "$CHEZMOI_MARKER" /etc/pacman.conf)" ]; then
  echo $CHEZMOI_MARKER | sudo tee --append /etc/pacman.conf

  echo "[multilib]" | sudo tee --append /etc/pacman.conf
  echo "Include = /etc/pacman.d/mirrorlist" | sudo tee --append /etc/pacman.conf

  sudo pacman-key --recv-key 3056513887B78AEB --keyserver keyserver.ubuntu.com
  sudo pacman-key --lsign-key 3056513887B78AEB
  sudo pacman -U 'https://cdn-mirror.chaotic.cx/chaotic-aur/chaotic-keyring.pkg.tar.zst'
  sudo pacman -U 'https://cdn-mirror.chaotic.cx/chaotic-aur/chaotic-mirrorlist.pkg.tar.zst'

  echo "[chaotic-aur]" | sudo tee --append /etc/pacman.conf
  echo "Include = /etc/pacman.d/chaotic-mirrorlist" | sudo tee --append /etc/pacman.conf
fi