let SessionLoad = 1
let s:so_save = &so | let s:siso_save = &siso | set so=0 siso=0
let v:this_session=expand("<sfile>:p")
silent only
cd ~/projects/formations_2023
if expand('%') == '' && !&modified && line('$') <= 1 && getline(1) == ''
  let s:wipebuf = bufnr('%')
endif
set shortmess=aoO
badd +2 Vue3/front/src/App.vue
badd +8 Vue3/front/src/main.js
badd +1 Vue3/front/.env
badd +2 Vue3/front/src/components/TodoEntry.vue
badd +8 Vue3/front/src/components/Todo.vue
badd +35 term://~/projects/formations_2023//3300596:/usr/bin/zsh
badd +200 term://~/projects/formations_2023//3301544:/usr/bin/zsh
argglobal
%argdel
set splitbelow splitright
wincmd t
set winminheight=0
set winheight=1
set winminwidth=0
set winwidth=1
argglobal
if bufexists("term://~/projects/formations_2023//3301544:/usr/bin/zsh") | buffer term://~/projects/formations_2023//3301544:/usr/bin/zsh | else | edit term://~/projects/formations_2023//3301544:/usr/bin/zsh | endif
if &buftype ==# 'terminal'
  silent file term://~/projects/formations_2023//3301544:/usr/bin/zsh
endif
setlocal fdm=expr
setlocal fde=nvim_treesitter#foldexpr()
setlocal fmr={{{,}}}
setlocal fdi=#
setlocal fdl=0
setlocal fml=1
setlocal fdn=20
setlocal fen
let s:l = 200 - ((53 * winheight(0) + 27) / 54)
if s:l < 1 | let s:l = 1 | endif
exe s:l
normal! zt
200
normal! 01|
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
let &so = s:so_save | let &siso = s:siso_save
let g:this_session = v:this_session
let g:this_obsession = v:this_session
doautoall SessionLoadPost
unlet SessionLoad
" vim: set ft=vim :
