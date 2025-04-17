import 'variables.just'

TARGET_DIR := env("dots_target_dir", home_dir())

TEMPLATED_DIR := justfile_directory() / '.templated'
BACKUPS_DIR := justfile_directory() / '.backups'
JUST := just_executable() + ' --working-directory "' + justfile_directory() + '"' + ' --justfile "' + justfile() + '"'

DEBUG := env("dots_debug", "false")

set quiet
set dotenv-load
set shell := ["bash", "-c"]

alias a := apply
alias i := install

default: apply

cp dir:
	#!/usr/bin/env bash

	set -euo pipefail

	echo '{{ CYAN }}{{ BOLD }}[{{ dir }}]{{ NORMAL }} Copying templated files to {{ replace(TARGET_DIR, home_dir(), "~") }}'

	mkdir -p '{{ TARGET_DIR }}'
	if command -v rsync >/dev/null 2>&1; then
		rsync -rLcgoXpb --backup-dir='{{ BACKUPS_DIR }}/{{ dir }}' '{{ TEMPLATED_DIR }}/{{ dir }}/.' '{{ TARGET_DIR }}'
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

	find '{{ dir }}' -type f -not -name 'dots.env' -not -path '*/dots.hooks/*' | while read f; do
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
	#!/usr/bin/env bash
	set -euo pipefail
	if [ -f "{{ dir }}/dots.hooks/apply" ] && [ ! -f "{{ dir }}/.disabled" ]; then
		echo "{{ CYAN }}{{ BOLD }}[{{ dir }}]{{ NORMAL }} Running apply hook"
		cd '{{ dir }}/dots.hooks'
		. ../dots.env >/dev/null
		. apply >/dev/null 2>&1
	fi

apply *dirs: pre-hook
	#!/usr/bin/env bash
	set -euo pipefail

	if [ -n '{{ dirs }}' ]; then
		DIRS='{{ dirs }}'
	else
		DIRS=`find . -maxdepth 1 -type d -not -name '.*' -printf '%f\n'`
	fi

	for dir in $DIRS; do
		if [ ! -f "$dir/.disabled" ]; then
			(
				set -a
				[ -f "$dir/dots.env" ] && source "$dir/dots.env"
				set +a
				{{ JUST }} _apply "$dir"
			)
		fi
	done

_install-cli +pkgs:
	#!/usr/bin/env bash
	set -euo pipefail

	pkgs=""
	for pkg in {{ pkgs }}; do
		if ! command -v "$pkg" >/dev/null 2>&1; then
			pkgs="$pkgs $pkg"
		fi
	done

	[ -z "$pkgs" ] || paru -S --needed --noconfirm $pkgs

install *dirs:
	#!/usr/bin/env bash
	set -euo pipefail

	if [ -n '{{ dirs }}' ]; then
		DIRS='{{ dirs }}'
	else
		DIRS=`find . -maxdepth 1 -type d -not -name '.*' -printf '%f\n' | sort`
	fi

	for dir in $DIRS; do
		if [ -f "$dir/dots.hooks/install" ] && [ ! -f "$dir/.disabled" ]; then
			echo "{{ CYAN }}{{ BOLD }}[${dir}]{{ NORMAL }} Running install hook"
			. "$dir/dots.hooks/install"
		fi
	done

@env file:
	ln -fs `realpath --relative-to {{ justfile_directory() }} {{ file }}` .env

disable dir:
	[ -f '{{ dir }}/.disabled' ] || touch '{{ dir }}/.disabled'

enable dir:
	[ -f '{{ dir }}/.disabled' ] && rm '{{ dir }}/.disabled' || true
