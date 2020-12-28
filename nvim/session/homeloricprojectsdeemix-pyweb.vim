let SessionLoad = 1
let s:so_save = &so | let s:siso_save = &siso | set so=0 siso=0
let v:this_session=expand("<sfile>:p")
silent only
cd ~/projects/deemix-pyweb
if expand('%') == '' && !&modified && line('$') <= 1 && getline(1) == ''
  let s:wipebuf = bufnr('%')
endif
set shortmess=aoO
badd +261 app.py
badd +21 ~/.local/lib/python3.8/site-packages/deemix/utils/localpaths.py
badd +232 server.py
badd +1 .gitignore
badd +50 ~/.local/lib/python3.8/site-packages/deemix/app/spotifyhelper.py
badd +109 ~/.local/lib/python3.8/site-packages/deemix/app/settings.py
badd +1 ~/.config/deemix/authCredentials.json
badd +1 ~/.config/deemix/config.json
badd +1 ~/.config/deemix/.arl
badd +480 ~/.local/lib/python3.8/site-packages/deemix/app/queuemanager.py
badd +2 ~/.local/lib/python3.8/site-packages/deemix/api/deezer.py
badd +12 ~/.local/lib/python3.8/site-packages/deemix/app/queueitem.py
badd +658 ~/.local/lib/python3.8/site-packages/deemix/app/downloadjob.py
badd +309 ~/.local/lib/python3.8/site-packages/deemix/app/track.py
badd +186 webui/src/components/pages/Artist.vue
argglobal
%argdel
edit ~/.local/lib/python3.8/site-packages/deemix/api/deezer.py
set splitbelow splitright
wincmd t
set winminheight=0
set winheight=1
set winminwidth=0
set winwidth=1
argglobal
setlocal fdm=manual
setlocal fde=0
setlocal fmr={{{,}}}
setlocal fdi=#
setlocal fdl=0
setlocal fml=1
setlocal fdn=20
setlocal fen
silent! normal! zE
let s:l = 2 - ((1 * winheight(0) + 27) / 54)
if s:l < 1 | let s:l = 1 | endif
exe s:l
normal! zt
2
normal! 0
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
