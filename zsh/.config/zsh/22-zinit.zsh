[ -f /usr/share/zinit/zinit.zsh ] && source /usr/share/zinit/zinit.zsh
[ -f $HOME/.local/share/zinit/zinit.zsh ] && source $HOME/.local/share/zinit/zinit.zsh

zinit light zsh-users/zsh-syntax-highlighting
zinit light zsh-users/zsh-autosuggestions
zinit light zsh-users/zsh-completions
zinit light zsh-users/zsh-history-substring-search
