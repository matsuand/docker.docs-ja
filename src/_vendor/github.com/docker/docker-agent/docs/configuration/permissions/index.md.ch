%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

% __SUBDIR__ 対応

@x
title: "Permissions"
description: "Control which tools can execute automatically, require confirmation, or are blocked entirely."
keywords: docker agent, ai agents, configuration, yaml, permissions
@y
title: "Permissions"
description: "Control which tools can execute automatically, require confirmation, or are blocked entirely."
keywords: docker agent, ai agents, configuration, yaml, permissions
@z

@x
canonical: https://docs.docker.com/ai/docker-agent/configuration/permissions/
@y
canonical: __SUBDIR__/ai/docker-agent/configuration/permissions/
@z

@x
_Control which tools can execute automatically, require confirmation, or are blocked entirely._
@y
_Control which tools can execute automatically, require confirmation, or are blocked entirely._
@z

@x
## Overview
@y
## Overview
@z

@x
Permissions provide fine-grained control over tool execution. You can configure which tools are auto-approved (run without asking), which require user confirmation, and which are completely blocked.
@y
Permissions provide fine-grained control over tool execution. You can configure which tools are auto-approved (run without asking), which require user confirmation, and which are completely blocked.
@z

@x
> [!NOTE]
> **Evaluation Order**
>
> Permissions are evaluated in this order: **Deny → Allow → Ask**. Deny patterns take priority, then allow patterns, and anything else falls through to the session's [safety mode](#safety-modes).
@y
> [!NOTE]
> **Evaluation Order**
>
> Permissions are evaluated in this order: **Deny → Allow → Ask**. Deny patterns take priority, then allow patterns, and anything else falls through to the session's [safety mode](#safety-modes).
@z

@x
## Safety Modes
@y
## Safety Modes
@z

@x
Every session runs in a **safety mode** that decides what happens when no permission rule matched a tool call. The runtime labels each call `safe` (safe-listed shell command such as `ls` or `git status`, or a read-only-annotated tool), `destructive` (destructive shell command such as `rm -rf`, or a destructive-annotated tool), or `unknown` — and the mode gates on that label:
@y
Every session runs in a **safety mode** that decides what happens when no permission rule matched a tool call. The runtime labels each call `safe` (safe-listed shell command such as `ls` or `git status`, or a read-only-annotated tool), `destructive` (destructive shell command such as `rm -rf`, or a destructive-annotated tool), or `unknown` — and the mode gates on that label:
@z

@x
| Mode | safe | destructive | unknown |
| ---- | ---- | ----------- | ------- |
| `strict` | ask | ask | ask |
| `balanced` | **allow** | ask | ask |
| `restricted` | **allow** | deny | deny |
| `autonomous` | **allow** | **allow** | **allow** |
@y
| Mode | safe | destructive | unknown |
| ---- | ---- | ----------- | ------- |
| `strict` | ask | ask | ask |
| `balanced` | **allow** | ask | ask |
| `restricted` | **allow** | deny | deny |
| `autonomous` | **allow** | **allow** | **allow** |
@z

@x
- **`strict`** prompts for every tool call, read-only ones included. Only an `allow:` rule silences a prompt.
- **`balanced`** runs safe calls silently and asks about everything else.
- **`restricted`** is the fail-closed profile for unattended/headless runs: safe calls run silently and everything else is **denied without asking** — the mode's fallback never prompts. Custom rules still win: an `allow:` rule can approve a destructive/unknown call, a `deny:` rule always blocks, and session-scoped `ask:` rules still prompt (as can a `preempt_yolo` hook). Restricted is defense in depth against unwanted tool calls, not a security boundary — for real isolation use [sandbox mode](../sandbox/index.md).
- **`autonomous`** is the legacy `--yolo` behavior: everything runs. Only `deny:` rules, session-scoped `ask:` rules, and `preempt_yolo` hooks still gate.
@y
- **`strict`** prompts for every tool call, read-only ones included. Only an `allow:` rule silences a prompt.
- **`balanced`** runs safe calls silently and asks about everything else.
- **`restricted`** is the fail-closed profile for unattended/headless runs: safe calls run silently and everything else is **denied without asking** — the mode's fallback never prompts. Custom rules still win: an `allow:` rule can approve a destructive/unknown call, a `deny:` rule always blocks, and session-scoped `ask:` rules still prompt (as can a `preempt_yolo` hook). Restricted is defense in depth against unwanted tool calls, not a security boundary — for real isolation use [sandbox mode](../sandbox/index.md).
- **`autonomous`** is the legacy `--yolo` behavior: everything runs. Only `deny:` rules, session-scoped `ask:` rules, and `preempt_yolo` hooks still gate.
@z

