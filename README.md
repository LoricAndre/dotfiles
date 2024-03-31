# My dotfiles, managed with chezmoi

## Included

*Note*: `Colorscheme` means that the colorscheme is managed by chezmoi.

| Category | Tool | Colorscheme |
| -------- | ---- | ----------- |
| Shell | ZSH | N/A |
| WM | Hyprland | Yes |
| Terminal emulator | Kitty | Yes |
| Editor/IDE | Neovim | Yes |
| Notification daemon | Dunst | Yes |
| VCS | Git | N/A |
| VCS | Lazygit | Yes (indirect) |
| Runner | Fuzzel | Yes |
| Status bar | Waybar | Yes |

## Usage

### Colorscheme

To set the colorscheme, see `.chezmoidata`. Set the correct value for the `theme` key, then reload.
To add a colorscheme, see the `colors` section. The format is based on Base16.
