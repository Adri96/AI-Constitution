# AI Constitution

A minimal set of universal principles to guide every AI tool you work with — Claude, Codex, Copilot, Cursor, and others.

Instead of configuring each tool separately, you define your principles once and install them into any project with a single command.

---

## Principles

The constitution included in this repo is an example — feel free to replace it with your own principles. Edit `CONSTITUTION.md` to reflect whatever values, behaviors, or constraints you want your AI tools to follow. All installed projects will pick up the changes automatically via symlinks.

1. **Golden Rule** — Do not do to others what you would not want done to you.
2. **Silver Rule** — Do to others what you would like done to you.
3. **Do things well** — Things done well lead to more things done well. Things done poorly lead to more things done poorly.
4. **Micro reflects macro** — How good and consistent you are at the micro level is how good and consistent you are at the macro level.

---

## Setup

Clone the repo and run setup once:

```bash
git clone https://github.com/Adri96/AI-Constitution.git
cd ai-constitution
./setup.sh
```

This registers two global commands on your machine: `install-ai-constitution` and `uninstall-ai-constitution`.

---

## Usage

From any project directory:

```bash
# Install (uses current directory)
cd ~/projects/my-project
install-ai-constitution

# Install into a specific path
install-ai-constitution ~/projects/other-project

# Uninstall
uninstall-ai-constitution
uninstall-ai-constitution ~/projects/other-project
```

### What gets installed

Each install creates symlinks in the target project pointing to `CONSTITUTION.md`:

| File                              | Tool           |
| --------------------------------- | -------------- |
| `CLAUDE.md`                       | Claude Code    |
| `AGENTS.md`                       | Codex CLI      |
| `.github/copilot-instructions.md` | GitHub Copilot |
| `.cursorrules`                    | Cursor         |

Because they are symlinks, any update to `CONSTITUTION.md` is automatically reflected in all projects — no need to reinstall.

---

## Uninstall global commands

To remove the global commands from your machine:

```bash
rm /usr/local/bin/install-ai-constitution
rm /usr/local/bin/uninstall-ai-constitution
```
