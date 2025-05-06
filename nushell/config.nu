# vi: ft=nu

$env.SHELL = "/bin/sh"

$env.config = {
  keybindings: [
    {
      name: skim_history
      modifier: control
      keycode: char_r
      mode: emacs
      event: {
        send: executehostcommand
        cmd: $"
          let result = history
              | uniq
              | sk --height 10 --tac --reverse --no-sort --format {get command} --preview {} ($env.SKIM_DEFAULT_OPTIONS)
              | get command;
          commandline edit --append $result;
          commandline set-cursor --end
        "
      }
    }
  ]
}

source $"($nu.default-config-dir)/aliases.nu"

# Starship
mkdir ($nu.data-dir | path join "vendor/autoload")
starship init nu | save -f ($nu.data-dir | path join "vendor/autoload/starship.nu")

# Direnv
$env.config = {
  hooks: {
    pre_prompt: [{ ||
      if (which direnv | is-empty) {
        return
      }

      direnv export json | from json | default {} | load-env
      if 'ENV_CONVERSIONS' in $env and 'PATH' in $env.ENV_CONVERSIONS {
        $env.PATH = do $env.ENV_CONVERSIONS.PATH.from_string $env.PATH
      }
    }]
  }
}

# Skim
plugin add $"($env.CARGO_HOME)/bin/nu_plugin_skim"


