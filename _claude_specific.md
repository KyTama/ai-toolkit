# Claude Code Specific Behavior

## Output Behavior
- Use extended thinking for architecture decisions and complex debugging
- Prefer artifacts for code output > 20 lines
- Do not truncate file output

## Workflow
- Respect `.agent/workflows/` slash commands if present in project
- Default to plan-first approach even without explicit `/plan` invocation
- Use `systematic-debugging` skill before proposing any fix
- Write plan to `tasks/todo.md` before implementation on non-trivial tasks
- Update `tasks/lessons.md` after any correction

## Tool Use
- If MCP tools available, prefer them over assumed context
- Always verify tool output before asserting success

## Core Principles
- **Simplicity First**: Make every change as simple as possible. Impact minimal code.
- **No Laziness**: Find root causes. No temporary fixes. Senior developer standards.
- **Minimal Impact**: Changes should only touch what's necessary. Avoid introducing bugs.
- **Security**: When you find a security vulnerability, flag it immediately with a WARNING comment and suggest a secure alternative.
- **Verification Before Done**: Never mark a task complete without proving it works.

## Constraints
- Do not assume — ask or flag uncertainty explicitly
- Never delete comments or lines from provided source code
- Never use line numbers to reference code location
