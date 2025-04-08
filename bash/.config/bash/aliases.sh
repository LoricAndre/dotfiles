has() {
  command -v "$1" >/dev/null 2>&1
}

alias c=clear
if has git; then
  alias g=git
fi
alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."
alias :qa='exit'
alias :q='clear'
if has systemctl; then
  alias reboot='systemctl reboot'
  alias winboot='systemctl reboot --boot-loader-entry=auto-windows'
  alias uefiboot='systemctl reboot --firmware-setup'
fi
alias shutdown='sudo shutdown'
alias mkdir="mkdir -p"
if has python3; then
  alias py='python3'
fi
if has bat; then
  alias cat='bat'
fi
if has btm; then
  alias top='btm'
fi
if has docker; then
  alias dkc='docker compose'
  alias dk='docker'
fi
if has kubectl; then
  alias k=kubectl
fi
if has kubectx; then
  alias ktx=kubectx
fi
if has kubens; then
  alias kns=kubens
fi
if has chezmoi; then
  alias cm=chezmoi
fi
if has just; then
  alias j=just
fi

mcd() {
  mkdir -p $@ && cd $@
}
n() {
  if [[ -d $f ]]; then 
    cur=$(pwd)
    cd $f
    nvim
    cd $cur
  else
    if [[ -z "$NVIM" ]] || ! has nvr; then
      nvim $@
    else
      nvr -sl $@
    fi
  fi
}
open() {
  for a in "$@"; do
    xdg-open $a >/dev/null 2>&1
  done
}
nohd() {
  nohup $@ >/dev/null 2>&1 &
}
if has uu-ls; then
  alias arch='uu-arch'
  alias base32='uu-base32'
  alias base64='uu-base64'
  alias basename='uu-basename'
  alias basenc='uu-basenc'
  alias chgrp='uu-chgrp'
  alias chmod='uu-chmod'
  alias chown='uu-chown'
  alias chroot='uu-chroot'
  alias cksum='uu-cksum'
  alias comm='uu-comm'
  alias coreutils='uu-coreutils'
  alias cp='uu-cp'
  alias csplit='uu-csplit'
  alias cut='uu-cut'
  alias date='uu-date'
  alias dd='uu-dd'
  alias df='uu-df'
  alias dir='uu-dir'
  alias dircolors='uu-dircolors'
  alias dirname='uu-dirname'
  alias du='uu-du'
  alias echo='uu-echo'
  alias env='uu-env'
  alias expand='uu-expand'
  alias expr='uu-expr'
  alias factor='uu-factor'
  alias false='uu-false'
  alias fmt='uu-fmt'
  alias fold='uu-fold'
  alias groups='uu-groups'
  alias hashsum='uu-hashsum'
  alias head='uu-head'
  alias hostid='uu-hostid'
  alias hostname='uu-hostname'
  alias id='uu-id'
  alias install='uu-install'
  alias join='uu-join'
  alias kill='uu-kill'
  alias l='uu-ls --color -F'
  alias la='uu-ls --color -FshklA'
  alias link='uu-link'
  alias ll='uu-ls --color -Fshkl'
  alias ln='uu-ln'
  alias logname='uu-logname'
  alias ls='uu-ls --color -Fshk'
  alias mkdir='uu-mkdir -p'
  alias mkfifo='uu-mkfifo'
  alias mknod='uu-mknod'
  alias mktemp='uu-mktemp'
  alias more='uu-more'
  alias mv='uu-mv'
  alias nice='uu-nice'
  alias nl='uu-nl'
  alias nohup='uu-nohup'
  alias nproc='uu-nproc'
  alias numfmt='uu-numfmt'
  alias od='uu-od'
  alias paste='uu-paste'
  alias pathchk='uu-pathchk'
  alias pinky='uu-pinky'
  alias pr='uu-pr'
  alias printenv='uu-printenv'
  alias printf='uu-printf'
  alias ptx='uu-ptx'
  alias pwd='uu-pwd'
  alias readlink='uu-readlink'
  alias realpath='uu-realpath'
  alias rm='uu-rm'
  alias rmdir='uu-rmdir'
  alias seq='uu-seq'
  alias shred='uu-shred'
  alias shuf='uu-shuf'
  alias sleep='uu-sleep'
  alias sort='uu-sort'
  alias split='uu-split'
  alias stat='uu-stat'
  alias stdbuf='uu-stdbuf'
  alias sum='uu-sum'
  alias sync='uu-sync'
  alias tac='uu-tac'
  alias tail='uu-tail'
  alias tee='uu-tee'
  alias timeout='uu-timeout'
  alias touch='uu-touch'
  alias tr='uu-tr'
  alias true='uu-true'
  alias truncate='uu-truncate'
  alias tsort='uu-tsort'
  alias uname='uu-uname'
  alias unexpand='uu-unexpand'
  alias uniq='uu-uniq'
  alias unlink='uu-unlink'
  alias uptime='uu-uptime'
  alias users='uu-users'
  alias vdir='uu-vdir'
  alias wc='uu-wc'
  alias who='uu-who'
  alias whoami='uu-whoami'
  alias yes='uu-yes'
fi

if has eza; then
  alias ls=eza
  alias ll="ls -lbhM --git"
  alias l=ls
  alias la="ll -a"
  alias tree="eza -T"
fi
