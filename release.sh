#!/usr/bin/env bash
set -euo pipefail

echo "Make sure you've bumped the version BEFORE running this script."

echo "Generating README"
./knock --help > README
git add knock README

echo "Committing"
version="$(./knock --version | cut -d' ' -f2)"
message="chore(release): ${version}"
git commit -a -m "${message}"
git tag "${version}" -m "${message}"

echo "Pushing"
git push --follow-tags

echo "Done."
