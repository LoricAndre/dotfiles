#!/bin/sh

handle_mon() {
  echo $1
  pkill kanshi || true
  sleep 0.1
  hyprctl keyword monitor ,pref,auto,auto
  sleep 0.1
  kanshi &
}

handle_title_change() {
  args="$(echo $1 | cut -d'>' -f3-)"
  addr="$(echo $args | cut -d',' -f1)"
  title="$(echo $args | cut -d',' -f2-)"
  echo "Window $addr title changed to $title ($args)"
  case $title in
    "Extension: "*)
      hyprctl --batch "\
            dispatch setfloating address:0x$addr; \
            dispatch resizewindowpixel exact 20% 50%, address:0x$addr; \
            dispatch centerwindow;" ;;
  esac
}

handle() {
  echo "Received $1"
  case $1 in
    # monitoradded*) handle_mon $1;;
    "monitorremoved>>eDP-1") echo 'kanshi removed the internal monitor, nothing to do' ;;
    "monitorremoved>>"*) handle_mon "$1";;
    "windowtitlev2>>"*) handle_title_change "$1" ;;
    # focusedmon*) do_something_else ;;
  esac
}

pidof -o %PPID -x $0 >/dev/null && notify-send -t 3000 -a "$0" "Warn: Script already running" && exit 1

notify-send -t 1000 -a "$0" "Starting script..."

socat -U - UNIX-CONNECT:$XDG_RUNTIME_DIR/hypr/$HYPRLAND_INSTANCE_SIGNATURE/.socket2.sock | while read -r line; do handle "$line"; done
