just _install-cli lazyjj

if ! command -v jj >/dev/null 2>&1; then
	paru -S jujustu --needed --noconfirm
fi
