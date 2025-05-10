#!/usr/bin/env bash
set -Eeuo pipefail

# config.sh - Show configuration precedence and merged config
#
# Usage:
#   devtools config show [--all|-a] [--backend|-b] [--frontend|-f] [--env|-e] [--help|-h]
#   devtools config [--all|-a] [--backend|-b] [--frontend|-f] [--env|-e] [--help|-h]
#
# This command prints the order of configuration precedence, loaded config files, and key environment variables.

show_help() {
  echo "Usage: devtools config show [options]"
  echo "   or: devtools config [options]"
  echo ""
  echo "Options:"
  echo "  --all, -a        Show all config and environment info (default)"
  echo "  --backend, -b    Show backend-related config"
  echo "  --frontend, -f   Show frontend-related config"
  echo "  --env, -e        Show environment variables only"
  echo "  --help, -h       Show this help message"
  echo ""
  echo "Config precedence: CLI > env-specific > project > global"
  echo "Config sources (highest to lowest):"
  echo "  1. CLI flags"
  echo "  2. ./dev-tools.{env}.yaml (if exists)"
  echo "  3. ./dev-tools.yaml (if exists)"
  echo "  4. ~/.dev-tools/config.yaml (if exists)"
}

show_config_files() {
  echo "# Config precedence: CLI > env-specific > project > global"
  echo "# Sources checked (in order):"
  echo "  CLI flags: (not shown here)"
  ENV_NAME=${ENV:-dev}
  for file in "./dev-tools.$ENV_NAME.yaml" ./dev-tools.yaml ~/.dev-tools/config.yaml; do
    if [[ -f $file ]]; then
      echo "  Loaded: $file"
    else
      echo "  Not found: $file"
    fi
  done
}

show_backend() {
  echo "# Backend configuration:"
  echo "  BACKEND: ${BACKEND:-<unset>}"
  echo "  DATABASE: ${DATABASE:-<unset>}"
  echo "  PORT: ${PORT:-<unset>}"
}

show_frontend() {
  echo "# Frontend configuration:"
  echo "  FRONTEND: ${FRONTEND:-<unset>}"
  echo "  FRONTEND_PORT: ${FRONTEND_PORT:-<unset>}"
}

show_env() {
  echo "# Environment variables:"
  echo "  ENV: ${ENV:-<unset>}"
  echo "  DEBUG: ${DEBUG:-<unset>}"
}

# Parse flags
SHOW_ALL=false
SHOW_BACKEND=false
SHOW_FRONTEND=false
SHOW_ENV=false

# Remove 'show' if present as first argument
if [[ $# -gt 0 && "$1" == "show" ]]; then
  shift
fi

if [[ $# -eq 0 ]]; then
  SHOW_ALL=true
fi

while [[ $# -gt 0 ]]; do
  case "$1" in
    --all|-a)      SHOW_ALL=true ;;
    --backend|-b) SHOW_BACKEND=true ;;
    --frontend|-f) SHOW_FRONTEND=true ;;
    --env|-e)     SHOW_ENV=true ;;
    --help|-h)    show_help; exit 0 ;;
    *) echo "Unknown option: $1"; show_help; exit 1 ;;
  esac
  shift
done

if $SHOW_ALL; then
  show_config_files
  show_backend
  show_frontend
  show_env
  exit 0
fi

$SHOW_BACKEND && show_backend
$SHOW_FRONTEND && show_frontend
$SHOW_ENV && show_env

exit 0 