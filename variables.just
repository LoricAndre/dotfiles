TARGET_DIR := env("DOTS_TARGET_DIR", home_dir())

TEMPLATED_DIR := justfile_directory() / '.templated'
BACKUPS_DIR := justfile_directory() / '.backups'
JUST := just_executable() + ' --working-directory "' + justfile_directory() + '"' + ' --justfile "' + justfile() + '"'
DEBUG := "false"

export terminal := "kitty"
export browser := "zen-browser"
export browser_desktop := if browser == "zen-browser" { "zen.desktop" } else { browser + ".desktop" }
export font_size := "10"
export font_family := "JetBrainsMono Nerd Font Mono"
