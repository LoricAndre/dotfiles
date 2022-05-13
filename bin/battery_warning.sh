status() {
	val=$(cat /sys/class/power_supply/BAT0/capacity)
	status=$(cat /sys/class/power_supply/BAT0/status)

	if [[ $status = Discharging ]]; then
	  (( $val <  15 )) && notify-send "Battery low" "$val % remaining."
	fi
}

while true; do
	status
	sleep 180
done
