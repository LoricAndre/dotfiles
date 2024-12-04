alias parin = paru -Sy
alias parem = paru -Rscn
alias c = clear

def mcd [p: path] {
  mkdir $p
  cd $p
}

alias h = history

alias .. = cd ..
alias ... = cd ...
alias ... = cd ../..
alias top = btm
alias s = status
# alias :qa = exit
# alias :q = clear
alias reboot = systemctl reboot
alias winboot = systemctl reboot --boot-loader-entry = auto-windows
alias uefiboot = systemctl reboot --firmware-setup
alias shutdown = sudo shutdown
# alias mkdir = mkdir -p

alias py = python3
alias cat = bat

def fullPush [msg: string] {
  git add .
  git commit -m "$msg"
  git push
}

alias dkc = docker-compose
alias dk = docker

def n [p: path = "."] {
  if (($p | path type) == dir ) {
    let cur = (pwd)
    cd $p
    nvim
    cd $cur

  } else {
    if NVIM in $env {
      nvr -sl $p
    } else {
      nvim $p
    }
  }
}
# open() {
#   for a in "$@"; do
#     xdg-open $a >/dev/null 2>&1
#   done
# }
#
def nohd [cmd: any] {
  pueue add $cmd
}

alias k = kubectl
alias ktx = kubectx
alias kns = kubens
# kgt() {
#   res=`kubectl get $1 -o wide --no-headers=true | fzf --preview "kubectl get $1 {1} -o yaml" | awk '{print $1}'`
#   kubectl get "$1" "$res" -o yaml | cat
# }
#
alias tf = terraform
# # alias nvim='TERM = xterm nvim
# alias gn = n +"Telescope repo list"
def gf [] {
  g a
  g c
  g p
}

# xdg-open() {
#   [ -z $(uname -r | grep WSL) ] && /usr/bin/xdg-open $@ || powershell.exe -c start $@
# }
#
# vnmap() {
#   nmap -Pn -sV --script vuln $@ | grep -C1 VULNERABLE | grep IDs | sed -n 's/^.*IDs:.*:\(.*\)$/\1/p'
# }
# alias pipr=pip install -r
#
# alias adb='HOME = $XDG_DATA_HOME/android" adb
# adb-tcp() {
#   IP=$1
#   PORT=$(nmap $IP -T5 -p 37000-44000 | sed -n 's#^\([0-9]\{5\}\)/tcp\sopen\s.*$#\1#p')
#   [ -z $PORT ] && echo "no open port found on $IP" && exit 1
#   adb connect $IP:$PORT
# }
# scrpcy-tcp() {
#   IP=$1
#   adb-tcp $1
#   scrpcy
# }
alias g = git
alias lg = lazygit
#
# fzn() {
#   pushd "$(find ~/src -name '.git' -exec dirname \{\} \; | fzf --preview '[ -f {}/README.md ] && bat {}/README.md || ls {}')" && nvim && popd
# }
#

if KITTY_WINDOW_ID in $env {
  if TMUX not-in $env {
    alias ssh = kitty +kitten ssh
  }
  alias icat = kitty +kitten icat
}

def rt [cmd: any] {
  let delay = 1
  until $cmd {
    echo $"Failed to run ($cmd), retrying in ($delay) seconds..."
    sleep $delay
  }
}
alias cm = chezmoi
def genpw [len: int] {
  open /dev/urandom | tr -dc 'A-Za-z0-9_-' | head -c $len | printf "%s" $in
}

alias j = just

def git-fd-dirty [dir: path] {
  fd '.git' $dir -t d -H | lines | each {
    cd (dirname $in)
    try {
      git status | ignore
    } catch {
      echo $"($in) dirty"
    }
  }
}
