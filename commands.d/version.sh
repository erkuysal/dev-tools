#!/usr/bin/env bash
set -Eeuo pipefail

# version.sh - Print the current dev-tools version
# Usage: dev-tools version

VERSION_FILE="$(dirname "$0")/../VERSION"

if [[ -f "$VERSION_FILE" ]]; then
  VERSION=$(cat "$VERSION_FILE")
  echo "dev-tools version $VERSION"
else
  echo "Version file not found."
  exit 1
fi 