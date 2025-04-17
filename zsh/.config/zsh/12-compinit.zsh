# Compinit
fpath=($HOME/.local/bin/completions /usr/share/zsh/site-functions $fpath)
zstyle ':completion:*' completer _extensions _complete _approximate
zstyle ':completion:*' menu select
zstyle ':completion:*' use-cache on
zstyle ':completion:*' cache-path "$XDG_CACHE_HOME/zsh/.zcompcache"
autoload -Uz compinit
compinit
