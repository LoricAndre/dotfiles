FROM archlinux:base-devel

ENV IN_DOCKER=true

ARG USER=loric

RUN useradd -m $USER
RUN echo "$USER ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers

RUN pacman -Syu --noconfirm && \
  pacman -Sy --noconfirm git base-devel && \
  pacman -Scc && \
  sudo rm /var/cache -rf

USER $USER
WORKDIR /home/$USER

# Add chaotic aur & trizen
RUN cd /tmp && git clone https://aur.archlinux.org/trizen.git && \
    cd trizen && \
    makepkg -si --noconfirm && \
    sudo pacman -Scc && \
    cd / && sudo rm /tmp/* -rf && \
    sudo rm /var/cache -rf


COPY _files/headless-packages packages

RUN trizen -Sy --noconfirm $(cat packages) && \
  rm .cache -rf && sudo rm /tmp/* -rf && \
  go clean -modcache && \
  trizen -Scc && \
  sudo rm /var/cache -rf

RUN sudo mkdir /src && sudo chown $USER /src
COPY --chown=$USER . .local/share/chezmoi
# RUN pwd && ls -al && exit 1
RUN chezmoi init
RUN chezmoi apply --exclude=scripts
RUN nvim --headless ":Lazy! sync" +qa
RUN zsh -lic exit
RUN zsh -lic exit
RUN zsh -lic "nvm install --lts"
# RUN nvim --headless +"sleep 60" +qa
WORKDIR /src
ENTRYPOINT ["zsh", "-li"]
