#!/bin/bash
# Usage: ./install.sh /path/to/your/project

TARGET=${1:-.}
CONSTITUTION="$(cd "$(dirname "$0")" && pwd)/CONSTITUTION.md"

mkdir -p "$TARGET/.github"

ln -sf "$CONSTITUTION" "$TARGET/CLAUDE.md"
ln -sf "$CONSTITUTION" "$TARGET/AGENTS.md"
ln -sf "$CONSTITUTION" "$TARGET/.github/copilot-instructions.md"

echo "Constitution installed in $TARGET"