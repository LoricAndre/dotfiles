FROM archlinux:base-devel

ENV IN_DOCKER=true

ARG USER=loric

RUN useradd -m $USER
RUN echo "$USER ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers

RUN pacman -Syu --noconfirm && \
  pacman -Sy --noconfirm git base-devel rustup && \
  yes | pacman -Scc && \
  cd / && \
  sudo rm /tmp/* /var/cache -rf

RUN mkdir /src && chown $USER /src

USER $USER

WORKDIR /tmp
RUN git clone https://aur.archlinux.org/paru.git && \
  rustup default stable && \
  cd paru && makepkg -si --noconfirm && \
  rm /tmp/* -rf

WORKDIR /home/$USER
COPY _files/headless-packages packages

RUN paru -Sy --noconfirm $(cat packages) && \
  helm plugin install https://github.com/jkroepke/helm-secrets && \
  helm plugin install https://github.com/databus23/helm-diff && \
  rm .cache -rf && \
  go clean -modcache && \
  yes | paru -Scc

COPY --chown=$USER . .local/share/chezmoi

RUN chezmoi init && \
  chezmoi apply --exclude=scripts && \
  nvim --headless ":Lazy! sync | sleep 60" +qa && \
  zsh -lic exit && zsh -lic exit && zsh -lic "nvm install --lts"

WORKDIR /src
ENTRYPOINT ["zsh", "-li"]
