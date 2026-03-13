#!/bin/bash
set -e

KIT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
PROJECT_DIR="${1:-}"

echo "=== AI Toolkit Bootstrap ==="
echo "Kit dir: $KIT_DIR"
echo ""

# Build global GEMINI.md
echo "→ Building ~/.gemini/GEMINI.md..."
mkdir -p "$HOME/.gemini"
cat "$KIT_DIR/_shared.md" "$KIT_DIR/_gemini_specific.md" > "$HOME/.gemini/GEMINI.md"

# Build global CLAUDE.md
echo "→ Building ~/.claude/CLAUDE.md..."
mkdir -p "$HOME/.claude"
cat "$KIT_DIR/_shared.md" "$KIT_DIR/_claude_specific.md" > "$HOME/.claude/CLAUDE.md"

# Project-level setup (only if path provided)
if [ -n "$PROJECT_DIR" ]; then
  echo ""
  echo "→ Setting up project at: $PROJECT_DIR"

  cp -r "$KIT_DIR/.agent" "$PROJECT_DIR/.agent"

  if [ ! -f "$PROJECT_DIR/GEMINI.md" ]; then
    cp "$KIT_DIR/templates/GEMINI.project.md" "$PROJECT_DIR/GEMINI.md"
    echo "→ Created $PROJECT_DIR/GEMINI.md"
  else
    echo "→ GEMINI.md exists, skipping"
  fi

  if [ ! -f "$PROJECT_DIR/CLAUDE.md" ]; then
    cp "$KIT_DIR/templates/CLAUDE.project.md" "$PROJECT_DIR/CLAUDE.md"
    echo "→ Created $PROJECT_DIR/CLAUDE.md"
  else
    echo "→ CLAUDE.md exists, skipping"
  fi

  echo "→ Edit the Project Context section in GEMINI.md / CLAUDE.md before starting"
fi

echo ""
echo "=== Done ==="
