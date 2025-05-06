# vi: ft=nu
alias ll = ls -l
alias la = ls -al
alias l = ls
alias c = clear

alias g = git

alias parin = paru -Sy
alias parem = paru -Rscn


alias dkc = docker compose
alias dk = docker
alias k = kubectl
alias ktx = kubectx
alias kns = kubens

alias tf = terraform

alias j = just

match $env.KITTY_WINDOW_ID? {
  null => {}
  _ => {
    match $env.TMUX? {
      null => {
        alias ssh = kitty +kitten ssh
      }
      _ => {}
    }
    alias icat = kitty +kitten icat
  }
}

def --env mcd [p: path] {
  mkdir $p
  cd $p
}

def n [p?: path] {
  match $p {
    null => { nvim }
    _ if ($p | path type) == "dir" => {
      cd $p
      nvim
    }
    _ => {
      match $env.NVIM? {
        null => { nvim $p }
        _ => { nvr -sl $p }
      }
      if ($env.NVIM? | default false) {
        nvim $p
      } else {
        nvr -sl $p
      }
    }
  }
}

def "git-log" [] {
  git log --pretty=%h»¦«%s»¦«%aN»¦«%aE»¦«%aD -n 25 | lines | split column "»¦«" commit subject name email date | upsert date {|d| $d.date | into datetime}
}
