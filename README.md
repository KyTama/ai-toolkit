# ai-toolkit

Personal AI dev environment — unified GEMINI.md + CLAUDE.md management,
antigravity-kit agents/workflows, and curated skills.

---

## First Time Setup
```bash
git clone https://github.com/KyTama/ai-toolkit.git
cd ai-toolkit
./scripts/bootstrap.sh
```

Then add aliases to your shell:
```bash
echo 'alias ai-bootstrap="~/projects/ai-toolkit/scripts/bootstrap.sh"' >> ~/.zshrc
echo 'alias ai-rebuild="~/projects/ai-toolkit/scripts/rebuild-global.sh"' >> ~/.zshrc
echo 'alias ai-update="~/projects/ai-toolkit/scripts/update.sh"' >> ~/.zshrc
source ~/.zshrc
```

> Adjust `~/projects/ai-toolkit` to wherever you cloned this repo.

---

## Setup a New or Existing Project
```bash
cd ~/projects/your-project
ai-bootstrap .
```

Then edit the Project Context section at the top of the generated `GEMINI.md`:
```bash
vi GEMINI.md
```

Fill in:
```
## Project Name
## Stack
## Current Phase
## Active Tasks
```

That's it — open the project in Antigravity or run `gemini` / `claude` in the terminal and everything is available.

---

## Daily Usage

### Triggering skills and workflows

Skills are loaded on-demand based on context. Trigger them explicitly via slash commands:
```
/plan build authentication system
/debug why is this endpoint returning 500
/brainstorm architecture for reservation system
/enhance refactor this service layer
/test generate tests for this module
```

Or reference a skill directly:
```
use systematic-debugging to trace this bug
use bun-development for this task
use docker-expert to review this Dockerfile
```

### After editing `_shared.md`, `_gemini_specific.md`, or `_claude_specific.md`
```bash
ai-rebuild
```

### Update agents, workflows, and skills to latest
```bash
ai-update
```

---

## Alias Cheatsheet

| Command | Description |
|---|---|
| `ai-bootstrap .` | Bootstrap current directory as a project |
| `ai-bootstrap ~/projects/x` | Bootstrap a specific project path |
| `ai-rebuild` | Rebuild global GEMINI.md + CLAUDE.md |
| `ai-update` | Pull latest from antigravity-kit + awesome-skills |

---

## How It Works

### Global config (auto-loaded by all tools)
| File | Loaded by |
|---|---|
| `~/.gemini/GEMINI.md` | Gemini CLI + Antigravity (global fallback) |
| `~/.claude/CLAUDE.md` | Claude Code (global fallback) |

### Per-project config (auto-loaded when project is opened)
| File/Folder | Purpose |
|---|---|
| `GEMINI.md` | Project context + shared identity + Gemini behavior |
| `CLAUDE.md` | Project context + shared identity + Claude behavior |
| `.agent/agents/` | 20 specialist AI personas |
| `.agent/skills/` | 200+ domain skill modules |
| `.agent/workflows/` | Slash command procedures |

### Source of truth
| File | Purpose |
|---|---|
| `_shared.md` | Identity, stack, tone, code style, workflow philosophy |
| `_gemini_specific.md` | Gemini CLI + Antigravity behavior + orchestration rules |
| `_claude_specific.md` | Claude Code behavior overrides |

> `GEMINI.md` and `CLAUDE.md` (both global and per-project) are assembled by
> concatenating `_shared.md` + the tool-specific file. Edit the source files,
> then run `ai-rebuild` — never edit the assembled files directly.

---

## Structure
```
ai-toolkit/
├── .agent/
│   ├── agents/       # specialist AI personas (from antigravity-kit)
│   ├── skills/       # domain skill modules (ag-kit + awesome-skills)
│   └── workflows/    # slash command procedures
├── scripts/
│   ├── bootstrap.sh       # setup global config + project
│   ├── rebuild-global.sh  # rebuild global config only
│   └── update.sh          # pull latest from upstream
├── templates/
│   ├── GEMINI.project.md  # per-project GEMINI.md template
│   └── CLAUDE.project.md  # per-project CLAUDE.md template
├── _shared.md             # source of truth
├── _gemini_specific.md    # gemini/antigravity overrides
└── _claude_specific.md    # claude code overrides
```
