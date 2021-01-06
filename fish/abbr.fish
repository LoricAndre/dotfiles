# Paru
abbr -a -g parin paru -Sy
abbr -a -g parem paru -R

# Common aliases
abbr -a -g .. cd ..
abbr -a -g ... cd ../..
abbr -a -g .... cd ../../..
abbr -a -g c clear
abbr -a -g ls ls --color
abbr -a -g ll ls --color -al
abbr -a -g h history
abbr -a -g :q clear
abbr -a -g :qa exit
abbr -a -g reboot sudo reboot
abbr -a -g shutdown sudo shutdown
abbr -a -g cat bat
abbr -a -g mkdir mkdir -p
abbr -a -g ssh ssh -i ~/.ssh/data
abbr -a -g spotify LD_PRELOAD=/usr/local/lib/spotify-adblock.so spotify

# Z
# abbr -a -g fz cd (z -l | fzf | sed 's/^[^\/]*\(\/.*\)$/\1/')
