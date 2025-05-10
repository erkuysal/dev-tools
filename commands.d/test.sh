#!/usr/bin/env bash
set -Eeuo pipefail

# test.sh - Run all Bats tests in the tests/ directory
# Usage: devtools test

if ! command -v bats >/dev/null 2>&1; then
  echo "Bats is not installed. Please install it to use this command."
  exit 1
fi

echo "Running Bats tests in tests/ ..."
bats tests/
echo "Bats tests completed." 