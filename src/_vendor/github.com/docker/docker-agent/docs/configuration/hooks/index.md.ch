%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

% __SUBDIR__ 対応

@x
title: "Hooks"
description: "Run shell commands at various points during agent execution for deterministic control over behavior."
keywords: docker agent, ai agents, configuration, yaml, hooks
@y
title: "Hooks"
description: "Run shell commands at various points during agent execution for deterministic control over behavior."
keywords: docker agent, ai agents, configuration, yaml, hooks
@z

@x
canonical: https://docs.docker.com/ai/docker-agent/configuration/hooks/
@y
canonical: __SUBDIR__/ai/docker-agent/configuration/hooks/
@z

@x
_Run shell commands at various points during agent execution for deterministic control over behavior._
@y
_Run shell commands at various points during agent execution for deterministic control over behavior._
@z

@x
## Overview
@y
## Overview
@z

@x
Hooks allow you to execute shell commands or scripts at key points in an agent's lifecycle. They provide deterministic control that works alongside the LLM's behavior, enabling validation, logging, environment setup, and more.
@y
Hooks allow you to execute shell commands or scripts at key points in an agent's lifecycle. They provide deterministic control that works alongside the LLM's behavior, enabling validation, logging, environment setup, and more.
@z

@x
> [!NOTE]
> **Use Cases**
>
> - Validate or transform tool inputs before execution
> - Log all tool calls to an audit file
> - Block dangerous operations based on custom rules
> - Validate, redact, or enrich user prompts before they reach the model
> - Programmatically approve or deny tool calls without prompting the user
> - Steer or veto context-window compaction
> - Audit sub-agent handoffs in multi-agent setups
> - Set up the environment when a session starts
> - Clean up resources when a session ends
> - Log or validate model responses before returning to the user
> - Send external notifications on agent errors or warnings
@y
> [!NOTE]
> **Use Cases**
>
> - Validate or transform tool inputs before execution
> - Log all tool calls to an audit file
> - Block dangerous operations based on custom rules
> - Validate, redact, or enrich user prompts before they reach the model
> - Programmatically approve or deny tool calls without prompting the user
> - Steer or veto context-window compaction
> - Audit sub-agent handoffs in multi-agent setups
> - Set up the environment when a session starts
> - Clean up resources when a session ends
> - Log or validate model responses before returning to the user
> - Send external notifications on agent errors or warnings
@z

@x
## Hook Types
@y
## Hook Types
@z

@x
Docker Agent dispatches the following hook events:
@y
Docker Agent dispatches the following hook events:
@z

@x
| Event                       | When it fires                                                                     | Can block? |
| --------------------------- | --------------------------------------------------------------------------------- | ---------- |
| `pre_tool_use`              | Before a tool call executes                                                       | Yes        |
| `tool_response_transform`   | Between a tool's execution and the runtime's emission/record of the response      | No         |
| `post_tool_use`             | After a tool completes — fires for both success and failure                       | Yes        |
| `permission_request`        | Just before the runtime would prompt the user to approve a tool                   | Yes        |
| `session_start`             | When a session begins or resumes                                                  | No         |
| `user_prompt_submit`        | Once per user message, after submission and before the model runs                 | Yes        |
| `user_steering_messages_submit` | Each time queued steering messages are drained (mid-turn, after stop, or while idle) | Yes    |
| `user_followup_submit`      | Each time a queued follow-up message starts a fresh turn (end-of-turn)             | Yes        |
| `turn_start`                | At the start of every agent turn (each model call)                                | No         |
| `turn_end`                  | At the end of every agent turn — fires no matter why the turn ended               | No         |
| `before_llm_call`           | Just before every model call (after `turn_start`)                                 | Yes        |
| `after_llm_call`            | After every successful model call, before the response is recorded                | No         |
| `session_end`               | When a session terminates                                                         | No         |
| `pre_compact`               | Just before the runtime compacts the session transcript                           | Yes        |
| `before_compaction`         | Just before a compaction runs — can veto or supply a custom summary               | Yes        |
| `after_compaction`          | After a successful compaction (summary applied to the session)                    | No         |
| `subagent_stop`             | When a sub-agent (transferred task / background / skill sub-session) finishes     | No         |
| `on_user_input`             | When the agent is waiting for user input                                          | No         |
| `stop`                      | When the model finishes responding                                                | No         |
| `notification`              | When the agent emits a notification (error or warning)                            | No         |
| `on_error`                  | When the runtime hits an error during a turn (fires alongside `notification`)     | No         |
| `on_max_iterations`         | When the runtime reaches its configured `max_iterations` limit                    | No         |
| `on_agent_switch`           | When the runtime moves the active agent (transfer_task, handoff, return)          | No         |
| `on_session_resume`         | When the user explicitly approves continuation past `max_iterations`              | No         |
| `on_tool_approval_decision` | After the runtime's approval chain (permissions / yolo / readonly / ask) resolves | No         |
| `worktree_create`           | After `docker agent run --worktree` creates a git worktree, before the session     | Yes        |
@y
| Event                       | When it fires                                                                     | Can block? |
| --------------------------- | --------------------------------------------------------------------------------- | ---------- |
| `pre_tool_use`              | Before a tool call executes                                                       | Yes        |
| `tool_response_transform`   | Between a tool's execution and the runtime's emission/record of the response      | No         |
| `post_tool_use`             | After a tool completes — fires for both success and failure                       | Yes        |
| `permission_request`        | Just before the runtime would prompt the user to approve a tool                   | Yes        |
| `session_start`             | When a session begins or resumes                                                  | No         |
| `user_prompt_submit`        | Once per user message, after submission and before the model runs                 | Yes        |
| `user_steering_messages_submit` | Each time queued steering messages are drained (mid-turn, after stop, or while idle) | Yes    |
| `user_followup_submit`      | Each time a queued follow-up message starts a fresh turn (end-of-turn)             | Yes        |
| `turn_start`                | At the start of every agent turn (each model call)                                | No         |
| `turn_end`                  | At the end of every agent turn — fires no matter why the turn ended               | No         |
| `before_llm_call`           | Just before every model call (after `turn_start`)                                 | Yes        |
| `after_llm_call`            | After every successful model call, before the response is recorded                | No         |
| `session_end`               | When a session terminates                                                         | No         |
| `pre_compact`               | Just before the runtime compacts the session transcript                           | Yes        |
| `before_compaction`         | Just before a compaction runs — can veto or supply a custom summary               | Yes        |
| `after_compaction`          | After a successful compaction (summary applied to the session)                    | No         |
| `subagent_stop`             | When a sub-agent (transferred task / background / skill sub-session) finishes     | No         |
| `on_user_input`             | When the agent is waiting for user input                                          | No         |
| `stop`                      | When the model finishes responding                                                | No         |
| `notification`              | When the agent emits a notification (error or warning)                            | No         |
| `on_error`                  | When the runtime hits an error during a turn (fires alongside `notification`)     | No         |
| `on_max_iterations`         | When the runtime reaches its configured `max_iterations` limit                    | No         |
| `on_agent_switch`           | When the runtime moves the active agent (transfer_task, handoff, return)          | No         |
| `on_session_resume`         | When the user explicitly approves continuation past `max_iterations`              | No         |
| `on_tool_approval_decision` | After the runtime's approval chain (permissions / yolo / readonly / ask) resolves | No         |
| `worktree_create`           | After `docker agent run --worktree` creates a git worktree, before the session     | Yes        |
@z

@x
> [!NOTE]
> **Two compaction events**
>
> `pre_compact` and `before_compaction` both fire just before a compaction. `pre_compact` is the original event and is best-suited to _steering_ the LLM-generated summary by appending guidance via `additional_context`. `before_compaction` is the newer, structured event: it carries the input/output token counts, the model's context limit, and a `compaction_reason` so handlers can decide based on real session pressure, and it can _replace_ the LLM-generated summary verbatim via `hook_specific_output.summary`.
@y
> [!NOTE]
> **Two compaction events**
>
> `pre_compact` and `before_compaction` both fire just before a compaction. `pre_compact` is the original event and is best-suited to _steering_ the LLM-generated summary by appending guidance via `additional_context`. `before_compaction` is the newer, structured event: it carries the input/output token counts, the model's context limit, and a `compaction_reason` so handlers can decide based on real session pressure, and it can _replace_ the LLM-generated summary verbatim via `hook_specific_output.summary`.
@z

@x
## Configuration
@y
## Configuration
@z

@x
You can configure hooks directly in an agent YAML file under the agent's `hooks:` block:
@y
You can configure hooks directly in an agent YAML file under the agent's `hooks:` block:
@z

@x
```yaml
agents:
  root:
    model: openai/gpt-4o
    description: An agent with hooks
    instruction: You are a helpful assistant.
    hooks:
      # Run before specific tools
      pre_tool_use:
        - matcher: "shell|edit_file"
          hooks:
            - type: command
              command: "./scripts/validate-command.sh"
              timeout: 30
@y
```yaml
agents:
  root:
    model: openai/gpt-4o
    description: An agent with hooks
    instruction: You are a helpful assistant.
    hooks:
      # Run before specific tools
      pre_tool_use:
        - matcher: "shell|edit_file"
          hooks:
            - type: command
              command: "./scripts/validate-command.sh"
              timeout: 30
@z

@x
      # Run after all tool calls
      post_tool_use:
        - matcher: "*"
          hooks:
            - type: command
              command: "./scripts/log-tool-call.sh"
@y
      # Run after all tool calls
      post_tool_use:
        - matcher: "*"
          hooks:
            - type: command
              command: "./scripts/log-tool-call.sh"
@z

@x
      # Run when session starts
      session_start:
        - type: command
          command: "./scripts/setup-env.sh"
@y
      # Run when session starts
      session_start:
        - type: command
          command: "./scripts/setup-env.sh"
@z

@x
      # Run when session ends
      session_end:
        - type: command
          command: "./scripts/cleanup.sh"
@y
      # Run when session ends
      session_end:
        - type: command
          command: "./scripts/cleanup.sh"
@z

@x
      # Run when agent is waiting for user input
      on_user_input:
        - type: command
          command: "./scripts/notify.sh"
@y
      # Run when agent is waiting for user input
      on_user_input:
        - type: command
          command: "./scripts/notify.sh"
@z

@x
      # Run when the model finishes responding
      stop:
        - type: command
          command: "./scripts/log-response.sh"
@y
      # Run when the model finishes responding
      stop:
        - type: command
          command: "./scripts/log-response.sh"
@z

@x
      # Run on agent errors and warnings
      notification:
        - type: command
          command: "./scripts/alert.sh"
```
@y
      # Run on agent errors and warnings
      notification:
        - type: command
          command: "./scripts/alert.sh"
```
@z

@x
Each event takes a list of hooks. A single hook can also be written directly
as a mapping, without the list dash:
@y
Each event takes a list of hooks. A single hook can also be written directly
as a mapping, without the list dash:
@z

@x
```yaml
stop:
  type: command
  command: "./scripts/log-response.sh"
```
@y
```yaml
stop:
  type: command
  command: "./scripts/log-response.sh"
```
@z

@x
## Global (user-level) hooks
@y
## Global (user-level) hooks
@z

@x
Global hooks let you apply the same hook configuration to every agent you run. Define them in your user config file at `~/.config/cagent/config.yaml` under `settings.hooks`:
@y
Global hooks let you apply the same hook configuration to every agent you run. Define them in your user config file at `~/.config/cagent/config.yaml` under `settings.hooks`:
@z

@x
```yaml
# ~/.config/cagent/config.yaml
settings:
  hooks:
    session_start:
      - type: command
        command: "~/.config/cagent/hooks/session-start.sh"
    pre_compact:
      - type: command
        command: "~/.config/cagent/hooks/pre-compact.sh"
    pre_tool_use:
      - matcher: "shell"
        hooks:
          - type: command
            command: "~/.config/cagent/hooks/check-shell.sh"
```
@y
```yaml
# ~/.config/cagent/config.yaml
settings:
  hooks:
    session_start:
      - type: command
        command: "~/.config/cagent/hooks/session-start.sh"
    pre_compact:
      - type: command
        command: "~/.config/cagent/hooks/pre-compact.sh"
    pre_tool_use:
      - matcher: "shell"
        hooks:
          - type: command
            command: "~/.config/cagent/hooks/check-shell.sh"
```
@z

@x
Global hooks use the same schema as agent-level hooks and are additive. If an event is configured in multiple places, all matching hooks run in this order:
@y
Global hooks use the same schema as agent-level hooks and are additive. If an event is configured in multiple places, all matching hooks run in this order:
@z

@x
1. Agent-config hooks from the agent YAML
2. Global hooks from `settings.hooks`
3. Hook drop-ins from `<config-dir>/hooks.d/` (lexicographic file order)
4. CLI hooks from `--hook-*` flags
@y
1. Agent-config hooks from the agent YAML
2. Global hooks from `settings.hooks`
3. Hook drop-ins from `<config-dir>/hooks.d/` (lexicographic file order)
4. CLI hooks from `--hook-*` flags
@z

@x
Global hooks cannot be suppressed by an individual agent. Use them for user-wide audit logging, personal guardrails, notifications, and setup/cleanup behavior that should apply everywhere.
@y
Global hooks cannot be suppressed by an individual agent. Use them for user-wide audit logging, personal guardrails, notifications, and setup/cleanup behavior that should apply everywhere.
@z

@x
### Hook drop-in files (`hooks.d`)
@y
### Hook drop-in files (`hooks.d`)
@z

