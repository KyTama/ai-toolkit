# ai-toolkit

Personal AI dev environment — unified GEMINI.md + CLAUDE.md management,
antigravity-kit agents/workflows, and curated skills.

## First time setup
```bash
git clone https://github.com/KyTama/ai-toolkit.git
cd ai-toolkit
./scripts/bootstrap.sh
```

## Bootstrap a new project
```bash
./scripts/bootstrap.sh ~/projects/your-project-name
```

Edit the `Project Context` section in the generated `GEMINI.md` / `CLAUDE.md`.

## After editing `_shared.md`, `_gemini_specific.md`, or `_claude_specific.md`
```bash
./scripts/rebuild-global.sh
```

## Update everything to latest
```bash
./scripts/update.sh
```

## Structure

| Path | Purpose |
|---|---|
| `_shared.md` | Source of truth — identity, stack, tone, preferences |
| `_gemini_specific.md` | Gemini CLI + Antigravity behavior + workflow orchestration |
| `_claude_specific.md` | Claude Code behavior overrides |
| `.agent/agents/` | Specialist AI personas |
| `.agent/skills/` | Domain skill modules (ag-kit + awesome-skills) |
| `.agent/workflows/` | Slash command procedures |
| `templates/` | Per-project GEMINI.md / CLAUDE.md templates |
| `scripts/bootstrap.sh` | Setup global config + new project |
| `scripts/rebuild-global.sh` | Rebuild global config only |
| `scripts/update.sh` | Pull latest from upstream sources |
