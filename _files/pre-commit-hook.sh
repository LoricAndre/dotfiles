#!/bin/sh

PACKAGES_FILE="_files/packages"

trizen -Qqe | sort | tee "$PACKAGES_FILE"

git add "$PACKAGES_FILE"
