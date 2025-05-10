#!/usr/bin/env bash
set -Eeuo pipefail

# lint.sh - Run ShellCheck on all shell scripts
# Usage: devtools lint

SCRIPTS=(bin/* commands.d/*.sh)

if ! command -v shellcheck >/dev/null 2>&1; then
  echo "ShellCheck is not installed. Please install it to use this command."
  exit 1
fi

echo "Running ShellCheck on all shell scripts..."
shellcheck "${SCRIPTS[@]}"
echo "ShellCheck completed." 