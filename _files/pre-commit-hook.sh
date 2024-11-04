#!/bin/sh

PACKAGES_FILE="_files/packages"

paru -Qqe | sort > "$PACKAGES_FILE"

git add "$PACKAGES_FILE"
