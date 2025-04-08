# ANTIGEN_FILE=${ADOTDIR:-${XDG_CACHE_HOME:-$HOME/.cache}}/antigen.zsh
# if [ ! -f "$ANTIGEN_FILE" ]; then
#   ANTIGEN_DIR=$(dirname "$ANTIGEN_FILE")
#   echo "Creating dir $ANTIGEN_DIR"
#   mkdir -p "$ANTIGEN_DIR"
#   echo "Downloading antigen to $ANTIGEN_FILE"
#   curl -L git.io/antigen > "$ANTIGEN_FILE" && echo "Done"
# fi
# . "$ANTIGEN_FILE"
# antigen use oh-my-zsh
# antigen bundle zsh-users/zsh-autosuggestions
# antigen bundle zsh-users/zsh-syntax-highlighting
# antigen bundle zsh-users/zsh-completions
# antigen bundle zsh-users/zsh-history-substring-search
# # antigen bundle atuinsh/atuin@main
# # antigen bundle git
# # antigen bundle agkozak/zsh-z
# # antigen bundle birdhackor/zsh-exa-ls-plugin@main
# antigen bundle 3v1n0/zsh-bash-completions-fallback
# antigen bundle cpitt/zsh-dotenv
# antigen apply
#
# export ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="fg=14"
