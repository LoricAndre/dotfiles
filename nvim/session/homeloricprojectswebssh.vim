let SessionLoad = 1
let s:so_save = &so | let s:siso_save = &siso | set so=0 siso=0
let v:this_session=expand("<sfile>:p")
silent only
cd ~/projects/webssh
if expand('%') == '' && !&modified && line('$') <= 1 && getline(1) == ''
  let s:wipebuf = bufnr('%')
endif
set shortmess=aoO
badd +101 webssh/templates/index.html
argglobal
%argdel
edit webssh/templates/index.html
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
2
normal! zo
22
normal! zo
25
normal! zo
26
normal! zo
27
normal! zo
28
normal! zo
29
normal! zo
30
normal! zo
31
normal! zo
32
normal! zo
35
normal! zo
36
normal! zo
37
normal! zo
42
normal! zo
43
normal! zo
44
normal! zo
47
normal! zo
50
normal! zo
51
normal! zo
52
normal! zo
56
normal! zo
55
normal! zo
56
normal! zo
60
normal! zo
61
normal! zo
62
normal! zo
65
normal! zo
68
normal! zo
71
normal! zo
72
normal! zo
73
normal! zo
82
normal! zo
let s:l = 82 - ((28 * winheight(0) + 27) / 54)
if s:l < 1 | let s:l = 1 | endif
exe s:l
normal! zt
82
normal! 031|
lcd ~/projects/webssh
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
