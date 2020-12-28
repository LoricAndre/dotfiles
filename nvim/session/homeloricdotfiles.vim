let SessionLoad = 1
let s:so_save = &g:so | let s:siso_save = &g:siso | setg so=0 siso=0 | setl so=-1 siso=-1
let v:this_session=expand("<sfile>:p")
silent only
cd ~/dotfiles
if expand('%') == '' && !&modified && line('$') <= 1 && getline(1) == ''
  let s:wipebuf = bufnr('%')
endif
set shortmess=aoO
badd +3 i3status-rust/config.toml
badd +117 zsh/zshrc
badd +22 Makefile
badd +4 mako/Makefile
badd +7 mako/config
badd +4 sway/Makefile
badd +168 sway/config
badd +5 ~/.cache/wal/colors.sh
badd +4 i3status-rust/Makefile
badd +14 i3status-rust/lule.toml
badd +1 ~/bin/lule_s
badd +1 zsh/Makefile
badd +1 misc/Makefile
badd +1 nvim/Makefile
badd +4 kitty/Makefile
badd +1 ranger/Makefile
badd +1 desktop/Makefile
badd +1 kitty/colors
badd +10 README.md
badd +2 fontconfig/Makefile
badd +12 nvim/misc.vim
badd +1 nvim/lua/options.lua
badd +6 kitty/conf
argglobal
%argdel
edit README.md
set splitbelow splitright
wincmd t
set winminheight=0
set winheight=1
set winminwidth=0
set winwidth=1
argglobal
setlocal fdm=expr
setlocal fde=nvim_treesitter#foldexpr()
setlocal fmr={{{,}}}
setlocal fdi=#
setlocal fdl=0
setlocal fml=1
setlocal fdn=20
setlocal fen
let s:l = 10 - ((9 * winheight(0) + 26) / 53)
if s:l < 1 | let s:l = 1 | endif
exe s:l
normal! zt
10
normal! 083|
tabnext 1
if exists('s:wipebuf') && getbufvar(s:wipebuf, '&buftype') isnot# 'terminal'
  silent exe 'bwipe ' . s:wipebuf
endif
unlet! s:wipebuf
set winheight=1 winwidth=20 winminheight=1 winminwidth=1 shortmess=filnxtToOF
let s:sx = expand("<sfile>:p:r")."x.vim"
if filereadable(s:sx)
  exe "source " . fnameescape(s:sx)
endif
let &g:so = s:so_save | let &g:siso = s:siso_save
let g:this_session = v:this_session
let g:this_obsession = v:this_session
doautoall SessionLoadPost
unlet SessionLoad
" vim: set ft=vim :
