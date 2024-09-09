[ -z "$EDITOR" ] && export EDITOR=nvim
[ -z "$VISUAL" ] && export VISUAL="nvim --cmd 'let g:flatten_wait=1'"
[ -z "$VISUAL" ] && export VISUAL=nvim
[ -z "$MANPAGER" ] && export MANPAGER="nvim +Man!"
# export XDG_CURRENT_DESKTOP=Unity
export XKB_DEFAULT_LAYOUT=fr
# export XKB_DEFAULT_OPTIONS="caps:escape,altwin:swap_alt_win,lv3:rwin_switch"
export PAGER=bat

export PATH=$HOME/bin:$HOME/.local/bin:/opt/texlive/2020/bin/x86_64-linux:$PATH:$HOME/.npm-packages/bin:/usr/lib/ruby/gems/2.7.0:$HOME/.gem/ruby/2.7.0:$HOME/.cargo/bin:$GOPATH/bin
