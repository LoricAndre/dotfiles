quick-apply:
  chezmoi apply --exclude scripts

apply:
  chezmoi apply

sync-packages:
  git pull --autostash
  paru -Sy --needed --noconfirm $(cat _files/packages | tr '\n' ' ')

hooks: packages-hook

packages-hook:
  cp ./_files/pre-commit-hook.sh .git/hooks/pre-commit
  chmod +x .git/hooks/pre-commit
