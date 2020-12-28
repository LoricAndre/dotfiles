let SessionLoad = 1
let s:so_save = &so | let s:siso_save = &siso | set so=0 siso=0
let v:this_session=expand("<sfile>:p")
silent only
cd ~/projects/parrainage
if expand('%') == '' && !&modified && line('$') <= 1 && getline(1) == ''
  let s:wipebuf = bufnr('%')
endif
set shortmess=aoO
badd +72 views/results.ejs
badd +32 scripts/populateFromLDAP.js
badd +70 utils/form.js
badd +1 routes/API/form.js
badd +96 models/userAnswer.js
badd +9 install.sh
badd +1 scripts/missingHints.js
badd +67 views/main.ejs
badd +11 scripts/csv/questions.csv
badd +12 scripts/csv/responses.csv
badd +21 routes/index.js
badd +41 routes/API/users.js
badd +5 routes/login.js
badd +1 server.js
badd +25 config/config.template.js
badd +18 models/answer.js
badd +103 models/question.js
badd +32 scripts/populateHouses.js
badd +919 scripts/csv/houses.json
badd +168 matching/matching.js
badd +190 models/mixins.js
badd +25 config/config.js
badd +21 scripts/housesFromAnswers.js
argglobal
%argdel
edit matching/matching.js
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
setlocal fdl=8
setlocal fml=1
setlocal fdn=20
setlocal fen
117
normal! zo
let s:l = 173 - ((50 * winheight(0) + 27) / 54)
if s:l < 1 | let s:l = 1 | endif
exe s:l
normal! zt
173
normal! 010|
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
