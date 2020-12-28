let SessionLoad = 1
let s:so_save = &g:so | let s:siso_save = &g:siso | setg so=0 siso=0 | setl so=-1 siso=-1
let v:this_session=expand("<sfile>:p")
silent only
cd ~/Files/ENSTA/PIE/arduino
if expand('%') == '' && !&modified && line('$') <= 1 && getline(1) == ''
  let s:wipebuf = bufnr('%')
endif
set shortmess=aoO
badd +12 libraries/SendOnlySoftwareSerial/SendOnlySoftwareSerial.cpp
badd +57 receiver/receiver.ino
badd +58 term://~/Files/ENSTA/PIE/arduino//193666:/home/loric/.local/share/nvim/site/pack/packer/start/vim-arduino/bin/run-headless\ arduino\ --upload\ --board\ arduino:avr:uno\ --port\ /dev/ttyACM0\ --pref\ programmer=arduino:usbtinyisp\ --pref\ \"build.path=/home/loric/Files/ENSTA/PIE/arduino/receiver/build\"\ --verbose-upload\ \"/home/loric/Files/ENSTA/PIE/arduino/receiver/receiver.ino\"
badd +0 term://~/Files/ENSTA/PIE/arduino//199953:/home/loric/.local/share/nvim/site/pack/packer/start/vim-arduino/bin/run-headless\ arduino\ --upload\ --board\ arduino:avr:uno\ --port\ /dev/ttyACM0\ --pref\ programmer=arduino:usbtinyisp\ --pref\ \"build.path=/home/loric/Files/ENSTA/PIE/arduino/receiver/build\"\ --verbose-upload\ \"/home/loric/Files/ENSTA/PIE/arduino/receiver/receiver.ino\"
badd +0 term://~/Files/ENSTA/PIE/arduino//199958:screen\ /dev/ttyACM0\ 9600
badd +26 ./basic_communication/sender/sender.ino
badd +24 term://~/Files/ENSTA/PIE/arduino//200306:/home/loric/.local/share/nvim/site/pack/packer/start/vim-arduino/bin/run-headless\ arduino\ --upload\ --board\ arduino:avr:uno\ --port\ /dev/ttyACM0\ --pref\ programmer=arduino:usbtinyisp\ --pref\ \"build.path=/home/loric/Files/ENSTA/PIE/arduino/basic_communication/sender/build\"\ --verbose-upload\ \"/home/loric/Files/ENSTA/PIE/arduino/basic_communication/sender/sender.ino\"
badd +0 term://~/Files/ENSTA/PIE/arduino//200309:screen\ /dev/ttyACM0\ 9600
badd +25 term://~/Files/ENSTA/PIE/arduino//200939:/home/loric/.local/share/nvim/site/pack/packer/start/vim-arduino/bin/run-headless\ arduino\ --upload\ --board\ arduino:avr:uno\ --port\ /dev/ttyACM0\ --pref\ programmer=arduino:usbtinyisp\ --pref\ \"build.path=/home/loric/Files/ENSTA/PIE/arduino/basic_communication/sender/build\"\ --verbose-upload\ \"/home/loric/Files/ENSTA/PIE/arduino/basic_communication/sender/sender.ino\"
badd +0 term://~/Files/ENSTA/PIE/arduino//200944:screen\ /dev/ttyACM0\ 9600
badd +24 term://~/Files/ENSTA/PIE/arduino//208331:/home/loric/.local/share/nvim/site/pack/packer/start/vim-arduino/bin/run-headless\ arduino\ --upload\ --board\ arduino:avr:uno\ --port\ /dev/ttyACM0\ --pref\ programmer=arduino:usbtinyisp\ --pref\ \"build.path=/home/loric/Files/ENSTA/PIE/arduino/basic_communication/sender/build\"\ --verbose-upload\ \"/home/loric/Files/ENSTA/PIE/arduino/basic_communication/sender/sender.ino\"
badd +82 term://~/Files/ENSTA/PIE/arduino//208851:/home/loric/.local/share/nvim/site/pack/packer/start/vim-arduino/bin/run-headless\ arduino\ --upload\ --board\ arduino:avr:uno\ --port\ /dev/ttyACM0\ --pref\ programmer=arduino:usbtinyisp\ --pref\ \"build.path=/home/loric/Files/ENSTA/PIE/arduino/basic_communication/sender/build\"\ --verbose-upload\ \"/home/loric/Files/ENSTA/PIE/arduino/basic_communication/sender/sender.ino\"
badd +0 term://~/Files/ENSTA/PIE/arduino//209111:screen\ /dev/ttyACM0\ 9600
argglobal
%argdel
edit ./basic_communication/sender/sender.ino
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
let s:l = 26 - ((25 * winheight(0) + 26) / 53)
if s:l < 1 | let s:l = 1 | endif
exe s:l
normal! zt
26
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
let &g:so = s:so_save | let &g:siso = s:siso_save
let g:this_session = v:this_session
let g:this_obsession = v:this_session
doautoall SessionLoadPost
unlet SessionLoad
" vim: set ft=vim :
