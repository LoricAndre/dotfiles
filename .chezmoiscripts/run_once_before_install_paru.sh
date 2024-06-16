#!/bin/sh

cd /tmp
sudo pacman -S --noconfirm --needed base-devel
git clone https://aur.archlinux.org/paru.git
cd paru
makepkg -si --noconfirm

paru -R --noconfirm paru-debug || true

echo "[multilib]" | sudo tee --append /etc/pacman.conf
echo "Include = /etc/pacman.d/mirrorlist" | sudo tee --append /etc/pacman.conf
