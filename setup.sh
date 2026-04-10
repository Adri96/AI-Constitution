#!/bin/bash
# Run once to make install-ai-constitution and uninstall-ai-constitution available globally.
# Usage: ./setup.sh
REPO="$(cd "$(dirname "$0")" && pwd)"

sudo ln -sf "$REPO/install.py" /usr/local/bin/install-ai-constitution
sudo ln -sf "$REPO/uninstall.py" /usr/local/bin/uninstall-ai-constitution

echo "Done! Commands available:"
echo "  install-ai-constitution [path] [--append]"
echo "  uninstall-ai-constitution [path]"
echo ""
echo "If no path is given, uses the current directory."
echo ""
echo "Flags:"
echo "  --append  Append constitution to existing files instead of skipping them."
echo "            Useful when a project already has its own CLAUDE.md or .cursorrules."