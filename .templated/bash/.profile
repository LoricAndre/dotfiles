# vi: ft=bash
export XDG_DATA_HOME=$HOME/.local/share
export XDG_CONFIG_HOME=$HOME/.config
export XDG_STATE_HOME=$HOME/.local/state
export XDG_CACHE_HOME=$HOME/.cache

export LANG=en_US.UTF-8
export VIMRUNTIME=/usr/share/nvim/runtime

# XDG-ninja
export ADOTDIR="$XDG_DATA_HOME/antigen"
export ANDROID_USER_HOME="$XDG_DATA_HOME/android"
export ANSIBLE_HOME="$XDG_DATA_HOME/ansible"
export AWS_CONFIG_FILE="$XDG_CONFIG_HOME/aws/config"
export AWS_SHARED_CREDENTIALS_FILE="$XDG_CONFIG_HOME/aws/credentials"
export AZURE_CONFIG_DIR="$XDG_DATA_HOME/azure"
export CARGO_HOME="$XDG_DATA_HOME/cargo"
export DOCKER_CONFIG="$XDG_CONFIG_HOME/docker"
export DOTNET_CLI_HOME="$XDG_DATA_HOME/dotnet"
export GNUPGHOME="$XDG_DATA_HOME/gnupg"
export GOPATH="$XDG_DATA_HOME/go"
export GTK2_RC_FILES="$XDG_CONFIG_HOME/gtk-2.0/gtkrc"
export IPYTHONDIR="$XDG_CONFIG_HOME/ipython"
export NUGET_PACKAGES="$XDG_CACHE_HOME/NuGetPackages"
export NVM_DIR="$XDG_DATA_HOME/nvm"
export OMNISHARPHOME="$XDG_CONFIG_HOME/omnisharp"
export PASSWORD_STORE_DIR="$XDG_DATA_HOME/pass"
export PNPM_HOME="$XDG_DATA_HOME/pnpm"
export PULUMI_HOME="$XDG_DATA_HOME/pulumi"
export PYENV_ROOT="$XDG_DATA_HOME/pyenv"
export PYENV_ROOT="$XDG_DATA_HOME/pyenv"
export RUSTUP_HOME="$XDG_DATA_HOME/rustup"
export VAGRANT_HOME="$XDG_DATA_HOME/vagrant"
export WINEPREFIX="$XDG_DATA_HOME/wine"
export XCURSOR_PATH="/usr/share/icons:$XDG_DATA_HOME/icons"
export XINITRC="$XDG_CONFIG_HOME/x11/xinitrc"
export ZDOTDIR="$XDG_CONFIG_HOME/zsh"
export _JAVA_OPTIONS=-Djava.util.prefs.userRoot="$XDG_CONFIG_HOME/java"
export _Z_DATA="$XDG_DATA_HOME/z"
alias wget=wget --hsts-file="$XDG_DATA_HOME/wget-hsts"

export HISTFILE="$XDG_STATE_HOME/bash/history"
mkdir -p $(dirname $HISTFILE)

export QT_STYLE_OVERRIDE=kvantum


[[ -f "$HOME/.bashrc" ]] && source "$HOME/.bashrc"
