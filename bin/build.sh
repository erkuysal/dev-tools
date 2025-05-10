#!/usr/bin/env bash
set -Eeuo pipefail
source "$(dirname "$0")/../lib/utils.sh"

# defaults
PUSH=true
VERSION=""

usage() {
  cat <<EOF
Usage: $(basename "$0") -v|--version <tag> [--no-push]

Options:
  -v, --version   version string (e.g. v1.2.3)
      --no-push   skip docker-compose push
  -h, --help      show this message
EOF
  exit 1
}

# parse opts
opts=$(getopts_long \
  v: version: \
  "" no-push "" \
  h help "" \
  -- "$@")
eval set -- "$opts"

while true; do
  case "$1" in
    -v|--version) VERSION="$2"; shift 2 ;;
    --no-push)    PUSH=false;       shift   ;;
    -h|--help)    usage            ;;
    --) shift; break               ;;
  esac
done

[[ -z $VERSION ]] && die "version is required"

log "Building images tagged: $VERSION"
docker-compose build

if $PUSH; then
  log "Pushing images"
  docker-compose push
else
  log "Skipping push"
fi

log "Done."
