#!/bin/bash
set -e

KIT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"

EXISTING=(
  api-patterns
  game-development
  python-patterns
  app-builder
  geo-fundamentals
  red-team-tactics
  architecture
  i18n-localization
  bash-linux
  intelligent-routing
  seo-fundamentals
  behavioral-modes
  lint-and-validate
  server-management
  brainstorming
  mcp-builder
  systematic-debugging
  clean-code
  mobile-design
  tailwind-patterns
  code-review-checklist
  nextjs-react-expert
  tdd-workflow
  database-design
  nodejs-best-practices
  testing-patterns
  deployment-procedures
  parallel-agents
  vulnerability-scanner
  performance-profiling
  web-design-guidelines
  documentation-templates
  plan-writing
  webapp-testing
  frontend-design
  powershell-windows
  rust-pro
  doc.md
)

echo "=== Updating antigravity-kit ==="
git clone --depth=1 https://github.com/vudovn/antigravity-kit.git /tmp/antigravity-kit-update
cp -r /tmp/antigravity-kit-update/.agent/agents "$KIT_DIR/.agent/"
cp -r /tmp/antigravity-kit-update/.agent/workflows "$KIT_DIR/.agent/"
cp -r /tmp/antigravity-kit-update/.agent/skills/. "$KIT_DIR/.agent/skills/"
rm -rf /tmp/antigravity-kit-update
echo "Agents, workflows, and base skills updated."

echo ""
echo "=== Updating cherry-picked skills ==="
git clone --depth=1 https://github.com/sickn33/antigravity-awesome-skills.git /tmp/awesome-skills-update

for skill_path in /tmp/awesome-skills-update/skills/*/; do
  skill=$(basename "$skill_path")
  skip=false
  for existing in "${EXISTING[@]}"; do
    if [ "$skill" = "$existing" ]; then
      skip=true
      break
    fi
  done
  if [ "$skip" = false ]; then
    echo "→ Updating $skill..."
    rm -rf "$KIT_DIR/.agent/skills/$skill"
    cp -r "$skill_path" "$KIT_DIR/.agent/skills/"
  fi
done

rm -rf /tmp/awesome-skills-update
echo ""
echo "=== Done ==="
