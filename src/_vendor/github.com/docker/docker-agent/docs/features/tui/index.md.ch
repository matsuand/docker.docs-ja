%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

% __SUBDIR__ 対応

@x
title: "Terminal UI (TUI)"
description: "Docker Agent's default interface is a rich, interactive terminal UI with file attachments, themes, session management, and more."
keywords: docker agent, ai agents, features, terminal ui (tui)
linkTitle: "Terminal UI"
@y
title: "Terminal UI (TUI)"
description: "Docker Agent's default interface is a rich, interactive terminal UI with file attachments, themes, session management, and more."
keywords: docker agent, ai agents, features, terminal ui (tui)
linkTitle: "Terminal UI"
@z

@x
canonical: https://docs.docker.com/ai/docker-agent/features/tui/
@y
canonical: __SUBDIR__/ai/docker-agent/features/tui/
@z

@x
_Docker Agent's default interface is a rich, interactive terminal UI with file attachments, themes, session management, and more._
@y
_Docker Agent's default interface is a rich, interactive terminal UI with file attachments, themes, session management, and more._
@z

@x
![Docker Agent TUI in action showing an interactive agent session](../../demo.gif)
@y
![Docker Agent TUI in action showing an interactive agent session](../../demo.gif)
@z

@x
## Launching the TUI
@y
## Launching the TUI
@z

@x
Both the full TUI and the lean TUI display a centered ASCII art Docker Agent banner on startup when the chat is empty. The banner is automatically hidden once the agent starts responding or when a custom welcome message is configured.
@y
Both the full TUI and the lean TUI display a centered ASCII art Docker Agent banner on startup when the chat is empty. The banner is automatically hidden once the agent starts responding or when a custom welcome message is configured.
@z

@x
```bash
# Launch with a config
$ docker agent run agent.yaml
@y
```bash
# Launch with a config
$ docker agent run agent.yaml
@z

@x
# Start with an initial message
$ docker agent run agent.yaml "Help me refactor this code"
@y
# Start with an initial message
$ docker agent run agent.yaml "Help me refactor this code"
@z

@x
# Auto-approve all tool calls
$ docker agent run agent.yaml --yolo
@y
# Auto-approve all tool calls
$ docker agent run agent.yaml --yolo
@z

@x
# Enable debug logging
$ docker agent run agent.yaml --debug
@y
# Enable debug logging
$ docker agent run agent.yaml --debug
@z

@x
# Override the application name shown in the status bar and window title
$ docker agent run agent.yaml --app-name "My Project"
@y
# Override the application name shown in the status bar and window title
$ docker agent run agent.yaml --app-name "My Project"
@z

@x
# Preselect a color theme
$ docker agent run agent.yaml --theme dracula
@y
# Preselect a color theme
$ docker agent run agent.yaml --theme dracula
@z

@x
# Hide the sidebar (cannot be re-enabled via Ctrl+B)
$ docker agent run agent.yaml --sidebar=false
@y
# Hide the sidebar (cannot be re-enabled via Ctrl+B)
$ docker agent run agent.yaml --sidebar=false
@z

@x
# Disable specific slash commands
$ docker agent run agent.yaml --disable-commands="/cost,/eval,/model"
@y
# Disable specific slash commands
$ docker agent run agent.yaml --disable-commands="/cost,/eval,/model"
@z

@x
# Open in read-only mode to review a past session without sending new messages
$ docker agent run agent.yaml --session -1 --session-read-only
@y
# Open in read-only mode to review a past session without sending new messages
$ docker agent run agent.yaml --session -1 --session-read-only
@z

@x
# Use the lean TUI for this run
$ docker agent run agent.yaml --lean
```
@y
# Use the lean TUI for this run
$ docker agent run agent.yaml --lean
```
@z

@x
### Lean TUI
@y
### Lean TUI
@z

@x
The lean TUI uses a simplified terminal interface with minimal chrome. To make it the default for interactive runs, set `lean` in your user config:
@y
The lean TUI uses a simplified terminal interface with minimal chrome. To make it the default for interactive runs, set `lean` in your user config:
@z

@x
```yaml
# ~/.config/cagent/config.yaml
settings:
  lean: true
```
@y
```yaml
# ~/.config/cagent/config.yaml
settings:
  lean: true
```
@z

@x
Omit `lean` or set it to `false` to keep the full TUI as the default. You can still use `--lean` for a single run, or `--lean=false` to use the full TUI when `settings.lean` is enabled. See [User Settings](../../configuration/user-settings/index.md) for the full precedence rules between flags and user config.
@y
Omit `lean` or set it to `false` to keep the full TUI as the default. You can still use `--lean` for a single run, or `--lean=false` to use the full TUI when `settings.lean` is enabled. See [User Settings](../../configuration/user-settings/index.md) for the full precedence rules between flags and user config.
@z

@x
The lean TUI supports **steering** and **follow-ups** while the agent is running. Press <kbd>Enter</kbd> to steer the active turn, or <kbd>Alt</kbd>+<kbd>Enter</kbd> to queue the message as a separate turn after the current one finishes. Pending messages appear with muted styling at the end of the live stream.
@y
The lean TUI supports **steering** and **follow-ups** while the agent is running. Press <kbd>Enter</kbd> to steer the active turn, or <kbd>Alt</kbd>+<kbd>Enter</kbd> to queue the message as a separate turn after the current one finishes. Pending messages appear with muted styling at the end of the live stream.
@z

@x
The lean TUI supports a focused set of slash commands: `/new`, `/compact`, `/model`, `/effort`, `/clear`, `/help`, `/exit` (alias: `/quit`), plus any agent-defined commands. Type `/model` (or `/model <provider/model>`) to switch the active model inline — the command opens a fuzzy-searchable list of available models.
@y
The lean TUI supports a focused set of slash commands: `/new`, `/compact`, `/model`, `/effort`, `/clear`, `/help`, `/exit` (alias: `/quit`), plus any agent-defined commands. Type `/model` (or `/model <provider/model>`) to switch the active model inline — the command opens a fuzzy-searchable list of available models.
@z

@x
## Slash Commands
@y
## Slash Commands
@z

@x
Type `/` during a session to see available commands, or press <kbd>Ctrl</kbd>+<kbd>K</kbd> for the command palette:
@y
Type `/` during a session to see available commands, or press <kbd>Ctrl</kbd>+<kbd>K</kbd> for the command palette:
@z

