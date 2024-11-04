aur_helper := "paru"
pacman_args := "--needed"

default:
  just --list

quick-apply:
  chezmoi apply --exclude scripts

apply:
  chezmoi apply

custom-packages:
  #!/usr/bin/env bash
  set -euo pipefail

  for pkg in _files/alr/*; do
    pushd $pkg
    [ -f PKGBUILD ] && PACMAN={{ aur_helper }} makepkg -si --needed --noconfirm
    popd
  done

sync-packages: aur-helper custom-packages
  git pull --autostash
  @{{aur_helper}} {{pacman_args}} -Syu
  @{{aur_helper}} {{pacman_args}} -Sy $(cat _files/packages | tr '\n' ' ')

hooks: packages-hook

packages-hook:
  cp ./_files/pre-commit-hook.sh .git/hooks/pre-commit
  @chmod +x .git/hooks/pre-commit

chaotic-aur:
  #!/usr/bin/env -S sudo bash
  set -euo pipefail
  CHEZMOI_MARKER="### Added by chezmoi ###"
  if [ -z "$(grep "$CHEZMOI_MARKER" /etc/pacman.conf)" ]; then
    echo $CHEZMOI_MARKER >> /etc/pacman.conf

    echo "[multilib]" >> /etc/pacman.conf
    echo "Include = /etc/pacman.d/mirrorlist" >> /etc/pacman.conf

    pacman-key --recv-key 3056513887B78AEB --keyserver keyserver.ubuntu.com
    pacman-key --lsign-key 3056513887B78AEB
    pacman {{pacman_args}} -U 'https://cdn-mirror.chaotic.cx/chaotic-aur/chaotic-keyring.pkg.tar.zst'
    pacman {{pacman_args}} -U 'https://cdn-mirror.chaotic.cx/chaotic-aur/chaotic-mirrorlist.pkg.tar.zst'

    echo "[chaotic-aur]" >> /etc/pacman.conf
    echo "Include = /etc/pacman.d/chaotic-mirrorlist" >> /etc/pacman.conf
  fi

aur-helper: chaotic-aur 
  which {{aur_helper}} || sudo pacman -Sy {{pacman_args}} {{aur_helper}}
