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
badd +13 Makefile
badd +1 mako/Makefile
badd +7 mako/config
badd +1 sway/Makefile
badd +1 sway/config
badd +5 ~/.cache/wal/colors.sh
badd +8 i3status-rust/Makefile
badd +14 i3status-rust/lule.toml
badd +1 ~/bin/lule_s
badd +1 zsh/Makefile
badd +1 misc/Makefile
badd +1 nvim/Makefile
badd +4 kitty/Makefile
badd +1 ranger/Makefile
badd +1 desktop/Makefile
badd +21 kitty/colors
badd +9 README.md
badd +2 fontconfig/Makefile
badd +7 nvim/misc.vim
badd +1 nvim/lua/options.lua
argglobal
%argdel
edit nvim/lua/options.lua
set splitbelow splitright
wincmd _ | wincmd |
vsplit
1wincmd h
wincmd w
wincmd t
set winminheight=0
set winheight=1
set winminwidth=0
set winwidth=1
exe 'vert 1resize ' . ((&columns * 106 + 106) / 213)
exe 'vert 2resize ' . ((&columns * 106 + 106) / 213)
argglobal
setlocal fdm=expr
setlocal fde=nvim_treesitter#foldexpr()
setlocal fmr={{{,}}}
setlocal fdi=#
setlocal fdl=0
setlocal fml=1
setlocal fdn=20
setlocal fen
let s:l = 30 - ((29 * winheight(0) + 26) / 53)
if s:l < 1 | let s:l = 1 | endif
exe s:l
normal! zt
30
normal! 014|
wincmd w
argglobal
if bufexists("nvim/misc.vim") | buffer nvim/misc.vim | else | edit nvim/misc.vim | endif
if &buftype ==# 'terminal'
  silent file nvim/misc.vim
endif
setlocal fdm=expr
setlocal fde=nvim_treesitter#foldexpr()
setlocal fmr={{{,}}}
setlocal fdi=#
setlocal fdl=0
setlocal fml=1
setlocal fdn=20
setlocal fen
let s:l = 12 - ((11 * winheight(0) + 26) / 53)
if s:l < 1 | let s:l = 1 | endif
exe s:l
normal! zt
12
normal! 0
wincmd w
exe 'vert 1resize ' . ((&columns * 106 + 106) / 213)
exe 'vert 2resize ' . ((&columns * 106 + 106) / 213)
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
nohlsearch
let g:this_session = v:this_session
let g:this_obsession = v:this_session
doautoall SessionLoadPost
unlet SessionLoad
" vim: set ft=vim :