@x
External tools that integrate with Docker Agent (terminal emulators, IDEs, audit or observability sidecars) shouldn't have to rewrite your `config.yaml` to install a hook. Instead, Docker Agent also loads every `*.yaml` / `*.yml` file from the `hooks.d` directory next to your user config (default: `~/.config/cagent/hooks.d/`). Each file is a standalone hooks block with the same schema as the content of `settings.hooks`:
@y
External tools that integrate with Docker Agent (terminal emulators, IDEs, audit or observability sidecars) shouldn't have to rewrite your `config.yaml` to install a hook. Instead, Docker Agent also loads every `*.yaml` / `*.yml` file from the `hooks.d` directory next to your user config (default: `~/.config/cagent/hooks.d/`). Each file is a standalone hooks block with the same schema as the content of `settings.hooks`:
@z

@x
```yaml
# ~/.config/cagent/hooks.d/50-mytool.yaml
session_start:
  - type: command
    command: mytool notify --event session-start
stop:
  - type: command
    command: mytool notify --event stop
```
@y
```yaml
# ~/.config/cagent/hooks.d/50-mytool.yaml
session_start:
  - type: command
    command: mytool notify --event session-start
stop:
  - type: command
    command: mytool notify --event stop
```
@z

@x
- Files are loaded in lexicographic order and merged additively after `settings.hooks` (use numeric prefixes like `10-`, `50-` to control ordering).
- A malformed file is skipped with a logged warning; a broken drop-in never breaks a run.
- Installing an integration means writing one self-contained file; uninstalling means deleting it. No shared-file edits, no conflicts between tools.
@y
- Files are loaded in lexicographic order and merged additively after `settings.hooks` (use numeric prefixes like `10-`, `50-` to control ordering).
- A malformed file is skipped with a logged warning; a broken drop-in never breaks a run.
- Installing an integration means writing one self-contained file; uninstalling means deleting it. No shared-file edits, no conflicts between tools.
@z

@x
The config directory can be relocated with the `--config-dir` flag or the `DOCKER_AGENT_CONFIG_DIR` (legacy `CAGENT_CONFIG_DIR`) environment variable, which external tools can use to locate `hooks.d` under non-default config dirs.
@y
The config directory can be relocated with the `--config-dir` flag or the `DOCKER_AGENT_CONFIG_DIR` (legacy `CAGENT_CONFIG_DIR`) environment variable, which external tools can use to locate `hooks.d` under non-default config dirs.
@z

@x
## Built-in Hooks
@y
## Built-in Hooks
@z

@x
In addition to shell `command` hooks, Docker Agent ships a small library of **built-in hooks** — in-process Go functions that run without spawning a subprocess. They're invoked with `type: builtin`, where `command` is the builtin's registered name and `args` are passed through as the builtin's parameters.
@y
In addition to shell `command` hooks, Docker Agent ships a small library of **built-in hooks** — in-process Go functions that run without spawning a subprocess. They're invoked with `type: builtin`, where `command` is the builtin's registered name and `args` are passed through as the builtin's parameters.
@z

@x
```yaml
hooks:
  turn_start:
    - type: builtin
      command: add_date
    - type: builtin
      command: add_prompt_files
      args:
        - GUIDELINES.md
        - PROJECT.md
  session_start:
    - type: builtin
      command: add_environment_info
  before_llm_call:
    - type: builtin
      command: max_iterations
      args: ["50"]
```
@y
```yaml
hooks:
  turn_start:
    - type: builtin
      command: add_date
    - type: builtin
      command: add_prompt_files
      args:
        - GUIDELINES.md
        - PROJECT.md
  session_start:
    - type: builtin
      command: add_environment_info
  before_llm_call:
    - type: builtin
      command: max_iterations
      args: ["50"]
```
@z

@x
Built-ins are typically zero-config and faster than equivalent shell hooks because they don't fork a process. They cover the common "inject context into every turn / session" patterns out of the box.
@y
Built-ins are typically zero-config and faster than equivalent shell hooks because they don't fork a process. They cover the common "inject context into every turn / session" patterns out of the box.
@z

@x
### Available built-ins
@y
### Available built-ins
@z