@x
| Command            | Description                                                                          |
| ------------------ | ------------------------------------------------------------------------------------ |
| `/new`             | Start a new conversation                                                             |
| `/clear`           | Clear the current conversation (keep session, drop messages)                         |
| `/compact`         | Summarize and compact the conversation history                                       |
| `/fork`            | Fork the current session into a new branch                                           |
| `/copy`            | Copy the entire conversation to clipboard                                            |
| `/copy-last`       | Copy only the last assistant message to clipboard                                    |
| `/undo`            | Restore file changes from the latest snapshot (only when snapshots are enabled)      |
| `/snapshots`       | List captured snapshots (only when snapshots are enabled)                            |
| `/export`          | Export the session as HTML                                                           |
| `/sessions`        | Browse and load past sessions                                                        |
| `/plans`           | Browse and manage plans: every [shared plan](../../tools/plan/index.md) plus the current session's [session plan](../../tools/session_plan/index.md). Filter, open a detail view, refresh, export to a file, and — for shared plans — set status, edit/create in `$VISUAL`/`$EDITOR`, and delete, all guarded against concurrent edits. Not available in the lean TUI |
| `/model`           | Change the model for the current agent                                               |
| `/effort`          | Set the current model's reasoning-effort level (`/effort <none\|minimal\|low\|medium\|high\|xhigh\|max>`, or `/effort` alone to pick from the supported levels; reasoning models only). Press <kbd>Tab</kbd> after `/effort` and a space to complete a level the current model supports |
| `/settings`        | Manage appearance, behavior, and notification preferences                           |
| `/yolo`            | Toggle automatic tool call approval                                                  |
| `/title`           | Set or regenerate session title                                                      |
| `/attach`          | Attach a file to your message                                                        |
| `/shell`           | Open a shell                                                                         |
| `/star`            | Star/unstar the current session                                                      |
| `/context`         | Show a context-window breakdown: estimated tokens per category (system prompt, tool definitions, prompt files, messages, tool results, compaction summary), a team-level **Live sessions** view (the current session plus every running sub-agent session with its agent, short session ID, and context budget), plus a per-file inventory of attached files and prompt files. When a compaction has occurred, the dialog also displays the verbatim text of the most recent compaction summary. When a dedicated `compaction_model` caps the effective limit below the primary model's own window, a second line reads "compaction cap: `<model>` • `<N>` tokens" — Live-sessions rows are silent on the cap, and the sidebar shows a minimal ⚠ capped marker without repeating the model or the figure (the `/context` header is the authoritative source of the model + number). Use the arrow keys to select a row: press <kbd>Enter</kbd> on a live session to explicitly compact it, or <kbd>d</kbd> on an attached file to drop it |
| `/drop`            | Remove an attached file from the session context (`/drop <path>`, or `/drop` alone to review and drop from the `/context` dialog). Press <kbd>Tab</kbd> after `/drop` and a space to complete an attached file's path |
| `/cost`            | Show cost breakdown for this session. Includes a **By Agent** section (alongside **By Model**) showing cumulative cost per agent; unattributed usage and compaction spend appear in their own buckets. |
| `/eval`            | Create an evaluation report                                                          |
| `/pause`           | Pause/resume the runtime loop. While the agent is mid-request, the resize handle shows "Pausing…" until the in-flight request completes; once the loop is blocked the indicator changes to "⏸ Paused". Run `/pause` again to resume. |
| `/tools`           | Show every toolset (with lifecycle state) and the tools they expose                  |
| `/skills`          | List skills available to the current agent                                           |
| `/toolset-restart` | Force a supervisor-driven reconnect of the named toolset (`/toolset-restart <name>`). Press <kbd>Tab</kbd> after `/toolset-restart` and a space to complete a toolset name; non-restartable toolsets are shown dimmed and cannot be selected. |
| `/permissions`     | Inspect and edit tool permission rules                                               |
| `/speak`           | Voice input via system speech-to-text (macOS only)                                   |
| `/exit`            | Exit the application (aliases: `/quit`, `/q`)                                        |
@y
| Command            | Description                                                                          |
| ------------------ | ------------------------------------------------------------------------------------ |
| `/new`             | Start a new conversation                                                             |
| `/clear`           | Clear the current conversation (keep session, drop messages)                         |
| `/compact`         | Summarize and compact the conversation history                                       |
| `/fork`            | Fork the current session into a new branch                                           |
| `/copy`            | Copy the entire conversation to clipboard                                            |
| `/copy-last`       | Copy only the last assistant message to clipboard                                    |
| `/undo`            | Restore file changes from the latest snapshot (only when snapshots are enabled)      |
| `/snapshots`       | List captured snapshots (only when snapshots are enabled)                            |
| `/export`          | Export the session as HTML                                                           |
| `/sessions`        | Browse and load past sessions                                                        |
| `/plans`           | Browse and manage plans: every [shared plan](../../tools/plan/index.md) plus the current session's [session plan](../../tools/session_plan/index.md). Filter, open a detail view, refresh, export to a file, and — for shared plans — set status, edit/create in `$VISUAL`/`$EDITOR`, and delete, all guarded against concurrent edits. Not available in the lean TUI |
| `/model`           | Change the model for the current agent                                               |
| `/effort`          | Set the current model's reasoning-effort level (`/effort <none\|minimal\|low\|medium\|high\|xhigh\|max>`, or `/effort` alone to pick from the supported levels; reasoning models only). Press <kbd>Tab</kbd> after `/effort` and a space to complete a level the current model supports |
| `/settings`        | Manage appearance, behavior, and notification preferences                           |
| `/yolo`            | Toggle automatic tool call approval                                                  |
| `/title`           | Set or regenerate session title                                                      |
| `/attach`          | Attach a file to your message                                                        |
| `/shell`           | Open a shell                                                                         |
| `/star`            | Star/unstar the current session                                                      |
| `/context`         | Show a context-window breakdown: estimated tokens per category (system prompt, tool definitions, prompt files, messages, tool results, compaction summary), a team-level **Live sessions** view (the current session plus every running sub-agent session with its agent, short session ID, and context budget), plus a per-file inventory of attached files and prompt files. When a compaction has occurred, the dialog also displays the verbatim text of the most recent compaction summary. When a dedicated `compaction_model` caps the effective limit below the primary model's own window, a second line reads "compaction cap: `<model>` • `<N>` tokens" — Live-sessions rows are silent on the cap, and the sidebar shows a minimal ⚠ capped marker without repeating the model or the figure (the `/context` header is the authoritative source of the model + number). Use the arrow keys to select a row: press <kbd>Enter</kbd> on a live session to explicitly compact it, or <kbd>d</kbd> on an attached file to drop it |
| `/drop`            | Remove an attached file from the session context (`/drop <path>`, or `/drop` alone to review and drop from the `/context` dialog). Press <kbd>Tab</kbd> after `/drop` and a space to complete an attached file's path |
| `/cost`            | Show cost breakdown for this session. Includes a **By Agent** section (alongside **By Model**) showing cumulative cost per agent; unattributed usage and compaction spend appear in their own buckets. |
| `/eval`            | Create an evaluation report                                                          |
| `/pause`           | Pause/resume the runtime loop. While the agent is mid-request, the resize handle shows "Pausing…" until the in-flight request completes; once the loop is blocked the indicator changes to "⏸ Paused". Run `/pause` again to resume. |
| `/tools`           | Show every toolset (with lifecycle state) and the tools they expose                  |
| `/skills`          | List skills available to the current agent                                           |
| `/toolset-restart` | Force a supervisor-driven reconnect of the named toolset (`/toolset-restart <name>`). Press <kbd>Tab</kbd> after `/toolset-restart` and a space to complete a toolset name; non-restartable toolsets are shown dimmed and cannot be selected. |
| `/permissions`     | Inspect and edit tool permission rules                                               |
| `/speak`           | Voice input via system speech-to-text (macOS only)                                   |
| `/exit`            | Exit the application (aliases: `/quit`, `/q`)                                        |
@z

@x
Slash commands (both built-in and named) execute immediately when entered. Regular chat messages sent while the agent is working are steered into the ongoing stream by default: the agent picks them up mid-turn (they appear in the transcript at the point the agent sees them) without breaking the stream. Prefer the previous end-of-turn behavior? Switch **While agent is working** to `Queue` on the **Behavior** tab of `/settings`; queued messages are processed in order once the stream stops.
@y
Slash commands (both built-in and named) execute immediately when entered. Regular chat messages sent while the agent is working are steered into the ongoing stream by default: the agent picks them up mid-turn (they appear in the transcript at the point the agent sees them) without breaking the stream. Prefer the previous end-of-turn behavior? Switch **While agent is working** to `Queue` on the **Behavior** tab of `/settings`; queued messages are processed in order once the stream stops.
@z

@x
Agent-defined commands (prompts, URL links, agent-switching shortcuts) are configured under `commands:` in the agent YAML — see [Custom Commands](../../configuration/commands/index.md) for the full reference, including how to hide commands with `--disable-commands`.
@y
Agent-defined commands (prompts, URL links, agent-switching shortcuts) are configured under `commands:` in the agent YAML — see [Custom Commands](../../configuration/commands/index.md) for the full reference, including how to hide commands with `--disable-commands`.
@z

@x
### Agents Panel
@y
### Agents Panel
@z

@x
The sidebar's **Agents** section lists every agent in the team and has two display modes selectable via **Sidebar info mode** in `/settings`:
@y
The sidebar's **Agents** section lists every agent in the team and has two display modes selectable via **Sidebar info mode** in `/settings`:
@z

@x
- **Compact** (default) — The current agent is shown as a focus **card** (rendered in place at its position in the list) with its name, a wrapped description, its full `provider/model`, and a thinking line. Every other agent is shown as a compact **two-line row** — line 1 is the shortcut/spinner, the agent name (in its accent color), and a right-aligned thinking **gauge**; line 2 is the indented full `provider/model` and, once the agent has run, its latest **context usage** as a right-aligned percentage of its context window.
- **Detailed** — Each agent is shown as a responsive card with labeled **Effort**, **Context**, and **Cost** metrics on a single line (or split across lines at narrow sidebar widths), making cumulative per-agent cost visible at a glance across the team.
@y
- **Compact** (default) — The current agent is shown as a focus **card** (rendered in place at its position in the list) with its name, a wrapped description, its full `provider/model`, and a thinking line. Every other agent is shown as a compact **two-line row** — line 1 is the shortcut/spinner, the agent name (in its accent color), and a right-aligned thinking **gauge**; line 2 is the indented full `provider/model` and, once the agent has run, its latest **context usage** as a right-aligned percentage of its context window.
- **Detailed** — Each agent is shown as a responsive card with labeled **Effort**, **Context**, and **Cost** metrics on a single line (or split across lines at narrow sidebar widths), making cumulative per-agent cost visible at a glance across the team.
@z

@x
Agents are separated by a blank line so rows stay visually distinct. The effort **gauge** is the only visual language for thinking; the focus card and the Agent Inspector spell out the exact level alongside it. Left-click any agent to switch to it.
@y
Agents are separated by a blank line so rows stay visually distinct. The effort **gauge** is the only visual language for thinking; the focus card and the Agent Inspector spell out the exact level alongside it. Left-click any agent to switch to it.
@z

@x
On large teams the roster can be trimmed to the agents that matter right now: enable **Active agents only** (nested under **Agents** in `/settings` → Appearance → Sidebar sections, off by default) to list only agents active in the current session — the selected or working agent, participants of an in-flight transfer, and any agent with recorded participation (usage or attributed cost, including agents restored with a reloaded session). The filter also applies to the top/bottom band, is purely presentational — <kbd>Ctrl</kbd>+<kbd>number</kbd> shortcuts keep their original team positions and agent cycling still walks the whole team — and is unavailable while the Agents section itself is hidden.
@y
On large teams the roster can be trimmed to the agents that matter right now: enable **Active agents only** (nested under **Agents** in `/settings` → Appearance → Sidebar sections, off by default) to list only agents active in the current session — the selected or working agent, participants of an in-flight transfer, and any agent with recorded participation (usage or attributed cost, including agents restored with a reloaded session). The filter also applies to the top/bottom band, is purely presentational — <kbd>Ctrl</kbd>+<kbd>number</kbd> shortcuts keep their original team positions and agent cycling still walks the whole team — and is unavailable while the Agents section itself is hidden.
@z

@x
#### Agent inspector
@y
#### Agent inspector
@z

@x
Open a read-only **Agent Inspector** to inspect any agent's full configuration combined with its live state. The instruction/system prompt is deliberately omitted; everything else the agent declares is shown:
@y
Open a read-only **Agent Inspector** to inspect any agent's full configuration combined with its live state. The instruction/system prompt is deliberately omitted; everything else the agent declares is shown:
@z

@x
- **Right-click any agent** (card or row) to open the inspector without switching to it.
- **<kbd>Ctrl</kbd>+left-click any agent** does the same — a fallback for terminals that don't forward right-clicks.
- **Left-click** always switches to the agent.
@y
- **Right-click any agent** (card or row) to open the inspector without switching to it.
- **<kbd>Ctrl</kbd>+left-click any agent** does the same — a fallback for terminals that don't forward right-clicks.
- **Left-click** always switches to the agent.
@z

@x
The title is rendered in the agent's accent color. Sections appear in this order, and any empty section is omitted:
@y
The title is rendered in the agent's accent color. Sections appear in this order, and any empty section is omitted:
@z

