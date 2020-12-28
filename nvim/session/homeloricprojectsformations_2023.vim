let SessionLoad = 1
let s:so_save = &so | let s:siso_save = &siso | set so=0 siso=0
let v:this_session=expand("<sfile>:p")
silent only
cd 
if expand('%') == '' && !&modified && line('$') <= 1 && getline(1) == ''
  let s:wipebuf = bufnr('%')
endif
set shortmess=aoO
badd +1 README.md
badd +1 Vue3/front/src/components/TodoEntry.vue
badd +27 front/src/components/Todo.vue
badd +75 back/server.js
badd +24 back/config/passport.js
badd +1 back/models/User.js
badd +15 back/routes/getTodoEntries.js
badd +10 front/src/main.js
badd +1 front/src/App.vue
badd +28 front/package.json
badd +2 back/models/todoEntry.js
badd +1 front/.env
badd +5 back/config/config.js
badd +5 back/routes/login.js
badd +35 front/src/routes.js
badd +4 front/vue.config.js
badd +2 term://~/projects/formations_2023//489197:git\ ls-files\ \|\ fzf\ -m\ --preview\ \'bat\ --color=always\ \{}\'\ >\ /tmp/fzterm
badd +28 term://~/projects/formations_2023//189049:git\ ls-files\ \|\ fzf\ -m\ --preview\ \'bat\ --color=always\ \{}\'\ >\ /tmp/fzterm
argglobal
%argdel
edit back/config/passport.js
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
setlocal fdl=5
setlocal fml=1
setlocal fdn=20
setlocal fen
5
normal! zo
6
normal! zo
19
normal! zo
20
normal! zo
28
normal! zo
let s:l = 24 - ((23 * winheight(0) + 27) / 54)
if s:l < 1 | let s:l = 1 | endif
exe s:l
normal! zt
24
normal! 035|
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
