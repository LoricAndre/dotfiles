just _install-cli zsh

if ! command -v uu-coreutils >/dev/null 2>&1; then
	paru -S --needed --noconfirm uutils-coreutils
fi
