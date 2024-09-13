FROM archlinux:base-devel

ENV IN_DOCKER=true

ARG USER=loric

RUN useradd -m $USER
RUN echo "$USER ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers

USER $USER
WORKDIR /home/$USER

RUN sudo pacman -Syu --noconfirm && \
  sudo pacman -S --noconfirm git \
                        openssh \
                        sudo && \
  cd /tmp && git clone https://aur.archlinux.org/paru.git && cd paru && makepkg -si --noconfirm && \
  cd && paru -Sy --noconfirm \
    atuin \
    bat \
    chezmoi \
    direnv \
    dotnet-sdk \
    dotnet-sdk-6.0 \
    eza \
    fd \
    fzf \
    skim \
    helm \
    helm-diff \
    helmfile \
    helm-secrets \
    jq \
    k3sup \
    k9s \
    kubectl \
    kubectx \
    lazygit \
    lsof \
    man-db \
    mariadb \
    mongodb-tools \
    ncdu \
    nerdfix \
    nmap \
    nuget \
    neovim-nightly-bin \
    neovim-remote \
    nvm \
    openssh \
    pass \
    pnpm \
    postgresql \
    powershell-bin \
    progress \
    python-virtualenv \
    ripgrep \
    sops \
    starship \
    tldr \
    tmux \
    tmux-plugin-manager \
    traceroute \
    ttf-jetbrains-mono-nerd \
    unzip \
    wget \
    wl-clipboard \
    yq \
    zip \
    zoxide \
    zsh && \
  rm .cache -rf && sudo rm /tmp/* -rf && \
  go clean -modcache && \
  paru -Scc && \
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
