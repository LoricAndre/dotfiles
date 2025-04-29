[ -f /usr/share/nvm/init-nvm.sh ] && source /usr/share/nvm/init-nvm.sh
[ -f $NVM_DIR/nvm.sh ] && source $NVM_DIR/nvm.sh

export THEFUCK_EXCLUDE_RULES="fix_file"
[ -x "$(which thefuck)" ] && eval $(thefuck --alias f)

eval "$(zoxide init zsh)"

[ -f "/usr/share/stderred/stderred.sh" ] && . "/usr/share/stderred/stderred.sh"
[ -f "/usr/share/stderred/stderred32.sh" ] && . "/usr/share/stderred/stderred32.sh"

# pnpm
export PNPM_HOME="/home/loric/.local/share/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac

eval "$(direnv hook zsh)"

# pnpm end
#
PULUMI_HOME="$HOME/.pulumi"
[ -d $PULUMI_HOME/bin ] && export PATH="$PULUMI_HOME/bin:$PATH"

[ -n $CARGO_HOME ] && export PATH="$CARGO_HOME/bin:$PATH"

export PYENV_ROOT="$HOME/.pyenv"
[[ -d $PYENV_ROOT/bin ]] && export PATH="$PYENV_ROOT/bin:$PATH" && eval "$(pyenv init -)"

if [ -z "$TMUX" ] && (
  [ "$TERM" = "xterm-kitty" ] || [ "$TERM" = "xterm-ghostty" ]
)
; then
  tmux attach || exec tmux new-session && exit;
fi

export GPG_TTY="$(tty)"

export SKIM_CTRL_R_OPTS='--preview="echo {4..} | bat --plain --language zsh --color=always" --bind tab:accept --tiebreak=index,begin'

[ -f /usr/share/skim/key-bindings.zsh ] && source /usr/share/skim/key-bindings.zsh || true