@x
Pick a mode with the `--safety` flag (`docker-agent run --safety balanced ...`), the `safety_policy` field on session create (`POST /api/sessions`) or mid-session (`PATCH /api/sessions/:id/safety-policy`), or escalate directly from a confirmation prompt (`B` switches to balanced, `A` to autonomous; the `restricted` fallback never prompts, so the mode is only selected via flag/config/API). Sessions that never choose a mode keep the historical default: read-only tools auto-approve, everything else asks.
@y
Pick a mode with the `--safety` flag (`docker-agent run --safety balanced ...`), the `safety_policy` field on session create (`POST /api/sessions`) or mid-session (`PATCH /api/sessions/:id/safety-policy`), or escalate directly from a confirmation prompt (`B` switches to balanced, `A` to autonomous; the `restricted` fallback never prompts, so the mode is only selected via flag/config/API). Sessions that never choose a mode keep the historical default: read-only tools auto-approve, everything else asks.
@z

@x
### Declarative Safety Defaults
@y
### Declarative Safety Defaults
@z

@x
Safety modes can also be declared as **defaults** in YAML, at four scopes:
@y
Safety modes can also be declared as **defaults** in YAML, at four scopes:
@z

@x
| Scope | Location | Owner |
| ----- | -------- | ----- |
| Alias | `aliases.<name>.safety` in `~/.config/cagent/config.yaml` (or `docker agent alias add ... --safety <mode>`) | User |
| Global settings | `settings.safety` in `~/.config/cagent/config.yaml` | User |
| Per-agent | `agents.<name>.safety` in the agent YAML | Agent author |
| Config-wide | `runtime.safety` in the agent YAML | Agent author |
@y
| Scope | Location | Owner |
| ----- | -------- | ----- |
| Alias | `aliases.<name>.safety` in `~/.config/cagent/config.yaml` (or `docker agent alias add ... --safety <mode>`) | User |
| Global settings | `settings.safety` in `~/.config/cagent/config.yaml` | User |
| Per-agent | `agents.<name>.safety` in the agent YAML | Agent author |
| Config-wide | `runtime.safety` in the agent YAML | Agent author |
@z

@x
```yaml
# Agent YAML (author-declared defaults)
runtime:
  safety: balanced # config-wide default for new sessions
@y
```yaml
# Agent YAML (author-declared defaults)
runtime:
  safety: balanced # config-wide default for new sessions
@z

@x
agents:
  root:
    safety: strict # overrides runtime.safety for this agent
```
@y
agents:
  root:
    safety: strict # overrides runtime.safety for this agent
```
@z

@x
All four fields accept only the four canonical modes — `strict`, `balanced`, `restricted`, `autonomous` (yes, an author may declare `autonomous`) — and any other value fails loading with an error naming the field. The legacy spellings remain as aliases for `autonomous`: `settings.YOLO`, the alias `yolo` option, and the `--yolo` flag. When both are set at the same scope, `safety` wins over the legacy `YOLO`/`yolo`.
@y
All four fields accept only the four canonical modes — `strict`, `balanced`, `restricted`, `autonomous` (yes, an author may declare `autonomous`) — and any other value fails loading with an error naming the field. The legacy spellings remain as aliases for `autonomous`: `settings.YOLO`, the alias `yolo` option, and the `--yolo` flag. When both are set at the same scope, `safety` wins over the legacy `YOLO`/`yolo`.
@z

