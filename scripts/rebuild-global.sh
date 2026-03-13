#!/bin/bash
set -e

KIT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"

echo "→ Rebuilding ~/.gemini/GEMINI.md..."
mkdir -p "$HOME/.gemini"
cat "$KIT_DIR/_shared.md" "$KIT_DIR/_personal.md" "$KIT_DIR/_gemini_specific.md" > "$HOME/.gemini/GEMINI.md"

echo "→ Rebuilding ~/.claude/CLAUDE.md..."
mkdir -p "$HOME/.claude"
cat "$KIT_DIR/_shared.md" "$KIT_DIR/_personal.md" "$KIT_DIR/_claude_specific.md" > "$HOME/.claude/CLAUDE.md"

echo "Done."
