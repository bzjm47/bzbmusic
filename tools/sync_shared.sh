#!/usr/bin/env bash
# Sync /shared into each first-level folder (except shared/tools/images/.git/.github)
set -euo pipefail
ROOT="$(pwd)"
SHARED="$ROOT/shared"
for dir in "$ROOT"/*/ ; do
  name="$(basename "$dir")"
  case "$name" in shared|tools|images|.git|.github) continue;; esac
  echo "Syncing shared → $name/shared"
  mkdir -p "$dir/shared"
  rsync -a --delete "$SHARED/" "$dir/shared/"
done
echo "Done — commit the changes."