@x
- **Description** — the agent's wrapped description.
- **Live state** — a `● current agent` line when the inspected agent is the one currently running.
- **Model / Fallback / Thinking** — the `provider/model`, any fallback models, and the gauge + value thinking line (omitted for models with no selectable thinking, e.g. harness-backed agents).
- **Context** — the agent's latest known context usage, e.g. `Context: 12.8K of 128.0K tokens (10%)` (a bare token count when the context limit is unknown; omitted until the agent has run). Sub-agent and background-agent runs are accounted for. When a dedicated `compaction_model` caps the effective limit below the primary model's own window, the token-usage line also shows a short "⚠ capped" marker (see `/context` for the model and figure).
- **Cost** — the agent's cumulative cost across all runs in the session tree. Repeated session snapshots are not double-counted. Omitted until the agent has run.
- **Sub-agents (N) / Handoffs (N) / Skills (N)** — compact, inline, comma-separated lists wrapped to the dialog width.
- **Limits** — the configured per-agent limits that are set, e.g. `Limits: max-iter 50 · history 40 · max-tool-calls 5`.
- **Options** — the enabled option flags, e.g. `Options: add-date · add-environment-info · redact-secrets`.
- **Toolsets (N)** — one line per toolset with a status marker, its name, kind, and tool count, followed by the indented tool names.
- **Commands (N)** — the slash commands the agent defines, each with its description.
@y
- **Description** — the agent's wrapped description.
- **Live state** — a `● current agent` line when the inspected agent is the one currently running.
- **Model / Fallback / Thinking** — the `provider/model`, any fallback models, and the gauge + value thinking line (omitted for models with no selectable thinking, e.g. harness-backed agents).
- **Context** — the agent's latest known context usage, e.g. `Context: 12.8K of 128.0K tokens (10%)` (a bare token count when the context limit is unknown; omitted until the agent has run). Sub-agent and background-agent runs are accounted for. When a dedicated `compaction_model` caps the effective limit below the primary model's own window, the token-usage line also shows a short "⚠ capped" marker (see `/context` for the model and figure).
- **Cost** — the agent's cumulative cost across all runs in the session tree. Repeated session snapshots are not double-counted. Omitted until the agent has run.
- **Sub-agents (N) / Handoffs (N) / Skills (N)** — compact, inline, comma-separated lists wrapped to the dialog width.
- **Limits** — the configured per-agent limits that are set, e.g. `Limits: max-iter 50 · history 40 · max-tool-calls 5`.
- **Options** — the enabled option flags, e.g. `Options: add-date · add-environment-info · redact-secrets`.
- **Toolsets (N)** — one line per toolset with a status marker, its name, kind, and tool count, followed by the indented tool names.
- **Commands (N)** — the slash commands the agent defines, each with its description.
@z

@x
Each toolset carries a single-width status marker reflecting its **live** lifecycle: `●` started (serving), `○` stopped (not yet started), or `⚠` error. The tools listed under a toolset are the **live** tool names when it has started; for a toolset that has not started, the inspector instead shows its declared `tools:` allow-list prefixed with `declared:` (and shows nothing when the toolset declares no allow-list and therefore serves every tool). This lets you see both what an agent is configured with and what is actually running, even before the agent has been used.
@y
Each toolset carries a single-width status marker reflecting its **live** lifecycle: `●` started (serving), `○` stopped (not yet started), or `⚠` error. The tools listed under a toolset are the **live** tool names when it has started; for a toolset that has not started, the inspector instead shows its declared `tools:` allow-list prefixed with `declared:` (and shows nothing when the toolset declares no allow-list and therefore serves every tool). This lets you see both what an agent is configured with and what is actually running, even before the agent has been used.
@z

@x
The dialog scrolls when the content is long; press <kbd>Esc</kbd> to close it. Remote runtimes (which hold no local team config) degrade gracefully — the config-derived sections are simply omitted.
@y
The dialog scrolls when the content is long; press <kbd>Esc</kbd> to close it. Remote runtimes (which hold no local team config) degrade gracefully — the config-derived sections are simply omitted.
@z

@x
Model identifiers on line 2 are truncated **from the left** (e.g. `…claude-sonnet-4-6`) only when they overflow, so the informative tail (variant/version) is preserved. As the sidebar narrows the model keeps its own line, and near the minimum width line 1's gauge collapses to a single cell to keep the name readable.
@y
Model identifiers on line 2 are truncated **from the left** (e.g. `…claude-sonnet-4-6`) only when they overflow, so the informative tail (variant/version) is preserved. As the sidebar narrows the model keeps its own line, and near the minimum width line 1's gauge collapses to a single cell to keep the name readable.
@z

@x
The thinking state of each model is shown with a gauge + value on the card and a gauge or badge on the row (no `✻` glyph):
@y
The thinking state of each model is shown with a gauge + value on the card and a gauge or badge on the row (no `✻` glyph):
@z

@x
| Model state            | Card line                      | Row badge              |
| ---------------------- | ------------------------------ | ---------------------- |
| Effort level           | `thinking ▰▰▰▰▱▱ high`         | `▰▰▰▰▱▱` (effort gauge)  |
| Adaptive budget        | `thinking auto adaptive`       | `auto`                 |
| Token budget           | `thinking ◉ 8.2K tokens`        | `◉ 8.2K`               |
| Disabled (capable)     | `thinking ▱▱▱▱▱▱ off` (dimmed)  | `▱▱▱▱▱▱` (empty gauge)  |
| Not reasoning-capable  | _(omitted)_                    | _(omitted)_            |
@y
| Model state            | Card line                      | Row badge              |
| ---------------------- | ------------------------------ | ---------------------- |
| Effort level           | `thinking ▰▰▰▰▱▱ high`         | `▰▰▰▰▱▱` (effort gauge)  |
| Adaptive budget        | `thinking auto adaptive`       | `auto`                 |
| Token budget           | `thinking ◉ 8.2K tokens`        | `◉ 8.2K`               |
| Disabled (capable)     | `thinking ▱▱▱▱▱▱ off` (dimmed)  | `▱▱▱▱▱▱` (empty gauge)  |
| Not reasoning-capable  | _(omitted)_                    | _(omitted)_            |
@z

@x
The **effort gauge** is a fixed-width six-cell indicator (`▰` filled, `▱` empty) so the badge column stays aligned. It maps the six selectable levels one-to-one onto filled-cell counts — `minimal` → `▰▱▱▱▱▱`, `low` → `▰▰▱▱▱▱`, `medium` → `▰▰▰▱▱▱`, `high` → `▰▰▰▰▱▱`, `xhigh` → `▰▰▰▰▰▱`, `max` → `▰▰▰▰▰▰` — so the cell count alone is lossless, with a low→high color ramp as a secondary cue. A capable-but-disabled model shows a dim empty gauge (`▱▱▱▱▱▱` `off`), adaptive budgets show `auto`, and token budgets keep `◉ <count>`. The same gauge + value renders on the focus card, the Agent Inspector, and the row.
@y
The **effort gauge** is a fixed-width six-cell indicator (`▰` filled, `▱` empty) so the badge column stays aligned. It maps the six selectable levels one-to-one onto filled-cell counts — `minimal` → `▰▱▱▱▱▱`, `low` → `▰▰▱▱▱▱`, `medium` → `▰▰▰▱▱▱`, `high` → `▰▰▰▰▱▱`, `xhigh` → `▰▰▰▰▰▱`, `max` → `▰▰▰▰▰▰` — so the cell count alone is lossless, with a low→high color ramp as a secondary cue. A capable-but-disabled model shows a dim empty gauge (`▱▱▱▱▱▱` `off`), adaptive budgets show `auto`, and token budgets keep `◉ <count>`. The same gauge + value renders on the focus card, the Agent Inspector, and the row.
@z

@x
Harness-backed agents (e.g. `claude-code`) show the harness type as their model and no thinking gauge. Press **Shift+Tab** to cycle the current model's thinking-effort level; a `✻ Thinking: <level>` toast confirms the change (useful when the sidebar is hidden).
@y
Harness-backed agents (e.g. `claude-code`) show the harness type as their model and no thinking gauge. Press **Shift+Tab** to cycle the current model's thinking-effort level; a `✻ Thinking: <level>` toast confirms the change (useful when the sidebar is hidden).
@z

@x
### Agent Delegation Feedback
@y
### Agent Delegation Feedback
@z

@x
When a parent agent calls `transfer_task` to delegate work to a sub-agent, the TUI provides live visual feedback in both the sidebar and the chat.
@y
When a parent agent calls `transfer_task` to delegate work to a sub-agent, the TUI provides live visual feedback in both the sidebar and the chat.
@z

@x
**Sidebar — Transfer box:** As soon as the delegation starts, an animated **Transfer** box appears below the agent roster, showing the direction of the handoff with a traveling dot:
@y
**Sidebar — Transfer box:** As soon as the delegation starts, an animated **Transfer** box appears below the agent roster, showing the direction of the handoff with a traveling dot:
@z

@x
```text
╭─ Transfer ─────────────────╮
│  parent  ●──────►  child   │
╰────────────────────────────╯
```
@y
```text
╭─ Transfer ─────────────────╮
│  parent  ●──────►  child   │
╰────────────────────────────╯
```
@z

@x
The box stays visible for at least 1.5 seconds. Once the sub-agent produces its first message, reasoning, or tool output, the box hides (still honoring the minimum window) to keep the sidebar focused on the active agent. If the sub-agent is slow or silent, the box hides after a 3-second maximum cutoff. The header shows a `↔` marker while any delegation is still in flight, even after the box hides.
@y
The box stays visible for at least 1.5 seconds. Once the sub-agent produces its first message, reasoning, or tool output, the box hides (still honoring the minimum window) to keep the sidebar focused on the active agent. If the sub-agent is slow or silent, the box hides after a 3-second maximum cutoff. The header shows a `↔` marker while any delegation is still in flight, even after the box hides.
@z

@x
**Sidebar — Return box:** When the sub-agent finishes and control returns to the parent, a brief **Return** box animates the reverse direction for up to 1.5 seconds, then disappears:
@y
**Sidebar — Return box:** When the sub-agent finishes and control returns to the parent, a brief **Return** box animates the reverse direction for up to 1.5 seconds, then disappears:
@z

@x
```text
╭─ Return ───────────────────╮
│  child  ●──────►  parent   │
╰────────────────────────────╯
```
@y
```text
╭─ Return ───────────────────╮
│  child  ●──────►  parent   │
╰────────────────────────────╯
```
@z

@x
**Chat — return transition:** Alongside the sidebar Return animation, the chat shows a one-line static transition between the two agent badges:
@y
**Chat — return transition:** Alongside the sidebar Return animation, the chat shows a one-line static transition between the two agent badges:
@z

