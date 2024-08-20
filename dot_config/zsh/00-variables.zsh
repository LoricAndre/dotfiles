[ -z "$EDITOR" ] && export EDITOR=nvim
[ -z "$VISUAL" ] && export VISUAL="nvim --cmd 'let g:flatten_wait=1'"
[ -z "$VISUAL" ] && export VISUAL=nvim
[ -z "$MANPAGER" ] && export MANPAGER="nvim +Man!"
# export XDG_CURRENT_DESKTOP=Unity
export XKB_DEFAULT_LAYOUT=fr
# export XKB_DEFAULT_OPTIONS="caps:escape,altwin:swap_alt_win,lv3:rwin_switch"
export PAGER=bat

export XDG_DATA_HOME=$HOME/.local/share
export XDG_CONFIG_HOME=$HOME/.config
export XDG_STATE_HOME=$HOME/.local/state
export XDG_CACHE_HOME=$HOME/.cache

export GOPATH=$HOME/.local/share/go
export LANG=en_US.UTF-8
export VIMRUNTIME=/usr/share/nvim/runtime

# XDG-ninja
export ANDROID_USER_HOME="$XDG_DATA_HOME"/android
export ADOTDIR="$XDG_DATA_HOME"/antigen
export CARGO_HOME="$XDG_DATA_HOME"/cargo
export DOCKER_CONFIG="$XDG_CONFIG_HOME"/docker
export NVM_DIR="$XDG_DATA_HOME"/nvm
export RUSTUP_HOME="$XDG_DATA_HOME"/rustup
export _Z_DATA="$XDG_DATA_HOME/z"
autoload -Uz compinit && compinit -d "$XDG_CACHE_HOME"/zsh/zcompdump-"$ZSH_VERSION"
export HISTFILE="$XDG_STATE_HOME"/zsh/history

export PATH=$HOME/bin:$HOME/.local/bin:/opt/texlive/2020/bin/x86_64-linux:$PATH:$HOME/.npm-packages/bin:/usr/lib/ruby/gems/2.7.0:$HOME/.gem/ruby/2.7.0:$HOME/.cargo/bin:$GOPATH/bin
