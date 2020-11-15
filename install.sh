#!/usr/bin/env bash
set -euo pipefail

echo "Creating symlink"
ln -s "${PWD}/knock" ~/.local/bin/knock

echo "Creating config"
mkdir -p ~/.config/knock
cat > ~/.config/knock/hosts.json <<EOF
{
  "example.com": [1000, 2000, 3000]
}
EOF
chmod 0600 ~/.config/knock/hosts.json

echo "Done."
