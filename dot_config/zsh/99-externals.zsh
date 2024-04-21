[ -f /usr/share/nvm/init-nvm.sh ] && source /usr/share/nvm/init-nvm.sh

export THEFUCK_EXCLUDE_RULES="fix_file"
[ -x $(which thefuck) ] && eval $(thefuck --alias f)

eval "$(zoxide init zsh)"

[ -f "/usr/share/stderred/stderred.sh" ] && . "/usr/share/stderred/stderred.sh"
[ -f "/usr/share/stderred/stderred32.sh" ] && . "/usr/share/stderred/stderred32.sh"

if [ -z "$TMUX" ] && [ "$TERM" = "xterm-kitty" ]; then
  tmux attach || exec tmux new-session && exit;
fi