@x
```text
[child]  returned control to  [parent]
```
@y
```text
[child]  returned control to  [parent]
```
@z

@x
This transition is not persisted — it does not reappear when you reload the session.
@y
This transition is not persisted — it does not reappear when you reload the session.
@z

@x
### Context-Usage Gauge
@y
### Context-Usage Gauge
@z

@x
The context percentage shown in the sidebar token-usage section, and the fill bar in the lean TUI status line, both color-escalate as the active session approaches the auto-compaction threshold:
@y
The context percentage shown in the sidebar token-usage section, and the fill bar in the lean TUI status line, both color-escalate as the active session approaches the auto-compaction threshold:
@z

@x
| State   | Color  | Trigger |
| ------- | ------ | ------- |
| Normal  | (default) | Usage below 75% of the compaction threshold |
| Warning | Orange | Usage at or above 75% of the compaction threshold |
| Critical | Red   | Usage at or above 95% of the compaction threshold |
@y
| State   | Color  | Trigger |
| ------- | ------ | ------- |
| Normal  | (default) | Usage below 75% of the compaction threshold |
| Warning | Orange | Usage at or above 75% of the compaction threshold |
| Critical | Red   | Usage at or above 95% of the compaction threshold |
@z

@x
While a compaction is running the percentage is replaced by a **"compacting…"** indicator; token counts remain visible in the lean TUI status line.
@y
While a compaction is running the percentage is replaced by a **"compacting…"** indicator; token counts remain visible in the lean TUI status line.
@z

@x
The thresholds are proportional to the agent's configured `compaction_threshold` (default `0.9`), so a custom value keeps a predictable visual runway. See [Compaction Threshold](../../configuration/models/index.md#delegating-session-compaction) for configuration details.
@y
The thresholds are proportional to the agent's configured `compaction_threshold` (default `0.9`), so a custom value keeps a predictable visual runway. See [Compaction Threshold](../../configuration/models/index.md#delegating-session-compaction) for configuration details.
@z

@x
Clicking the token/context part of the sidebar's usage reading (the glyph, token count, context percentage — or the "compacting…" marker — and the `⚠ capped` marker) opens the `/context` dialog with the full breakdown. Clicking the cost part (the `$` figure and the sub-session count) opens the `/cost` dialog instead. The "Token Usage" section title itself is not clickable.
@y
Clicking the token/context part of the sidebar's usage reading (the glyph, token count, context percentage — or the "compacting…" marker — and the `⚠ capped` marker) opens the `/context` dialog with the full breakdown. Clicking the cost part (the `$` figure and the sub-session count) opens the `/cost` dialog instead. The "Token Usage" section title itself is not clickable.
@z

@x
### Thinking and Tool Details
@y
### Thinking and Tool Details
@z

@x
Reasoning/thinking blocks are collapsed by default and carry a `Thinking` header badge. When collapsed, the TUI shows a short preview and compact tool summaries. Expand a block to see the full thinking content and the real tool renderers, including detailed tool output such as file edit diffs.
@y
Reasoning/thinking blocks are collapsed by default and carry a `Thinking` header badge. When collapsed, the TUI shows a short preview and compact tool summaries. Expand a block to see the full thinking content and the real tool renderers, including detailed tool output such as file edit diffs.
@z

@x
To start new sessions with thinking/tool blocks expanded by default, set `expand_thinking` in your user config:
@y
To start new sessions with thinking/tool blocks expanded by default, set `expand_thinking` in your user config:
@z

@x
```yaml
# ~/.config/cagent/config.yaml
settings:
  expand_thinking: true
```
@y
```yaml
# ~/.config/cagent/config.yaml
settings:
  expand_thinking: true
```
@z

@x
Set it to `false` or omit it to keep the default collapsed behavior. See [User Settings](../../configuration/user-settings/index.md) for the full settings reference.
@y
Set it to `false` or omit it to keep the default collapsed behavior. See [User Settings](../../configuration/user-settings/index.md) for the full settings reference.
@z

@x
### Mermaid Diagrams
@y
### Mermaid Diagrams
@z

@x
The TUI renders Mermaid diagram blocks inline rather than displaying raw syntax. When an assistant message contains a fenced code block tagged ` ```mermaid `, the TUI parses the diagram and draws an ASCII representation directly in the conversation:
@y
The TUI renders Mermaid diagram blocks inline rather than displaying raw syntax. When an assistant message contains a fenced code block tagged ` ```mermaid `, the TUI parses the diagram and draws an ASCII representation directly in the conversation:
@z

@x
| Diagram type                                   | Support                                           |
| ---------------------------------------------- | ------------------------------------------------- |
| `graph` / `flowchart`                          | ✅ Rendered inline                                 |
| `sequenceDiagram`                              | ✅ Rendered inline                                 |
| `stateDiagram` / `stateDiagram-v2`             | ✅ Rendered inline (supports `direction TD/TB/BT/LR/RL`) |
| Other types (`classDiagram`, `erDiagram`, …) | Falls back to a syntax-highlighted code block     |
@y
| Diagram type                                   | Support                                           |
| ---------------------------------------------- | ------------------------------------------------- |
| `graph` / `flowchart`                          | ✅ Rendered inline                                 |
| `sequenceDiagram`                              | ✅ Rendered inline                                 |
| `stateDiagram` / `stateDiagram-v2`             | ✅ Rendered inline (supports `direction TD/TB/BT/LR/RL`) |
| Other types (`classDiagram`, `erDiagram`, …) | Falls back to a syntax-highlighted code block     |
@z

@x
Mermaid rendering works in both the full TUI and the lean TUI. Unsupported or syntactically invalid diagram blocks are displayed as ordinary fenced code blocks — no configuration is required and there is no way to disable it.
@y
Mermaid rendering works in both the full TUI and the lean TUI. Unsupported or syntactically invalid diagram blocks are displayed as ordinary fenced code blocks — no configuration is required and there is no way to disable it.
@z

@x
### LaTeX Math Rendering
@y
### LaTeX Math Rendering
@z

@x
The TUI renders LaTeX math expressions as terminal-friendly Unicode text. When an assistant message contains inline math (delimited by `$…$`) or display math (delimited by `$$…$$`), the TUI converts supported LaTeX commands to their Unicode equivalents and displays them directly in the conversation.
@y
The TUI renders LaTeX math expressions as terminal-friendly Unicode text. When an assistant message contains inline math (delimited by `$…$`) or display math (delimited by `$$…$$`), the TUI converts supported LaTeX commands to their Unicode equivalents and displays them directly in the conversation.
@z

@x
Supported features include:
@y
Supported features include:
@z

@x
- Greek letters (`\alpha`, `\beta`, `\gamma`, …)
- Mathematical operators (`\times`, `\div`, `\pm`, `\oplus`, …)
- Relations (`\le`, `\ge`, `\approx`, `\equiv`, …)
- Set operators (`\cap`, `\cup`, `\subset`, `\in`, …)
- Calculus symbols (`\int`, `\sum`, `\prod`, `\partial`, `\nabla`, …)
- Arrows and logic (`\to`, `\implies`, `\forall`, `\exists`, …)
- Superscripts and subscripts (e.g., `x^2`, `a_i`)
- Fractions (`\frac{a}{b}`), square roots (`\sqrt{x}`), and matrices
- Common functions (`\sin`, `\cos`, `\log`, `\lim`, …)
@y
- Greek letters (`\alpha`, `\beta`, `\gamma`, …)
- Mathematical operators (`\times`, `\div`, `\pm`, `\oplus`, …)
- Relations (`\le`, `\ge`, `\approx`, `\equiv`, …)
- Set operators (`\cap`, `\cup`, `\subset`, `\in`, …)
- Calculus symbols (`\int`, `\sum`, `\prod`, `\partial`, `\nabla`, …)
- Arrows and logic (`\to`, `\implies`, `\forall`, `\exists`, …)
- Superscripts and subscripts (e.g., `x^2`, `a_i`)
- Fractions (`\frac{a}{b}`), square roots (`\sqrt{x}`), and matrices
- Common functions (`\sin`, `\cos`, `\log`, `\lim`, …)
@z

@x
Unsupported or syntactically invalid LaTeX expressions fall back to displaying the raw source. LaTeX rendering works in both the full TUI and the lean TUI, requires no configuration, and cannot be disabled.
@y
Unsupported or syntactically invalid LaTeX expressions fall back to displaying the raw source. LaTeX rendering works in both the full TUI and the lean TUI, requires no configuration, and cannot be disabled.
@z

@x
### Markdown Images
@y
### Markdown Images
@z

@x
The TUI fetches and renders images referenced in agent responses using the Kitty graphics protocol. When an assistant message contains a standard Markdown image reference, the TUI downloads the image in the background and displays it inline at the point of the reference. While the image is loading a placeholder is shown; once loaded, the message re-renders with the image in place.
@y
The TUI fetches and renders images referenced in agent responses using the Kitty graphics protocol. When an assistant message contains a standard Markdown image reference, the TUI downloads the image in the background and displays it inline at the point of the reference. While the image is loading a placeholder is shown; once loaded, the message re-renders with the image in place.
@z

@x
Only `http://`, `https://`, and `data:image/…;base64,…` URIs are resolved. `file://`, `sandbox://`, and any other URI scheme are rejected as a security measure against prompt-injection attacks that could otherwise read local files. Bare relative paths (e.g. `./output.png`, used for agent-generated images) are read via the local filesystem. Images that fail to load are silently dropped — the surrounding message text is unaffected. Image rendering requires a terminal that supports the Kitty graphics protocol; it is automatically disabled when the terminal does not support it. You can also disable it explicitly via `render_images: false` in `~/.config/cagent/config.yaml` or the **Render images** toggle in `/settings`.
@y
Only `http://`, `https://`, and `data:image/…;base64,…` URIs are resolved. `file://`, `sandbox://`, and any other URI scheme are rejected as a security measure against prompt-injection attacks that could otherwise read local files. Bare relative paths (e.g. `./output.png`, used for agent-generated images) are read via the local filesystem. Images that fail to load are silently dropped — the surrounding message text is unaffected. Image rendering requires a terminal that supports the Kitty graphics protocol; it is automatically disabled when the terminal does not support it. You can also disable it explicitly via `render_images: false` in `~/.config/cagent/config.yaml` or the **Render images** toggle in `/settings`.
@z

