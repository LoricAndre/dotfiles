# Paru
alias parin="paru -Sy"
alias parem="paru -R"

# Common aliases
abbr -a -g .. cd ..
abbr -a -g ... cd ../..
abbr -a -g .... cd ../../..
alias c="clear"
alias ls="ls --color"
alias ll="ls --color -al"
alias h="history"
abbr -a -g :q clear
abbr -a -g :qa exit
alias reboot="sudo reboot"
alias shutdown="sudo shutdown"
alias cat="bat"
alias mkdir="mkdir -p"
alias ssh="ssh -i ~/.ssh/data"
alias spotify="LD_PRELOAD=/usr/local/lib/spotify-adblock.so spotify"
abbr -a -g !! $history[1]

# Z
alias fz="cd (z -l | fzf | sed 's/^[^\/]*\(\/.*\)\$/\1/')"
