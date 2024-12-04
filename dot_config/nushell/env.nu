# Nushell Environment Config File
#
# version = "0.100.0"

def create_left_prompt [] {
    let dir = match (do --ignore-shell-errors { $env.PWD | path relative-to $nu.home-path }) {
        null => $env.PWD
        '' => '~'
        $relative_pwd => ([~ $relative_pwd] | path join)
    }

    let path_color = (if (is-admin) { ansi red_bold } else { ansi green_bold })
    let separator_color = (if (is-admin) { ansi light_red_bold } else { ansi light_green_bold })
    let path_segment = $"($path_color)($dir)(ansi reset)"

    $path_segment | str replace --all (char path_sep) $"($separator_color)(char path_sep)($path_color)"
}

def create_right_prompt [] {
    # create a right prompt in magenta with green separators and am/pm underlined
    let time_segment = ([
        (ansi reset)
        (ansi magenta)
        (date now | format date '%x %X') # try to respect user's locale
    ] | str join | str replace --regex --all "([/:])" $"(ansi green)${1}(ansi magenta)" |
        str replace --regex --all "([AP]M)" $"(ansi magenta_underline)${1}")

    let last_exit_code = if ($env.LAST_EXIT_CODE != 0) {([
        (ansi rb)
        ($env.LAST_EXIT_CODE)
    ] | str join)
    } else { "" }

    ([$last_exit_code, (char space), $time_segment] | str join)
}

# Use nushell functions to define your right and left prompt
$env.PROMPT_COMMAND = {|| create_left_prompt }
# FIXME: This default is not implemented in rust code as of 2023-09-08.
$env.PROMPT_COMMAND_RIGHT = {|| create_right_prompt }

# The prompt indicators are environmental variables that represent
# the state of the prompt
$env.PROMPT_INDICATOR = {|| "> " }
$env.PROMPT_INDICATOR_VI_INSERT = {|| ": " }
$env.PROMPT_INDICATOR_VI_NORMAL = {|| "> " }
$env.PROMPT_MULTILINE_INDICATOR = {|| "::: " }

# If you want previously entered commands to have a different prompt from the usual one,
# you can uncomment one or more of the following lines.
# This can be useful if you have a 2-line prompt and it's taking up a lot of space
# because every command entered takes up 2 lines instead of 1. You can then uncomment
# the line below so that previously entered commands show with a single `🚀`.
# $env.TRANSIENT_PROMPT_COMMAND = {|| "🚀 " }
# $env.TRANSIENT_PROMPT_INDICATOR = {|| "" }
# $env.TRANSIENT_PROMPT_INDICATOR_VI_INSERT = {|| "" }
# $env.TRANSIENT_PROMPT_INDICATOR_VI_NORMAL = {|| "" }
# $env.TRANSIENT_PROMPT_MULTILINE_INDICATOR = {|| "" }
# $env.TRANSIENT_PROMPT_COMMAND_RIGHT = {|| "" }

# Specifies how environment variables are:
# - converted from a string to a value on Nushell startup (from_string)
# - converted from a value back to a string when running external commands (to_string)
# Note: The conversions happen *after* config.nu is loaded
$env.ENV_CONVERSIONS = {
    "PATH": {
        from_string: { |s| $s | split row (char esep) | path expand --no-symlink }
        to_string: { |v| $v | path expand --no-symlink | str join (char esep) }
    }
    "Path": {
        from_string: { |s| $s | split row (char esep) | path expand --no-symlink }
        to_string: { |v| $v | path expand --no-symlink | str join (char esep) }
    }
}

# Directories to search for scripts when calling source or use
# The default for this is $nu.default-config-dir/scripts
$env.NU_LIB_DIRS = [
    ($nu.default-config-dir | path join 'scripts') # add <nushell-config-dir>/scripts
    ($nu.data-dir | path join 'completions') # default home for nushell completions
]

# Directories to search for plugin binaries when calling register
# The default for this is $nu.default-config-dir/plugins
$env.NU_PLUGIN_DIRS = [
    ($nu.default-config-dir | path join 'plugins') # add <nushell-config-dir>/plugins
]

# ---
# XDG
# ---
$env.XDG_DATA_HOME = ($env.PATH | path join ".local"  "share")
$env.XDG_STATE_HOME = ($env.PATH | path join ".local"  "state")
$env.XDG_CONFIG_HOME = ($env.PATH | path join ".config")
$env.XDG_CACHE_HOME = ($env.PATH | path join ".cache")

# ---
# XDG ninja
# ---
$env.ANDROID_USER_HOME = (env.$XDG_DATA_HOME | path join "android")
$env.ANSIBLE_HOME = (env.$XDG_DATA_HOME | path join "ansible")
$env.AWS_SHARED_CREDENTIALS_FILE = (env.$XDG_CONFIG_HOME | path join "aws" "credentials")
$env.AWS_CONFIG_FILE = (env.$XDG_CONFIG_HOME | path join "aws" "config")
$env.AZURE_CONFIG_DIR = (env.$XDG_DATA_HOME | path join "azure")
$env.ADOTDIR = (env.$XDG_DATA_HOME | path join "antigen")
$env.CARGO_HOME = (env.$XDG_DATA_HOME | path join "cargo")
$env.DOCKER_CONFIG = (env.$XDG_CONFIG_HOME | path join "docker")
$env.GNUPGHOME = (env.$XDG_DATA_HOME | path join "gnupg")
$env.GTK2_RC_FILES = (env.$XDG_CONFIG_HOME | path join "gtk-2.0" "gtkrc")
$env.GOPATH = ($env.XDG_DATA_HOME | path join "go")
$env.IPYTHONDIR = (env.$XDG_CONFIG_HOME | path join "ipython")
$env.NUGET_PACKAGES = (env.$XDG_CACHE_HOME | path join "NuGetPackages")
$env.NVM_DIR = (env.$XDG_DATA_HOME | path join "nvm")
$env.OMNISHARPHOME = (env.$XDG_CONFIG_HOME | path join "omnisharp")
$env._JAVA_OPTIONS = $"-Djava.util.prefs.userRoot=($env.XDG_CONFIG_HOME | path join "java")"
$env.PASSWORD_STORE_DIR = (env.$XDG_DATA_HOME | path join "pass")
$env.PYENV_ROOT = (env.$XDG_DATA_HOME | path join "pyenv")
$env.RUSTUP_HOME = (env.$XDG_DATA_HOME | path join "rustup")
$env.VAGRANT_HOME = (env.$XDG_DATA_HOME | path join "vagrant")
$env.WINEPREFIX = (env.$XDG_DATA_HOME | path join "wine")
$env.XINITRC = (env.$XDG_CONFIG_HOME | path join "X11" "xinitrc")
$env._Z_DATA = (env.$XDG_DATA_HOME | path join "z")
$env.ZDOTDIR = (env.$HOME" | path join ".config" "zsh")

# ---
# Path
# ---
use std "path add"
$env.PATH = ($env.PATH | split row (char esep))
path add ($env.HOME | path join "bin")
path add ($env.HOME | path join ".local" "bin")
path add ($env.HOME | path join ".npm-packages" "bin")
path add ($env.GOPATH | path join "bin")

$env.LANG = "en_US.UTF-8"

# ---
# Tools
# ---
$env.PAGER = "bat"
$env.EDITOR = $env | get --ignore-errors EDITOR | default "nvr -sl --remote-wait"
$env.VISUAL = $env | get --ignore-errors EDITOR | default $env.EDITOR
$env.MANPAGER = $env | get --ignore-errors MANPAGER | default "nvim +Man!"

source ($nu.default-config-dir | path join 'aliases.nu')