@x
### Snapshots, `/undo`, and `/snapshots`
@y
### Snapshots, `/undo`, and `/snapshots`
@z

@x
Enable shadow-git snapshots globally in `~/.config/cagent/config.yaml`:
@y
Enable shadow-git snapshots globally in `~/.config/cagent/config.yaml`:
@z

@x
```yaml
settings:
  snapshot: true
```
@y
```yaml
settings:
  snapshot: true
```
@z

@x
When enabled, Docker Agent records filesystem snapshots at turn boundaries. The TUI exposes two slash commands that operate on those snapshots:
@y
When enabled, Docker Agent records filesystem snapshots at turn boundaries. The TUI exposes two slash commands that operate on those snapshots:
@z

@x
- **`/undo`** restores files from the most recent snapshot (one step back).
- **`/snapshots`** opens a dialog showing how many snapshots have been captured and the number of files in each one. Use <kbd>↑</kbd>/<kbd>↓</kbd> (or <kbd>j</kbd>/<kbd>k</kbd>) to highlight an entry, then press <kbd>r</kbd> to reset the workspace to that point. Pick `<original>` to revert every snapshot and bring the workspace back to its pre-agent state. <kbd>Esc</kbd> closes the dialog without changing anything.
@y
- **`/undo`** restores files from the most recent snapshot (one step back).
- **`/snapshots`** opens a dialog showing how many snapshots have been captured and the number of files in each one. Use <kbd>↑</kbd>/<kbd>↓</kbd> (or <kbd>j</kbd>/<kbd>k</kbd>) to highlight an entry, then press <kbd>r</kbd> to reset the workspace to that point. Pick `<original>` to revert every snapshot and bring the workspace back to its pre-agent state. <kbd>Esc</kbd> closes the dialog without changing anything.
@z

@x
Neither command removes messages from the session transcript — they only touch files on disk. Both commands (and the matching command-palette entries) are hidden when snapshots are turned off. Omit `snapshot` or set it to `false` to leave automatic snapshots off; agents can still configure snapshot hooks manually.
@y
Neither command removes messages from the session transcript — they only touch files on disk. Both commands (and the matching command-palette entries) are hidden when snapshots are turned off. Omit `snapshot` or set it to `false` to leave automatic snapshots off; agents can still configure snapshot hooks manually.
@z

@x
See [Snapshots](../snapshots/index.md) for how the shadow-git machinery works and how to wire it per-agent.
@y
See [Snapshots](../snapshots/index.md) for how the shadow-git machinery works and how to wire it per-agent.
@z

@x
## File Attachments
@y
## File Attachments
@z

@x
Attach file contents to your messages using the `@` trigger:
@y
Attach file contents to your messages using the `@` trigger:
@z

@x
1. Type `@` to open the file completion menu
2. Start typing to filter files (respects `.gitignore`)
3. Select a file to insert the reference
@y
1. Type `@` to open the file completion menu
2. Start typing to filter files (respects `.gitignore`)
3. Select a file to insert the reference
@z

@x
```bash
# In the chat input:
Explain what the code in @pkg/agent/agent.go does
```
@y
```bash
# In the chat input:
Explain what the code in @pkg/agent/agent.go does
```
@z

@x
The agent receives the full file contents in a structured `<attachments>` block, while the UI shows just the reference.
@y
The agent receives the full file contents in a structured `<attachments>` block, while the UI shows just the reference.
@z

