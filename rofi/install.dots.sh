just _install-cli rofi

if [[ "$(gcc --print-file-name=rofi/calc.so)" == "rofi/calc.so" ]]; then
	paru -S --needed --noconfirm "rofi-calc"
fi
