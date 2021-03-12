set -x PATH $HOME/bin $HOME/.local/bin $HOME/.cargo/bin $PATH
set -x LANG en_US.UTF-8
set -x EDITOR nvim
set -x VISUAL nvim

bind [P delete-char


set -x MOZ_ENABLE_WAYLAND 1
# If running from tty1 start sway
if [ "(tty)" = "/dev/tty1" ]
  exec sway
end

source $HOME/.config/fish/abbr.fish
