[ -f /usr/share/nvm/init-nvm.sh ] && source /usr/share/nvm/init-nvm.sh

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

if [ -z "$TMUX" ] && [ "$TERM" = "xterm-kitty" ]; then
  tmux attach || exec tmux new-session && exit;
fi
