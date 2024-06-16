#!/bin/sh

cd /tmp
sudo pacman -S --noconfirm --needed base-devel
git clone https://aur.archlinux.org/paru.git
cd paru
makepkg -si --noconfirm

echo "[multilib]" >> /etc/pacman.conf
echo "Include = /etc/pacman.d/mirrorlist"
