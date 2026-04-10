#!/usr/bin/env python3
# Usage: ./install.py [target_path] [--append]

import argparse
import os

MARKER_START = "<!-- ai-constitution:start -->"
MARKER_END = "<!-- ai-constitution:end -->"


def get_constitution_path():
    return os.path.join(os.path.dirname(os.path.abspath(__file__)), "CONSTITUTION.md")


def main():
    parser = argparse.ArgumentParser(description="Install AI Constitution into a project.")
    parser.add_argument("target", nargs="?", default=os.getcwd(), help="Target project path (default: current directory)")
    parser.add_argument("--append", action="store_true", help="Append constitution to existing files instead of skipping them")
    args = parser.parse_args()

    target = os.path.abspath(args.target)
    constitution_path = get_constitution_path()

    os.makedirs(os.path.join(target, ".github"), exist_ok=True)

    links = [
        os.path.join(target, "CLAUDE.md"),
        os.path.join(target, "AGENTS.md"),
        os.path.join(target, ".github", "copilot-instructions.md"),
        os.path.join(target, ".cursorrules"),
    ]

    with open(constitution_path) as f:
        constitution_content = f.read().strip()

    for link in links:
        if os.path.islink(link):
            if os.readlink(link) == constitution_path:
                continue
            print(f"Warning: {link} is a symlink pointing elsewhere ({os.readlink(link)}) — skipping")
            continue

        if os.path.exists(link):
            if args.append:
                with open(link) as f:
                    content = f.read()
                block = f"{MARKER_START}\n{constitution_content}\n{MARKER_END}"
                if MARKER_START in content:
                    start = content.index(MARKER_START)
                    end = content.index(MARKER_END) + len(MARKER_END)
                    new_content = content[:start] + block + content[end:]
                else:
                    new_content = content.rstrip() + f"\n\n{block}\n"
                with open(link, "w") as f:
                    f.write(new_content)
                print(f"Appended constitution to {link}")
            else:
                print(f"Warning: {link} already exists and is not a symlink — skipping (use --append to append instead)")
            continue

        os.symlink(constitution_path, link)

    print(f"Constitution installed in {target}")


if __name__ == "__main__":
    main()
