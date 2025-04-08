function precmd () {
  print -Pn "\e]0; - zsh\a"
  if [[ -f "$PWD/.venv/bin/activate" ]]; then
    source "$PWD/.venv/bin/activate"
  else
    deactivate >/dev/null 2>&1 || true
  fi
}
