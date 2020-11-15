#!/usr/bin/env bash
set -euo pipefail

echo "Removing symlink"
rm ~/.local/bin/knock

echo "Removing config"
rm -r ~/.config/knock

echo "Done."
