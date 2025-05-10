#!/usr/bin/env bash
set -Eeuo pipefail

# die <msg>
die() {
  echo "❌ $*" >&2
  exit 1
}

# log <msg>
log() {
  echo "👉 $*"
}

# getopts_long: wraps GNU getopt for short+long options
# usage: opts=$(getopts_long \\ 
#     a: alpha: \\ 
#     b beta: \\ 
#     -- "$@")
# then: eval set -- "$opts"
getopts_long() {
  local spec=() short=() long=()
  # read triples: short: long: has_arg
  while [[ $# -gt 0 ]]; do
    [[ $1 = -- ]] && { shift; break; }
    IFS=":" read -r s l <<<"$1"
    shift
    has_arg="$1"; shift
    spec+=( "${s}${has_arg:+:}" )
    short+=( "$s" )
    long+=( "$l${has_arg:+:}" )
  done
  local getopt_spec
  getopt_spec=$(getopt \
    -o "$(printf "%s" "${spec[@]}")" \
    -l "$(printf "%s," "${long[@]}")" \
    -- "$@") || die "Invalid options"
  echo "$getopt_spec"
}
