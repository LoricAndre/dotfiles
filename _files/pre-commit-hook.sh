#!/bin/sh

PACKAGES_FILE=".chezmoidata/packages.yaml"

echo "packages:" > "${PACKAGES_FILE}"
paru -Qqe | sort | sed 's/^/-  /' >> "${PACKAGES_FILE}"

git add "${PACKAGES_FILE}"

