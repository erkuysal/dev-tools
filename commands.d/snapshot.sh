#!/usr/bin/env bash
set -Eeuo pipefail

# Directory to store snapshots
SNAPSHOT_DIR="ver"
TIMESTAMP=$(date +%Y%m%d-%H%M%S)
DEST="$SNAPSHOT_DIR/snapshot-$TIMESTAMP"

mkdir -p "$SNAPSHOT_DIR"

# Exclude the snapshot directory itself
rsync -a --exclude "$SNAPSHOT_DIR" . "$DEST"

echo "Snapshot saved to $DEST" 