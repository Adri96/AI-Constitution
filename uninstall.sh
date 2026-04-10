#!/bin/bash
# Usage: ./uninstall.sh /path/to/your/project

TARGET=${1:-$(pwd)}

LINKS=(
  "$TARGET/CLAUDE.md"
  "$TARGET/AGENTS.md"
  "$TARGET/.github/copilot-instructions.md"
  "$TARGET/.cursorrules"
)

for link in "${LINKS[@]}"; do
  if [ -L "$link" ]; then
    rm "$link"
    echo "Removed $link"
  else
    echo "Skipped $link (not a symlink, leaving untouched)"
  fi
done

echo "Constitution uninstalled from $TARGET"