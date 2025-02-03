#!/bin/sh

result() {
	tree="$(bspc query -T -m)"
	focused="$(bspc query -T -d)"
	echo "{\"tree\": $tree, \"focused\": $focused}"
}

result
bspc subscribe desktop | while read -r _; do
	result
done