@x
| Builtin                 | Event                                                                                     | Args                  | What it does                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                       |
| ----------------------- | ----------------------------------------------------------------------------------------- | --------------------- | ---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| `add_date`              | `turn_start`                                                                              | _none_                | Prepends `Today's date: YYYY-MM-DD` so the model always knows the current date.                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                    |
| `add_environment_info`  | `session_start`                                                                           | _none_                | Adds the working directory, git-repo status, OS, and CPU architecture.                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                             |
| `add_prompt_files`      | `turn_start`                                                                              | `[file1, file2, ...]` | Reads each named file from the workdir hierarchy (walking up) and the home directory, and appends their contents.                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                  |
| `add_git_status`        | `turn_start`                                                                              | _none_                | Adds the output of `git status --short --branch` (no-op outside a git repo or when git isn't installed).                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                           |
| `add_git_diff`          | `turn_start`                                                                              | _none_, or `["full"]` | Adds `git diff --stat` by default. Pass `args: ["full"]` to emit the full unified diff. Output is capped to 4 KB.                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                  |
| `add_directory_listing` | `session_start`                                                                           | _none_                | Adds an alphabetical listing of the cwd's top-level entries (skips dot-files, capped at 100 with a "... and N more").                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                              |
| `add_user_info`         | `session_start`                                                                           | _none_                | Adds the current OS user (username and full name) and the hostname.                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                |
| `add_recent_commits`    | `session_start`                                                                           | _none_, or `["<N>"]`  | Adds `git log --oneline -n N`. `N` defaults to 10; pass a positive integer to override.                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                            |
| `max_iterations`        | `before_llm_call`                                                                         | `["<N>"]` (required)  | Hard-stops the agent after `N` model calls. Stateless: the runtime supplies the iteration counter on every dispatch.                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                       |
| `snapshot`              | `session_start`, `turn_start`, `turn_end`, `pre_tool_use`, `post_tool_use`, `session_end` | _none_                | Records filesystem snapshots in a shadow git repo under the Docker Agent data directory. No-op outside git repos; respects the source repo's ignore rules and skips newly-added files larger than 2 MiB.                                                                                                                                                                                                                                                                                                                                                                                                                           |
| `redact_secrets`        | `pre_tool_use`, `before_llm_call`, `tool_response_transform`                              | _none_                | Scrubs detected secrets (API keys, tokens, private keys, …) out of tool call arguments, outgoing chat content, and tool output. The same builtin handles all three events and dispatches on the event name. Auto-registered on all three events by `redact_secrets: true` on the agent — see [`examples/redact_secrets_hooks.yaml`](https://github.com/docker/docker-agent/blob/main/examples/redact_secrets_hooks.yaml) for the manual wiring.                                                                                                                                                                                     |
| `limit_large_tool_results` | `tool_response_transform`, `session_end`                                               | _none_                | **Always-on safety hook** — automatically injected by the runtime, no configuration required. When a tool result from the `filesystem`, `shell`, `mcp`, or `a2a` categories exceeds 2,000 lines or 50 KiB, the full payload is written to a per-session temp file and replaced in the conversation with a notice plus a bounded excerpt (2,000 lines, up to 50 KiB): the tail for most tools, but the head for the built-in filesystem `read_file`, whose notice suggests a follow-up call with `line`/`limit` to continue reading. The `session_end` leg deletes the temp directory. Internal toolsets (`memory`, `plan`, `tasks`, `think`, …) are not affected. |
| `safer_shell`           | `pre_tool_use`                                                                            | _none_                | **Deprecated compatibility shim.** The runtime now classifies every shell command natively (`safe` / `destructive` / `unknown`) and gates it through the session's [safety mode](../permissions/index.md#safety-modes), so this builtin no longer emits verdicts. Pinned entries keep working as pure labellers that attach classification metadata (`safety_label`, `blast_radius`, `category`, `reason`) to the call. Filters by tool name internally (no-op for non-shell calls). |
| `unload`                | `on_agent_switch`                                                                         | _none_                | POSTs `{"model": "<id>"}` to each of the previous agent's DMR model endpoints (`/_unload` by default, overridable per-model via `unload_api`) to free the GPU/RAM the just-departing model was holding. Pure HTTP — reads the model snapshot the runtime ships on `on_agent_switch` and depends on no provider-specific runtime state. Non-DMR providers (OpenAI, Anthropic, …) are silently skipped, so cross-provider chains are safe. Errors are logged and swallowed; agent switching never blocks on a slow or unreachable engine (each call has a 10 s timeout). See [`examples/unload_on_switch.yaml`](https://github.com/docker/docker-agent/blob/main/examples/unload_on_switch.yaml). |
@y
| Builtin                 | Event                                                                                     | Args                  | What it does                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                       |
| ----------------------- | ----------------------------------------------------------------------------------------- | --------------------- | ---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| `add_date`              | `turn_start`                                                                              | _none_                | Prepends `Today's date: YYYY-MM-DD` so the model always knows the current date.                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                    |
| `add_environment_info`  | `session_start`                                                                           | _none_                | Adds the working directory, git-repo status, OS, and CPU architecture.                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                             |
| `add_prompt_files`      | `turn_start`                                                                              | `[file1, file2, ...]` | Reads each named file from the workdir hierarchy (walking up) and the home directory, and appends their contents.                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                  |
| `add_git_status`        | `turn_start`                                                                              | _none_                | Adds the output of `git status --short --branch` (no-op outside a git repo or when git isn't installed).                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                           |
| `add_git_diff`          | `turn_start`                                                                              | _none_, or `["full"]` | Adds `git diff --stat` by default. Pass `args: ["full"]` to emit the full unified diff. Output is capped to 4 KB.                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                  |
| `add_directory_listing` | `session_start`                                                                           | _none_                | Adds an alphabetical listing of the cwd's top-level entries (skips dot-files, capped at 100 with a "... and N more").                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                              |
| `add_user_info`         | `session_start`                                                                           | _none_                | Adds the current OS user (username and full name) and the hostname.                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                |
| `add_recent_commits`    | `session_start`                                                                           | _none_, or `["<N>"]`  | Adds `git log --oneline -n N`. `N` defaults to 10; pass a positive integer to override.                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                            |
| `max_iterations`        | `before_llm_call`                                                                         | `["<N>"]` (required)  | Hard-stops the agent after `N` model calls. Stateless: the runtime supplies the iteration counter on every dispatch.                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                       |
| `snapshot`              | `session_start`, `turn_start`, `turn_end`, `pre_tool_use`, `post_tool_use`, `session_end` | _none_                | Records filesystem snapshots in a shadow git repo under the Docker Agent data directory. No-op outside git repos; respects the source repo's ignore rules and skips newly-added files larger than 2 MiB.                                                                                                                                                                                                                                                                                                                                                                                                                           |
| `redact_secrets`        | `pre_tool_use`, `before_llm_call`, `tool_response_transform`                              | _none_                | Scrubs detected secrets (API keys, tokens, private keys, …) out of tool call arguments, outgoing chat content, and tool output. The same builtin handles all three events and dispatches on the event name. Auto-registered on all three events by `redact_secrets: true` on the agent — see [`examples/redact_secrets_hooks.yaml`](https://github.com/docker/docker-agent/blob/main/examples/redact_secrets_hooks.yaml) for the manual wiring.                                                                                                                                                                                     |
| `limit_large_tool_results` | `tool_response_transform`, `session_end`                                               | _none_                | **Always-on safety hook** — automatically injected by the runtime, no configuration required. When a tool result from the `filesystem`, `shell`, `mcp`, or `a2a` categories exceeds 2,000 lines or 50 KiB, the full payload is written to a per-session temp file and replaced in the conversation with a notice plus a bounded excerpt (2,000 lines, up to 50 KiB): the tail for most tools, but the head for the built-in filesystem `read_file`, whose notice suggests a follow-up call with `line`/`limit` to continue reading. The `session_end` leg deletes the temp directory. Internal toolsets (`memory`, `plan`, `tasks`, `think`, …) are not affected. |
| `safer_shell`           | `pre_tool_use`                                                                            | _none_                | **Deprecated compatibility shim.** The runtime now classifies every shell command natively (`safe` / `destructive` / `unknown`) and gates it through the session's [safety mode](../permissions/index.md#safety-modes), so this builtin no longer emits verdicts. Pinned entries keep working as pure labellers that attach classification metadata (`safety_label`, `blast_radius`, `category`, `reason`) to the call. Filters by tool name internally (no-op for non-shell calls). |
| `unload`                | `on_agent_switch`                                                                         | _none_                | POSTs `{"model": "<id>"}` to each of the previous agent's DMR model endpoints (`/_unload` by default, overridable per-model via `unload_api`) to free the GPU/RAM the just-departing model was holding. Pure HTTP — reads the model snapshot the runtime ships on `on_agent_switch` and depends on no provider-specific runtime state. Non-DMR providers (OpenAI, Anthropic, …) are silently skipped, so cross-provider chains are safe. Errors are logged and swallowed; agent switching never blocks on a slow or unreachable engine (each call has a 10 s timeout). See [`examples/unload_on_switch.yaml`](https://github.com/docker/docker-agent/blob/main/examples/unload_on_switch.yaml). |
@z

@x
> [!NOTE]
> **Per-turn vs. per-session**
>
> `turn_start` built-ins recompute every turn and contribute **transient** context that is _not_ persisted to the session — perfect for fast-moving signals like the date or current git state. `session_start` built-ins run once per session and their context **persists** across turns and resumes — pick this for stable context like the OS user or the initial directory listing.
@y
> [!NOTE]
> **Per-turn vs. per-session**
>
> `turn_start` built-ins recompute every turn and contribute **transient** context that is _not_ persisted to the session — perfect for fast-moving signals like the date or current git state. `session_start` built-ins run once per session and their context **persists** across turns and resumes — pick this for stable context like the OS user or the initial directory listing.
@z

@x
> [!NOTE]
> **Auto-injected built-ins**
>
> The agent flags `add_date: true`, `add_environment_info: true`, `add_prompt_files: [...]`, and `redact_secrets: true` are shorthands that auto-register the matching built-in hook. You don't need to repeat them under `hooks:` — set the flag _or_ the hook entry(ies), not both. `redact_secrets: true` auto-registers the same builtin on all three of `pre_tool_use`, `before_llm_call`, and `tool_response_transform`; you can also wire any subset of them by hand for finer-grained control (per-tool matchers, ordering with other rewriters, …).
>
> `limit_large_tool_results` is injected unconditionally by the runtime — it is always active and cannot be removed from config.
@y
> [!NOTE]
> **Auto-injected built-ins**
>
> The agent flags `add_date: true`, `add_environment_info: true`, `add_prompt_files: [...]`, and `redact_secrets: true` are shorthands that auto-register the matching built-in hook. You don't need to repeat them under `hooks:` — set the flag _or_ the hook entry(ies), not both. `redact_secrets: true` auto-registers the same builtin on all three of `pre_tool_use`, `before_llm_call`, and `tool_response_transform`; you can also wire any subset of them by hand for finer-grained control (per-tool matchers, ordering with other rewriters, …).
>
> `limit_large_tool_results` is injected unconditionally by the runtime — it is always active and cannot be removed from config.
@z

@x
A minimal snapshot wiring looks like this:
@y
A minimal snapshot wiring looks like this:
@z

@x
```yaml
hooks:
  turn_start:
    - type: builtin
      command: snapshot
  turn_end:
    - type: builtin
      command: snapshot
  session_end:
    - type: builtin
      command: snapshot
```
@y
```yaml
hooks:
  turn_start:
    - type: builtin
      command: snapshot
  turn_end:
    - type: builtin
      command: snapshot
  session_end:
    - type: builtin
      command: snapshot
```
@z

@x
The shadow repository stores tree objects only; it never writes commits or touches the source repository's `.git` directory. The source repository's `.gitignore` and `info/exclude` rules are mirrored before each capture so ignored files do not appear in snapshots. The built-in only records undo checkpoints when files changed, so a final no-op model response does not hide the last changed snapshot.
@y
The shadow repository stores tree objects only; it never writes commits or touches the source repository's `.git` directory. The source repository's `.gitignore` and `info/exclude` rules are mirrored before each capture so ignored files do not appear in snapshots. The built-in only records undo checkpoints when files changed, so a final no-op model response does not hide the last changed snapshot.
@z

@x
You can also enable snapshots globally for every agent with user config:
@y
You can also enable snapshots globally for every agent with user config:
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
Omit `snapshot` or set it to `false` to leave automatic snapshots off; manually configured snapshot hooks still run.
@y
Omit `snapshot` or set it to `false` to leave automatic snapshots off; manually configured snapshot hooks still run.
@z

@x
See [`examples/snapshot_hooks.yaml`](https://github.com/docker/docker-agent/blob/main/examples/snapshot_hooks.yaml) for a complete snapshot hook configuration. For an overview of the snapshot feature and the `/undo` / `/snapshots` commands, see [Snapshots](../../features/snapshots/index.md).
@y
See [`examples/snapshot_hooks.yaml`](https://github.com/docker/docker-agent/blob/main/examples/snapshot_hooks.yaml) for a complete snapshot hook configuration. For an overview of the snapshot feature and the `/undo` / `/snapshots` commands, see [Snapshots](../../features/snapshots/index.md).
@z

@x
> [!WARNING]
> **Two flavors of `max_iterations`**
>
> The `max_iterations` agent field has its own UX (it pauses and asks the user to resume past the limit). The `max_iterations` built-in hook is a **hard stop with no resume** — when its counter trips, the agent terminates with a block decision. Use the agent field for interactive sessions and the built-in hook to enforce non-negotiable caps in unattended runs.
@y
> [!WARNING]
> **Two flavors of `max_iterations`**
>
> The `max_iterations` agent field has its own UX (it pauses and asks the user to resume past the limit). The `max_iterations` built-in hook is a **hard stop with no resume** — when its counter trips, the agent terminates with a block decision. Use the agent field for interactive sessions and the built-in hook to enforce non-negotiable caps in unattended runs.
@z

@x
## Matcher Patterns
@y
## Matcher Patterns
@z

@x
The `matcher` field uses regex patterns to match tool names:
@y
The `matcher` field uses regex patterns to match tool names:
@z

@x
| Pattern            | Matches                       |
| ------------------ | ----------------------------- |
| `*`                | All tools                     |
| `shell`            | Only the `shell` tool         |
| `shell\|edit_file` | Either `shell` or `edit_file` |
| `mcp:.*`           | All MCP tools (regex)         |
@y
| Pattern            | Matches                       |
| ------------------ | ----------------------------- |
| `*`                | All tools                     |
| `shell`            | Only the `shell` tool         |
| `shell\|edit_file` | Either `shell` or `edit_file` |
| `mcp:.*`           | All MCP tools (regex)         |
@z

@x
## Hook Input
@y
## Hook Input
@z

@x
Hooks receive JSON input via stdin with context about the event:
@y
Hooks receive JSON input via stdin with context about the event:
@z

@x
```json
{
  "session_id": "abc123",
  "cwd": "/path/to/project",
  "hook_event_name": "pre_tool_use",
  "tool_name": "shell",
  "tool_use_id": "call_xyz",
  "tool_input": {
    "cmd": "rm -rf /tmp/cache",
    "cwd": "."
  }
}
```
@y
```json
{
  "session_id": "abc123",
  "cwd": "/path/to/project",
  "hook_event_name": "pre_tool_use",
  "tool_name": "shell",
  "tool_use_id": "call_xyz",
  "tool_input": {
    "cmd": "rm -rf /tmp/cache",
    "cwd": "."
  }
}
```
@z

@x
### Common Fields
@y
### Common Fields
@z

@x
Every hook event carries:
@y
Every hook event carries:
@z

@x
| Field             | Description                           |
| ----------------- | ------------------------------------- |
| `session_id`      | The current session's ID.             |
| `cwd`             | The runtime's working directory.      |
| `hook_event_name` | The event name (e.g. `pre_tool_use`). |
@y
| Field             | Description                           |
| ----------------- | ------------------------------------- |
| `session_id`      | The current session's ID.             |
| `cwd`             | The runtime's working directory.      |
| `hook_event_name` | The event name (e.g. `pre_tool_use`). |
@z

@x
### Per-Event Extra Fields
@y
### Per-Event Extra Fields
@z

@x
In addition to the common fields, each event ships its own payload:
@y
In addition to the common fields, each event ships its own payload:
@z

@x
| Event                       | Extra fields                                                                                                          |
| --------------------------- | --------------------------------------------------------------------------------------------------------------------- |
| `pre_tool_use`              | `agent_name`, `tool_name`, `tool_use_id`, `tool_input`                                                                |
| `tool_response_transform`   | `tool_name`, `tool_use_id`, `tool_input`, `tool_response`                                                             |
| `post_tool_use`             | `agent_name`, `tool_name`, `tool_use_id`, `tool_input`, `tool_response`, `tool_error`                                 |
| `permission_request`        | `agent_name`, `tool_name`, `tool_use_id`, `tool_input`                                                                |
| `session_start`             | `source` — one of `startup`, `resume`, `clear`, `compact`                                                             |
| `user_prompt_submit`        | `prompt` — the text the user just submitted                                                                           |
| `user_steering_messages_submit` | `steering_messages` — the drained steering messages, in submission order                                         |
| `user_followup_submit`      | `prompt` — the text of the dequeued follow-up message                                                                |
| `turn_start`                | _none_ (just the common fields)                                                                                       |
| `turn_end`                  | `agent_name`, `reason` — one of `normal`, `continue`, `steered`, `error`, `canceled`, `hook_blocked`, `loop_detected` |
| `before_llm_call`           | `iteration` — 1-based run-loop iteration counter (the model call this hook is gating), `model_id`                    |
| `after_llm_call`            | `agent_name`, `stop_response`, `last_user_message`, `model_id`, `usage`, `cost`                                       |
| `session_end`               | `reason` — one of `clear`, `logout`, `prompt_input_exit`, `other`                                                     |
| `pre_compact`               | `source` — one of `manual`, `auto`, `overflow`, `tool_overflow`                                                       |
| `before_compaction`         | `input_tokens`, `output_tokens`, `context_limit`, `compaction_reason` (one of `threshold`/`overflow`/`manual`)        |
| `after_compaction`          | `input_tokens`, `output_tokens`, `context_limit`, `compaction_reason`, `summary`                                      |
| `subagent_stop`             | `agent_name` (the sub-agent), `parent_session_id`, `stop_response`                                                    |
| `on_user_input`             | _none_                                                                                                                |
| `stop`                      | `agent_name`, `stop_response`, `last_user_message`                                                                    |
| `notification`              | `notification_level` (`error` or `warning`), `notification_message`                                                   |
| `on_error`                  | `notification_level` (always `error`), `notification_message`                                                         |
| `on_max_iterations`         | `notification_level` (always `warning`), `notification_message`                                                       |
| `on_agent_switch`           | `from_agent`, `to_agent`, `agent_switch_kind` (`transfer_task`, `transfer_task_return`, `handoff`, or `force_handoff`)                 |
| `on_session_resume`         | `previous_max_iterations`, `new_max_iterations`                                                                       |
| `on_tool_approval_decision` | `tool_name`, `tool_use_id`, `tool_input`, `approval_decision`, `approval_source`                                      |
| `worktree_create`           | `worktree_path`, `worktree_branch`, `worktree_source_dir` (`cwd` is also set to the new worktree)                     |
@y
| Event                       | Extra fields                                                                                                          |
| --------------------------- | --------------------------------------------------------------------------------------------------------------------- |
| `pre_tool_use`              | `agent_name`, `tool_name`, `tool_use_id`, `tool_input`                                                                |
| `tool_response_transform`   | `tool_name`, `tool_use_id`, `tool_input`, `tool_response`                                                             |
| `post_tool_use`             | `agent_name`, `tool_name`, `tool_use_id`, `tool_input`, `tool_response`, `tool_error`                                 |
| `permission_request`        | `agent_name`, `tool_name`, `tool_use_id`, `tool_input`                                                                |
| `session_start`             | `source` — one of `startup`, `resume`, `clear`, `compact`                                                             |
| `user_prompt_submit`        | `prompt` — the text the user just submitted                                                                           |
| `user_steering_messages_submit` | `steering_messages` — the drained steering messages, in submission order                                         |
| `user_followup_submit`      | `prompt` — the text of the dequeued follow-up message                                                                |
| `turn_start`                | _none_ (just the common fields)                                                                                       |
| `turn_end`                  | `agent_name`, `reason` — one of `normal`, `continue`, `steered`, `error`, `canceled`, `hook_blocked`, `loop_detected` |
| `before_llm_call`           | `iteration` — 1-based run-loop iteration counter (the model call this hook is gating), `model_id`                    |
| `after_llm_call`            | `agent_name`, `stop_response`, `last_user_message`, `model_id`, `usage`, `cost`                                       |
| `session_end`               | `reason` — one of `clear`, `logout`, `prompt_input_exit`, `other`                                                     |
| `pre_compact`               | `source` — one of `manual`, `auto`, `overflow`, `tool_overflow`                                                       |
| `before_compaction`         | `input_tokens`, `output_tokens`, `context_limit`, `compaction_reason` (one of `threshold`/`overflow`/`manual`)        |
| `after_compaction`          | `input_tokens`, `output_tokens`, `context_limit`, `compaction_reason`, `summary`                                      |
| `subagent_stop`             | `agent_name` (the sub-agent), `parent_session_id`, `stop_response`                                                    |
| `on_user_input`             | _none_                                                                                                                |
| `stop`                      | `agent_name`, `stop_response`, `last_user_message`                                                                    |
| `notification`              | `notification_level` (`error` or `warning`), `notification_message`                                                   |
| `on_error`                  | `notification_level` (always `error`), `notification_message`                                                         |
| `on_max_iterations`         | `notification_level` (always `warning`), `notification_message`                                                       |
| `on_agent_switch`           | `from_agent`, `to_agent`, `agent_switch_kind` (`transfer_task`, `transfer_task_return`, `handoff`, or `force_handoff`)                 |
| `on_session_resume`         | `previous_max_iterations`, `new_max_iterations`                                                                       |
| `on_tool_approval_decision` | `tool_name`, `tool_use_id`, `tool_input`, `approval_decision`, `approval_source`                                      |
| `worktree_create`           | `worktree_path`, `worktree_branch`, `worktree_source_dir` (`cwd` is also set to the new worktree)                     |
@z

@x
Notes:
@y
Notes:
@z

@x
- `tool_response` for `post_tool_use` carries the tool's result; `tool_error` is `true` when the tool failed (the failure detail is surfaced inside `tool_response`).
- `agent_name` on `pre_tool_use`, `post_tool_use`, and `permission_request` identifies the agent that issued the tool call — in multi-agent setups this follows the active sub-agent, not always the root agent.
- `prompt` is only populated for `user_prompt_submit`. Sub-sessions (transferred tasks, background agents, skills) do **not** fire this event because their kick-off message is synthesised by the runtime, not authored by the user.
- `steering_messages` is only populated for `user_steering_messages_submit`. It carries the user messages the runtime just drained from the steering queue — messages submitted while the agent was already working (mid-turn, after the model stopped, or while idle before the first model call).
- `prompt` is also populated for `user_followup_submit`, carrying the text of the dequeued follow-up message (a user message queued for end-of-turn processing via the FollowUp API / queue, as opposed to mid-turn steering).
- `stop_response` carries the model's final assistant text for `stop`, `after_llm_call`, and `subagent_stop`. `last_user_message` carries the latest user message at dispatch time.
- `model_id` is populated for `after_llm_call` (and `before_llm_call`) in the canonical `<provider>/<model>` form (e.g. `anthropic/claude-sonnet-4-5`). For harness agents, `model_id` is the harness label (e.g. `claude-code`) rather than a canonical model name — see [Coding Harnesses](../../features/harnesses/index.md).
- `usage` and `cost` are populated for `after_llm_call` only. `usage` is the per-call token usage object (`input_tokens`, `output_tokens`, `cached_input_tokens`, `cached_write_tokens`, and `reasoning_tokens` — the last is itself omitted for non-reasoning models); the whole object is absent when the provider reported no usage. `cost` is the USD price of that one model response. For a **native model call** it is the price computed from `usage` and the model's pricing table, and equals the cost the session records for the turn: it is **absent** when the response is unpriced (no pricing data on file, or no usage) and an explicit `0` for a priced call that was free — so a present `cost` is authoritative and an absent one means "unpriced", with no need to cross-check `usage`. Models the catalogue does not price (custom endpoints, local models) can be priced explicitly with the model-level [`cost`](../models/index.md#custom-token-pricing) config. (For harness agents the meaning differs — see the next note.) A cost ledger can therefore record per-call spend from the payload alone, without subscribing to the runtime event channel.
- For [harness agents](../../features/harnesses/index.md), `cost` is the harness's own reported total for the call rather than a computed price, and is present only when the harness reported a non-zero cost (some harnesses, e.g. `codex`, report token counts but no cost — those turns carry `usage` with `cost` absent, even though the recorded message stores `0`).
- `after_llm_call` fires for **every** model call, including calls made inside sub-sessions (transferred tasks, background agents, skills). For those, `session_id` is the sub-session's id. Summing `cost` across `after_llm_call` events therefore captures **all** spend, including sub-sessions (and even sub-sessions that error before their cost is persisted). Do **not** add a separately-queried session cost total on top: the runtime's own total already recurses into and includes completed sub-session spend, so combining the two double-counts. Pick one source — the summed hook costs — as the authoritative ledger.
- `context_limit` is `0` when the model definition is unavailable (treat `0` as "unknown", not as a real limit).
- `approval_decision` is one of `allow`, `deny`, `canceled`. `approval_source` is a stable classifier of which step decided (e.g. `yolo`, `session_permissions_allow`, `session_permissions_deny`, `team_permissions_allow`, `team_permissions_deny`, `pre_tool_use_hook_allow`, `pre_tool_use_hook_deny`, `readonly_hint`, `user_approved`, `user_approved_session`, `user_approved_safe`, `user_approved_tool`, `user_rejected`, `context_canceled`).
@y
- `tool_response` for `post_tool_use` carries the tool's result; `tool_error` is `true` when the tool failed (the failure detail is surfaced inside `tool_response`).
- `agent_name` on `pre_tool_use`, `post_tool_use`, and `permission_request` identifies the agent that issued the tool call — in multi-agent setups this follows the active sub-agent, not always the root agent.
- `prompt` is only populated for `user_prompt_submit`. Sub-sessions (transferred tasks, background agents, skills) do **not** fire this event because their kick-off message is synthesised by the runtime, not authored by the user.
- `steering_messages` is only populated for `user_steering_messages_submit`. It carries the user messages the runtime just drained from the steering queue — messages submitted while the agent was already working (mid-turn, after the model stopped, or while idle before the first model call).
- `prompt` is also populated for `user_followup_submit`, carrying the text of the dequeued follow-up message (a user message queued for end-of-turn processing via the FollowUp API / queue, as opposed to mid-turn steering).
- `stop_response` carries the model's final assistant text for `stop`, `after_llm_call`, and `subagent_stop`. `last_user_message` carries the latest user message at dispatch time.
- `model_id` is populated for `after_llm_call` (and `before_llm_call`) in the canonical `<provider>/<model>` form (e.g. `anthropic/claude-sonnet-4-5`). For harness agents, `model_id` is the harness label (e.g. `claude-code`) rather than a canonical model name — see [Coding Harnesses](../../features/harnesses/index.md).
- `usage` and `cost` are populated for `after_llm_call` only. `usage` is the per-call token usage object (`input_tokens`, `output_tokens`, `cached_input_tokens`, `cached_write_tokens`, and `reasoning_tokens` — the last is itself omitted for non-reasoning models); the whole object is absent when the provider reported no usage. `cost` is the USD price of that one model response. For a **native model call** it is the price computed from `usage` and the model's pricing table, and equals the cost the session records for the turn: it is **absent** when the response is unpriced (no pricing data on file, or no usage) and an explicit `0` for a priced call that was free — so a present `cost` is authoritative and an absent one means "unpriced", with no need to cross-check `usage`. Models the catalogue does not price (custom endpoints, local models) can be priced explicitly with the model-level [`cost`](../models/index.md#custom-token-pricing) config. (For harness agents the meaning differs — see the next note.) A cost ledger can therefore record per-call spend from the payload alone, without subscribing to the runtime event channel.
- For [harness agents](../../features/harnesses/index.md), `cost` is the harness's own reported total for the call rather than a computed price, and is present only when the harness reported a non-zero cost (some harnesses, e.g. `codex`, report token counts but no cost — those turns carry `usage` with `cost` absent, even though the recorded message stores `0`).
- `after_llm_call` fires for **every** model call, including calls made inside sub-sessions (transferred tasks, background agents, skills). For those, `session_id` is the sub-session's id. Summing `cost` across `after_llm_call` events therefore captures **all** spend, including sub-sessions (and even sub-sessions that error before their cost is persisted). Do **not** add a separately-queried session cost total on top: the runtime's own total already recurses into and includes completed sub-session spend, so combining the two double-counts. Pick one source — the summed hook costs — as the authoritative ledger.
- `context_limit` is `0` when the model definition is unavailable (treat `0` as "unknown", not as a real limit).
- `approval_decision` is one of `allow`, `deny`, `canceled`. `approval_source` is a stable classifier of which step decided (e.g. `yolo`, `session_permissions_allow`, `session_permissions_deny`, `team_permissions_allow`, `team_permissions_deny`, `pre_tool_use_hook_allow`, `pre_tool_use_hook_deny`, `readonly_hint`, `user_approved`, `user_approved_session`, `user_approved_safe`, `user_approved_tool`, `user_rejected`, `context_canceled`).
@z

@x
## Hook Output
@y
## Hook Output
@z

@x
Hooks communicate back via JSON output to stdout:
@y
Hooks communicate back via JSON output to stdout:
@z

@x
```json
{
  "continue": true,
  "stop_reason": "Optional message when continue=false",
  "suppress_output": false,
  "system_message": "Warning message to show user",
  "decision": "block",
  "reason": "Explanation for the decision",
  "hook_specific_output": {
    "hook_event_name": "pre_tool_use",
    "permission_decision": "allow",
    "permission_decision_reason": "Command is safe",
    "updated_input": { "cmd": "modified command" }
  }
}
```
@y
```json
{
  "continue": true,
  "stop_reason": "Optional message when continue=false",
  "suppress_output": false,
  "system_message": "Warning message to show user",
  "decision": "block",
  "reason": "Explanation for the decision",
  "hook_specific_output": {
    "hook_event_name": "pre_tool_use",
    "permission_decision": "allow",
    "permission_decision_reason": "Command is safe",
    "updated_input": { "cmd": "modified command" }
  }
}
```
@z

@x
All fields are optional. Returning `{}` (or no output at all) means "do nothing, continue normally".
@y
All fields are optional. Returning `{}` (or no output at all) means "do nothing, continue normally".
@z

@x
### Output Fields
@y
### Output Fields
@z

@x
| Field             | Type    | Description                                     |
| ----------------- | ------- | ----------------------------------------------- |
| `continue`        | boolean | Whether to continue execution (default: `true`) |
| `stop_reason`     | string  | Message to show when `continue=false`           |
| `suppress_output` | boolean | Hide stdout from transcript                     |
| `system_message`  | string  | Warning message to display to user              |
| `decision`        | string  | For blocking: `block` to prevent operation      |
| `reason`          | string  | Explanation for the decision                    |
@y
| Field             | Type    | Description                                     |
| ----------------- | ------- | ----------------------------------------------- |
| `continue`        | boolean | Whether to continue execution (default: `true`) |
| `stop_reason`     | string  | Message to show when `continue=false`           |
| `suppress_output` | boolean | Hide stdout from transcript                     |
| `system_message`  | string  | Warning message to display to user              |
| `decision`        | string  | For blocking: `block` to prevent operation      |
| `reason`          | string  | Explanation for the decision                    |
@z

@x
### Pre-Tool-Use / Permission-Request Specific Output
@y
### Pre-Tool-Use / Permission-Request Specific Output
@z

@x
The `hook_specific_output` for `pre_tool_use` (and `permission_request`) supports:
@y
The `hook_specific_output` for `pre_tool_use` (and `permission_request`) supports:
@z

@x
| Field                        | Type   | Description                             |
| ---------------------------- | ------ | --------------------------------------- |
| `permission_decision`        | string | `allow`, `deny`, or `ask`               |
| `permission_decision_reason` | string | Explanation for the decision            |
| `updated_input`              | object | Modified tool input (replaces original) |
| `metadata`                   | object | (`permission_request` and `pre_tool_use` entries with `preempt_yolo: true` only) string key/value annotations merged onto the tool-call confirmation prompt — see below |
@y
| Field                        | Type   | Description                             |
| ---------------------------- | ------ | --------------------------------------- |
| `permission_decision`        | string | `allow`, `deny`, or `ask`               |
| `permission_decision_reason` | string | Explanation for the decision            |
| `updated_input`              | object | Modified tool input (replaces original) |
| `metadata`                   | object | (`permission_request` and `pre_tool_use` entries with `preempt_yolo: true` only) string key/value annotations merged onto the tool-call confirmation prompt — see below |
@z

@x
### Preempting auto-approval from `pre_tool_use`
@y
### Preempting auto-approval from `pre_tool_use`
@z

@x
`pre_tool_use` entries default to firing AFTER the deterministic approval
pipeline (custom allow rules / safety mode), so an auto-approved call
skips them entirely. For security-critical checks that MUST run on every
call regardless of the safety mode (including `autonomous`, the legacy
`--yolo`), set `preempt_yolo: true` on the matcher entry:
@y
`pre_tool_use` entries default to firing AFTER the deterministic approval
pipeline (custom allow rules / safety mode), so an auto-approved call
skips them entirely. For security-critical checks that MUST run on every
call regardless of the safety mode (including `autonomous`, the legacy
`--yolo`), set `preempt_yolo: true` on the matcher entry:
@z

@x
```yaml
hooks:
  pre_tool_use:
    - matcher: "*"
      preempt_yolo: true
      hooks:
        - type: command
          command: ./security-check.sh
```
@y
```yaml
hooks:
  pre_tool_use:
    - matcher: "*"
      preempt_yolo: true
      hooks:
        - type: command
          command: ./security-check.sh
```
@z

@x
The entry then fires in a dedicated stage 0 BEFORE `Decide()`:
@y
The entry then fires in a dedicated stage 0 BEFORE `Decide()`:
@z

@x
- `deny` rejects the call outright; the user is not prompted.
- `ask` forces user confirmation. The default `pre_tool_use` lane and
  `permission_request` are skipped on this path so a policy-level
  allow there can't override the security verdict. The one exception
  is a session-scoped allow grant (the interactive "always allow this
  tool" decision) — an informed user opt-in made in response to this
  very prompt.
- `allow` is advisory — the pipeline still runs `Decide()` and the
  rest of `pre_tool_use`. Same shape as a regular `allow` on the
  default lane, just observed earlier.
- No verdict (empty `permission_decision`) falls through.
@y
- `deny` rejects the call outright; the user is not prompted.
- `ask` forces user confirmation. The default `pre_tool_use` lane and
  `permission_request` are skipped on this path so a policy-level
  allow there can't override the security verdict. The one exception
  is a session-scoped allow grant (the interactive "always allow this
  tool" decision) — an informed user opt-in made in response to this
  very prompt.
- `allow` is advisory — the pipeline still runs `Decide()` and the
  rest of `pre_tool_use`. Same shape as a regular `allow` on the
  default lane, just observed earlier.
- No verdict (empty `permission_decision`) falls through.
@z

@x
Hook crashes on a `preempt_yolo: true` entry fail closed (deny), matching
the default `pre_tool_use` posture.
@y
Hook crashes on a `preempt_yolo: true` entry fail closed (deny), matching
the default `pre_tool_use` posture.
@z

@x
Preempting entries can attach structured context via
`hook_specific_output.metadata` (`map[string]string`). The runtime merges
that into the tool-call confirmation event, on top of the metadata it
already derives from its own safety classification (`safety_label`,
`blast_radius`, `category`, `reason`). Key conventions with special
rendering in the TUI confirmation prompt:
@y
Preempting entries can attach structured context via
`hook_specific_output.metadata` (`map[string]string`). The runtime merges
that into the tool-call confirmation event, on top of the metadata it
already derives from its own safety classification (`safety_label`,
`blast_radius`, `category`, `reason`). Key conventions with special
rendering in the TUI confirmation prompt:
@z

@x
- `safety_label` — the three-value taxonomy: `safe`, `destructive`, or
  `unknown`.
- `blast_radius` — one of `safe`, `low`, `medium`, `high`, `unknown`.
  Rendered as a colored severity badge (green / yellow / red / muted).
- `category` — taxonomy tag (e.g. `fs-delete`, `dk-volume-del`).
@y
- `safety_label` — the three-value taxonomy: `safe`, `destructive`, or
  `unknown`.
- `blast_radius` — one of `safe`, `low`, `medium`, `high`, `unknown`.
  Rendered as a colored severity badge (green / yellow / red / muted).
- `category` — taxonomy tag (e.g. `fs-delete`, `dk-volume-del`).
@z

@x
Plus a free-form `reason` key that the dialog shows as supporting
context. Other keys render as plain text. Last writer wins on key
clashes across hooks, and preempting entries win over the runtime's own
classification.
@y
Plus a free-form `reason` key that the dialog shows as supporting
context. Other keys render as plain text. Last writer wins on key
clashes across hooks, and preempting entries win over the runtime's own
classification.
@z

@x
### Tool-Response-Transform Specific Output
@y
### Tool-Response-Transform Specific Output
@z

@x
The `hook_specific_output` for `tool_response_transform` supports:
@y
The `hook_specific_output` for `tool_response_transform` supports:
@z

@x
| Field                   | Type   | Description                                   |
| ----------------------- | ------ | --------------------------------------------- |
| `updated_tool_response` | string | Rewritten tool output (replaces the original) |
@y
| Field                   | Type   | Description                                   |
| ----------------------- | ------ | --------------------------------------------- |
| `updated_tool_response` | string | Rewritten tool output (replaces the original) |
@z

@x
This is the symmetric counterpart of `pre_tool_use`'s `updated_input`, applied to tool **results** instead of tool **arguments**. The rewrite reaches every downstream consumer — event subscribers, the persisted session file, the `post_tool_use` hook input, and the next LLM call. Use it to truncate excessive output, scrub PII, or normalise tool dialects. The built-in `redact_secrets` registers itself on this event as the third leg of the redact_secrets feature.
@y
This is the symmetric counterpart of `pre_tool_use`'s `updated_input`, applied to tool **results** instead of tool **arguments**. The rewrite reaches every downstream consumer — event subscribers, the persisted session file, the `post_tool_use` hook input, and the next LLM call. Use it to truncate excessive output, scrub PII, or normalise tool dialects. The built-in `redact_secrets` registers itself on this event as the third leg of the redact_secrets feature.
@z

@x
### Context-Contributing Events
@y
### Context-Contributing Events
@z

@x
For `session_start`, `user_prompt_submit`, `user_steering_messages_submit`, `user_followup_submit`, `turn_start`, `post_tool_use`, `pre_compact`, and `stop`, hooks may set `hook_specific_output.additional_context` to inject text into the conversation. `turn_start` context is **transient** (recomputed every turn, never persisted); `session_start` context **persists** for the life of the session. `user_steering_messages_submit` and `user_followup_submit` context is **transient** like `user_prompt_submit` — it is spliced into the steered/follow-up turn only and never persisted. (`worktree_create` also surfaces stdout, but to the CLI user rather than the conversation — the session doesn't exist yet.)
@y
For `session_start`, `user_prompt_submit`, `user_steering_messages_submit`, `user_followup_submit`, `turn_start`, `post_tool_use`, `pre_compact`, and `stop`, hooks may set `hook_specific_output.additional_context` to inject text into the conversation. `turn_start` context is **transient** (recomputed every turn, never persisted); `session_start` context **persists** for the life of the session. `user_steering_messages_submit` and `user_followup_submit` context is **transient** like `user_prompt_submit` — it is spliced into the steered/follow-up turn only and never persisted. (`worktree_create` also surfaces stdout, but to the CLI user rather than the conversation — the session doesn't exist yet.)
@z

@x
### Before-Compaction Specific Output
@y
### Before-Compaction Specific Output
@z

@x
For `before_compaction`, the `hook_specific_output.summary` field, when non-empty, replaces the LLM-generated compaction summary. The runtime applies the string verbatim and skips the model call.
@y
For `before_compaction`, the `hook_specific_output.summary` field, when non-empty, replaces the LLM-generated compaction summary. The runtime applies the string verbatim and skips the model call.
@z

@x
```json
{
  "hook_specific_output": {
    "hook_event_name": "before_compaction",
    "summary": "User asked to refactor pkg/foo. Done in commit abc123."
  }
}
```
@y
```json
{
  "hook_specific_output": {
    "hook_event_name": "before_compaction",
    "summary": "User asked to refactor pkg/foo. Done in commit abc123."
  }
}
```
@z

@x
Returning `decision: "block"` (or exit code 2) instead vetoes the compaction entirely. Be cautious about denying when `compaction_reason` is `overflow`: the runtime is recovering from a context-overflow error and a denial there will leave the session unable to make progress.
@y
Returning `decision: "block"` (or exit code 2) instead vetoes the compaction entirely. Be cautious about denying when `compaction_reason` is `overflow`: the runtime is recovering from a context-overflow error and a denial there will leave the session unable to make progress.
@z

@x
### Plain Text Output
@y
### Plain Text Output
@z

@x
For `session_start`, `user_prompt_submit`, `user_steering_messages_submit`, `user_followup_submit`, `turn_start`, `post_tool_use`, `pre_compact`, and `stop` hooks, plain text written to stdout (i.e., output that is not valid JSON) is captured as additional context for the agent. For `pre_compact` it is appended to the compaction prompt; for the others it is spliced into the conversation as a (transient or persisted) system message depending on the event.
@y
For `session_start`, `user_prompt_submit`, `user_steering_messages_submit`, `user_followup_submit`, `turn_start`, `post_tool_use`, `pre_compact`, and `stop` hooks, plain text written to stdout (i.e., output that is not valid JSON) is captured as additional context for the agent. For `pre_compact` it is appended to the compaction prompt; for the others it is spliced into the conversation as a (transient or persisted) system message depending on the event.
@z

@x
## Exit Codes
@y
## Exit Codes
@z

@x
Hook exit codes have special meaning:
@y
Hook exit codes have special meaning:
@z

@x
| Exit Code | Meaning                                |
| --------- | -------------------------------------- |
| `0`       | Success — continue normally            |
| `2`       | Blocking error — stop the operation    |
| Other     | Error — logged but execution continues |
@y
| Exit Code | Meaning                                |
| --------- | -------------------------------------- |
| `0`       | Success — continue normally            |
| `2`       | Blocking error — stop the operation    |
| Other     | Error — logged but execution continues |
@z

@x
## Per-hook options
@y
## Per-hook options
@z

@x
Hooks have a default timeout of 60 seconds. You can also give hooks a name, add environment variables, choose a working directory, and control how non-security hook failures behave:
@y
Hooks have a default timeout of 60 seconds. You can also give hooks a name, add environment variables, choose a working directory, and control how non-security hook failures behave:
@z

@x
```yaml
hooks:
  post_tool_use:
    - matcher: "shell"
      hooks:
        - name: "summarize shell output"
          type: command
          command: "./summarize.sh"
          timeout: 120 # 2 minutes
          working_dir: ./hooks
          env:
            PROFILE: dev
          on_error: warn # warn | ignore | block
```
@y
```yaml
hooks:
  post_tool_use:
    - matcher: "shell"
      hooks:
        - name: "summarize shell output"
          type: command
          command: "./summarize.sh"
          timeout: 120 # 2 minutes
          working_dir: ./hooks
          env:
            PROFILE: dev
          on_error: warn # warn | ignore | block
```
@z

@x
`pre_tool_use` is fail-closed for safety: a failed pre-tool hook blocks the tool call regardless of `on_error`.
@y
`pre_tool_use` is fail-closed for safety: a failed pre-tool hook blocks the tool call regardless of `on_error`.
@z

@x
`working_dir` and `env` apply to `command` and `builtin` hooks. For `builtin` hooks, `working_dir` is resolved with the same logic as `command` hooks (absolute path wins; relative paths join onto the executor directory). `working_dir` accepts `~`, `$VAR`, `${VAR}` and `${env.VAR}`; `env` values expand only the plain `${env.VAR}` form (resolved from the OS process environment), keeping any other `$` literal (see [Variable Expansion in Config Fields](../overview/index.md#variable-expansion-in-config-fields)). A `working_dir` that expands to an empty string (e.g. an unset variable) falls back to the executor's directory with a warning. For `model` hooks, both fields are accepted by the schema but have no effect: model hooks render a prompt template and call the LLM API directly — no subprocess is spawned and no file I/O is performed, so working directory and environment variables have no applicable semantics.
@y
`working_dir` and `env` apply to `command` and `builtin` hooks. For `builtin` hooks, `working_dir` is resolved with the same logic as `command` hooks (absolute path wins; relative paths join onto the executor directory). `working_dir` accepts `~`, `$VAR`, `${VAR}` and `${env.VAR}`; `env` values expand only the plain `${env.VAR}` form (resolved from the OS process environment), keeping any other `$` literal (see [Variable Expansion in Config Fields](../overview/index.md#variable-expansion-in-config-fields)). A `working_dir` that expands to an empty string (e.g. an unset variable) falls back to the executor's directory with a warning. For `model` hooks, both fields are accepted by the schema but have no effect: model hooks render a prompt template and call the LLM API directly — no subprocess is spawned and no file I/O is performed, so working directory and environment variables have no applicable semantics.
@z

@x
> [!WARNING]
> **Performance**
>
> Hooks run synchronously and can slow down agent execution. Keep hook scripts fast and efficient. Consider using `suppress_output: true` for logging hooks to reduce noise.
@y
> [!WARNING]
> **Performance**
>
> Hooks run synchronously and can slow down agent execution. Keep hook scripts fast and efficient. Consider using `suppress_output: true` for logging hooks to reduce noise.
@z

@x
> [!NOTE]
> **Session End and Cancellation**
>
> `session_end` hooks are designed to run even when the session is interrupted (e.g., Ctrl+C). They are still subject to their configured timeout.
@y
> [!NOTE]
> **Session End and Cancellation**
>
> `session_end` hooks are designed to run even when the session is interrupted (e.g., Ctrl+C). They are still subject to their configured timeout.
@z

@x
## Examples
@y
## Examples
@z

@x
### Validation Script
@y
### Validation Script
@z

@x
A simple pre-tool-use hook that blocks dangerous shell commands:
@y
A simple pre-tool-use hook that blocks dangerous shell commands:
@z

@x
```bash
#!/bin/bash
# scripts/validate-command.sh
@y
```bash
#!/bin/bash
# scripts/validate-command.sh
@z

@x
# Read JSON input from stdin
INPUT=$(cat)
TOOL_NAME=$(echo "$INPUT" | jq -r '.tool_name')
CMD=$(echo "$INPUT" | jq -r '.tool_input.cmd // empty')
@y
# Read JSON input from stdin
INPUT=$(cat)
TOOL_NAME=$(echo "$INPUT" | jq -r '.tool_name')
CMD=$(echo "$INPUT" | jq -r '.tool_input.cmd // empty')
@z

@x
# Block dangerous commands
if [[ "$TOOL_NAME" == "shell" ]]; then
  if [[ "$CMD" =~ ^sudo ]] || [[ "$CMD" =~ rm.*-rf ]]; then
    echo '{"decision": "block", "reason": "Dangerous command blocked by policy"}'
    exit 2
  fi
fi
@y
# Block dangerous commands
if [[ "$TOOL_NAME" == "shell" ]]; then
  if [[ "$CMD" =~ ^sudo ]] || [[ "$CMD" =~ rm.*-rf ]]; then
    echo '{"decision": "block", "reason": "Dangerous command blocked by policy"}'
    exit 2
  fi
fi
@z

@x
# Allow everything else (returning {} means "do nothing, continue normally")
echo '{}'
exit 0
```
@y
# Allow everything else (returning {} means "do nothing, continue normally")
echo '{}'
exit 0
```
@z

@x
### Audit Logging
@y
### Audit Logging
@z

@x
A post-tool-use hook that logs all tool calls:
@y
A post-tool-use hook that logs all tool calls:
@z

@x
```bash
#!/bin/bash
# scripts/log-tool-call.sh
@y
```bash
#!/bin/bash
# scripts/log-tool-call.sh
@z

@x
INPUT=$(cat)
TIMESTAMP=$(date -u +"%Y-%m-%dT%H:%M:%SZ")
TOOL_NAME=$(echo "$INPUT" | jq -r '.tool_name')
SESSION_ID=$(echo "$INPUT" | jq -r '.session_id')
@y
INPUT=$(cat)
TIMESTAMP=$(date -u +"%Y-%m-%dT%H:%M:%SZ")
TOOL_NAME=$(echo "$INPUT" | jq -r '.tool_name')
SESSION_ID=$(echo "$INPUT" | jq -r '.session_id')
@z

@x
# Append to audit log
echo "$TIMESTAMP | $SESSION_ID | $TOOL_NAME" >> ./audit.log
@y
# Append to audit log
echo "$TIMESTAMP | $SESSION_ID | $TOOL_NAME" >> ./audit.log
@z

@x
# Don't block execution
echo '{"continue": true}'
exit 0
```
@y
# Don't block execution
echo '{"continue": true}'
exit 0
```
@z

@x
### Session Lifecycle
@y
### Session Lifecycle
@z

@x
Session start and end hooks for environment setup and cleanup:
@y
Session start and end hooks for environment setup and cleanup:
@z

@x
```yaml
hooks:
  session_start:
    - type: command
      timeout: 10
      command: |
        INPUT=$(cat)
        SESSION_ID=$(echo "$INPUT" | jq -r '.session_id // "unknown"')
        echo "Session $SESSION_ID started at $(date)" >> /tmp/agent-session.log
        echo '{"hook_specific_output":{"additional_context":"Session initialized."}}'
@y
```yaml
hooks:
  session_start:
    - type: command
      timeout: 10
      command: |
        INPUT=$(cat)
        SESSION_ID=$(echo "$INPUT" | jq -r '.session_id // "unknown"')
        echo "Session $SESSION_ID started at $(date)" >> /tmp/agent-session.log
        echo '{"hook_specific_output":{"additional_context":"Session initialized."}}'
@z

@x
  session_end:
    - type: command
      timeout: 10
      command: |
        INPUT=$(cat)
        SESSION_ID=$(echo "$INPUT" | jq -r '.session_id // "unknown"')
        REASON=$(echo "$INPUT" | jq -r '.reason // "unknown"')
        echo "Session $SESSION_ID ended ($REASON) at $(date)" >> /tmp/agent-session.log
```
@y
  session_end:
    - type: command
      timeout: 10
      command: |
        INPUT=$(cat)
        SESSION_ID=$(echo "$INPUT" | jq -r '.session_id // "unknown"')
        REASON=$(echo "$INPUT" | jq -r '.reason // "unknown"')
        echo "Session $SESSION_ID ended ($REASON) at $(date)" >> /tmp/agent-session.log
```
@z

@x
### Response Logging with Stop Hook
@y
### Response Logging with Stop Hook
@z

@x
Log every model response for analytics or compliance:
@y
Log every model response for analytics or compliance:
@z

@x
```yaml
hooks:
  stop:
    - type: command
      timeout: 10
      command: |
        INPUT=$(cat)
        SESSION_ID=$(echo "$INPUT" | jq -r '.session_id // "unknown"')
        RESPONSE_LENGTH=$(echo "$INPUT" | jq -r '.stop_response // ""' | wc -c | tr -d ' ')
        echo "[$(date)] Session $SESSION_ID - Response: $RESPONSE_LENGTH chars" >> /tmp/agent-responses.log
```
@y
```yaml
hooks:
  stop:
    - type: command
      timeout: 10
      command: |
        INPUT=$(cat)
        SESSION_ID=$(echo "$INPUT" | jq -r '.session_id // "unknown"')
        RESPONSE_LENGTH=$(echo "$INPUT" | jq -r '.stop_response // ""' | wc -c | tr -d ' ')
        echo "[$(date)] Session $SESSION_ID - Response: $RESPONSE_LENGTH chars" >> /tmp/agent-responses.log
```
@z

@x
The `stop` hook is useful for:
@y
The `stop` hook is useful for:
@z

@x
- **Response quality checks** — validate that responses meet criteria before returning
- **Analytics** — track response lengths, patterns, or content
- **Compliance logging** — record all agent outputs for audit
@y
- **Response quality checks** — validate that responses meet criteria before returning
- **Analytics** — track response lengths, patterns, or content
- **Compliance logging** — record all agent outputs for audit
@z

@x
### Error Notifications
@y
### Error Notifications
@z

@x
Send alerts when the agent encounters errors:
@y
Send alerts when the agent encounters errors:
@z

@x
```yaml
hooks:
  notification:
    - type: command
      timeout: 10
      command: |
        INPUT=$(cat)
        LEVEL=$(echo "$INPUT" | jq -r '.notification_level // "unknown"')
        MESSAGE=$(echo "$INPUT" | jq -r '.notification_message // "no message"')
        echo "[$(date)] [$LEVEL] $MESSAGE" >> /tmp/agent-notifications.log
```
@y
```yaml
hooks:
  notification:
    - type: command
      timeout: 10
      command: |
        INPUT=$(cat)
        LEVEL=$(echo "$INPUT" | jq -r '.notification_level // "unknown"')
        MESSAGE=$(echo "$INPUT" | jq -r '.notification_message // "no message"')
        echo "[$(date)] [$LEVEL] $MESSAGE" >> /tmp/agent-notifications.log
```
@z

@x
The `notification` hook fires when:
@y
The `notification` hook fires when:
@z

@x
- The model returns an error (all models failed) — also fires `on_error`
- A degenerate tool call loop is detected — also fires `on_error`
- The maximum iteration limit is reached — also fires `on_max_iterations`
@y
- The model returns an error (all models failed) — also fires `on_error`
- A degenerate tool call loop is detected — also fires `on_error`
- The maximum iteration limit is reached — also fires `on_max_iterations`
@z

@x
Use `on_error` and `on_max_iterations` instead of `notification` when you want a structured handler for one of these conditions without parsing `notification_level`.
@y
Use `on_error` and `on_max_iterations` instead of `notification` when you want a structured handler for one of these conditions without parsing `notification_level`.
@z

@x
### Turn-Start: per-turn context
@y
### Turn-Start: per-turn context
@z

@x
`turn_start` fires at the start of every agent turn (each model call). Anything you contribute via `additional_context` (or plain stdout) is appended as a **transient** system message for that turn only — it is *not* persisted to the session. Use it for fast-moving signals like the date, current git state, or per-turn prompt files. The built-in hooks `add_date`, `add_prompt_files`, `add_git_status`, and `add_git_diff` all target this event.
@y
`turn_start` fires at the start of every agent turn (each model call). Anything you contribute via `additional_context` (or plain stdout) is appended as a **transient** system message for that turn only — it is *not* persisted to the session. Use it for fast-moving signals like the date, current git state, or per-turn prompt files. The built-in hooks `add_date`, `add_prompt_files`, `add_git_status`, and `add_git_diff` all target this event.
@z

@x
### Turn-End: per-turn finalizer
@y
### Turn-End: per-turn finalizer
@z

@x
`turn_end` is the symmetric counterpart of `turn_start`. It fires once per turn when the iteration finishes — no matter why. The runtime guarantees the dispatch on every exit path (a normal stop, an error, a hook-driven shutdown, the loop detector, even context cancellation), and it uses `context.WithoutCancel` internally so handlers run to completion on Ctrl+C.
@y
`turn_end` is the symmetric counterpart of `turn_start`. It fires once per turn when the iteration finishes — no matter why. The runtime guarantees the dispatch on every exit path (a normal stop, an error, a hook-driven shutdown, the loop detector, even context cancellation), and it uses `context.WithoutCancel` internally so handlers run to completion on Ctrl+C.
@z

@x
The `reason` field classifies the exit:
@y
The `reason` field classifies the exit:
@z

@x
| `reason`        | When                                                         |
| --------------- | ------------------------------------------------------------ |
| `normal`        | Model finished cleanly with no follow-up                     |
| `continue`      | More iterations to come (e.g. tool calls, follow-up message) |
| `steered`       | Drained steered messages prompted a re-entry                 |
| `error`         | Model call failed (`handleStreamError` exited the loop)      |
| `canceled`      | Context was cancelled (e.g. Ctrl+C)                          |
| `hook_blocked`  | `before_llm_call` or `post_tool_use` denied the call         |
| `loop_detected` | The consecutive-tool-call loop detector terminated the turn  |
@y
| `reason`        | When                                                         |
| --------------- | ------------------------------------------------------------ |
| `normal`        | Model finished cleanly with no follow-up                     |
| `continue`      | More iterations to come (e.g. tool calls, follow-up message) |
| `steered`       | Drained steered messages prompted a re-entry                 |
| `error`         | Model call failed (`handleStreamError` exited the loop)      |
| `canceled`      | Context was cancelled (e.g. Ctrl+C)                          |
| `hook_blocked`  | `before_llm_call` or `post_tool_use` denied the call         |
| `loop_detected` | The consecutive-tool-call loop detector terminated the turn  |
@z

@x
`turn_end` is observational — the result is ignored. Use it to time turns, accumulate per-turn metrics (token usage, tool counts), or notify external observability pipelines symmetrically with `turn_start`.
@y
`turn_end` is observational — the result is ignored. Use it to time turns, accumulate per-turn metrics (token usage, tool counts), or notify external observability pipelines symmetrically with `turn_start`.
@z

@x
### Before/After-LLM-Call: budget guards and model auditing
@y
### Before/After-LLM-Call: budget guards and model auditing
@z

@x
`before_llm_call` fires immediately before every model call (after `turn_start` has assembled the messages). It cannot contribute context — use `turn_start` for that — but it can **stop the run** by returning `decision: block` (or exit code 2). The built-in `max_iterations` hook implements a hard cap on top of this event.
@y
`before_llm_call` fires immediately before every model call (after `turn_start` has assembled the messages). It cannot contribute context — use `turn_start` for that — but it can **stop the run** by returning `decision: block` (or exit code 2). The built-in `max_iterations` hook implements a hard cap on top of this event.
@z

@x
`after_llm_call` fires immediately after each successful model call, before the response is recorded into the session and tool calls are dispatched. The assistant text is in `stop_response`, and the call's `usage` and `cost` carry the per-turn token usage and computed USD spend (see the field notes above). Use it for response auditing, redaction logging, quality metrics, or a sidecar cost ledger that records per-call spend without subscribing to the runtime event channel. Failed model calls fire `on_error` instead.
@y
`after_llm_call` fires immediately after each successful model call, before the response is recorded into the session and tool calls are dispatched. The assistant text is in `stop_response`, and the call's `usage` and `cost` carry the per-turn token usage and computed USD spend (see the field notes above). Use it for response auditing, redaction logging, quality metrics, or a sidecar cost ledger that records per-call spend without subscribing to the runtime event channel. Failed model calls fire `on_error` instead.
@z

@x
### Before/After-Compaction: structured compaction control
@y
### Before/After-Compaction: structured compaction control
@z

@x
`before_compaction` fires immediately before a compaction. Unlike `pre_compact`, it carries structured token-pressure data: `input_tokens`, `output_tokens`, `context_limit`, and a `compaction_reason` (`threshold`, `overflow`, or `manual`). Hooks can either:
@y
`before_compaction` fires immediately before a compaction. Unlike `pre_compact`, it carries structured token-pressure data: `input_tokens`, `output_tokens`, `context_limit`, and a `compaction_reason` (`threshold`, `overflow`, or `manual`). Hooks can either:
@z

@x
- veto compaction by returning `decision: block` (the runtime skips compaction entirely), or
- replace the LLM-generated summary by returning `hook_specific_output.summary` (the runtime applies that summary verbatim and skips the model call).
@y
- veto compaction by returning `decision: block` (the runtime skips compaction entirely), or
- replace the LLM-generated summary by returning `hook_specific_output.summary` (the runtime applies that summary verbatim and skips the model call).
@z

@x
`after_compaction` fires after a successful compaction. It carries the produced `summary` along with the *pre-compaction* `input_tokens` / `output_tokens` so observability handlers can naturally express "compacted from X to Y". `after_compaction` is purely observational; output is ignored.
@y
`after_compaction` fires after a successful compaction. It carries the produced `summary` along with the *pre-compaction* `input_tokens` / `output_tokens` so observability handlers can naturally express "compacted from X to Y". `after_compaction` is purely observational; output is ignored.
@z

@x
### Agent-Switch and Session-Resume: observability for multi-agent and long runs
@y
### Agent-Switch and Session-Resume: observability for multi-agent and long runs
@z

@x
`on_agent_switch` fires whenever the runtime moves the active agent to a new one — `transfer_task`, `handoff`, `force_handoff`, or the return after a transferred task completes. The cause is in `agent_switch_kind`, the source and destination in `from_agent` and `to_agent`. Use it for audit, transcript, and metrics pipelines that track which agent ran which tools.
@y
`on_agent_switch` fires whenever the runtime moves the active agent to a new one — `transfer_task`, `handoff`, `force_handoff`, or the return after a transferred task completes. The cause is in `agent_switch_kind`, the source and destination in `from_agent` and `to_agent`. Use it for audit, transcript, and metrics pipelines that track which agent ran which tools.
@z

@x
The built-in [`unload`](#available-built-ins) hooks into this event to release the resources held by the previous agent's models. It's the canonical way to run two heavy local models on a GPU that can only fit one at a time:
@y
The built-in [`unload`](#available-built-ins) hooks into this event to release the resources held by the previous agent's models. It's the canonical way to run two heavy local models on a GPU that can only fit one at a time:
@z

@x
```yaml
agents:
  coder:
    model: qwen3-large
    handoffs: [reviewer]
    hooks:
      on_agent_switch:
        - type: builtin
          command: unload
  reviewer:
    model: qwen3-coder
    handoffs: [coder]
    hooks:
      on_agent_switch:
        - type: builtin
          command: unload
@y
```yaml
agents:
  coder:
    model: qwen3-large
    handoffs: [reviewer]
    hooks:
      on_agent_switch:
        - type: builtin
          command: unload
  reviewer:
    model: qwen3-coder
    handoffs: [coder]
    hooks:
      on_agent_switch:
        - type: builtin
          command: unload
@z

@x
models:
  qwen3-large:
    provider: dmr
    model: ai/qwen3-large
  qwen3-coder:
    provider: dmr
    model: ai/qwen3-coder
```
@y
models:
  qwen3-large:
    provider: dmr
    model: ai/qwen3-large
  qwen3-coder:
    provider: dmr
    model: ai/qwen3-coder
```
@z

@x
At every transfer the runtime ships a snapshot of the previous agent's model endpoints on the `on_agent_switch` hook input, and the `unload` builtin POSTs `{"model": "<id>"}` to each DMR endpoint's `/_unload` URL over plain HTTP. For cloud providers (OpenAI, Anthropic, …) the hook is a silent no-op since they don't expose an HTTP unload endpoint. Cross-provider chains are safe — only DMR endpoints are touched. See [`examples/unload_on_switch.yaml`](https://github.com/docker/docker-agent/blob/main/examples/unload_on_switch.yaml) for the full file.
@y
At every transfer the runtime ships a snapshot of the previous agent's model endpoints on the `on_agent_switch` hook input, and the `unload` builtin POSTs `{"model": "<id>"}` to each DMR endpoint's `/_unload` URL over plain HTTP. For cloud providers (OpenAI, Anthropic, …) the hook is a silent no-op since they don't expose an HTTP unload endpoint. Cross-provider chains are safe — only DMR endpoints are touched. See [`examples/unload_on_switch.yaml`](https://github.com/docker/docker-agent/blob/main/examples/unload_on_switch.yaml) for the full file.
@z

@x
`on_session_resume` fires when the user explicitly approves the runtime to continue past its configured `max_iterations` limit. `previous_max_iterations` carries the cap that was reached and `new_max_iterations` carries the new cap after approval. Useful for alerting on extended-runtime sessions or for billing / quota pipelines that meter resumes.
@y
`on_session_resume` fires when the user explicitly approves the runtime to continue past its configured `max_iterations` limit. `previous_max_iterations` carries the cap that was reached and `new_max_iterations` carries the new cap after approval. Useful for alerting on extended-runtime sessions or for billing / quota pipelines that meter resumes.
@z

@x
### Tool-Approval-Decision: who-approved-what audit trail
@y
### Tool-Approval-Decision: who-approved-what audit trail
@z

@x
`on_tool_approval_decision` fires after the runtime's tool-approval chain (permissions / yolo / readonly / pre_tool_use hooks / interactive prompt) has resolved a verdict for a tool call. `approval_decision` is `allow`, `deny`, or `canceled`; `approval_source` is a stable classifier of which step produced the verdict. Observational only — it gives audit pipelines a single, structured "who approved what" record without re-implementing the chain.
@y
`on_tool_approval_decision` fires after the runtime's tool-approval chain (permissions / yolo / readonly / pre_tool_use hooks / interactive prompt) has resolved a verdict for a tool call. `approval_decision` is `allow`, `deny`, or `canceled`; `approval_source` is a stable classifier of which step produced the verdict. Observational only — it gives audit pipelines a single, structured "who approved what" record without re-implementing the chain.
@z

@x
### Worktree-Create: prepare an isolated checkout
@y
### Worktree-Create: prepare an isolated checkout
@z

@x
`worktree_create` fires once, just after `docker agent run --worktree[=name]` creates a fresh [git worktree](../../features/cli/index.md) and **before** the session starts. Each hook runs **inside** the new worktree — its working directory (and `cwd` in the input) is the fresh checkout — so setup commands operate on the new tree rather than your original one. The worktree path and branch are in `worktree_path` and `worktree_branch`, and `worktree_source_dir` carries the repository root it was branched from.
@y
`worktree_create` fires once, just after `docker agent run --worktree[=name]` creates a fresh [git worktree](../../features/cli/index.md) and **before** the session starts. Each hook runs **inside** the new worktree — its working directory (and `cwd` in the input) is the fresh checkout — so setup commands operate on the new tree rather than your original one. The worktree path and branch are in `worktree_path` and `worktree_branch`, and `worktree_source_dir` carries the repository root it was branched from.
@z

@x
Use it to prepare the checkout before the agent begins: copy untracked files git won't carry over (`.env`, local config), install dependencies, or warm caches. Because the worktree lives under the Docker Agent data directory — not next to your checkout — resolve the original files through `worktree_source_dir` rather than a relative path. A hook may **abort the run** by returning `decision: block` / `{"continue": false}` / exit code 2 (for example, when a setup step fails); plain stdout is surfaced as additional context.
@y
Use it to prepare the checkout before the agent begins: copy untracked files git won't carry over (`.env`, local config), install dependencies, or warm caches. Because the worktree lives under the Docker Agent data directory — not next to your checkout — resolve the original files through `worktree_source_dir` rather than a relative path. A hook may **abort the run** by returning `decision: block` / `{"continue": false}` / exit code 2 (for example, when a setup step fails); plain stdout is surfaced as additional context.
@z

@x
```yaml
hooks:
  worktree_create:
    # Copy untracked dotfiles git won't bring into the new worktree.
    - name: seed local env
      type: command
      command: |
        INPUT=$(cat)
        SRC=$(echo "$INPUT" | jq -r '.worktree_source_dir // ""')
        [ -n "$SRC" ] && [ -f "$SRC/.env" ] && [ ! -f .env ] && cp "$SRC/.env" .env
        echo "Prepared worktree"
    # Install dependencies, aborting the run on failure.
    - name: install dependencies
      type: command
      timeout: 600
      command: |
        if [ -f package.json ]; then
          npm install || { echo '{"continue": false, "system_message": "npm install failed"}'; exit 2; }
        fi
```
@y
```yaml
hooks:
  worktree_create:
    # Copy untracked dotfiles git won't bring into the new worktree.
    - name: seed local env
      type: command
      command: |
        INPUT=$(cat)
        SRC=$(echo "$INPUT" | jq -r '.worktree_source_dir // ""')
        [ -n "$SRC" ] && [ -f "$SRC/.env" ] && [ ! -f .env ] && cp "$SRC/.env" .env
        echo "Prepared worktree"
    # Install dependencies, aborting the run on failure.
    - name: install dependencies
      type: command
      timeout: 600
      command: |
        if [ -f package.json ]; then
          npm install || { echo '{"continue": false, "system_message": "npm install failed"}'; exit 2; }
        fi
```
@z

@x
Unlike most events, `worktree_create` is dispatched from the CLI rather than the run loop, because the worktree (and the working directory the runtime, session, tools, and snapshot machinery all capture) must be settled before the runtime and session exist. See [`examples/worktree_create_hook.yaml`](https://github.com/docker/docker-agent/blob/main/examples/worktree_create_hook.yaml) for the full file.
@y
Unlike most events, `worktree_create` is dispatched from the CLI rather than the run loop, because the worktree (and the working directory the runtime, session, tools, and snapshot machinery all capture) must be settled before the runtime and session exist. See [`examples/worktree_create_hook.yaml`](https://github.com/docker/docker-agent/blob/main/examples/worktree_create_hook.yaml) for the full file.
@z

@x
### Pre-Compact: steer the summary
@y
### Pre-Compact: steer the summary
@z

@x
`pre_compact` fires just before the runtime compacts the session transcript. Its `source` field tells you why compaction was triggered:
@y
`pre_compact` fires just before the runtime compacts the session transcript. Its `source` field tells you why compaction was triggered:
@z

@x
- `manual` — the user invoked `/compact`
- `auto` — proactive compaction at the configured threshold
- `overflow` — emergency compaction after a context-overflow error
- `tool_overflow` — proactive compaction triggered by tool results pushing the estimated context past the threshold
@y
- `manual` — the user invoked `/compact`
- `auto` — proactive compaction at the configured threshold
- `overflow` — emergency compaction after a context-overflow error
- `tool_overflow` — proactive compaction triggered by tool results pushing the estimated context past the threshold
@z

@x
Return `additional_context` (or plain stdout) to append guidance to the compaction prompt without modifying the agent's instruction. Block the event (`decision: block` / exit code 2) to cancel compaction — useful when you want to handle truncation yourself.
@y
Return `additional_context` (or plain stdout) to append guidance to the compaction prompt without modifying the agent's instruction. Block the event (`decision: block` / exit code 2) to cancel compaction — useful when you want to handle truncation yourself.
@z

@x
### User-Prompt-Submit: gate or enrich every user message
@y
### User-Prompt-Submit: gate or enrich every user message
@z

@x
`user_prompt_submit` fires once per user message, after the prompt is recorded in the session and before the first model call. The submitted text is in `prompt`. Use it to:
@y
`user_prompt_submit` fires once per user message, after the prompt is recorded in the session and before the first model call. The submitted text is in `prompt`. Use it to:
@z

@x
- block prompts that violate policy (`decision: block` / exit code 2),
- inject per-prompt context (`additional_context` is spliced as a transient system message for that turn),
- audit user prompts to a log.
@y
- block prompts that violate policy (`decision: block` / exit code 2),
- inject per-prompt context (`additional_context` is spliced as a transient system message for that turn),
- audit user prompts to a log.
@z

@x
It does **not** fire for sub-sessions (transferred tasks, background agents, skill sub-sessions) because their kick-off message is synthesised by the runtime.
@y
It does **not** fire for sub-sessions (transferred tasks, background agents, skill sub-sessions) because their kick-off message is synthesised by the runtime.
@z

@x
### User-Steering-Messages-Submit: gate or enrich mid-flight steering
@y
### User-Steering-Messages-Submit: gate or enrich mid-flight steering
@z

@x
`user_steering_messages_submit` is the steering-queue analogue of `user_prompt_submit`. It fires each time the runtime drains the steering queue — messages the user submitted while the agent was already working: mid-turn (after a batch of tool calls), after the model stopped, or while idle before the first model call. The drained messages arrive as a JSON array in `steering_messages`. Use it to:
@y
`user_steering_messages_submit` is the steering-queue analogue of `user_prompt_submit`. It fires each time the runtime drains the steering queue — messages the user submitted while the agent was already working: mid-turn (after a batch of tool calls), after the model stopped, or while idle before the first model call. The drained messages arrive as a JSON array in `steering_messages`. Use it to:
@z

@x
- block a run when steering violates policy (`decision: block` / exit code 2),
- inject context in response to the steering (`additional_context` is spliced as a transient system message for the steered turn — never persisted, exactly like `user_prompt_submit`),
- audit steering messages to a log.
@y
- block a run when steering violates policy (`decision: block` / exit code 2),
- inject context in response to the steering (`additional_context` is spliced as a transient system message for the steered turn — never persisted, exactly like `user_prompt_submit`),
- audit steering messages to a log.
@z

@x
Unlike `turn_end` with `reason: steered`, which only observes the mid-turn and post-stop drains, this event fires on **every** drain — including steering applied while the agent was idle before its first model call.
@y
Unlike `turn_end` with `reason: steered`, which only observes the mid-turn and post-stop drains, this event fires on **every** drain — including steering applied while the agent was idle before its first model call.
@z

@x
```yaml
hooks:
  user_steering_messages_submit:
    - type: command
      timeout: 5
      command: |
        INPUT=$(cat)
        COUNT=$(echo "$INPUT" | jq -r '.steering_messages | length')
        echo "$INPUT" | jq -r '.steering_messages[]' >> /tmp/agent-steering.log
        if [ "$COUNT" -gt 0 ]; then
          echo '{"hook_specific_output":{"additional_context":"The user sent new instructions while you were working — re-read the latest user messages and adjust course before continuing."}}'
        fi
```
@y
```yaml
hooks:
  user_steering_messages_submit:
    - type: command
      timeout: 5
      command: |
        INPUT=$(cat)
        COUNT=$(echo "$INPUT" | jq -r '.steering_messages | length')
        echo "$INPUT" | jq -r '.steering_messages[]' >> /tmp/agent-steering.log
        if [ "$COUNT" -gt 0 ]; then
          echo '{"hook_specific_output":{"additional_context":"The user sent new instructions while you were working — re-read the latest user messages and adjust course before continuing."}}'
        fi
```
@z

@x
### User-Followup-Submit: gate or enrich queued follow-ups
@y
### User-Followup-Submit: gate or enrich queued follow-ups
@z

@x
`user_followup_submit` is the follow-up-queue analogue of `user_prompt_submit`. It fires each time the runtime dequeues a follow-up message at the end of a turn and starts a fresh turn for it. Follow-ups are user messages queued for end-of-turn processing (the FollowUp API / queue) — distinct from mid-turn steering: the model sees a follow-up as fresh input, not an interruption, and each follow-up gets a full undivided turn. The follow-up text is in `prompt`. Use it to:
@y
`user_followup_submit` is the follow-up-queue analogue of `user_prompt_submit`. It fires each time the runtime dequeues a follow-up message at the end of a turn and starts a fresh turn for it. Follow-ups are user messages queued for end-of-turn processing (the FollowUp API / queue) — distinct from mid-turn steering: the model sees a follow-up as fresh input, not an interruption, and each follow-up gets a full undivided turn. The follow-up text is in `prompt`. Use it to:
@z

@x
- block a queued follow-up that violates policy (`decision: block` / exit code 2),
- inject per-follow-up context (`additional_context` is spliced as a transient system message for the follow-up turn — never persisted, exactly like `user_prompt_submit`),
- audit follow-up messages to a log.
@y
- block a queued follow-up that violates policy (`decision: block` / exit code 2),
- inject per-follow-up context (`additional_context` is spliced as a transient system message for the follow-up turn — never persisted, exactly like `user_prompt_submit`),
- audit follow-up messages to a log.
@z

@x
This closes the gap left by `user_prompt_submit`, which fires only for the first interactive prompt and never for queued follow-ups.
@y
This closes the gap left by `user_prompt_submit`, which fires only for the first interactive prompt and never for queued follow-ups.
@z

@x
```yaml
hooks:
  user_followup_submit:
    - type: command
      timeout: 5
      command: |
        INPUT=$(cat)
        echo "$INPUT" | jq -r '.prompt' >> /tmp/agent-followups.log
```
@y
```yaml
hooks:
  user_followup_submit:
    - type: command
      timeout: 5
      command: |
        INPUT=$(cat)
        echo "$INPUT" | jq -r '.prompt' >> /tmp/agent-followups.log
```
@z

@x
### Subagent-Stop: observe handoff completions
@y
### Subagent-Stop: observe handoff completions
@z

@x
`subagent_stop` fires whenever a sub-agent finishes — `transfer_task` returns, a background agent completes, or a skill sub-session ends. It runs against the *parent* agent's hooks executor, so handlers configured on the orchestrator see every child completion in one place. The sub-agent's name is in `agent_name`, the parent's session ID in `parent_session_id`, and the child's final assistant message in `stop_response`.
@y
`subagent_stop` fires whenever a sub-agent finishes — `transfer_task` returns, a background agent completes, or a skill sub-session ends. It runs against the *parent* agent's hooks executor, so handlers configured on the orchestrator see every child completion in one place. The sub-agent's name is in `agent_name`, the parent's session ID in `parent_session_id`, and the child's final assistant message in `stop_response`.
@z

@x
### Permission-Request: programmatic tool approval
@y
### Permission-Request: programmatic tool approval
@z

@x
`permission_request` fires just before the runtime would prompt the user to approve a tool call (i.e. when neither the safety mode nor a permissions rule short-circuited the decision). Use the same `hook_specific_output.permission_decision` shape as `pre_tool_use` to auto-approve or auto-deny the call:
@y
`permission_request` fires just before the runtime would prompt the user to approve a tool call (i.e. when neither the safety mode nor a permissions rule short-circuited the decision). Use the same `hook_specific_output.permission_decision` shape as `pre_tool_use` to auto-approve or auto-deny the call:
@z

@x
```yaml
hooks:
  permission_request:
    - matcher: "shell"
      hooks:
        - type: command
          command: |
            INPUT=$(cat)
            CMD=$(echo "$INPUT" | jq -r '.tool_input.cmd // ""')
            if echo "$CMD" | grep -qE '^(ls|pwd|cat) '; then
              echo '{"hook_specific_output":{"permission_decision":"allow","permission_decision_reason":"safe read-only command"}}'
            fi
```
@y
```yaml
hooks:
  permission_request:
    - matcher: "shell"
      hooks:
        - type: command
          command: |
            INPUT=$(cat)
            CMD=$(echo "$INPUT" | jq -r '.tool_input.cmd // ""')
            if echo "$CMD" | grep -qE '^(ls|pwd|cat) '; then
              echo '{"hook_specific_output":{"permission_decision":"allow","permission_decision_reason":"safe read-only command"}}'
            fi
```
@z

@x
Return nothing to fall through to the usual interactive confirmation.
@y
Return nothing to fall through to the usual interactive confirmation.
@z

@x
When the hook falls through (returns no `permission_decision`), it can still attach key/value `metadata` to the confirmation prompt the runtime shows the user. The runtime merges it onto any static metadata the toolset attached to the tool (hook keys win on a clash) and emits it on the tool-call confirmation message, so clients (TUI, HTTP) can render extra per-call context. Keys from multiple matching hooks are merged; the last hook in config order wins on a clash.
@y
When the hook falls through (returns no `permission_decision`), it can still attach key/value `metadata` to the confirmation prompt the runtime shows the user. The runtime merges it onto any static metadata the toolset attached to the tool (hook keys win on a clash) and emits it on the tool-call confirmation message, so clients (TUI, HTTP) can render extra per-call context. Keys from multiple matching hooks are merged; the last hook in config order wins on a clash.
@z

@x
```yaml
hooks:
  permission_request:
    - matcher: "shell"
      hooks:
        - type: command
          command: |
            INPUT=$(cat)
            CMD=$(echo "$INPUT" | jq -r '.tool_input.cmd // ""')
            if echo "$CMD" | grep -qE '\brm\b'; then
              echo '{"hook_specific_output":{"metadata":{"risk":"high","note":"deletes files"}}}'
            fi
```
@y
```yaml
hooks:
  permission_request:
    - matcher: "shell"
      hooks:
        - type: command
          command: |
            INPUT=$(cat)
            CMD=$(echo "$INPUT" | jq -r '.tool_input.cmd // ""')
            if echo "$CMD" | grep -qE '\brm\b'; then
              echo '{"hook_specific_output":{"metadata":{"risk":"high","note":"deletes files"}}}'
            fi
```
@z

@x
### LLM as a Judge (Auto-Approving Tool Calls)
@y
### LLM as a Judge (Auto-Approving Tool Calls)
@z

@x
The `model` hook type asks an LLM and translates its reply into the
hook's native output — no Go code, no shell glue, no JSON parsing on
your side. Combined with the well-known `pre_tool_use_decision`
schema it gives you a fully-configurable LLM judge that decides
`allow` / `ask` / `deny` per tool call.
@y
The `model` hook type asks an LLM and translates its reply into the
hook's native output — no Go code, no shell glue, no JSON parsing on
your side. Combined with the well-known `pre_tool_use_decision`
schema it gives you a fully-configurable LLM judge that decides
`allow` / `ask` / `deny` per tool call.
@z

@x
```yaml
hooks:
  pre_tool_use:
    - matcher: "shell|edit_file|mcp:.*"
      hooks:
        - type: model
          model: openai/gpt-4o-mini
          timeout: 15
          schema: pre_tool_use_decision
          prompt: |
            You are a security judge for an autonomous agent.
            Decide whether this tool call is safe to auto-approve.
@y
```yaml
hooks:
  pre_tool_use:
    - matcher: "shell|edit_file|mcp:.*"
      hooks:
        - type: model
          model: openai/gpt-4o-mini
          timeout: 15
          schema: pre_tool_use_decision
          prompt: |
            You are a security judge for an autonomous agent.
            Decide whether this tool call is safe to auto-approve.
@z

@x
            Tool: {{ .ToolName }}
            Args: {{ .ToolInput | toJSON }}
@y
            Tool: {{ .ToolName }}
            Args: {{ .ToolInput | toJSON }}
@z

@x
            Project rules:
            - Reads under the working directory are safe.
            - Writes to ~/.ssh / ~/.aws / ~/.docker are deny.
```
@y
            Project rules:
            - Reads under the working directory are safe.
            - Writes to ~/.ssh / ~/.aws / ~/.docker are deny.
```
@z

@x
| Field     | Required         | Description                                                                                                                                                               |
| --------- | ---------------- | ------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| `model`   | yes              | Model spec (`provider/model`, e.g. `openai/gpt-4o-mini`). The judge model — small/cheap is recommended.                                                                   |
| `prompt`  | yes              | Go [`text/template`](https://pkg.go.dev/text/template) body. Sees the hook [Input](#hook-input) as data, plus the `toJSON` and `truncate <n>` helpers.                    |
| `schema`  | no               | Well-known response interpretation. `pre_tool_use_decision` produces a `permission_decision` verdict; omit for free-form text injected as `additional_context`.           |
| `timeout` | no (default 60s) | Per-call timeout. **Timeouts fail closed (deny) for `pre_tool_use`** regardless of any other setting. Match it to your judge model's typical latency plus a small buffer. |
@y
| Field     | Required         | Description                                                                                                                                                               |
| --------- | ---------------- | ------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| `model`   | yes              | Model spec (`provider/model`, e.g. `openai/gpt-4o-mini`). The judge model — small/cheap is recommended.                                                                   |
| `prompt`  | yes              | Go [`text/template`](https://pkg.go.dev/text/template) body. Sees the hook [Input](#hook-input) as data, plus the `toJSON` and `truncate <n>` helpers.                    |
| `schema`  | no               | Well-known response interpretation. `pre_tool_use_decision` produces a `permission_decision` verdict; omit for free-form text injected as `additional_context`.           |
| `timeout` | no (default 60s) | Per-call timeout. **Timeouts fail closed (deny) for `pre_tool_use`** regardless of any other setting. Match it to your judge model's typical latency plus a small buffer. |
@z

@x
The `pre_tool_use_decision` schema constrains the judge to reply with
strict `{decision, reason}` JSON. Providers that honor structured
output (OpenAI, ...) are asked to emit that shape directly; on
providers that ignore it the framework still parses tolerant
JSON-in-text. Anything unparseable propagates as a hook error and the
executor falls closed (deny) on `pre_tool_use`.
@y
The `pre_tool_use_decision` schema constrains the judge to reply with
strict `{decision, reason}` JSON. Providers that honor structured
output (OpenAI, ...) are asked to emit that shape directly; on
providers that ignore it the framework still parses tolerant
JSON-in-text. Anything unparseable propagates as a hook error and the
executor falls closed (deny) on `pre_tool_use`.
@z

@x
Pair it with deterministic `permissions:` rules so destructive calls
(e.g. `sudo`, `rm -rf`) are blocked even if the judge is misled, and
obvious read-only calls bypass the LLM entirely. See
[`examples/llm_judge.yaml`](https://github.com/docker/docker-agent/blob/main/examples/llm_judge.yaml)
for a complete configuration.
@y
Pair it with deterministic `permissions:` rules so destructive calls
(e.g. `sudo`, `rm -rf`) are blocked even if the judge is misled, and
obvious read-only calls bypass the LLM entirely. See
[`examples/llm_judge.yaml`](https://github.com/docker/docker-agent/blob/main/examples/llm_judge.yaml)
for a complete configuration.
@z

@x
**Security considerations**:
@y
**Security considerations**:
@z

@x
- **Sensitive data**: Tool arguments (including file paths, command
  arguments, and any other parameters) are sent to the judge LLM. Avoid
  using the judge on tools that handle secrets, or ensure your judge
  model is self-hosted.
- **Defense in depth**: The judge should not be your only security
  layer. Use deterministic `permissions:` rules to block obviously
  dangerous operations (e.g., `sudo`, `rm -rf`) before the judge sees
  them, as shown in the example configuration.
@y
- **Sensitive data**: Tool arguments (including file paths, command
  arguments, and any other parameters) are sent to the judge LLM. Avoid
  using the judge on tools that handle secrets, or ensure your judge
  model is self-hosted.
- **Defense in depth**: The judge should not be your only security
  layer. Use deterministic `permissions:` rules to block obviously
  dangerous operations (e.g., `sudo`, `rm -rf`) before the judge sees
  them, as shown in the example configuration.
@z

@x
## CLI Flags
@y
## CLI Flags
@z

@x
You can add hooks from the command line without modifying the agent's YAML file. This is useful for one-off debugging, audit logging, or layering hooks onto an existing agent.
@y
You can add hooks from the command line without modifying the agent's YAML file. This is useful for one-off debugging, audit logging, or layering hooks onto an existing agent.
@z

@x
| Flag                   | Description                                      |
| ---------------------- | ------------------------------------------------ |
| `--hook-pre-tool-use`  | Run a command before every tool call             |
| `--hook-post-tool-use` | Run a command after every tool call              |
| `--hook-session-start` | Run a command when a session starts              |
| `--hook-session-end`   | Run a command when a session ends                |
| `--hook-on-user-input` | Run a command when waiting for input             |
| `--hook-stop`          | Run a command when the model finishes responding |
@y
| Flag                   | Description                                      |
| ---------------------- | ------------------------------------------------ |
| `--hook-pre-tool-use`  | Run a command before every tool call             |
| `--hook-post-tool-use` | Run a command after every tool call              |
| `--hook-session-start` | Run a command when a session starts              |
| `--hook-session-end`   | Run a command when a session ends                |
| `--hook-on-user-input` | Run a command when waiting for input             |
| `--hook-stop`          | Run a command when the model finishes responding |
@z

@x
All flags are repeatable — pass multiple to register multiple hooks.
@y
All flags are repeatable — pass multiple to register multiple hooks.
@z

@x
```bash
# Add a session-start hook
$ docker agent run agent.yaml --hook-session-start "./scripts/setup-env.sh"
@y
```bash
# Add a session-start hook
$ docker agent run agent.yaml --hook-session-start "./scripts/setup-env.sh"
@z

@x
# Combine multiple hooks
$ docker agent run agent.yaml \
  --hook-pre-tool-use "./scripts/validate.sh" \
  --hook-post-tool-use "./scripts/log.sh"
@y
# Combine multiple hooks
$ docker agent run agent.yaml \
  --hook-pre-tool-use "./scripts/validate.sh" \
  --hook-post-tool-use "./scripts/log.sh"
@z

@x
# Add hooks to an agent from a registry
$ docker agent run myorg/coder \
  --hook-pre-tool-use "./audit.sh"
```
@y
# Add hooks to an agent from a registry
$ docker agent run myorg/coder \
  --hook-pre-tool-use "./audit.sh"
```
@z

@x
> [!NOTE]
> **Merging behavior**
>
> Agent-config, global, drop-in, and CLI hooks are additive. For each event, hooks run in this order: agent-config hooks first, then global hooks from `settings.hooks`, then [hook drop-ins](#hook-drop-in-files-hooksd) from `hooks.d/`, then CLI hooks. No source replaces another, and individual agents cannot opt out of global hooks.
@y
> [!NOTE]
> **Merging behavior**
>
> Agent-config, global, drop-in, and CLI hooks are additive. For each event, hooks run in this order: agent-config hooks first, then global hooks from `settings.hooks`, then [hook drop-ins](#hook-drop-in-files-hooksd) from `hooks.d/`, then CLI hooks. No source replaces another, and individual agents cannot opt out of global hooks.
@z
