alias parin="paru -Sy"
alias parem="paru -Rscn"
alias tz=trizen
alias tza="tz -Sy"
alias tzr="tz -Rscn"

# f() {
#   find $@ 2>/dev/null | fzf
# }
alias c=clear

mcd() {
  mkdir -p $@ && cd $@
}

nalias() {
  echo "alias $1='$2'" >> $HOME/.zshaliases
}
alias h='history'

alias ..='cd ..'
alias ...='cd ...'
alias ...='cd ../..'
alias top='btm'
alias s='status'
alias :qa='exit'
alias :q='clear'
alias reboot='systemctl reboot'
alias winboot='systemctl reboot --boot-loader-entry=auto-windows'
alias uefiboot='systemctl reboot --firmware-setup'
alias shutdown='sudo shutdown'
alias mkdir="mkdir -p"

data() {
  pid=$(pgrep openvpn)
  if [ ! -z $pid ]; then
    read -k 1 "k?VPN is running. Terminate ?[Y/n] "
    if [[ "$k" =~ "^[^Nn]" ]]; then
      sudo kill "$pid"
    fi
  else
    echo "Launching ovpn"
    sudo openvpn --config "$HOME/projects/data.ovpn" --daemon
  fi
}

alias py='python3'
alias cat='bat'

fullPush() {
  git add .
  git commit -m "$@"
  git push
}

alias dkc='docker-compose'
alias dk='docker'

n() {
  if [[ -d $f ]]; then
    cur=$(pwd)
    cd $f
    nvim
    cd $cur
  else
    if [[ -z "$NVIM" ]]; then
      nvim $@
    else
      nvr -sl $@
    fi
  fi
}

fcd() {
  cd "$(z | fzf --preview='exa -l {+2}' --nth=2 | awk '{print $2}')"
}

fn() {
  d=$(z | fzf --tac | awk '{print $2}')
  [[ -z $d ]] && return
  echo $d
  n $d
}

open() {
  for a in "$@"; do
    xdg-open $a >/dev/null 2>&1
  done
}

nohd() {
  nohup $@ >/dev/null 2>&1 &
}

cl() {
  cd $1
  ls
}

alias wthr='curl https://wttr.in'
alias lwd='source ~/.cache/zsh/lwd'
alias bashupload='curl https://bashupload.com -T'

alias k=kubectl
alias ktx=kubectx
alias kns=kubens
kgt() {
  res=`kubectl get $1 -o wide --no-headers=true | fzf --preview "kubectl get $1 {1} -o yaml" | awk '{print $1}'`
  kubectl get "$1" "$res" -o yaml | cat
}

alias tf='terraform'
# alias nvim='TERM=xterm nvim'
alias gn='n +"Telescope repo list"'
alias :e='n'
alias gf='g a && g c && g p'
xdg-open() {
  [ -z $(uname -r | grep WSL) ] && /usr/bin/xdg-open $@ || powershell.exe -c start $@
}

vnmap() {
  nmap -Pn -sV --script vuln $@ | grep -C1 VULNERABLE | grep IDs | sed -n 's/^.*IDs:.*:\(.*\)$/\1/p'
}
alias pipr=pip install -r

alias adb='HOME="$XDG_DATA_HOME/android" adb'
adb-tcp() {
  IP=$1
  PORT=$(nmap $IP -T5 -p 37000-44000 | sed -n 's#^\([0-9]\{5\}\)/tcp\sopen\s.*$#\1#p')
  [ -z $PORT ] && echo "no open port found on $IP" && exit 1
  adb connect $IP:$PORT
}
scrpcy-tcp() {
  IP=$1
  adb-tcp $1
  scrpcy
}
alias g="git"
alias lg="lazygit"

fzn() {
  pushd "$(find ~/src -name '.git' -exec dirname \{\} \; | fzf --preview '[ -f {}/README.md ] && bat {}/README.md || ls {}')" && nvim && popd
}

if [[ -n "$KITTY_WINDOW_ID" ]]; then
  if [[ -z "$TMUX" ]]; then
    alias ssh="kitty +kitten ssh"
  fi
  alias icat="kitty +kitten icat"
fi

rt() {
  until $@; do
    echo "Failed to run $@, retrying in $delay seconds..."
    sleep 1
  done
}
alias cm=chezmoi

alias cdg='cd "$HOME/ghq/$(ghq list | sk)"'

alias m="sudo mpm -C ~/.config/mpm/config.yaml"

mkproj() {
  PROJ_ROOT="$HOME/src"
  PROJ_DIR="$PROJ_ROOT/$1/$2"
  mkdir "$PROJ_DIR"
  pushd "$PROJ_DIR"
  git init
  popd
}

genpw() {
  printf "%s" $(tr -dc 'A-Za-z0-9_-' </dev/urandom | head -c $1)
}

j() {
  # Create a temporary file to capture output.
  tmpfile=$(mktemp)

  # Tee writes unfiltered output to tmpfile, then we filter the stream with sed before displaying.
  just "$@" 2>&1 | tee "$tmpfile" | sed '/error: Justfile does not contain recipe/d'

  # Capture the exit code from the just command.
  exit_code=${PIPESTATUS[0]}

  # If the local just fails and the error indicates "does not contain recipe", retry with the global justfile.
  if [[ $exit_code != 0 ]] && grep -q "does not contain recipe" "$tmpfile"; then
    just -g "$@"
  fi

  # Clean up the temporary file.
  rm -f "$tmpfile"
}

git-fd-dirty() {
  fd '.git' "$1" -t d -H | xargs dirname | while read repo; do { pushd "$repo">/dev/null; git status >/dev/null 2>&1 || echo "$repo dirty" }; done
}
