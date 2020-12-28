let SessionLoad = 1
let s:so_save = &g:so | let s:siso_save = &g:siso | setg so=0 siso=0 | setl so=-1 siso=-1
let v:this_session=expand("<sfile>:p")
silent only
cd ~/projects/tangoalpha-website
if expand('%') == '' && !&modified && line('$') <= 1 && getline(1) == ''
  let s:wipebuf = bufnr('%')
endif
set shortmess=aoO
badd +12 config/config.js
badd +22 views/includes/tools/tools_associations.ejs
badd +218 views/associations.ejs
argglobal
%argdel
edit views/associations.ejs
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
setlocal fdl=13
setlocal fml=1
setlocal fdn=20
setlocal fen
2
normal! zo
8
normal! zo
13
normal! zo
14
normal! zo
97
normal! zo
120
normal! zo
121
normal! zo
123
normal! zo
124
normal! zo
125
normal! zo
128
normal! zo
134
normal! zo
137
normal! zo
138
normal! zo
139
normal! zo
140
normal! zo
144
normal! zo
159
normal! zo
160
normal! zo
164
normal! zo
183
normal! zo
184
normal! zo
188
normal! zo
206
normal! zo
207
normal! zo
211
normal! zo
237
normal! zo
let s:l = 218 - ((26 * winheight(0) + 26) / 53)
if s:l < 1 | let s:l = 1 | endif
exe s:l
normal! zt
218
normal! 023|
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
