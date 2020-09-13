#!/usr/bin/env bash
set -e

echo "Adding package install instruction for package $1"
echo "Install(\"$1\", { repository = {\"selwtf\"} })" > /etc/updater/conf.d/selwtf-package-$1.lua
