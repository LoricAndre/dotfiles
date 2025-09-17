BREW_BIN="/home/linuxbrew/.linuxbrew/bin/brew"
if [ -f "$BREW_BIN" ]; then
	eval "$($BREW_BIN shellenv)"
fi

