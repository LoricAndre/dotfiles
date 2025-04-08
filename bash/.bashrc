# vi: ft=bash

# [[ $- == *i* ]] && [[ -f /usr/share/blesh/ble.sh ]] && source /usr/share/blesh/ble.sh --noattach && source ${XDG_CONFIG_HOME:-${HOME}/.config}/bash/ble-theme.sh

source ${XDG_CONFIG_HOME:-${HOME}/.config}/bash/aliases.sh
source ${XDG_CONFIG_HOME:-${HOME}/.config}/bash/options.sh

if has nvr; then
  [ -z "$EDITOR" ] && export EDITOR="nvr -sl --remote-wait"
fi
if has nvim; then
  [ -z "$MANPAGER" ] && export MANPAGER="nvim +Man!"
fi
[ -z "$VISUAL" ] && export VISUAL=$EDITOR
# export XDG_CURRENT_DESKTOP=Unity
export XKB_DEFAULT_LAYOUT=fr
# export XKB_DEFAULT_OPTIONS="caps:escape,altwin:swap_alt_win,lv3:rwin_switch"
if has bat; then
  export PAGER=bat
fi

[ -f /usr/share/nvm/init-nvm.sh ] && source /usr/share/nvm/init-nvm.sh
[ -f $NVM_DIR/nvm.sh ] && source $NVM_DIR/nvm.sh

if has thefuck; then
  export THEFUCK_EXCLUDE_RULES="fix_file"
  eval $(thefuck --alias f)
fi

if has zoxide; then
  eval "$(zoxide init bash)"
fi

[ -f "/usr/share/stderred/stderred.sh" ] && . "/usr/share/stderred/stderred.sh"
[ -f "/usr/share/stderred/stderred32.sh" ] && . "/usr/share/stderred/stderred32.sh"

if has npm; then
  [[ -d "$HOME/.npm-packages/bin" ]] && export PATH="$HOME/.npm-packages/bin:$PATH"
fi
if has pnpm; then
  [[ -d "$PNPM_HOME" ]] && export PATH="$PNPM_HOME:$PATH"
fi
if has pulumi; then
  [[ -d "$PULUMI_HOME" ]] && export PATH="$PULUMI_HOME/bin:$PATH"
fi
if has cargo; then
  [[ -d "$CARGO_HOME/bin" ]] && export PATH="$CARGO_HOME/bin:$PATH"
fi
if has go; then
  [[ -d "$GOPATH/bin" ]] && export PATH="$GOPATH/bin:$PATH"
fi
if has pyvenv; then
  [[ -d $PYENV_ROOT/bin ]] && export PATH="$PYENV_ROOT/bin:$PATH"
  eval "$(pyenv init -)"
fi
export PATH=$HOME/bin:$HOME/.local/bin:$PATH


if has direnv; then
  eval "$(direnv hook bash)"
fi

[ -z "$GPG_TTY" ] && export GPG_TTY="$(tty)"

if has sk; then
  export SKIM_CTRL_R_OPTS='--preview="echo {4..} | bat --plain --language zsh --color=always" --bind tab:accept'

  source /usr/share/skim/key-bindings.bash
  source /usr/share/skim/completion.bash
fi

if has rsnip; then
  source <(rsnip --generate bash)
fi

if has starship; then
  eval "$(starship init bash)"
fi

[[ $- == *i* ]] && [[ -f /usr/share/bash-completion/bash_completion ]] && \
    source /usr/share/bash-completion/bash_completion

if has tmux; then
  if [ -z "$TMUX" ] && (
    [ "$TERM" = "xterm-kitty" ] || [ "$TERM" = "xterm-ghostty" ]
  ) then
    tmux attach || exec tmux new-session && exit;
  fi
fi


[[ ${BLE_VERSION-} ]] && ble-attach
