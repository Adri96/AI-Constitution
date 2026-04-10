#!/bin/bash
# Run once to make install-ai-constitution and uninstall-ai-constitution available globally.
# Usage: ./setup.sh
REPO="$(cd "$(dirname "$0")" && pwd)"

sudo ln -sf "$REPO/install.sh" /usr/local/bin/install-ai-constitution
sudo ln -sf "$REPO/uninstall.sh" /usr/local/bin/uninstall-ai-constitution

echo "Done! Commands available:"
echo "  install-ai-constitution [path]"
echo "  uninstall-ai-constitution [path]"
echo ""
echo "If no path is given, uses the current directory."