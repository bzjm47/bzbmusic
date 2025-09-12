#!/usr/bin/env bash
set -euo pipefail
ROOT="$(pwd)"; SRC="$ROOT/shared"
if [[ ! -d "$SRC" ]]; then echo "ERROR: shared/ missing"; exit 1; fi
shopt -s nullglob
for dir in "$ROOT"/*/ ; do
  name="$(basename "$dir")"
  [[ "$name" == "shared" || "$name" == "tools" || "$name" == ".git" ]] && continue
  [[ ! -f "$dir/index.html" ]] && continue
  DEST="$dir/shared"; echo "→ Sync $name/shared"
  rm -rf "$DEST" && mkdir -p "$DEST"
  if command -v rsync >/dev/null 2>&1; then rsync -a --delete "$SRC/" "$DEST/"; else cp -R "$SRC/." "$DEST/"; fi
done
echo "Done."
