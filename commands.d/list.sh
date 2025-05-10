#!/usr/bin/env bash
set -Eeuo pipefail

# list.sh - List all available devtools commands
# Usage: devtools list

COMMANDS_DIR="$(dirname "$0")"

list_commands() {
  echo "Available commands:"
  for cmd in "$COMMANDS_DIR"/*.sh; do
    [ -e "$cmd" ] || continue
    name=$(basename "$cmd" .sh)
    desc=$(grep -m1 -E '^#( [^!]|[^!])' "$cmd" | sed 's/^# *//')
    printf "  %-15s %s\n" "$name" "$desc"
  done
}

list_commands 