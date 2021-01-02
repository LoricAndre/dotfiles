let SessionLoad = 1
let s:so_save = &g:so | let s:siso_save = &g:siso | setg so=0 siso=0 | setl so=-1 siso=-1
let v:this_session=expand("<sfile>:p")
silent only
cd ~/
if expand('%') == '' && !&modified && line('$') <= 1 && getline(1) == ''
  let s:wipebuf = bufnr('%')
endif
set shortmess=aoO
badd +1 /tmp/scp0/bot.js
badd +4 ~/Files/vimwiki/index.wiki
badd +1 ~/Files/vimwiki/Todo.wiki
badd +1 ~/Files/vimwiki/.wiki
argglobal
%argdel
edit ~/Files/vimwiki/Todo.wiki
set splitbelow splitright
wincmd _ | wincmd |
split
1wincmd k
wincmd w
wincmd t
set winminheight=0
set winheight=1
set winminwidth=0
set winwidth=1
exe '1resize ' . ((&lines * 26 + 27) / 55)
exe '2resize ' . ((&lines * 26 + 27) / 55)
argglobal
setlocal fdm=manual
setlocal fde=nvim_treesitter#foldexpr()
setlocal fmr={{{,}}}
setlocal fdi=#
setlocal fdl=0
setlocal fml=1
setlocal fdn=20
setlocal fen
silent! normal! zE
let s:l = 1 - ((0 * winheight(0) + 13) / 26)
if s:l < 1 | let s:l = 1 | endif
exe s:l
normal! zt
1
normal! 014|
wincmd w
argglobal
if bufexists("~/.local/share/nvim/site/pack/packer/start/vimwiki/doc/vimwiki.txt") | buffer ~/.local/share/nvim/site/pack/packer/start/vimwiki/doc/vimwiki.txt | else | edit ~/.local/share/nvim/site/pack/packer/start/vimwiki/doc/vimwiki.txt | endif
if &buftype ==# 'terminal'
  silent file ~/.local/share/nvim/site/pack/packer/start/vimwiki/doc/vimwiki.txt
endif
setlocal fdm=manual
setlocal fde=nvim_treesitter#foldexpr()
setlocal fmr={{{,}}}
setlocal fdi=#
setlocal fdl=0
setlocal fml=1
setlocal fdn=20
setlocal nofen
silent! normal! zE
let s:l = 1863 - ((22 * winheight(0) + 13) / 26)
if s:l < 1 | let s:l = 1 | endif
exe s:l
normal! zt
1863
normal! 058|
wincmd w
exe '1resize ' . ((&lines * 26 + 27) / 55)
exe '2resize ' . ((&lines * 26 + 27) / 55)
tabnext 1
if exists('s:wipebuf') && getbufvar(s:wipebuf, '&buftype') isnot# 'terminal'
  silent exe 'bwipe ' . s:wipebuf
endif
unlet! s:wipebuf
set winheight=1 winwidth=20 winminheight=1 winminwidth=1 shortmess=filnxtToOFc
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
