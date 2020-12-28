let SessionLoad = 1
let s:so_save = &g:so | let s:siso_save = &g:siso | setg so=0 siso=0 | setl so=-1 siso=-1
let v:this_session=expand("<sfile>:p")
silent only
cd ~/projects/votensta
if expand('%') == '' && !&modified && line('$') <= 1 && getline(1) == ''
  let s:wipebuf = bufnr('%')
endif
set shortmess=aoO
badd +121 front/src/components/HomePage.vue
badd +24 back/server.js
badd +10 back/routes/api.js
badd +7 back/routes/getVotes.js
badd +8 ./back/routes/form.js
badd +1 back/config/votes.json
badd +32 back/models/vote.js
badd +19 back/models/user.js
badd +10 ./back/config/config.js
badd +34 back/config/passport.js
badd +28 front/src/routes/routes.js
badd +21 front/src/components/VoteStatus.vue
badd +39 front/src/components/Admin.vue
badd +1 is
badd +14 front/src/components/Results.vue
badd +44 back/routes/results.js
badd +44 front/src/components/Pie.vue
badd +2 back/config/admins.json
badd +13 back/routes/admin.js
badd +28 front/src/components/Topnav.vue
badd +7 .gitignore
badd +4 front/src/App.vue
argglobal
%argdel
edit front/src/components/VoteStatus.vue
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
let s:l = 21 - ((20 * winheight(0) + 26) / 52)
if s:l < 1 | let s:l = 1 | endif
exe s:l
normal! zt
21
normal! 056|
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
