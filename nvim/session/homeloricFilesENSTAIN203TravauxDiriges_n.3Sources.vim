let SessionLoad = 1
let s:so_save = &g:so | let s:siso_save = &g:siso | setg so=0 siso=0 | setl so=-1 siso=-1
let v:this_session=expand("<sfile>:p")
silent only
cd ~/Files/ENSTA/IN203/TravauxDiriges_n.3/Sources
if expand('%') == '' && !&modified && line('$') <= 1 && getline(1) == ''
  let s:wipebuf = bufnr('%')
endif
set shortmess=aoO
badd +55 dotproduct_thread.cpp
badd +6 dotproduct.cpp
badd +115 README.md
badd +95 TestProductMatrix.cpp
badd +30 ProdMatMat.cpp
badd +11 Matrix.cpp
badd +1 Matrix.hpp
badd +26 ../Solutions/ProdMatMat_blockomp.cpp
badd +227 ../Solutions/README.md
badd +1 ./bhudda.cpp
badd +75 ./bitonic.cpp
badd +27 ./Vecteur.hpp
badd +28 Vecteur.cpp
argglobal
%argdel
edit ./bitonic.cpp
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
setlocal fdl=6
setlocal fml=1
setlocal fdn=20
setlocal fen
1
normal! zo
17
normal! zo
19
normal! zo
20
normal! zo
23
normal! zo
31
normal! zo
49
normal! zo
95
normal! zo
116
normal! zo
84
normal! zo
107
normal! zo
128
normal! zo
let s:l = 65 - ((32 * winheight(0) + 26) / 53)
if s:l < 1 | let s:l = 1 | endif
exe s:l
normal! zt
65
normal! 029|
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
