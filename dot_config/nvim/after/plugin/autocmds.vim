let chezmoi_files = "~/.local/share/chezmoi/**"

augroup custom_autocmds_vimscript
  au!
  au BufEnter term://* startinsert
  au BufLeave term:// stopinsert
  au BufWritePost ~/.local/share/chezmoi/** silent !cp ~/.config/nvim/lazy-lock.json ~/.local/share/chezmoi/dot_config/nvim/lazy-lock.json && chezmoi apply 
augroup END