@x
For a **new** root session the first source in this order wins:
@y
For a **new** root session the first source in this order wins:
@z

@x
1. explicit `--safety` flag
2. explicit `--yolo` flag
3. alias `safety`/`yolo` option
4. `settings.safety`/`settings.YOLO` (user config)
5. selected agent's `agents.<name>.safety`
6. `runtime.safety`
7. the historical default (read-only tools auto-approve, everything else asks)
@y
1. explicit `--safety` flag
2. explicit `--yolo` flag
3. alias `safety`/`yolo` option
4. `settings.safety`/`settings.YOLO` (user config)
5. selected agent's `agents.<name>.safety`
6. `runtime.safety`
7. the historical default (read-only tools auto-approve, everything else asks)
@z

@x
**Resuming a session never re-applies defaults**: the stored mode is kept unless you pass an explicit `--safety` or `--yolo` flag for that run. Agent switches, handoffs, and delegated sub-agent sessions inherit the active session's mode rather than resetting it.
@y
**Resuming a session never re-applies defaults**: the stored mode is kept unless you pass an explicit `--safety` or `--yolo` flag for that run. Agent switches, handoffs, and delegated sub-agent sessions inherit the active session's mode rather than resetting it.
@z

@x
Sessions created through the API (`POST /api/sessions`) without a `safety_policy` receive the author-declared defaults (5–6) when their first run starts — the earliest point the agent configuration is loaded. If the server restarts before that first run, the session keeps the historical unset default (7).
@y
Sessions created through the API (`POST /api/sessions`) without a `safety_policy` receive the author-declared defaults (5–6) when their first run starts — the earliest point the agent configuration is loaded. If the server restarts before that first run, the session keeps the historical unset default (7).
@z

@x
> [!WARNING]
> **Trust: author defaults never outrank you.** `runtime.safety` and `agents.<name>.safety` are written by the agent's author — which may be a config you pulled from a URL or an OCI registry. They only fill the gap when you expressed no preference: any user-owned source (CLI flag, alias option, user settings) always takes precedence, and a resumed session keeps its stored mode. Still, an author default of `autonomous` means a fresh session runs every tool call unprompted — review third-party configs before running them, or pin your own floor with `settings.safety` / `--safety`.
@y
> [!WARNING]
> **Trust: author defaults never outrank you.** `runtime.safety` and `agents.<name>.safety` are written by the agent's author — which may be a config you pulled from a URL or an OCI registry. They only fill the gap when you expressed no preference: any user-owned source (CLI flag, alias option, user settings) always takes precedence, and a resumed session keeps its stored mode. Still, an author default of `autonomous` means a fresh session runs every tool call unprompted — review third-party configs before running them, or pin your own floor with `settings.safety` / `--safety`.
@z

@x
**Custom rules always win over the mode**, with one asymmetry: `ask:` rules written in an agent's YAML (or global config) are agent-author advisories and yield to a user-chosen `balanced`/`restricted`/`autonomous` mode (under `restricted` they resolve to the mode's allow-or-deny verdict rather than introducing a prompt), while `ask:` rules granted at the session level (interactive "always ask" decisions, the session permissions API) always prompt.
@y
**Custom rules always win over the mode**, with one asymmetry: `ask:` rules written in an agent's YAML (or global config) are agent-author advisories and yield to a user-chosen `balanced`/`restricted`/`autonomous` mode (under `restricted` they resolve to the mode's allow-or-deny verdict rather than introducing a prompt), while `ask:` rules granted at the session level (interactive "always ask" decisions, the session permissions API) always prompt.
@z

@x
## Permission Levels
@y
## Permission Levels
@z

@x
Permissions can be defined at two levels:
@y
Permissions can be defined at two levels:
@z

