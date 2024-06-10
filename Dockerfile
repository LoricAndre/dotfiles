FROM archlinux:base-devel

ARG USER=loric

RUN pacman -Syu --noconfirm && \
  pacman -S --noconfirm git openssh sudo rustup
RUN useradd -m $USER
RUN echo "$USER ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers

USER loric
WORKDIR ~$USER
RUN rustup default stable
RUN yes 1 | sh -c "$(curl -fsLS get.chezmoi.io)" -- init --apply https://gitlab.com/loric.andre/dotfiles.git

ENTRYPOINT zsh
