function n
  if test -d $argv
    set p $HOME/.config/nvim/session/(echo (cd $argv && pwd) | sed -e 's#/##g').vim
    nvim -S "$p" -c "silent! Obsess $p"
  else
    nvim $argv
  end
end