@x
| Level | Location | Scope |
| ----- | -------- | ----- |
| **Agent-level** | Agent YAML config (`permissions:` section) | Applies to that specific agent config |
| **Global (user-level)** | `~/.config/cagent/config.yaml` under `settings.permissions` | Applies to every agent you run |
@y
| Level | Location | Scope |
| ----- | -------- | ----- |
| **Agent-level** | Agent YAML config (`permissions:` section) | Applies to that specific agent config |
| **Global (user-level)** | `~/.config/cagent/config.yaml` under `settings.permissions` | Applies to every agent you run |
@z

@x
Hooks follow the same user-config pattern: agent-level hooks live under `agents.<name>.hooks`, and global hooks live under `settings.hooks`. See [Hooks](../hooks/index.md#global-user-level-hooks).
@y
Hooks follow the same user-config pattern: agent-level hooks live under `agents.<name>.hooks`, and global hooks live under `settings.hooks`. See [Hooks](../hooks/index.md#global-user-level-hooks).
@z

@x
Both levels use the same `allow`/`ask`/`deny` pattern syntax. When both are present, they are **merged** at startup -- patterns from both sources are combined into a single checker. See [Merging Behavior](#merging-behavior) for details.
@y
Both levels use the same `allow`/`ask`/`deny` pattern syntax. When both are present, they are **merged** at startup -- patterns from both sources are combined into a single checker. See [Merging Behavior](#merging-behavior) for details.
@z

@x
## Agent-Level Configuration
@y
## Agent-Level Configuration
@z

@x
```yaml
agents:
  root:
    model: openai/gpt-4o
    description: Agent with permission controls
    instruction: You are a helpful assistant.
@y
```yaml
agents:
  root:
    model: openai/gpt-4o
    description: Agent with permission controls
    instruction: You are a helpful assistant.
@z

@x
permissions:
  # Auto-approve these tools (no confirmation needed)
  allow:
    - "read_file"
    - "read_*" # Glob patterns
    - "shell:cmd=ls*" # With argument matching
@y
permissions:
  # Auto-approve these tools (no confirmation needed)
  allow:
    - "read_file"
    - "read_*" # Glob patterns
    - "shell:cmd=ls*" # With argument matching
@z

@x
  # Always ask before running these tools, even if an allow pattern would match
  ask:
    - "shell:cmd=git push*"
    - "write_file:path=/home/user/important/*"
@y
  # Always ask before running these tools, even if an allow pattern would match
  ask:
    - "shell:cmd=git push*"
    - "write_file:path=/home/user/important/*"
@z

@x
  # Block these tools entirely
  deny:
    - "shell:cmd=sudo*"
    - "shell:cmd=rm*-rf*"
    - "dangerous_tool"
```
@y
  # Block these tools entirely
  deny:
    - "shell:cmd=sudo*"
    - "shell:cmd=rm*-rf*"
    - "dangerous_tool"
```
@z

@x
The three lists are evaluated in order `deny` → `allow` → `ask`, so an `ask:` entry lets you add a confirmation layer on top of an otherwise-allowed tool.
@y
The three lists are evaluated in order `deny` → `allow` → `ask`, so an `ask:` entry lets you add a confirmation layer on top of an otherwise-allowed tool.
@z

@x
## Global Permissions
@y
## Global Permissions
@z

@x
Global permissions let you enforce rules across **all** agents, regardless of which agent config you run. Define them in your user config file:
@y
Global permissions let you enforce rules across **all** agents, regardless of which agent config you run. Define them in your user config file:
@z

@x
```yaml
# ~/.config/cagent/config.yaml
settings:
  permissions:
    deny:
      - "shell:cmd=sudo*"
      - "shell:cmd=rm*-rf*"
    allow:
      - "read_*"
      - "shell:cmd=ls*"
      - "shell:cmd=cat*"
```
@y
```yaml
# ~/.config/cagent/config.yaml
settings:
  permissions:
    deny:
      - "shell:cmd=sudo*"
      - "shell:cmd=rm*-rf*"
    allow:
      - "read_*"
      - "shell:cmd=ls*"
      - "shell:cmd=cat*"
```
@z

@x
This is useful for setting personal safety guardrails that apply everywhere -- for example, always blocking `sudo` or always auto-approving read-only tools -- without relying on each agent config to include those rules.
@y
This is useful for setting personal safety guardrails that apply everywhere -- for example, always blocking `sudo` or always auto-approving read-only tools -- without relying on each agent config to include those rules.
@z

@x
### Merging Behavior
@y
### Merging Behavior
@z

@x
When both global and agent-level permissions are present, they are merged into a single set of patterns before evaluation. The merge works as follows:
@y
When both global and agent-level permissions are present, they are merged into a single set of patterns before evaluation. The merge works as follows:
@z

@x
- **Deny patterns from either source block the tool.** A global deny cannot be overridden by an agent-level allow, and vice versa.
- **Allow patterns from either source auto-approve the tool** (as long as no deny pattern matches).
- **Ask patterns from either source force confirmation** (as long as no deny or allow pattern matches).
@y
- **Deny patterns from either source block the tool.** A global deny cannot be overridden by an agent-level allow, and vice versa.
- **Allow patterns from either source auto-approve the tool** (as long as no deny pattern matches).
- **Ask patterns from either source force confirmation** (as long as no deny or allow pattern matches).
@z

@x
The evaluation order remains the same after merging: **Deny > Allow > Ask > default Ask**.
@y
The evaluation order remains the same after merging: **Deny > Allow > Ask > default Ask**.
@z

@x
> [!TIP]
> **Example: Global deny + agent allow**
>
> If your global config denies `shell:cmd=sudo*` and an agent config allows `shell:cmd=sudo apt update`, the deny wins. Deny patterns always take priority regardless of source.
@y
> [!TIP]
> **Example: Global deny + agent allow**
>
> If your global config denies `shell:cmd=sudo*` and an agent config allows `shell:cmd=sudo apt update`, the deny wins. Deny patterns always take priority regardless of source.
@z

@x
## Pattern Syntax
@y
## Pattern Syntax
@z

@x
Permissions support glob-style patterns with optional argument matching:
@y
Permissions support glob-style patterns with optional argument matching:
@z

@x
### Simple Patterns
@y
### Simple Patterns
@z

@x
| Pattern        | Matches                        |
| -------------- | ------------------------------ |
| `shell`        | Exact match for `shell` tool   |
| `read_*`       | Any tool starting with `read_` |
| `github_*`     | Any GitHub MCP tool            |
| `*`            | All tools                      |
@y
| Pattern        | Matches                        |
| -------------- | ------------------------------ |
| `shell`        | Exact match for `shell` tool   |
| `read_*`       | Any tool starting with `read_` |
| `github_*`     | Any GitHub MCP tool            |
| `*`            | All tools                      |
@z

@x
### Argument Matching
@y
### Argument Matching
@z

@x
You can match tools based on their argument values using `tool:arg=pattern` syntax:
@y
You can match tools based on their argument values using `tool:arg=pattern` syntax:
@z

@x
```yaml
permissions:
  allow:
    # Allow shell only when cmd starts with "ls" or "cat"
    - "shell:cmd=ls*"
    - "shell:cmd=cat*"
@y
```yaml
permissions:
  allow:
    # Allow shell only when cmd starts with "ls" or "cat"
    - "shell:cmd=ls*"
    - "shell:cmd=cat*"
@z

@x
    # Allow edit_file only in specific directory
    - "edit_file:path=/home/user/safe/*"
@y
    # Allow edit_file only in specific directory
    - "edit_file:path=/home/user/safe/*"
@z

@x
  deny:
    # Block shell with sudo
    - "shell:cmd=sudo*"
@y
  deny:
    # Block shell with sudo
    - "shell:cmd=sudo*"
@z

@x
    # Block writes to system directories
    - "write_file:path=/etc/*"
    - "write_file:path=/usr/*"
```
@y
    # Block writes to system directories
    - "write_file:path=/etc/*"
    - "write_file:path=/usr/*"
```
@z

@x
> [!NOTE]
> **Colons inside argument values are preserved.** Only the `:key=` token boundaries between
> argument conditions split a pattern — colons that appear inside a value are treated as
> ordinary characters and do not start a new condition. Check a tool’s actual argument names
> (and whether they accept a string or a list) before writing an argument-matching pattern.
@y
> [!NOTE]
> **Colons inside argument values are preserved.** Only the `:key=` token boundaries between
> argument conditions split a pattern — colons that appear inside a value are treated as
> ordinary characters and do not start a new condition. Check a tool’s actual argument names
> (and whether they accept a string or a list) before writing an argument-matching pattern.
@z

@x
### Multiple Argument Conditions
@y
### Multiple Argument Conditions
@z

@x
Chain multiple argument conditions with colons. All conditions must match:
@y
Chain multiple argument conditions with colons. All conditions must match:
@z

@x
```yaml
permissions:
  allow:
    # Allow shell with ls in current directory
    - "shell:cmd=ls*:cwd=."
@y
```yaml
permissions:
  allow:
    # Allow shell with ls in current directory
    - "shell:cmd=ls*:cwd=."
@z

@x
  deny:
    # Block shell with rm -rf anywhere
    - "shell:cmd=rm*:cmd=*-rf*"
```
@y
  deny:
    # Block shell with rm -rf anywhere
    - "shell:cmd=rm*:cmd=*-rf*"
```
@z

@x
## Glob Pattern Rules
@y
## Glob Pattern Rules
@z

@x
Patterns follow filepath.Match semantics with some extensions:
@y
Patterns follow filepath.Match semantics with some extensions:
@z

@x
- `*` — matches any sequence of characters (including spaces)
- `?` — matches any single character
- `[abc]` — matches any character in the set
- `[a-z]` — matches any character in the range
@y
- `*` — matches any sequence of characters (including spaces)
- `?` — matches any single character
- `[abc]` — matches any character in the set
- `[a-z]` — matches any character in the range
@z

@x
Matching is **case-insensitive**.
@y
Matching is **case-insensitive**.
@z

@x
> [!TIP]
> **Trailing Wildcards**
>
> Trailing wildcards like `sudo*` match any characters including spaces, so `sudo*` matches `sudo rm -rf /`.
@y
> [!TIP]
> **Trailing Wildcards**
>
> Trailing wildcards like `sudo*` match any characters including spaces, so `sudo*` matches `sudo rm -rf /`.
@z

@x
## Decision Types
@y
## Decision Types
@z

@x
| Decision  | Behavior                                            |
| --------- | --------------------------------------------------- |
| **Allow** | Tool executes immediately without user confirmation |
| **Ask**   | User must confirm before tool executes (default)    |
| **Deny**  | Tool is blocked and returns an error to the agent   |
@y
| Decision  | Behavior                                            |
| --------- | --------------------------------------------------- |
| **Allow** | Tool executes immediately without user confirmation |
| **Ask**   | User must confirm before tool executes (default)    |
| **Deny**  | Tool is blocked and returns an error to the agent   |
@z

@x
## Examples
@y
## Examples
@z

@x
### Read-Only Agent
@y
### Read-Only Agent
@z

@x
Allow all read operations, block all writes:
@y
Allow all read operations, block all writes:
@z

@x
```yaml
permissions:
  allow:
    - "read_file"
    - "read_multiple_files"
    - "list_directory"
    - "directory_tree"
    - "search_files_content"
  deny:
    - "write_file"
    - "edit_file"
    - "shell"
```
@y
```yaml
permissions:
  allow:
    - "read_file"
    - "read_multiple_files"
    - "list_directory"
    - "directory_tree"
    - "search_files_content"
  deny:
    - "write_file"
    - "edit_file"
    - "shell"
```
@z

@x
### Safe Shell Agent
@y
### Safe Shell Agent
@z

@x
Allow specific safe commands, block dangerous ones:
@y
Allow specific safe commands, block dangerous ones:
@z

@x
```yaml
permissions:
  allow:
    - "shell:cmd=ls*"
    - "shell:cmd=cat*"
    - "shell:cmd=grep*"
    - "shell:cmd=find*"
    - "shell:cmd=head*"
    - "shell:cmd=tail*"
    - "shell:cmd=wc*"
  deny:
    - "shell:cmd=sudo*"
    - "shell:cmd=rm*"
    - "shell:cmd=mv*"
    - "shell:cmd=chmod*"
    - "shell:cmd=chown*"
```
@y
```yaml
permissions:
  allow:
    - "shell:cmd=ls*"
    - "shell:cmd=cat*"
    - "shell:cmd=grep*"
    - "shell:cmd=find*"
    - "shell:cmd=head*"
    - "shell:cmd=tail*"
    - "shell:cmd=wc*"
  deny:
    - "shell:cmd=sudo*"
    - "shell:cmd=rm*"
    - "shell:cmd=mv*"
    - "shell:cmd=chmod*"
    - "shell:cmd=chown*"
```
@z

@x
### MCP Tool Permissions
@y
### MCP Tool Permissions
@z

@x
Control MCP tools by their qualified names:
@y
Control MCP tools by their qualified names:
@z

@x
```yaml
permissions:
  allow:
    # Allow all GitHub read operations
    - "github_get_*"
    - "github_list_*"
    - "github_search_*"
  deny:
    # Block destructive GitHub operations
    - "github_delete_*"
    - "github_close_*"
```
@y
```yaml
permissions:
  allow:
    # Allow all GitHub read operations
    - "github_get_*"
    - "github_list_*"
    - "github_search_*"
  deny:
    # Block destructive GitHub operations
    - "github_delete_*"
    - "github_close_*"
```
@z

@x
## Combining with Hooks
@y
## Combining with Hooks
@z

@x
Permissions work alongside [hooks](../hooks/index.md). The evaluation order is:
@y
Permissions work alongside [hooks](../hooks/index.md). The evaluation order is:
@z

@x
1. Run **`preempt_yolo` pre_tool_use hooks** — security-critical checks that no mode or allow rule can bypass
2. Check **deny** patterns — if matched, tool is blocked
3. Check **allow** patterns — if matched, tool is auto-approved
4. Check **ask** patterns — if matched, the user is prompted directly, skipping the default `pre_tool_use` lane
5. If no rule matched, apply the **[safety mode](#safety-modes)** to the call's safety label — may auto-approve (or, under `restricted`, deny)
6. On a mode "ask", run **pre_tool_use hooks** — hooks can allow, deny, or ask
7. If no decision, **ask user** for confirmation
@y
1. Run **`preempt_yolo` pre_tool_use hooks** — security-critical checks that no mode or allow rule can bypass
2. Check **deny** patterns — if matched, tool is blocked
3. Check **allow** patterns — if matched, tool is auto-approved
4. Check **ask** patterns — if matched, the user is prompted directly, skipping the default `pre_tool_use` lane
5. If no rule matched, apply the **[safety mode](#safety-modes)** to the call's safety label — may auto-approve (or, under `restricted`, deny)
6. On a mode "ask", run **pre_tool_use hooks** — hooks can allow, deny, or ask
7. If no decision, **ask user** for confirmation
@z

@x
Default-lane hooks only see calls the mode routed to "ask"; they cannot override deny decisions or explicit `ask:` rules.
@y
Default-lane hooks only see calls the mode routed to "ask"; they cannot override deny decisions or explicit `ask:` rules.
@z

@x
> [!WARNING]
> **Security Note**
>
> Permissions are enforced client-side. They help prevent accidental operations but should not be relied upon as a security boundary for untrusted agents. For stronger isolation, use [sandbox mode](../sandbox/index.md).
@y
> [!WARNING]
> **Security Note**
>
> Permissions are enforced client-side. They help prevent accidental operations but should not be relied upon as a security boundary for untrusted agents. For stronger isolation, use [sandbox mode](../sandbox/index.md).
@z
