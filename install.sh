#!/bin/bash
# Usage: ./install.sh /path/to/your/project

TARGET=${1:-$(pwd)}
CONSTITUTION="$(cd "$(dirname "$0")" && pwd)/CONSTITUTION.md"

mkdir -p "$TARGET/.github"

LINKS=(
  "$TARGET/CLAUDE.md"
  "$TARGET/AGENTS.md"
  "$TARGET/.github/copilot-instructions.md"
  "$TARGET/.cursorrules"
)

for link in "${LINKS[@]}"; do
  if [ -e "$link" ] && [ ! -L "$link" ]; then
    echo "Warning: $link already exists and is not a symlink — skipping to avoid overwriting"
    continue
  fi
  if [ -L "$link" ] && [ "$(readlink "$link")" != "$CONSTITUTION" ]; then
    echo "Warning: $link is a symlink pointing elsewhere ($(readlink "$link")) — skipping"
    continue
  fi
  ln -sf "$CONSTITUTION" "$link"
done

echo "Constitution installed in $TARGET"