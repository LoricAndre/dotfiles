import 'variables.just'

set quiet
set dotenv-load
set shell := ["bash", "-c"]

alias a := apply

cp dir:
	#!/usr/bin/env bash

	set -euo pipefail

	echo '{{ CYAN }}{{ BOLD }}[{{ dir }}]{{ NORMAL }} Copying templated files to {{ replace(TARGET_DIR, home_dir(), "~") }}'

	mkdir -p '{{ TARGET_DIR }}'
	if command -v rsync >/dev/null 2>&1; then
		rsync -rLcgoXpb --backup-dir='{{ BACKUPS_DIR }}' '{{ TEMPLATED_DIR }}/{{ dir }}/.' '{{ TARGET_DIR }}'
	else
		cp -ua '{{ TEMPLATED_DIR }}/{{ dir }}/.' '{{ TARGET_DIR }}'
	fi

clean dir:
	rm -r '{{ TEMPLATED_DIR }}/{{ dir }}' 2>/dev/null || true

pre-hook:
	rm -r 'oil:' 2>/dev/null || true
	notify-send 'Applying dots changes...'

_tpl file:
	#!/usr/bin/env bash
	set -euo pipefail

	mkdir -p `dirname {{ TEMPLATED_DIR }}/{{ file }}`
	target_file=$(echo '{{ TEMPLATED_DIR }}/{{ file }}' | sed -n 's#^\(.*\)/+\([^/]\+\)$#\1/\2#p')
	DOLLAR='$' envsubst < '{{ file }}' > "$target_file"
	chown --reference='{{ file }}' "$target_file"
	chmod --reference='{{ file }}' "$target_file"

tpl dir:
	#!/usr/bin/env bash
	set -euo pipefail

	echo '{{ CYAN }}{{ BOLD }}[{{ dir }}]{{ NORMAL }} Templating files'

	find '{{ dir }}' -type f -not -name 'dots.env' | while read f; do
		if [[ "$f" =~ ^.*/\+[^/]*$ ]]; then
			{{ DEBUG }} && echo "{{ CYAN }}{{ BOLD }} > {{ NORMAL }} Templating $f"
			{{ JUST }} _tpl "$f"
		else
			{{ DEBUG }} && echo -e "{{ CYAN }}{{ BOLD }} > {{ NORMAL }} Copying $f"
			mkdir -p `dirname "{{ TEMPLATED_DIR }}/$f"`
			cp "$f" "{{ TEMPLATED_DIR }}/$f"
		fi
	done


_apply dir: (clean dir) (tpl dir) (cp dir)
	# echo '{{ CYAN }}{{ BOLD }}[{{ dir }}]{{ NORMAL }} Done'

apply *dirs: pre-hook
	#!/usr/bin/env bash
	set -euo pipefail

	if [ -n '{{ dirs }}' ]; then
		DIRS='{{ dirs }}'
	else
		DIRS=`find . -maxdepth 1 -type d -not -name '.*' -printf '%f\n'`
	fi

	for dir in $DIRS; do
		(
			set -a
			[ -f "$dir/dots.env" ] && source "$dir/dots.env"
			set +a
			{{ JUST }} _apply "$dir"
		)
	done

env file:
	ln -fs `realpath {{ file }}` .env

@_dbg:
	echo $FOO
	echo $TARGET_DIR
