if [ -f $HOME/.local/share/zinit/zinit.git/zinit.zsh ]; then
	source $HOME/.local/share/zinit/zinit.git/zinit.zsh
else
	[ -f /usr/share/zinit/zinit.zsh ] && source /usr/share/zinit/zinit.zsh
fi

if ! command -v zinit >/dev/null 2>&1; then
	echo '[zsg/apply-hook] zinit not found'
	exit 1;
fi

autoload -Uz _zinit
(( ${+_comps} )) && _comps[zinit]=_zinit

zinit light zsh-users/zsh-syntax-highlighting
zinit light zsh-users/zsh-autosuggestions
zinit light zsh-users/zsh-completions
zinit light zsh-users/zsh-history-substring-search
