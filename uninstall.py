#!/usr/bin/env python3
# Usage: ./uninstall.py [target_path]

import os
import sys

MARKER_START = "<!-- ai-constitution:start -->"
MARKER_END = "<!-- ai-constitution:end -->"


def main():
    target = os.path.abspath(sys.argv[1] if len(sys.argv) > 1 else os.getcwd())

    links = [
        os.path.join(target, "CLAUDE.md"),
        os.path.join(target, "AGENTS.md"),
        os.path.join(target, ".github", "copilot-instructions.md"),
        os.path.join(target, ".cursorrules"),
    ]

    for link in links:
        if os.path.islink(link):
            os.remove(link)
            print(f"Removed {link}")
        elif os.path.exists(link):
            with open(link) as f:
                content = f.read()
            if MARKER_START in content and MARKER_END in content:
                start = content.index(MARKER_START)
                end = content.index(MARKER_END) + len(MARKER_END)
                remaining = content[:start].rstrip()
                if remaining:
                    with open(link, "w") as f:
                        f.write(remaining + "\n")
                    print(f"Removed constitution block from {link}")
                else:
                    os.remove(link)
                    print(f"Removed {link} (contained only constitution content)")
            else:
                print(f"Skipped {link} (not a symlink and no constitution block found)")

    print(f"Constitution uninstalled from {target}")


if __name__ == "__main__":
    main()
