FROM archlinux:base-devel

RUN useradd -m loric
RUN echo 'loric ALL=(ALL) NOPASSWD: ALL' >> /etc/sudoers
USER loric

RUN mkdir -p /home/loric/dots
WORKDIR /home/loric/dots

COPY --chown=loric dots.hooks/ dots.hooks/
COPY --chown=loric dots.env .
COPY --chown=loric .env .
COPY --chown=loric .data/ .data/
COPY --chown=loric ./bin/dots ./bin/dots
COPY --chown=loric .packages/shell .packages/shell
COPY --chown=loric .packages/tools .packages/tools

COPY --chown=loric direnv/dots.env direnv/dots.env
COPY --chown=loric direnv/dots.hooks/install direnv/dots.hooks/install
COPY --chown=loric jj/dots.env jj/dots.env
COPY --chown=loric jj/dots.hooks/install jj/dots.hooks/install
COPY --chown=loric just/dots.env just/dots.env
COPY --chown=loric just/dots.hooks/install just/dots.hooks/install
COPY --chown=loric lazygit/dots.env lazygit/dots.env
COPY --chown=loric lazygit/dots.hooks/install lazygit/dots.hooks/install
COPY --chown=loric nvim/dots.env nvim/dots.env
COPY --chown=loric nvim/dots.hooks/install nvim/dots.hooks/install
COPY --chown=loric starship/dots.env starship/dots.env
COPY --chown=loric starship/dots.hooks/install starship/dots.hooks/install
COPY --chown=loric tmux/dots.env tmux/dots.env
COPY --chown=loric tmux/dots.hooks/install tmux/dots.hooks/install
COPY --chown=loric zsh/dots.hooks/install zsh/dots.hooks/install

ENV PACMAN_NONINTERACTIVE=1
RUN --mount=type=cache,target=/home/loric/.cache,uid=1000,gid=1000 --mount=type=cache,target=/var/cache ./bin/dots install

COPY --chown=loric bin/ bin/
COPY --chown=loric direnv/ direnv/
COPY --chown=loric git/ git/
COPY --chown=loric jj/ jj/
COPY --chown=loric just/ just/
COPY --chown=loric lazygit/ lazygit/
COPY --chown=loric nvim/ nvim/
COPY --chown=loric starship/ starship/
COPY --chown=loric tmux/ tmux/
COPY --chown=loric zsh/ zsh/

COPY --chown=loric .data .data
COPY --chown=loric .env .
RUN ./bin/dots apply

WORKDIR /home/loric

# # Prepare dynamic stuff
RUN zsh -lic exit; nvim "+Lazy! sync | qa"

ENTRYPOINT ["zsh", "-li"]
