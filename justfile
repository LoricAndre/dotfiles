quick-apply:
  chezmoi apply --exclude scripts

apply:
  chezmoi apply

hooks: packages-hook

packages-hook:
  cp ./_files/pre-commit-hook.sh .git/hooks/pre-commit
  chmod +x .git/hooks/pre-commit