@x
For large or frequently-reused documents, or for getting content to an agent over the API or chat server instead of the TUI, see [Choosing a Large-Input Strategy](../../guides/headless/index.md#choosing-a-large-input-strategy).
@y
For large or frequently-reused documents, or for getting content to an agent over the API or chat server instead of the TUI, see [Choosing a Large-Input Strategy](../../guides/headless/index.md#choosing-a-large-input-strategy).
@z

@x
Attached files are also recorded on the session so sub-agents spawned by task transfer can read them. To review what is attached, open `/context`: the dialog lists every attached file (and resolved prompt file) with a per-file token estimate and, when a compaction has occurred, displays the verbatim text of the most recent compaction summary. Use <kbd>↑</kbd>/<kbd>↓</kbd> to select an attached file and press <kbd>d</kbd> (or <kbd>x</kbd>/<kbd>Del</kbd>) to drop it, or run `/drop <path>` directly — press <kbd>Tab</kbd> after `/drop` and a space to complete the path from the currently attached files. Dropping stops sharing the file with sub-agents and skills; content already inlined in earlier messages stays in the conversation until compaction, and the file can always be re-attached with `@` or `/attach`.
@y
Attached files are also recorded on the session so sub-agents spawned by task transfer can read them. To review what is attached, open `/context`: the dialog lists every attached file (and resolved prompt file) with a per-file token estimate and, when a compaction has occurred, displays the verbatim text of the most recent compaction summary. Use <kbd>↑</kbd>/<kbd>↓</kbd> to select an attached file and press <kbd>d</kbd> (or <kbd>x</kbd>/<kbd>Del</kbd>) to drop it, or run `/drop <path>` directly — press <kbd>Tab</kbd> after `/drop` and a space to complete the path from the currently attached files. Dropping stops sharing the file with sub-agents and skills; content already inlined in earlier messages stays in the conversation until compaction, and the file can always be re-attached with `@` or `/attach`.
@z

@x
### Team Context Budgets and Targeted Compaction
@y
### Team Context Budgets and Targeted Compaction
@z

@x
The `/context` dialog also shows a **Live sessions** section: the current session plus every currently running sub-agent session (foreground children spawned by task transfer and long-running `run_background_agent` tasks). Each row shows the agent name, a short session ID (so two concurrent runs of the same agent stay distinguishable), and that session's context budget: used tokens, context limit, and percentage, or an explicit "limit unknown" reading when the model's window cannot be resolved. Live-sessions rows do not repeat the compaction-cap wording themselves — the dialog's header line is the sole authority on which model, if any, caps the effective limit.
@y
The `/context` dialog also shows a **Live sessions** section: the current session plus every currently running sub-agent session (foreground children spawned by task transfer and long-running `run_background_agent` tasks). Each row shows the agent name, a short session ID (so two concurrent runs of the same agent stay distinguishable), and that session's context budget: used tokens, context limit, and percentage, or an explicit "limit unknown" reading when the model's window cannot be resolved. Live-sessions rows do not repeat the compaction-cap wording themselves — the dialog's header line is the sole authority on which model, if any, caps the effective limit.
@z

@x
When a compaction has occurred, the dialog displays the verbatim text of the most recent compaction summary below the file inventory, under a "Latest compaction summary" section. This shows exactly what was summarized, preserving hard newlines and soft-wrapping long lines to the dialog width.
@y
When a compaction has occurred, the dialog displays the verbatim text of the most recent compaction summary below the file inventory, under a "Latest compaction summary" section. This shows exactly what was summarized, preserving hard newlines and soft-wrapping long lines to the dialog width.
@z

@x
Select a live session with <kbd>↑</kbd>/<kbd>↓</kbd> and press <kbd>Enter</kbd> to explicitly compact it. Cross-agent compaction happens only on this explicit request: no idle-triggered automatic compaction is added, and the existing automatic threshold and overflow-recovery compaction of sub-agent sessions is unchanged. The request is queued onto the target session's own run loop and executes at the next safe point between model turns, so it cannot corrupt an in-flight turn. The dialog closes and a notification confirms the request; a second notification reports the outcome (compacted, skipped, or failed) with the agent's name. Selecting the main row runs the same compaction as `/compact`. `/compact` itself keeps compacting the current root session. Remote runtimes do not expose live-session tracking, so the section is omitted there.
@y
Select a live session with <kbd>↑</kbd>/<kbd>↓</kbd> and press <kbd>Enter</kbd> to explicitly compact it. Cross-agent compaction happens only on this explicit request: no idle-triggered automatic compaction is added, and the existing automatic threshold and overflow-recovery compaction of sub-agent sessions is unchanged. The request is queued onto the target session's own run loop and executes at the next safe point between model turns, so it cannot corrupt an in-flight turn. The dialog closes and a notification confirms the request; a second notification reports the outcome (compacted, skipped, or failed) with the agent's name. Selecting the main row runs the same compaction as `/compact`. `/compact` itself keeps compacting the current root session. Remote runtimes do not expose live-session tracking, so the section is omitted there.
@z

@x
## Runtime Model Switching
@y
## Runtime Model Switching
@z

@x
Change the AI model during a session with `/model` or <kbd>Ctrl</kbd>+<kbd>M</kbd>. Model switching works in both the full TUI and the lean TUI.
@y
Change the AI model during a session with `/model` or <kbd>Ctrl</kbd>+<kbd>M</kbd>. Model switching works in both the full TUI and the lean TUI.
@z

@x
1. Press <kbd>Ctrl</kbd>+<kbd>M</kbd> (full TUI) or type `/model` (both TUIs)
2. Select from config models or type a custom `provider/model`
3. The model switch is saved with the session and restored on reload
@y
1. Press <kbd>Ctrl</kbd>+<kbd>M</kbd> (full TUI) or type `/model` (both TUIs)
2. Select from config models or type a custom `provider/model`
3. The model switch is saved with the session and restored on reload
@z

@x
When a models gateway is configured (`--models-gateway`) and it exposes an OpenAI-style `/v1/models` endpoint, the picker lists the models actually served by the gateway (merged with the models defined in the agent config). When the gateway doesn't expose `/v1/models`, the picker falls back to the regular catalog.
@y
When a models gateway is configured (`--models-gateway`) and it exposes an OpenAI-style `/v1/models` endpoint, the picker lists the models actually served by the gateway (merged with the models defined in the agent config). When the gateway doesn't expose `/v1/models`, the picker falls back to the regular catalog.
@z

@x
The picker's catalog entries come from [models.dev](https://models.dev) and are cached locally for a day. Press <kbd>Ctrl</kbd>+<kbd>R</kbd> in the picker to force model discovery to run again, including a refetch of the models.dev catalog.
@y
The picker's catalog entries come from [models.dev](https://models.dev) and are cached locally for a day. Press <kbd>Ctrl</kbd>+<kbd>R</kbd> in the picker to force model discovery to run again, including a refetch of the models.dev catalog.
@z

@x
> [!TIP]
> Use model switching to try a more capable model for complex tasks, or a cheaper one for simple queries — without modifying your YAML config.
@y
> [!TIP]
> Use model switching to try a more capable model for complex tasks, or a cheaper one for simple queries — without modifying your YAML config.
@z

@x
## Editable Messages
@y
## Editable Messages
@z

@x
Edit any previous user message to branch the conversation. Hover a past user message and click **✎ edit** (or select it with the keyboard and press <kbd>e</kbd>) to modify it — the agent will re-process from that point, while the original session history is preserved. This is great for exploring alternative approaches without losing your work.
@y
Edit any previous user message to branch the conversation. Hover a past user message and click **✎ edit** (or select it with the keyboard and press <kbd>e</kbd>) to modify it — the agent will re-process from that point, while the original session history is preserved. This is great for exploring alternative approaches without losing your work.
@z

@x
Hovering a user or assistant message also reveals a **⎘ copy** button that copies the message text to the clipboard (<kbd>c</kbd> when a message is selected).
@y
Hovering a user or assistant message also reveals a **⎘ copy** button that copies the message text to the clipboard (<kbd>c</kbd> when a message is selected).
@z

@x
## Error Recovery
@y
## Error Recovery
@z

@x
When an agent turn fails (fatal model error, hook block, loop detection, tool-setup failure), the TUI displays the error in the message stream and persists it to the session store. Errors survive a reload and are shown exactly where they occurred, making them visible in shared or remote sessions.
@y
When an agent turn fails (fatal model error, hook block, loop detection, tool-setup failure), the TUI displays the error in the message stream and persists it to the session store. Errors survive a reload and are shown exactly where they occurred, making them visible in shared or remote sessions.
@z

@x
Each error message includes a clickable **↻ retry** button. Clicking it resumes the conversation from the point of failure — without retyping your last message. This lets you recover from transient failures (rate limits, network blips, model API errors) in one click.
@y
Each error message includes a clickable **↻ retry** button. Clicking it resumes the conversation from the point of failure — without retyping your last message. This lets you recover from transient failures (rate limits, network blips, model API errors) in one click.
@z

@x
## Session Management
@y
## Session Management
@z

@x
Docker Agent automatically saves your sessions. Use `/sessions` to browse past conversations:
@y
Docker Agent automatically saves your sessions. Use `/sessions` to browse past conversations:
@z

@x
- **Browse** past sessions with search and filtering. The search matches against session **titles** and **session IDs** (full UUIDs, dash-less variants, and partial fragments all resolve correctly — useful when jumping back to a session from a copied ID or log).
- **Workspace grouping**: sessions are grouped by **git repository root** (worktree-aware) — sessions from any subdirectory or linked worktree of the same repository are grouped together under "This workspace", and the header shows the repository root path. Sessions outside the current repository appear under "Other locations" with their originating directory. Press <kbd>Ctrl</kbd>+<kbd>G</kbd> in the browser to cycle between all, current-workspace only, and other-directory views. Restoring a session reopens it in its original directory, so the label always matches where a restore will land.
- **Star** important sessions with `/star`
- **Branch** conversations by editing any previous user message — preserving the original session history
- **Resume** sessions with `docker agent run config.yaml --session <id>`
- **Relative refs**: `--session -1` for the last session, `-2` for the one before
@y
- **Browse** past sessions with search and filtering. The search matches against session **titles** and **session IDs** (full UUIDs, dash-less variants, and partial fragments all resolve correctly — useful when jumping back to a session from a copied ID or log).
- **Workspace grouping**: sessions are grouped by **git repository root** (worktree-aware) — sessions from any subdirectory or linked worktree of the same repository are grouped together under "This workspace", and the header shows the repository root path. Sessions outside the current repository appear under "Other locations" with their originating directory. Press <kbd>Ctrl</kbd>+<kbd>G</kbd> in the browser to cycle between all, current-workspace only, and other-directory views. Restoring a session reopens it in its original directory, so the label always matches where a restore will land.
- **Star** important sessions with `/star`
- **Branch** conversations by editing any previous user message — preserving the original session history
- **Resume** sessions with `docker agent run config.yaml --session <id>`
- **Relative refs**: `--session -1` for the last session, `-2` for the one before
@z

@x
### Session Title Editing
@y
### Session Title Editing
@z

@x
Customize session titles to make them more meaningful and easier to find. By default, Docker Agent auto-generates titles based on your first message, but you can override or regenerate them at any time.
@y
Customize session titles to make them more meaningful and easier to find. By default, Docker Agent auto-generates titles based on your first message, but you can override or regenerate them at any time.
@z

@x
**Using the `/title` command:**
@y
**Using the `/title` command:**
@z

@x
```bash
/title                     # Regenerate title using AI (based on recent messages)
/title My Custom Title     # Set a specific title
```
@y
```bash
/title                     # Regenerate title using AI (based on recent messages)
/title My Custom Title     # Set a specific title
```
@z

@x
**Using the sidebar:**
@y
**Using the sidebar:**
@z

@x
1. Click the pencil icon (✎) next to the session title in the sidebar
2. Type your new title
3. Press <kbd>Enter</kbd> to save, or <kbd>Escape</kbd> to cancel
@y
1. Click the pencil icon (✎) next to the session title in the sidebar
2. Type your new title
3. Press <kbd>Enter</kbd> to save, or <kbd>Escape</kbd> to cancel
@z

@x
> [!NOTE]
> Manually set titles are preserved and won’t be overwritten by auto-generation. Title changes are persisted immediately to the session.
@y
> [!NOTE]
> Manually set titles are preserved and won’t be overwritten by auto-generation. Title changes are persisted immediately to the session.
@z

@x
## Keyboard Shortcuts
@y
## Keyboard Shortcuts
@z

@x
| Shortcut   | Action                                          |
| ---------- | ----------------------------------------------- |
| Ctrl+K     | Open command palette                            |
| Ctrl+M     | Switch model                                    |
| Ctrl+R     | Reverse history search (search previous inputs) |
| Ctrl+G     | Cancel reverse history search                   |
| Ctrl+S     | Cycle to next agent in the team                 |
| Shift+Tab  | Cycle the current model's thinking-effort level (shows a `✻ Thinking: <level>` toast) |
| Ctrl+1 – 9 | Switch directly to agent _N_ in the team list   |
| Ctrl+T     | Open a new tab (additional agent session)       |
| Ctrl+W     | Close the current tab                           |
| Ctrl+N     | Next tab                                        |
| Ctrl+P     | Previous tab                                    |
| Ctrl+B     | Toggle the sidebar (full-UI mode only; disabled when --sidebar=false) |
| Ctrl+Y     | Toggle YOLO mode (auto-approve tool calls)      |
| Ctrl+O     | Toggle hide tool results                        |
| Ctrl+Z     | Suspend TUI to background (resume with `fg`)    |
| Ctrl+X     | Clear queued messages                           |
| Escape     | Cancel current operation                        |
| Enter      | Send message (or steer while the agent is running) |
| Alt+Enter  | Queue a follow-up turn while the agent is running |
| Shift+Enter | Insert a newline |
| Up/Down    | Navigate message history                        |
@y
| Shortcut   | Action                                          |
| ---------- | ----------------------------------------------- |
| Ctrl+K     | Open command palette                            |
| Ctrl+M     | Switch model                                    |
| Ctrl+R     | Reverse history search (search previous inputs) |
| Ctrl+G     | Cancel reverse history search                   |
| Ctrl+S     | Cycle to next agent in the team                 |
| Shift+Tab  | Cycle the current model's thinking-effort level (shows a `✻ Thinking: <level>` toast) |
| Ctrl+1 – 9 | Switch directly to agent _N_ in the team list   |
| Ctrl+T     | Open a new tab (additional agent session)       |
| Ctrl+W     | Close the current tab                           |
| Ctrl+N     | Next tab                                        |
| Ctrl+P     | Previous tab                                    |
| Ctrl+B     | Toggle the sidebar (full-UI mode only; disabled when --sidebar=false) |
| Ctrl+Y     | Toggle YOLO mode (auto-approve tool calls)      |
| Ctrl+O     | Toggle hide tool results                        |
| Ctrl+Z     | Suspend TUI to background (resume with `fg`)    |
| Ctrl+X     | Clear queued messages                           |
| Escape     | Cancel current operation                        |
| Enter      | Send message (or steer while the agent is running) |
| Alt+Enter  | Queue a follow-up turn while the agent is running |
| Shift+Enter | Insert a newline |
| Up/Down    | Navigate message history                        |
@z

@x
Press <kbd>Ctrl</kbd>+<kbd>H</kbd> to view the complete list of all available keyboard shortcuts.
@y
Press <kbd>Ctrl</kbd>+<kbd>H</kbd> to view the complete list of all available keyboard shortcuts.
@z

@x
### Custom Keybindings
@y
### Custom Keybindings
@z

@x
You can remap the shortcuts above by adding a `keybindings` list to the `settings` block of your `~/.config/cagent/config.yaml` (see [User Settings](../../configuration/user-settings/index.md#settings-reference) for the field reference). Each entry maps an action to one or more key combinations in [Bubbles key format](https://github.com/charmbracelet/bubbles) (for example `ctrl+q`, `alt+enter`, `f2`). Unlisted actions keep their defaults.
@y
You can remap the shortcuts above by adding a `keybindings` list to the `settings` block of your `~/.config/cagent/config.yaml` (see [User Settings](../../configuration/user-settings/index.md#settings-reference) for the field reference). Each entry maps an action to one or more key combinations in [Bubbles key format](https://github.com/charmbracelet/bubbles) (for example `ctrl+q`, `alt+enter`, `f2`). Unlisted actions keep their defaults.
@z

@x
This is the recommended way to replace the `Ctrl+J` newline fallback, which conflicts with common editor/terminal shortcuts (for example inside VS Code).
@y
This is the recommended way to replace the `Ctrl+J` newline fallback, which conflicts with common editor/terminal shortcuts (for example inside VS Code).
@z

@x
```yaml
settings:
  keybindings:
    # Insert a newline with Alt+Enter instead of Ctrl+J. Shift+Enter still
    # works automatically on terminals that report it.
    - action: "editor_newline"
      keys: ["alt+enter"]
    # Allow several keys for one action.
    - action: "commands"
      keys: ["f2", "ctrl+k"]
    - action: "quit"
      keys: ["ctrl+q"]
```
@y
```yaml
settings:
  keybindings:
    # Insert a newline with Alt+Enter instead of Ctrl+J. Shift+Enter still
    # works automatically on terminals that report it.
    - action: "editor_newline"
      keys: ["alt+enter"]
    # Allow several keys for one action.
    - action: "commands"
      keys: ["f2", "ctrl+k"]
    - action: "quit"
      keys: ["ctrl+q"]
```
@z

@x
**Valid actions:**
@y
**Valid actions:**
@z

@x
| Action                     | Default      | Description                            |
| -------------------------- | ------------ | -------------------------------------- |
| `editor_send`              | `enter`      | Send the current message               |
| `editor_newline`           | `ctrl+j`     | Insert a newline in the input          |
| `quit`                     | `ctrl+c`     | Quit (opens the exit confirmation)     |
| `switch_focus`             | `tab`        | Switch focus between panels            |
| `commands`                 | `ctrl+k`     | Open the command palette               |
| `help`                     | `ctrl+h`     | Show the help dialog                   |
| `toggle_yolo`              | `ctrl+y`     | Toggle YOLO mode                       |
| `toggle_hide_tool_results` | `ctrl+o`     | Toggle hiding tool results             |
| `cycle_agent`              | `ctrl+s`     | Cycle to the next agent                |
| `model_picker`             | `ctrl+m`     | Open the model picker                  |
| `clear_queue`              | `ctrl+x`     | Clear queued messages                  |
| `suspend`                  | `ctrl+z`     | Suspend the TUI                        |
| `toggle_sidebar`           | `ctrl+b`     | Toggle the sidebar                     |
| `edit_external`            | `ctrl+g`     | Edit input in an external editor       |
| `history_search`           | `ctrl+r`     | Incremental history search             |
@y
| Action                     | Default      | Description                            |
| -------------------------- | ------------ | -------------------------------------- |
| `editor_send`              | `enter`      | Send the current message               |
| `editor_newline`           | `ctrl+j`     | Insert a newline in the input          |
| `quit`                     | `ctrl+c`     | Quit (opens the exit confirmation)     |
| `switch_focus`             | `tab`        | Switch focus between panels            |
| `commands`                 | `ctrl+k`     | Open the command palette               |
| `help`                     | `ctrl+h`     | Show the help dialog                   |
| `toggle_yolo`              | `ctrl+y`     | Toggle YOLO mode                       |
| `toggle_hide_tool_results` | `ctrl+o`     | Toggle hiding tool results             |
| `cycle_agent`              | `ctrl+s`     | Cycle to the next agent                |
| `model_picker`             | `ctrl+m`     | Open the model picker                  |
| `clear_queue`              | `ctrl+x`     | Clear queued messages                  |
| `suspend`                  | `ctrl+z`     | Suspend the TUI                        |
| `toggle_sidebar`           | `ctrl+b`     | Toggle the sidebar                     |
| `edit_external`            | `ctrl+g`     | Edit input in an external editor       |
| `history_search`           | `ctrl+r`     | Incremental history search             |
@z

@x
`Shift+Enter` for newline is detected from your terminal's capabilities and is always available where supported, independent of `editor_newline`.
@y
`Shift+Enter` for newline is detected from your terminal's capabilities and is always available where supported, independent of `editor_newline`.
@z

@x
Invalid entries are ignored with a warning (visible with `--debug`) so a bad config never breaks the TUI: unknown actions, empty or malformed keys, and keys that would collide with another action are dropped while every other binding keeps working.
@y
Invalid entries are ignored with a warning (visible with `--debug`) so a bad config never breaks the TUI: unknown actions, empty or malformed keys, and keys that would collide with another action are dropped while every other binding keeps working.
@z

@x
## History Search
@y
## History Search
@z

@x
Press <kbd>Ctrl</kbd>+<kbd>R</kbd> to enter incremental history search mode. Start typing to filter through your previous inputs. Press <kbd>Enter</kbd> to select a match, or <kbd>Escape</kbd> to cancel.
@y
Press <kbd>Ctrl</kbd>+<kbd>R</kbd> to enter incremental history search mode. Start typing to filter through your previous inputs. Press <kbd>Enter</kbd> to select a match, or <kbd>Escape</kbd> to cancel.
@z

@x
## Settings
@y
## Settings
@z

@x
Run `/settings` to open the settings dialog. Use <kbd>Tab</kbd> to switch between **Appearance**, **Behavior**, and **Notifications**.
@y
Run `/settings` to open the settings dialog. Use <kbd>Tab</kbd> to switch between **Appearance**, **Behavior**, and **Notifications**.
@z

@x
> [!TIP]
> **Full settings reference**
>
> This section covers the `/settings` dialog. For the complete list of `settings:` fields (including ones with no dialog UI, like `permissions`, `hooks`, and `keybindings`) and how they interact with CLI flags and aliases, see [User Settings](../../configuration/user-settings/index.md).
@y
> [!TIP]
> **Full settings reference**
>
> This section covers the `/settings` dialog. For the complete list of `settings:` fields (including ones with no dialog UI, like `permissions`, `hooks`, and `keybindings`) and how they interact with CLI flags and aliases, see [User Settings](../../configuration/user-settings/index.md).
@z

@x
The **Appearance** tab selects the theme and customizes the layout. Layout changes show a live schematic preview and apply immediately to the UI behind the dialog:
@y
The **Appearance** tab selects the theme and customizes the layout. Layout changes show a live schematic preview and apply immediately to the UI behind the dialog:
@z

@x
- **Sidebar position**: `Right` (default), `Left`, `Top`, or `Bottom`. Left/right keep the full vertical sidebar next to the chat; top/bottom render it as a compact horizontal band above or below the chat (session title, working directory, token usage, plus a one-line summary of the current agent and its model; in multi-agent configurations all team agents are listed by name after the current agent).
- **Sidebar info mode**: `Compact` (default) or `Detailed`. Controls how the Agents panel renders agent rows — see [Agents Panel](#agents-panel) for details. Persisted as `settings.layout.sidebar_info_mode: detailed`; compact is the default and omitted from the config.
- **Section spacing**: `Compact`, `Normal` (default), or `Relaxed`, the number of blank lines between the sidebar sections (1, 2, or 3).
- **Sidebar sections**: toggle the visibility of the **Session path** (the working directory line, including its git branch) and the **Token usage**, **Agents**, **Tools**, and **Todos** sections. The session title is always shown.
@y
- **Sidebar position**: `Right` (default), `Left`, `Top`, or `Bottom`. Left/right keep the full vertical sidebar next to the chat; top/bottom render it as a compact horizontal band above or below the chat (session title, working directory, token usage, plus a one-line summary of the current agent and its model; in multi-agent configurations all team agents are listed by name after the current agent).
- **Sidebar info mode**: `Compact` (default) or `Detailed`. Controls how the Agents panel renders agent rows — see [Agents Panel](#agents-panel) for details. Persisted as `settings.layout.sidebar_info_mode: detailed`; compact is the default and omitted from the config.
- **Section spacing**: `Compact`, `Normal` (default), or `Relaxed`, the number of blank lines between the sidebar sections (1, 2, or 3).
- **Sidebar sections**: toggle the visibility of the **Session path** (the working directory line, including its git branch) and the **Token usage**, **Agents**, **Tools**, and **Todos** sections. The session title is always shown.
@z

@x
Appearance also controls split-diff rendering, expanded thinking, and whether tool results are hidden by default. Select **Theme** to open the theme picker.
@y
Appearance also controls split-diff rendering, expanded thinking, and whether tool results are hidden by default. Select **Theme** to open the theme picker.
@z

@x
The **Behavior** tab controls busy-message handling, the auto-approve default, tab restoration, automatic snapshots, lean UI, and the maximum tab-title length. Restore-tabs and lean-UI changes take effect on the next launch. Enabling auto-approve requires confirmation.
@y
The **Behavior** tab controls busy-message handling, the auto-approve default, tab restoration, automatic snapshots, lean UI, and the maximum tab-title length. Restore-tabs and lean-UI changes take effect on the next launch. Enabling auto-approve requires confirmation.
@z

@x
The **Notifications** tab enables completion sounds and sets the minimum task duration before a sound plays.
@y
The **Notifications** tab enables completion sounds and sets the minimum task duration before a sound plays.
@z

@x
Press <kbd>Enter</kbd> to apply and persist, or <kbd>Escape</kbd> to cancel and restore the previous layout. The settings are saved globally in `~/.config/cagent/config.yaml`:
@y
Press <kbd>Enter</kbd> to apply and persist, or <kbd>Escape</kbd> to cancel and restore the previous layout. The settings are saved globally in `~/.config/cagent/config.yaml`:
@z

@x
```yaml
# ~/.config/cagent/config.yaml
settings:
  busy_send_mode: queue # steer (default), queue
  layout:
    sidebar_position: left # right (default), left, top, bottom
    sidebar_info_mode: detailed # compact (default, omitted), detailed
    section_spacing: compact # normal (default), compact, relaxed
    hide_session_path: false
    hide_usage: true
    hide_agents: false
    active_agents_only: false # true to filter to session-active agents
    hide_tools: false
    hide_todos: false
```
@y
```yaml
# ~/.config/cagent/config.yaml
settings:
  busy_send_mode: queue # steer (default), queue
  layout:
    sidebar_position: left # right (default), left, top, bottom
    sidebar_info_mode: detailed # compact (default, omitted), detailed
    section_spacing: compact # normal (default), compact, relaxed
    hide_session_path: false
    hide_usage: true
    hide_agents: false
    active_agents_only: false # true to filter to session-active agents
    hide_tools: false
    hide_todos: false
```
@z

@x
## Theming
@y
## Theming
@z

@x
Customize the TUI appearance with built-in or custom themes:
@y
Customize the TUI appearance with built-in or custom themes:
@z

@x
```bash
# Open Settings and select Theme under Appearance
/settings
```
@y
```bash
# Open Settings and select Theme under Appearance
/settings
```
@z

@x
### Built-in Themes
@y
### Built-in Themes
@z

@x
`default`, `default-light`, `catppuccin-latte`, `catppuccin-mocha`, `dracula`, `gruvbox-dark`, `gruvbox-light`, `nord`, `one-dark`, `solarized-dark`, `tokyo-night`
@y
`default`, `default-light`, `catppuccin-latte`, `catppuccin-mocha`, `dracula`, `gruvbox-dark`, `gruvbox-light`, `nord`, `one-dark`, `solarized-dark`, `tokyo-night`
@z

@x
### Auto Theme (match the terminal)
@y
### Auto Theme (match the terminal)
@z

@x
The special theme `auto` follows the terminal's light/dark background instead of naming a fixed theme. Select **Auto (match terminal)** from **Settings → Appearance → Theme**, pass `--theme auto`, or set it in your user config:
@y
The special theme `auto` follows the terminal's light/dark background instead of naming a fixed theme. Select **Auto (match terminal)** from **Settings → Appearance → Theme**, pass `--theme auto`, or set it in your user config:
@z

@x
```yaml
settings:
  theme: auto
  theme_dark: default # optional, theme used on dark backgrounds (default: default)
  theme_light: default-light # optional, theme used on light backgrounds (default: default-light)
```
@y
```yaml
settings:
  theme: auto
  theme_dark: default # optional, theme used on dark backgrounds (default: default)
  theme_light: default-light # optional, theme used on light backgrounds (default: default-light)
```
@z

@x
At startup the terminal background is queried (OSC 11) to pick the dark or light theme of the pair; non-interactive runs (pipes, CI) fall back to the dark theme. In terminals that report appearance changes (DEC mode 2031 — Ghostty, kitty, contour, …), flipping the OS or terminal appearance while Docker Agent is running switches the theme live. Terminals without that mode re-sync when the window regains focus.
@y
At startup the terminal background is queried (OSC 11) to pick the dark or light theme of the pair; non-interactive runs (pipes, CI) fall back to the dark theme. In terminals that report appearance changes (DEC mode 2031 — Ghostty, kitty, contour, …), flipping the OS or terminal appearance while Docker Agent is running switches the theme live. Terminals without that mode re-sync when the window regains focus.
@z

@x
### Custom Themes
@y
### Custom Themes
@z

@x
Create theme files in `~/.cagent/themes/` as YAML. Theme files are **partial overrides** — you only need to specify the colors you want to change. Any omitted keys fall back to the built-in default theme values.
@y
Create theme files in `~/.cagent/themes/` as YAML. Theme files are **partial overrides** — you only need to specify the colors you want to change. Any omitted keys fall back to the built-in default theme values.
@z

@x
```yaml
# ~/.cagent/themes/my-theme.yaml
name: "My Custom Theme"
@y
```yaml
# ~/.cagent/themes/my-theme.yaml
name: "My Custom Theme"
@z

@x
colors:
  # Backgrounds
  background: "#1a1a2e"
  background_alt: "#16213e"
@y
colors:
  # Backgrounds
  background: "#1a1a2e"
  background_alt: "#16213e"
@z

@x
  # Text colors
  text_bright: "#ffffff"
  text_primary: "#e8e8e8"
  text_secondary: "#b0b0b0"
  text_muted: "#707070"
@y
  # Text colors
  text_bright: "#ffffff"
  text_primary: "#e8e8e8"
  text_secondary: "#b0b0b0"
  text_muted: "#707070"
@z

@x
  # Accent colors
  accent: "#4fc3f7"
  brand: "#1d96f3"
@y
  # Accent colors
  accent: "#4fc3f7"
  brand: "#1d96f3"
@z

@x
  # Status colors
  success: "#4caf50"
  error: "#f44336"
  warning: "#ff9800"
  info: "#00bcd4"
@y
  # Status colors
  success: "#4caf50"
  error: "#f44336"
  warning: "#ff9800"
  info: "#00bcd4"
@z

@x
# Optional: Customize syntax highlighting colors
chroma:
  comment: "#6a9955"
  keyword: "#569cd6"
  literal_string: "#ce9178"
@y
# Optional: Customize syntax highlighting colors
chroma:
  comment: "#6a9955"
  keyword: "#569cd6"
  literal_string: "#ce9178"
@z

@x
# Optional: Customize markdown rendering colors
markdown:
  heading: "#4fc3f7"
  link: "#569cd6"
  code: "#ce9178"
```
@y
# Optional: Customize markdown rendering colors
markdown:
  heading: "#4fc3f7"
  link: "#569cd6"
  code: "#ce9178"
```
@z

@x
### Applying Themes
@y
### Applying Themes
@z

@x
**In user config** (`~/.config/cagent/config.yaml`, see [User Settings](../../configuration/user-settings/index.md) for the full reference):
@y
**In user config** (`~/.config/cagent/config.yaml`, see [User Settings](../../configuration/user-settings/index.md) for the full reference):
@z

@x
```yaml
settings:
  theme: my-theme # References ~/.cagent/themes/my-theme.yaml
```
@y
```yaml
settings:
  theme: my-theme # References ~/.cagent/themes/my-theme.yaml
```
@z

@x
**At launch:** Pass `--theme <name>` to `docker agent run` to preselect a theme for that session. This overrides `settings.theme` in your config but is not saved. Invalid theme names print an error at startup listing the available options. Has no effect in `--exec` mode. `--theme auto` enables the [auto theme](#auto-theme-match-the-terminal) for the session.
@y
**At launch:** Pass `--theme <name>` to `docker agent run` to preselect a theme for that session. This overrides `settings.theme` in your config but is not saved. Invalid theme names print an error at startup listing the available options. Has no effect in `--exec` mode. `--theme auto` enables the [auto theme](#auto-theme-match-the-terminal) for the session.
@z

@x
**At runtime:** Open `/settings`, select **Theme** on the Appearance tab, and choose from the available themes. Your selection is saved globally in `~/.config/cagent/config.yaml` under `settings.theme` and persists across sessions.
@y
**At runtime:** Open `/settings`, select **Theme** on the Appearance tab, and choose from the available themes. Your selection is saved globally in `~/.config/cagent/config.yaml` under `settings.theme` and persists across sessions.
@z

@x
> [!TIP]
> **Hot Reload**
>
> Custom themes auto-reload when you save changes to the file — no restart needed. This makes it easy to tweak colors in real-time.
@y
> [!TIP]
> **Hot Reload**
>
> Custom themes auto-reload when you save changes to the file — no restart needed. This makes it easy to tweak colors in real-time.
@z

@x
> [!WARNING]
> **Partial overrides**
>
> All user themes are applied on top of the `default` theme. If you want to customize a built-in theme (e.g., `dracula`), copy its full YAML from the [built-in themes on GitHub](https://github.com/docker/docker-agent/tree/main/pkg/tui/styles/themes) into `~/.cagent/themes/` and edit the copy. Otherwise, omitted values will use `default` colors, not the original theme's colors.
@y
> [!WARNING]
> **Partial overrides**
>
> All user themes are applied on top of the `default` theme. If you want to customize a built-in theme (e.g., `dracula`), copy its full YAML from the [built-in themes on GitHub](https://github.com/docker/docker-agent/tree/main/pkg/tui/styles/themes) into `~/.cagent/themes/` and edit the copy. Otherwise, omitted values will use `default` colors, not the original theme's colors.
@z

@x
## Tool Permissions
@y
## Tool Permissions
@z

@x
When an agent calls a tool, Docker Agent shows a confirmation dialog by default. You can:
@y
When an agent calls a tool, Docker Agent shows a confirmation dialog by default. You can:
@z

@x
- **Approve once** — Allow this specific call
- **Always allow** — Permanently approve this tool/command for the session
- **Deny** — Reject the tool call
@y
- **Approve once** — Allow this specific call
- **Always allow** — Permanently approve this tool/command for the session
- **Deny** — Reject the tool call
@z

@x
**Granular permissions:** The permission system supports pattern-based matching. When you “Always allow” a specific tool command, only that exact pattern is auto-approved — other commands from the same tool still require confirmation. This lets you auto-approve safe, read-only operations while maintaining control over destructive ones.
@y
**Granular permissions:** The permission system supports pattern-based matching. When you “Always allow” a specific tool command, only that exact pattern is auto-approved — other commands from the same tool still require confirmation. This lets you auto-approve safe, read-only operations while maintaining control over destructive ones.
@z

@x
> [!TIP]
> **YOLO mode**
>
> Use `--yolo` or the `/yolo` command to auto-approve all tool calls. You can also toggle this mid-session. For aliases, set `--yolo` when creating the alias: `docker agent alias add fast myorg/coder --yolo`.
@y
> [!TIP]
> **YOLO mode**
>
> Use `--yolo` or the `/yolo` command to auto-approve all tool calls. You can also toggle this mid-session. For aliases, set `--yolo` when creating the alias: `docker agent alias add fast myorg/coder --yolo`.
@z

@x
## Notifications
@y
## Notifications
@z

@x
The TUI displays transient notification banners for agent warnings, errors, and other runtime events. Notifications auto-dismiss after a short delay unless the mouse is hovering over them — hovering pauses the timer so you have time to read the message.
@y
The TUI displays transient notification banners for agent warnings, errors, and other runtime events. Notifications auto-dismiss after a short delay unless the mouse is hovering over them — hovering pauses the timer so you have time to read the message.
@z

@x
| Interaction | Behaviour |
| ----------- | --------- |
| Hover       | Pauses auto-dismiss; the notification stays visible until the mouse moves away |
| Click       | Copies the notification text to the clipboard |
| × (close)   | Dismisses immediately; the glyph turns red when hovered |
@y
| Interaction | Behaviour |
| ----------- | --------- |
| Hover       | Pauses auto-dismiss; the notification stays visible until the mouse moves away |
| Click       | Copies the notification text to the clipboard |
| × (close)   | Dismisses immediately; the glyph turns red when hovered |
@z

@x
Hint text in the top-left corner of the notification border shows the available actions at a glance.
@y
Hint text in the top-left corner of the notification border shows the available actions at a glance.
@z
