%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

% __SUBDIR__ 対応

@x
title: "CLI Reference"
description: "Complete reference for all Docker Agent command-line commands and flags."
keywords: docker agent, ai agents, features, cli reference
@y
title: "CLI Reference"
description: "Complete reference for all Docker Agent command-line commands and flags."
keywords: docker agent, ai agents, features, cli reference
@z

@x
canonical: https://docs.docker.com/ai/docker-agent/features/cli/
@y
canonical: __SUBDIR__/ai/docker-agent/features/cli/
@z

@x
_Complete reference for all Docker Agent command-line commands and flags._
@y
_Complete reference for all Docker Agent command-line commands and flags._
@z

@x
> [!TIP]
> **No config needed**
>
> Running `docker agent run` without a config argument uses `docker-agent.yaml`, `docker-agent.yml`, or `docker-agent.hcl` from the current directory when present. Otherwise, it uses a built-in default agent that is perfect for quick experimentation.
@y
> [!TIP]
> **No config needed**
>
> Running `docker agent run` without a config argument uses `docker-agent.yaml`, `docker-agent.yml`, or `docker-agent.hcl` from the current directory when present. Otherwise, it uses a built-in default agent that is perfect for quick experimentation.
@z

@x
## Commands
@y
## Commands
@z

@x
### `docker agent run`
@y
### `docker agent run`
@z

@x
Launch the interactive TUI with an agent configuration (`.yaml`, `.yml`, or `.hcl`).
@y
Launch the interactive TUI with an agent configuration (`.yaml`, `.yml`, or `.hcl`).
@z

@x
```bash
$ docker agent run [config] [message...] [flags]
```
@y
```bash
$ docker agent run [config] [message...] [flags]
```
@z

@x
| Flag                                    | Description                                                                                                                               |
| --------------------------------------- | ----------------------------------------------------------------------------------------------------------------------------------------- |
| `-a, --agent <name>`                    | Run a specific agent from the config                                                                                                      |
| `--yolo`                                | Auto-approve tool calls (unless explicitly denied). Legacy alias for `--safety autonomous`.                                              |
| `--safety <mode>`                       | Safety mode for tool approval: `strict` (ask for everything), `balanced` (auto-approve safe calls), `restricted` (auto-approve safe calls, deny the rest — fail-closed for unattended runs), or `autonomous` (approve everything). Wins over `--yolo` when both are given. Without the flag, the mode falls back to alias/user-config defaults, then the agent YAML's `agents.<name>.safety` / `runtime.safety`; a resumed session keeps its stored mode unless `--safety`/`--yolo` is passed explicitly. See [Safety Modes](../../configuration/permissions/index.md#safety-modes). |
| `--model <ref>`                         | Override model(s). Use `provider/model` for all agents, or `agent=provider/model` for specific agents. Comma-separate multiple overrides. |
| `--session <id>`                        | Resume a previous session. Supports relative refs (`-1` = newest by creation time, `-2` = second-newest, … — creation order, not last-used). An explicit ID that does not exist yet is created with that ID, so a supervisor can own the session ID upfront and reuse it across runs. |
| `-s, --session-db <path>`               | Path to the SQLite session database (default: `<data-dir>/session.db`, so `~/.cagent/session.db` unless `--data-dir` is set)              |
| `--session-read-only`                   | Open the TUI in read-only mode: conversation history is displayed but no new messages can be sent to the LLM. Cannot be used with `--exec`. |
| `--prompt-file <path>`                  | Include file contents as additional system context (repeatable)                                                                           |
| `--attach <path>`                       | Attach an image file to the initial message                                                                                               |
| `--dry-run`                             | Initialize the agent without executing anything (useful for validating a config)                                                          |
| `--remote <addr>`                       | Use a remote runtime at the given address instead of running the agent locally. Mutually exclusive with `--sandbox`, `--worktree`, `--worktree-pr`, `--worktree-base`, `--session`, `--session-db`, `--record`, and `--fake` — a remote runtime owns its own session storage and execution environment, so these local-only concerns don't apply. |
| `--listen <addr>`                       | Expose this run's control plane over HTTP so an external process can drive the running TUI (send follow-ups, stream events, read the title). Accepts `host:port` or `unix://`, `npipe://`, `fd://`. Hidden from `docker agent run --help` — like `debug`, it's a stable but advanced/automation-oriented flag rather than a day-to-day one. See the [API Server](../api-server/index.md#listen) guide for the full walkthrough. |
| `--session-workingdir-root <path>`      | Confine the `working_dir` of sessions created through the `--listen` control plane to this directory and its descendants (default: no restriction — any clean host directory is accepted, though raw values containing `..` are rejected). Recommended when the control plane is reachable by other users. Hidden from `--help`, like `--listen`. |
| `--lean`                                | Use a simplified, non-alternate-screen TUI. Unlike the default full-screen TUI, this renders inline in the normal terminal buffer — useful in environments where an alternate screen is unwanted (e.g. inside tmux panes, CI with a tty, or log-friendly pipelines). Like the full TUI, displays an ASCII art banner on startup when the chat is empty. |
| `--app-name <name>`                     | Override the application name label shown in the TUI (status bar, window title, "/exit" notifications).                                   |
| `--sidebar`                             | Control sidebar visibility. Set to `--sidebar=false` to hide the sidebar and disable the Ctrl+B toggle (default: `true`).                 |
| `--disable-commands <list>`             | Hide and disable specific slash commands in the TUI. Accepts a comma-separated list of command names (leading slash optional, case-insensitive). E.g. `--disable-commands="/cost,/eval,/model"`. |
| `--theme <name>`                        | Preselect a TUI theme by name, or `auto` to follow the terminal's light/dark background (overrides the theme from user config; ignored outside the interactive TUI) |
| `--on-event <type>=<cmd>`               | Run a shell command when an event of the given type fires (`*=<cmd>` matches any event). Repeatable.                                      |
| `--json`                                | Output results as newline-delimited JSON (use with `--exec`)                                                                              |
| `--hide-tool-calls`                     | Hide tool calls in the output                                                                                                             |
| `--hide-tool-results`                   | Hide tool call results in the output                                                                                                      |
| `--sandbox`                             | Run the agent in sandbox mode using `sbx` (see [Sandbox](../../configuration/sandbox/index.md))                                 |
| `--template <image>`                    | Template image for the sandbox (default: `docker/docker-agent-sbx-templates:latest`)                                                      |
| `--no-kit`                              | Disable the [auto-kit](../../configuration/sandbox/index.md#auto-kit): do not stage skills or prompt files into the sandbox    |
| `--agent-picker [refs]`                 | Show a full-screen interactive picker before launching, letting you browse and select an agent. Accepts an optional comma-separated list of agent references to show (defaults to the built-in `default` and `coder` agents plus any agent configs found in `~/.agents`). Arrow keys navigate; `?` toggles the YAML preview panel; `l` (or mouse-click) toggles the **Lean Mode** checkbox to launch in the lean TUI; `b` (or clicking **[ Open Board ]**) opens the Kanban board (`docker agent board`) instead of running an agent; Enter confirms. Not available in `--exec` or non-TTY modes. |
| `-w, --worktree [name]`                 | Run the agent in a fresh git worktree of the working directory, isolating its changes from your checkout. Optionally name it (`--worktree=my-feature`); otherwise a name is generated. Requires the working directory to be inside a git repository. Every tool (the shell included) runs inside the worktree. Combine with `--working-dir` to branch from another repository, and with `--session` to resume into the same worktree later. Cannot be combined with `--remote` or `--sandbox`. When the session ends, a clean worktree is removed automatically; one with work prompts to keep or remove (never in `--exec`). |
| `--worktree-base <ref>`                  | Branch the `--worktree` from `<ref>` (a branch, tag, commit, or remote-tracking ref like `origin/main`) instead of the current `HEAD`. A remote-tracking ref is fetched first so the worktree starts from the latest remote state. Requires `--worktree`; cannot be combined with `--worktree-pr`, `--remote`, or `--sandbox`. |
| `--worktree-pr <number\|url>`            | Run the agent in a git worktree checked out on an existing GitHub pull request (PR number, `#123`, or PR URL). Continues the PR's branch so commits push back to it. Requires the [GitHub CLI](https://cli.github.com/) (`gh`). Cannot be combined with `--worktree`, `--remote`, or `--sandbox`. |
| `--working-dir <path>`                  | Set the working directory for the session (applies to tools and relative paths)                                                           |
| `--env-from-file <path>`                | Load environment variables from file (repeatable)                                                                                         |
| `--flavor <name>`                       | Enable a config flavor, a YAML patch defined under the config's `flavors` section (repeatable, applied in order). See [Flavors](../../configuration/flavors/index.md). |
| `--code-mode-tools`                     | Provide a single tool to call other tools via JavaScript (forces code-mode tools globally)                                                |
| `--models-gateway <addr>`               | Route model traffic through a gateway. Also reads `DOCKER_AGENT_MODELS_GATEWAY` (legacy `CAGENT_MODELS_GATEWAY`) env var.                  |
| `--hook-pre-tool-use <cmd>`             | Add a pre-tool-use hook command (repeatable). See [Hooks](../../configuration/hooks/index.md).                                  |
| `--hook-post-tool-use <cmd>`            | Add a post-tool-use hook command (repeatable)                                                                                             |
| `--hook-session-start <cmd>`            | Add a session-start hook command (repeatable)                                                                                             |
| `--hook-session-end <cmd>`              | Add a session-end hook command (repeatable)                                                                                               |
| `--hook-on-user-input <cmd>`            | Add an on-user-input hook command (repeatable)                                                                                            |
| `--hook-stop <cmd>`                     | Add a stop hook command, fired when the model finishes responding (repeatable)                                                            |
| `--fake <path>`                         | Replay AI responses from a cassette file (for testing). Mutually exclusive with `--record`.                                               |
| `--fake-stream [ms]`                    | When replaying with `--fake`, simulate streaming with a delay between chunks (defaults to 15ms when given without a value).               |
| `--record [path]`                       | Record AI API interactions to a cassette file and generate a TUI e2e test from the session (auto-generates filename if no path given). Routes through `--models-gateway` when one is configured. |
| `-d, --debug`                           | Enable debug logging                                                                                                                      |
| `--log-file <path>`                     | Custom debug log location                                                                                                                 |
| `-o, --otel`                            | Enable OpenTelemetry observability: traces, metrics, and logs. Requires `OTEL_EXPORTER_OTLP_ENDPOINT` to export to a collector. |
@y
| Flag                                    | Description                                                                                                                               |
| --------------------------------------- | ----------------------------------------------------------------------------------------------------------------------------------------- |
| `-a, --agent <name>`                    | Run a specific agent from the config                                                                                                      |
| `--yolo`                                | Auto-approve tool calls (unless explicitly denied). Legacy alias for `--safety autonomous`.                                              |
| `--safety <mode>`                       | Safety mode for tool approval: `strict` (ask for everything), `balanced` (auto-approve safe calls), `restricted` (auto-approve safe calls, deny the rest — fail-closed for unattended runs), or `autonomous` (approve everything). Wins over `--yolo` when both are given. Without the flag, the mode falls back to alias/user-config defaults, then the agent YAML's `agents.<name>.safety` / `runtime.safety`; a resumed session keeps its stored mode unless `--safety`/`--yolo` is passed explicitly. See [Safety Modes](../../configuration/permissions/index.md#safety-modes). |
| `--model <ref>`                         | Override model(s). Use `provider/model` for all agents, or `agent=provider/model` for specific agents. Comma-separate multiple overrides. |
| `--session <id>`                        | Resume a previous session. Supports relative refs (`-1` = newest by creation time, `-2` = second-newest, … — creation order, not last-used). An explicit ID that does not exist yet is created with that ID, so a supervisor can own the session ID upfront and reuse it across runs. |
| `-s, --session-db <path>`               | Path to the SQLite session database (default: `<data-dir>/session.db`, so `~/.cagent/session.db` unless `--data-dir` is set)              |
| `--session-read-only`                   | Open the TUI in read-only mode: conversation history is displayed but no new messages can be sent to the LLM. Cannot be used with `--exec`. |
| `--prompt-file <path>`                  | Include file contents as additional system context (repeatable)                                                                           |
| `--attach <path>`                       | Attach an image file to the initial message                                                                                               |
| `--dry-run`                             | Initialize the agent without executing anything (useful for validating a config)                                                          |
| `--remote <addr>`                       | Use a remote runtime at the given address instead of running the agent locally. Mutually exclusive with `--sandbox`, `--worktree`, `--worktree-pr`, `--worktree-base`, `--session`, `--session-db`, `--record`, and `--fake` — a remote runtime owns its own session storage and execution environment, so these local-only concerns don't apply. |
| `--listen <addr>`                       | Expose this run's control plane over HTTP so an external process can drive the running TUI (send follow-ups, stream events, read the title). Accepts `host:port` or `unix://`, `npipe://`, `fd://`. Hidden from `docker agent run --help` — like `debug`, it's a stable but advanced/automation-oriented flag rather than a day-to-day one. See the [API Server](../api-server/index.md#listen) guide for the full walkthrough. |
| `--session-workingdir-root <path>`      | Confine the `working_dir` of sessions created through the `--listen` control plane to this directory and its descendants (default: no restriction — any clean host directory is accepted, though raw values containing `..` are rejected). Recommended when the control plane is reachable by other users. Hidden from `--help`, like `--listen`. |
| `--lean`                                | Use a simplified, non-alternate-screen TUI. Unlike the default full-screen TUI, this renders inline in the normal terminal buffer — useful in environments where an alternate screen is unwanted (e.g. inside tmux panes, CI with a tty, or log-friendly pipelines). Like the full TUI, displays an ASCII art banner on startup when the chat is empty. |
| `--app-name <name>`                     | Override the application name label shown in the TUI (status bar, window title, "/exit" notifications).                                   |
| `--sidebar`                             | Control sidebar visibility. Set to `--sidebar=false` to hide the sidebar and disable the Ctrl+B toggle (default: `true`).                 |
| `--disable-commands <list>`             | Hide and disable specific slash commands in the TUI. Accepts a comma-separated list of command names (leading slash optional, case-insensitive). E.g. `--disable-commands="/cost,/eval,/model"`. |
| `--theme <name>`                        | Preselect a TUI theme by name, or `auto` to follow the terminal's light/dark background (overrides the theme from user config; ignored outside the interactive TUI) |
| `--on-event <type>=<cmd>`               | Run a shell command when an event of the given type fires (`*=<cmd>` matches any event). Repeatable.                                      |
| `--json`                                | Output results as newline-delimited JSON (use with `--exec`)                                                                              |
| `--hide-tool-calls`                     | Hide tool calls in the output                                                                                                             |
| `--hide-tool-results`                   | Hide tool call results in the output                                                                                                      |
| `--sandbox`                             | Run the agent in sandbox mode using `sbx` (see [Sandbox](../../configuration/sandbox/index.md))                                 |
| `--template <image>`                    | Template image for the sandbox (default: `docker/docker-agent-sbx-templates:latest`)                                                      |
| `--no-kit`                              | Disable the [auto-kit](../../configuration/sandbox/index.md#auto-kit): do not stage skills or prompt files into the sandbox    |
| `--agent-picker [refs]`                 | Show a full-screen interactive picker before launching, letting you browse and select an agent. Accepts an optional comma-separated list of agent references to show (defaults to the built-in `default` and `coder` agents plus any agent configs found in `~/.agents`). Arrow keys navigate; `?` toggles the YAML preview panel; `l` (or mouse-click) toggles the **Lean Mode** checkbox to launch in the lean TUI; `b` (or clicking **[ Open Board ]**) opens the Kanban board (`docker agent board`) instead of running an agent; Enter confirms. Not available in `--exec` or non-TTY modes. |
| `-w, --worktree [name]`                 | Run the agent in a fresh git worktree of the working directory, isolating its changes from your checkout. Optionally name it (`--worktree=my-feature`); otherwise a name is generated. Requires the working directory to be inside a git repository. Every tool (the shell included) runs inside the worktree. Combine with `--working-dir` to branch from another repository, and with `--session` to resume into the same worktree later. Cannot be combined with `--remote` or `--sandbox`. When the session ends, a clean worktree is removed automatically; one with work prompts to keep or remove (never in `--exec`). |
| `--worktree-base <ref>`                  | Branch the `--worktree` from `<ref>` (a branch, tag, commit, or remote-tracking ref like `origin/main`) instead of the current `HEAD`. A remote-tracking ref is fetched first so the worktree starts from the latest remote state. Requires `--worktree`; cannot be combined with `--worktree-pr`, `--remote`, or `--sandbox`. |
| `--worktree-pr <number\|url>`            | Run the agent in a git worktree checked out on an existing GitHub pull request (PR number, `#123`, or PR URL). Continues the PR's branch so commits push back to it. Requires the [GitHub CLI](https://cli.github.com/) (`gh`). Cannot be combined with `--worktree`, `--remote`, or `--sandbox`. |
| `--working-dir <path>`                  | Set the working directory for the session (applies to tools and relative paths)                                                           |
| `--env-from-file <path>`                | Load environment variables from file (repeatable)                                                                                         |
| `--flavor <name>`                       | Enable a config flavor, a YAML patch defined under the config's `flavors` section (repeatable, applied in order). See [Flavors](../../configuration/flavors/index.md). |
| `--code-mode-tools`                     | Provide a single tool to call other tools via JavaScript (forces code-mode tools globally)                                                |
| `--models-gateway <addr>`               | Route model traffic through a gateway. Also reads `DOCKER_AGENT_MODELS_GATEWAY` (legacy `CAGENT_MODELS_GATEWAY`) env var.                  |
| `--hook-pre-tool-use <cmd>`             | Add a pre-tool-use hook command (repeatable). See [Hooks](../../configuration/hooks/index.md).                                  |
| `--hook-post-tool-use <cmd>`            | Add a post-tool-use hook command (repeatable)                                                                                             |
| `--hook-session-start <cmd>`            | Add a session-start hook command (repeatable)                                                                                             |
| `--hook-session-end <cmd>`              | Add a session-end hook command (repeatable)                                                                                               |
| `--hook-on-user-input <cmd>`            | Add an on-user-input hook command (repeatable)                                                                                            |
| `--hook-stop <cmd>`                     | Add a stop hook command, fired when the model finishes responding (repeatable)                                                            |
| `--fake <path>`                         | Replay AI responses from a cassette file (for testing). Mutually exclusive with `--record`.                                               |
| `--fake-stream [ms]`                    | When replaying with `--fake`, simulate streaming with a delay between chunks (defaults to 15ms when given without a value).               |
| `--record [path]`                       | Record AI API interactions to a cassette file and generate a TUI e2e test from the session (auto-generates filename if no path given). Routes through `--models-gateway` when one is configured. |
| `-d, --debug`                           | Enable debug logging                                                                                                                      |
| `--log-file <path>`                     | Custom debug log location                                                                                                                 |
| `-o, --otel`                            | Enable OpenTelemetry observability: traces, metrics, and logs. Requires `OTEL_EXPORTER_OTLP_ENDPOINT` to export to a collector. |
@z

@x
```bash
# Examples
$ docker agent run agent.yaml
$ docker agent run agent.yaml "Fix the bug in auth.go"
$ docker agent run agent.yaml -a developer --yolo
$ docker agent run agent.yaml --model anthropic/claude-sonnet-4-5
$ docker agent run agent.yaml --model "dev=openai/gpt-4o,reviewer=anthropic/claude-sonnet-4-5"
$ docker agent run agent.yaml --session -1  # resume last session
$ docker agent run agent.yaml --session -1 --session-read-only  # review last session without sending messages
$ docker agent run agent.yaml --prompt-file ./context.md  # include file as context
@y
```bash
# Examples
$ docker agent run agent.yaml
$ docker agent run agent.yaml "Fix the bug in auth.go"
$ docker agent run agent.yaml -a developer --yolo
$ docker agent run agent.yaml --model anthropic/claude-sonnet-4-5
$ docker agent run agent.yaml --model "dev=openai/gpt-4o,reviewer=anthropic/claude-sonnet-4-5"
$ docker agent run agent.yaml --session -1  # resume last session
$ docker agent run agent.yaml --session -1 --session-read-only  # review last session without sending messages
$ docker agent run agent.yaml --prompt-file ./context.md  # include file as context
@z

@x
# Add hooks from the command line
$ docker agent run agent.yaml --hook-session-start "./scripts/setup-env.sh"
$ docker agent run agent.yaml --hook-pre-tool-use "./scripts/validate.sh" --hook-post-tool-use "./scripts/log.sh"
@y
# Add hooks from the command line
$ docker agent run agent.yaml --hook-session-start "./scripts/setup-env.sh"
$ docker agent run agent.yaml --hook-pre-tool-use "./scripts/validate.sh" --hook-post-tool-use "./scripts/log.sh"
@z

@x
# Queue multiple messages (processed in sequence)
$ docker agent run agent.yaml "question 1" "question 2" "question 3"
@y
# Queue multiple messages (processed in sequence)
$ docker agent run agent.yaml "question 1" "question 2" "question 3"
@z

@x
# Customize TUI display
$ docker agent run agent.yaml --app-name "My Project"
$ docker agent run agent.yaml --sidebar=false
$ docker agent run agent.yaml --disable-commands="/cost,/eval,/model"
@y
# Customize TUI display
$ docker agent run agent.yaml --app-name "My Project"
$ docker agent run agent.yaml --sidebar=false
$ docker agent run agent.yaml --disable-commands="/cost,/eval,/model"
@z

@x
# Browse and pick an agent interactively
$ docker agent run --agent-picker
$ docker agent run --agent-picker=myorg/coder,myorg/researcher
```
@y
# Browse and pick an agent interactively
$ docker agent run --agent-picker
$ docker agent run --agent-picker=myorg/coder,myorg/researcher
```
@z

@x
> [!TIP]
> **Lean, inline TUI**
>
> Pass `--lean` to get a lightweight TUI that renders inline in your terminal (no alternate screen). Like the full TUI, it displays an ASCII art banner on startup when the chat is empty, and supports the same slash commands and streaming output, making it handy inside tmux, scripts, or any context where a full-screen takeover is unwanted.
@y
> [!TIP]
> **Lean, inline TUI**
>
> Pass `--lean` to get a lightweight TUI that renders inline in your terminal (no alternate screen). Like the full TUI, it displays an ASCII art banner on startup when the chat is empty, and supports the same slash commands and streaming output, making it handy inside tmux, scripts, or any context where a full-screen takeover is unwanted.
@z

@x
> [!TIP]
> **Isolate a run in a git worktree**
>
> When the working directory is inside a git repository, `--worktree` creates a fresh [git worktree](https://git-scm.com/docs/git-worktree) and points the session at it, so the agent's edits land on a separate branch and never touch your checkout. Every tool — the shell included — runs inside the worktree. The worktree is stored under `<data-dir>/worktrees/<name>` on a branch named `worktree-<name>`.
@y
> [!TIP]
> **Isolate a run in a git worktree**
>
> When the working directory is inside a git repository, `--worktree` creates a fresh [git worktree](https://git-scm.com/docs/git-worktree) and points the session at it, so the agent's edits land on a separate branch and never touch your checkout. Every tool — the shell included — runs inside the worktree. The worktree is stored under `<data-dir>/worktrees/<name>` on a branch named `worktree-<name>`.
@z

@x
```bash
# Run in an isolated worktree with a generated name (e.g. "focused_turing")
$ docker agent run agent.yaml --worktree
$ docker agent run agent.yaml -w "Refactor the auth package"
@y
```bash
# Run in an isolated worktree with a generated name (e.g. "focused_turing")
$ docker agent run agent.yaml --worktree
$ docker agent run agent.yaml -w "Refactor the auth package"
@z

@x
# Give the worktree (and its branch) an explicit name
$ docker agent run agent.yaml --worktree=auth-refactor
@y
# Give the worktree (and its branch) an explicit name
$ docker agent run agent.yaml --worktree=auth-refactor
@z

@x
# Branch the worktree from another ref instead of the current HEAD.
# A remote-tracking ref is fetched first, so the worktree starts from the
# latest remote state.
$ docker agent run agent.yaml --worktree=auth-refactor --worktree-base origin/main
@y
# Branch the worktree from another ref instead of the current HEAD.
# A remote-tracking ref is fetched first, so the worktree starts from the
# latest remote state.
$ docker agent run agent.yaml --worktree=auth-refactor --worktree-base origin/main
@z

@x
# Resume a worktree run later: the session remembers its worktree, so you
# don't pass --worktree again (which would fail — the worktree already exists).
$ docker agent run agent.yaml --worktree=auth-refactor   # first run, creates it
$ docker agent run agent.yaml --session -1               # resumes into the same worktree
@y
# Resume a worktree run later: the session remembers its worktree, so you
# don't pass --worktree again (which would fail — the worktree already exists).
$ docker agent run agent.yaml --worktree=auth-refactor   # first run, creates it
$ docker agent run agent.yaml --session -1               # resumes into the same worktree
@z

@x
# Check out an existing GitHub pull request to continue it (requires gh)
$ docker agent run agent.yaml --worktree-pr 123
$ docker agent run agent.yaml --worktree-pr https://github.com/owner/repo/pull/123
```
@y
# Check out an existing GitHub pull request to continue it (requires gh)
$ docker agent run agent.yaml --worktree-pr 123
$ docker agent run agent.yaml --worktree-pr https://github.com/owner/repo/pull/123
```
@z

@x
With `--worktree-pr`, the PR's head branch is checked out tracking its remote (via the [GitHub CLI](https://cli.github.com/)), so commits made during the run push straight back to the pull request. The worktree is stored under `<data-dir>/worktrees/pr-<number>`.
@y
With `--worktree-pr`, the PR's head branch is checked out tracking its remote (via the [GitHub CLI](https://cli.github.com/)), so commits made during the run push straight back to the pull request. The worktree is stored under `<data-dir>/worktrees/pr-<number>`.
@z

@x
When the interactive session ends, the worktree is cleaned up based on its state:
@y
When the interactive session ends, the worktree is cleaned up based on its state:
@z

@x
- **Clean** (no uncommitted changes, untracked files, or new commits): the worktree and its branch are removed automatically.
- **Has work** (uncommitted changes, untracked files, or new commits): you're prompted to keep or remove it. Keeping preserves the directory and branch so you can return later; removing discards the worktree, its branch, and all that work.
- **Non-interactive runs** (`--exec`): the worktree is never cleaned up — it's left in place for inspection.
@y
- **Clean** (no uncommitted changes, untracked files, or new commits): the worktree and its branch are removed automatically.
- **Has work** (uncommitted changes, untracked files, or new commits): you're prompted to keep or remove it. Keeping preserves the directory and branch so you can return later; removing discards the worktree, its branch, and all that work.
- **Non-interactive runs** (`--exec`): the worktree is never cleaned up — it's left in place for inspection.
@z

@x
A worktree is only ever removed if `--worktree` created it for this run; a pre-existing worktree is never touched.
@y
A worktree is only ever removed if `--worktree` created it for this run; a pre-existing worktree is never touched.
@z

@x
A kept worktree can be resumed: pass `--session` (a relative ref like `-1`, or the session id) and the run reattaches to the same worktree directory and branch automatically. Don't re-pass `--worktree` on resume — that would try to create a new worktree and fail because it already exists.
@y
A kept worktree can be resumed: pass `--session` (a relative ref like `-1`, or the session id) and the run reattaches to the same worktree directory and branch automatically. Don't re-pass `--worktree` on resume — that would try to create a new worktree and fail because it already exists.
@z

@x
### `docker agent run --exec`
@y
### `docker agent run --exec`
@z

@x
Run an agent in non-interactive (headless) mode. No TUI — output goes to stdout.
@y
Run an agent in non-interactive (headless) mode. No TUI — output goes to stdout.
@z

@x
```bash
$ docker agent run --exec [config] [message...] [flags]
```
@y
```bash
$ docker agent run --exec [config] [message...] [flags]
```
@z

@x
```bash
# One-shot task
$ docker agent run --exec agent.yaml "Create a Dockerfile for a Python Flask app"
@y
```bash
# One-shot task
$ docker agent run --exec agent.yaml "Create a Dockerfile for a Python Flask app"
@z

@x
# With auto-approve
$ docker agent run --exec agent.yaml --yolo "Set up CI/CD pipeline"
@y
# With auto-approve
$ docker agent run --exec agent.yaml --yolo "Set up CI/CD pipeline"
@z

@x
# Multi-turn conversation
$ docker agent run --exec agent.yaml "question 1" "question 2" "question 3"
```
@y
# Multi-turn conversation
$ docker agent run --exec agent.yaml "question 1" "question 2" "question 3"
```
@z

@x
### `docker agent new`
@y
### `docker agent new`
@z

@x
Interactively generate a new agent configuration file.
@y
Interactively generate a new agent configuration file.
@z

@x
```bash
$ docker agent new [flags]
@y
```bash
$ docker agent new [flags]
@z

@x
# Examples
$ docker agent new
$ docker agent new --model openai/gpt-5
$ docker agent new --model dmr/ai/gemma3-qat:12B --max-iterations 15
```
@y
# Examples
$ docker agent new
$ docker agent new --model openai/gpt-5
$ docker agent new --model dmr/ai/gemma3-qat:12B --max-iterations 15
```
@z

@x
### `docker agent getting-started`
@y
### `docker agent getting-started`
@z

@x
Run a short (about 2 minutes), skippable interactive tour inside the chat UI: sending messages, approving tool calls, the command palette (<kbd>Ctrl</kbd>+<kbd>K</kbd>), slash commands, and how agents are configured. Aliased as `docker agent tour`. Requires an interactive terminal.
@y
Run a short (about 2 minutes), skippable interactive tour inside the chat UI: sending messages, approving tool calls, the command palette (<kbd>Ctrl</kbd>+<kbd>K</kbd>), slash commands, and how agents are configured. Aliased as `docker agent tour`. Requires an interactive terminal.
@z

@x
```bash
$ docker agent getting-started
```
@y
```bash
$ docker agent getting-started
```
@z

@x
Replay it anytime with this command, or with the `/getting-started` slash command inside a running TUI session.
@y
Replay it anytime with this command, or with the `/getting-started` slash command inside a running TUI session.
@z

@x
### `docker agent models`
@y
### `docker agent models`
@z

@x
List models available for use with `--model`. By default only shows models for providers you have credentials for. Aliases: `docker agent models list`, `docker agent models ls`.
@y
List models available for use with `--model`. By default only shows models for providers you have credentials for. Aliases: `docker agent models list`, `docker agent models ls`.
@z

@x
```bash
$ docker agent models [flags]
```
@y
```bash
$ docker agent models [flags]
```
@z

@x
| Flag                   | Default | Description                                                                        |
| ---------------------- | ------- | ---------------------------------------------------------------------------------- |
| `-p, --provider <id>`  | (none)  | Filter models by provider name (e.g. `openai`, `anthropic`, `dmr`, `ollama`, …).   |
| `--format <fmt>`       | `table` | Output format: `table` or `json`.                                                  |
| `-a, --all`            | `false` | Include models from all providers, not just those you have credentials for.        |
@y
| Flag                   | Default | Description                                                                        |
| ---------------------- | ------- | ---------------------------------------------------------------------------------- |
| `-p, --provider <id>`  | (none)  | Filter models by provider name (e.g. `openai`, `anthropic`, `dmr`, `ollama`, …).   |
| `--format <fmt>`       | `table` | Output format: `table` or `json`.                                                  |
| `-a, --all`            | `false` | Include models from all providers, not just those you have credentials for.        |
@z

@x
```bash
# Examples
$ docker agent models                                 # only providers you can use
$ docker agent models --all                           # every provider the catalog knows about
$ docker agent models --provider openai
$ docker agent models --format json | jq
```
@y
```bash
# Examples
$ docker agent models                                 # only providers you can use
$ docker agent models --all                           # every provider the catalog knows about
$ docker agent models --provider openai
$ docker agent models --format json | jq
```
@z

@x
When a models gateway is configured (`--models-gateway`, `DOCKER_AGENT_MODELS_GATEWAY`, or the user config), the command first queries the gateway's `/v1/models` endpoint. A non-empty response is authoritative for the models routed through the gateway: the listing shows the models the gateway serves (`--provider` filters within it), alongside any custom providers you have configured, which serve their models from their own endpoints rather than through the gateway. If the gateway cannot be queried or serves no usable model (endpoint not implemented, empty list, invalid response, timeout, missing authentication), the command falls back to the providers you have configured directly — provider API keys, provider aliases, and custom providers — plus the model catalog; a failure of one source never prevents the others from being listed. The Docker Desktop token is only sent (and required) when the gateway targets a trusted Docker URL.
@y
When a models gateway is configured (`--models-gateway`, `DOCKER_AGENT_MODELS_GATEWAY`, or the user config), the command first queries the gateway's `/v1/models` endpoint. A non-empty response is authoritative for the models routed through the gateway: the listing shows the models the gateway serves (`--provider` filters within it), alongside any custom providers you have configured, which serve their models from their own endpoints rather than through the gateway. If the gateway cannot be queried or serves no usable model (endpoint not implemented, empty list, invalid response, timeout, missing authentication), the command falls back to the providers you have configured directly — provider API keys, provider aliases, and custom providers — plus the model catalog; a failure of one source never prevents the others from being listed. The Docker Desktop token is only sent (and required) when the gateway targets a trusted Docker URL.
@z

@x
### `docker agent toolsets`
@y
### `docker agent toolsets`
@z

@x
List the built-in toolset types available for use in an agent configuration. Each type can be referenced under `toolsets:` in an agent YAML file. Use this to discover what's available without leaving the terminal.
@y
List the built-in toolset types available for use in an agent configuration. Each type can be referenced under `toolsets:` in an agent YAML file. Use this to discover what's available without leaving the terminal.
@z

@x
```bash
$ docker agent toolsets [flags]
```
@y
```bash
$ docker agent toolsets [flags]
```
@z

@x
| Flag             | Default | Description                       |
| ---------------- | ------- | --------------------------------- |
| `--format <fmt>` | `table` | Output format: `table` or `json`. |
@y
| Flag             | Default | Description                       |
| ---------------- | ------- | --------------------------------- |
| `--format <fmt>` | `table` | Output format: `table` or `json`. |
@z

@x
```bash
# Examples
$ docker agent toolsets                                # human-readable table
$ docker agent toolsets --format json | jq             # machine-readable (type, summary, docs URL)
```
@y
```bash
# Examples
$ docker agent toolsets                                # human-readable table
$ docker agent toolsets --format json | jq             # machine-readable (type, summary, docs URL)
```
@z

@x
### `docker agent setup`
@y
### `docker agent setup`
@z

@x
Set up a model interactively. Four paths:
@y
Set up a model interactively. Four paths:
@z

@x
- **Built-in cloud provider**: pick a provider Docker Agent already knows (Anthropic, OpenAI, Google, Groq, Hugging Face, ...) and connect it. Credentials vary by provider: most take an API key or token, stored in the Docker Agent env file `~/.config/cagent/.env`, while `chatgpt` signs in with your ChatGPT account in the browser.
- **Local model**: check Docker Model Runner and pull a model. No API key needed.
- **Custom OpenAI-compatible endpoint**: register an endpoint that is not built in (vLLM, LiteLLM, a corporate gateway, ...) with its base URL, API format, and API key variable, saved to your [user configuration](../../providers/custom/index.md#global-providers-user-configuration) so its models work everywhere via `--model <name>/<model>`.
- **Claude Code harness**: use a Claude subscription through the official `claude` CLI. The wizard checks that the CLI is installed and logged in, offers to run `claude auth login --claudeai` (only after you confirm), and writes a ready-to-run `claude-code-agent.yaml`. See [Coding Harnesses](../harnesses/index.md).
@y
- **Built-in cloud provider**: pick a provider Docker Agent already knows (Anthropic, OpenAI, Google, Groq, Hugging Face, ...) and connect it. Credentials vary by provider: most take an API key or token, stored in the Docker Agent env file `~/.config/cagent/.env`, while `chatgpt` signs in with your ChatGPT account in the browser.
- **Local model**: check Docker Model Runner and pull a model. No API key needed.
- **Custom OpenAI-compatible endpoint**: register an endpoint that is not built in (vLLM, LiteLLM, a corporate gateway, ...) with its base URL, API format, and API key variable, saved to your [user configuration](../../providers/custom/index.md#global-providers-user-configuration) so its models work everywhere via `--model <name>/<model>`.
- **Claude Code harness**: use a Claude subscription through the official `claude` CLI. The wizard checks that the CLI is installed and logged in, offers to run `claude auth login --claudeai` (only after you confirm), and writes a ready-to-run `claude-code-agent.yaml`. See [Coding Harnesses](../harnesses/index.md).
@z

@x
Ends with the exact command to start chatting. Secret values are never printed, and Docker Agent never reads or copies the Claude CLI's credentials.
@y
Ends with the exact command to start chatting. Secret values are never printed, and Docker Agent never reads or copies the Claude CLI's credentials.
@z

@x
The wizard is also offered automatically when an interactive run finds no usable model (decline-able; set `DOCKER_AGENT_NO_SETUP=1` to suppress the offer).
@y
The wizard is also offered automatically when an interactive run finds no usable model (decline-able; set `DOCKER_AGENT_NO_SETUP=1` to suppress the offer).
@z

@x
```bash
$ docker agent setup
```
@y
```bash
$ docker agent setup
```
@z

@x
### `docker agent doctor`
@y
### `docker agent doctor`
@z

@x
Diagnose the model and credential setup. Reports which model providers have credentials and where each credential comes from (shell environment, env file, Docker Desktop, …), whether Docker Model Runner is reachable and which models are pulled, and which model the `auto` selection would pick. Secret values are never printed. Exits with a non-zero status when an issue would prevent an agent from running, which makes it usable in scripts and CI.
@y
Diagnose the model and credential setup. Reports which model providers have credentials and where each credential comes from (shell environment, env file, Docker Desktop, …), whether Docker Model Runner is reachable and which models are pulled, and which model the `auto` selection would pick. Secret values are never printed. Exits with a non-zero status when an issue would prevent an agent from running, which makes it usable in scripts and CI.
@z

@x
```bash
$ docker agent doctor [agent-file|registry-ref] [flags]
```
@y
```bash
$ docker agent doctor [agent-file|registry-ref] [flags]
```
@z

@x
With an agent file, also lists the environment variables that file requires (model credentials and tool secrets such as `GITHUB_PERSONAL_ACCESS_TOKEN`), whether each one is set, and from which source. When the file declares a [`claude-code` harness](../harnesses/index.md) agent, the doctor additionally checks that the official `claude` CLI is installed and logged in, reporting its version and safe login metadata (auth method, API provider, subscription type — never your email, organization, or tokens); a missing or logged-out CLI is reported as an issue with the `claude auth login --claudeai` remediation.
@y
With an agent file, also lists the environment variables that file requires (model credentials and tool secrets such as `GITHUB_PERSONAL_ACCESS_TOKEN`), whether each one is set, and from which source. When the file declares a [`claude-code` harness](../harnesses/index.md) agent, the doctor additionally checks that the official `claude` CLI is installed and logged in, reporting its version and safe login metadata (auth method, API provider, subscription type — never your email, organization, or tokens); a missing or logged-out CLI is reported as an issue with the `claude auth login --claudeai` remediation.
@z

@x
| Flag                     | Default | Description                                                    |
| ------------------------ | ------- | -------------------------------------------------------------- |
| `--json`                 | `false` | Output the full report in JSON format (for scripting).         |
| `--env-from-file <file>` | (none)  | Also check variables supplied by an env file.                  |
| `--models-gateway <url>` | (none)  | Diagnose against a models gateway (credentials come from it).  |
@y
| Flag                     | Default | Description                                                    |
| ------------------------ | ------- | -------------------------------------------------------------- |
| `--json`                 | `false` | Output the full report in JSON format (for scripting).         |
| `--env-from-file <file>` | (none)  | Also check variables supplied by an env file.                  |
| `--models-gateway <url>` | (none)  | Diagnose against a models gateway (credentials come from it).  |
@z

@x
```bash
# Examples
$ docker agent doctor                        # credential, DMR, and auto-selection state
$ docker agent doctor ./agent.yaml           # also check that file's requirements
$ docker agent doctor --json | jq .issues
```
@y
```bash
# Examples
$ docker agent doctor                        # credential, DMR, and auto-selection state
$ docker agent doctor ./agent.yaml           # also check that file's requirements
$ docker agent doctor --json | jq .issues
```
@z

@x
### `docker agent serve api`
@y
### `docker agent serve api`
@z

@x
Start the HTTP API server for programmatic access. The argument can be a single agent file, a registry reference, or a directory — when given a directory, every `.yaml`/`.yml`/`.hcl` file in it is exposed as a separate entry under `/api/agents`.
@y
Start the HTTP API server for programmatic access. The argument can be a single agent file, a registry reference, or a directory — when given a directory, every `.yaml`/`.yml`/`.hcl` file in it is exposed as a separate entry under `/api/agents`.
@z

@x
```bash
$ docker agent serve api <agent-file>|<agents-dir>|<registry-ref> [flags]
```
@y
```bash
$ docker agent serve api <agent-file>|<agents-dir>|<registry-ref> [flags]
```
@z

@x
| Flag                       | Default            | Description                                                                                                |
| -------------------------- | ------------------ | ---------------------------------------------------------------------------------------------------------- |
| `-l, --listen <addr>`      | `127.0.0.1:8080`   | Address to listen on.                                                                                      |
| `--auth-token <token>`     | (none)             | Bearer token required for all API requests. When set, every request must include `Authorization: Bearer <token>`. Leave empty to disable authentication (safe when listening on loopback interfaces only). |
| `--max-request-size <bytes>` | `1048576` (1 MiB) | Maximum request body size. Requests exceeding this limit are rejected with HTTP 413 — see [Troubleshooting: HTTP 413](../../community/troubleshooting/index.md#http-413-request-body-too-large).                      |
| `--session-workingdir-root <path>` | (none)     | Confine the `working_dir` of sessions created via `POST /api/sessions` to this directory and its descendants (symlinks are resolved before the check). Unrestricted by default — any clean host directory is accepted (raw values containing `..` are rejected), as local single-user daemons rely on. Recommended for multi-user or network-exposed deployments. |
| `-s, --session-db <path>`  | `session.db`       | Path to the SQLite session database (relative paths resolve against the working directory).                |
| `--pull-interval <minutes>`| `0`                | Periodically re-pull OCI/URL references and refresh the agent definition. `0` disables auto-pull.          |
| `--fake <path>`             | (none)             | Replay AI responses from a cassette file (for testing). Mutually exclusive with `--record`.               |
| `--record [path]`           | (none)             | Record AI API interactions to a cassette file. Routes through `--models-gateway` when one is configured. |
| `--mcp-oauth-redirect-uri <url>` | (none)        | OAuth redirect URI for the unmanaged MCP OAuth flow in server mode. When set, the runtime drives PKCE and code exchange in-process and sends the full authorize URL to the client via elicitation. See [Remote MCP](../remote-mcp/index.md) for details. |
@y
| Flag                       | Default            | Description                                                                                                |
| -------------------------- | ------------------ | ---------------------------------------------------------------------------------------------------------- |
| `-l, --listen <addr>`      | `127.0.0.1:8080`   | Address to listen on.                                                                                      |
| `--auth-token <token>`     | (none)             | Bearer token required for all API requests. When set, every request must include `Authorization: Bearer <token>`. Leave empty to disable authentication (safe when listening on loopback interfaces only). |
| `--max-request-size <bytes>` | `1048576` (1 MiB) | Maximum request body size. Requests exceeding this limit are rejected with HTTP 413 — see [Troubleshooting: HTTP 413](../../community/troubleshooting/index.md#http-413-request-body-too-large).                      |
| `--session-workingdir-root <path>` | (none)     | Confine the `working_dir` of sessions created via `POST /api/sessions` to this directory and its descendants (symlinks are resolved before the check). Unrestricted by default — any clean host directory is accepted (raw values containing `..` are rejected), as local single-user daemons rely on. Recommended for multi-user or network-exposed deployments. |
| `-s, --session-db <path>`  | `session.db`       | Path to the SQLite session database (relative paths resolve against the working directory).                |
| `--pull-interval <minutes>`| `0`                | Periodically re-pull OCI/URL references and refresh the agent definition. `0` disables auto-pull.          |
| `--fake <path>`             | (none)             | Replay AI responses from a cassette file (for testing). Mutually exclusive with `--record`.               |
| `--record [path]`           | (none)             | Record AI API interactions to a cassette file. Routes through `--models-gateway` when one is configured. |
| `--mcp-oauth-redirect-uri <url>` | (none)        | OAuth redirect URI for the unmanaged MCP OAuth flow in server mode. When set, the runtime drives PKCE and code exchange in-process and sends the full authorize URL to the client via elicitation. See [Remote MCP](../remote-mcp/index.md) for details. |
@z

@x
> **Diagnostics:** Set `CAGENT_PPROF_ADDR=127.0.0.1:6060` (or `--pprof-addr`, a hidden flag) to start a live Go pprof server at `/debug/pprof/`. Use a loopback address; a non-loopback binding logs a security warning.
@y
> **Diagnostics:** Set `CAGENT_PPROF_ADDR=127.0.0.1:6060` (or `--pprof-addr`, a hidden flag) to start a live Go pprof server at `/debug/pprof/`. Use a loopback address; a non-loopback binding logs a security warning.
@z

@x
All [runtime configuration flags](#runtime-configuration-flags) (`--working-dir`, `--env-from-file`, `--models-gateway`, `--hook-*`, …) are also accepted.
@y
All [runtime configuration flags](#runtime-configuration-flags) (`--working-dir`, `--env-from-file`, `--models-gateway`, `--hook-*`, …) are also accepted.
@z

@x
```bash
# Examples
$ docker agent serve api agent.yaml
$ docker agent serve api agent.yaml --listen :8080
$ docker agent serve api ./agents/                          # directory of agent YAML/HCL configs
$ docker agent serve api ociReference --pull-interval 10    # auto-refresh
```
@y
```bash
# Examples
$ docker agent serve api agent.yaml
$ docker agent serve api agent.yaml --listen :8080
$ docker agent serve api ./agents/                          # directory of agent YAML/HCL configs
$ docker agent serve api ociReference --pull-interval 10    # auto-refresh
```
@z

@x
See [API Server](../api-server/index.md) for the full HTTP API reference.
@y
See [API Server](../api-server/index.md) for the full HTTP API reference.
@z

@x
### `docker agent serve mcp`
@y
### `docker agent serve mcp`
@z

@x
Expose agents as MCP tools for use in Claude Desktop, Claude Code, or other MCP clients. Defaults to stdio transport; use `--http` to start a streaming HTTP server instead.
@y
Expose agents as MCP tools for use in Claude Desktop, Claude Code, or other MCP clients. Defaults to stdio transport; use `--http` to start a streaming HTTP server instead.
@z

@x
```bash
$ docker agent serve mcp <config> [flags]
```
@y
```bash
$ docker agent serve mcp <config> [flags]
```
@z

@x
| Flag                   | Default            | Description                                                                                       |
| ---------------------- | ------------------ | ------------------------------------------------------------------------------------------------- |
| `-a, --agent <name>`   | (all agents)       | Name of the agent to expose. If omitted, every agent in the config is exposed as a separate tool. |
| `--tool-name <name>`   | (agent name)       | Override the MCP tool identifier clients call; only valid when exposing a single agent.           |
| `--http`               | `false`            | Use streaming HTTP transport instead of stdio.                                                    |
| `--safety <policy>`    | `restricted`       | HTTP MCP safety policy; no effect on stdio or `--attach`.                                         |
| `--auth-token <token>` | (none)             | Required Bearer token for HTTP MCP requests.                                                       |
| `--insecure-no-auth`   | `false`            | Permit unauthenticated non-loopback HTTP MCP binding.                                              |
| `-l, --listen <addr>`  | `127.0.0.1:8081`   | Address to listen on (only used with `--http`).                                                   |
| `--mcp-keepalive <dur>`| `0` (disabled)     | Interval between MCP keep-alive pings (e.g. `30s`).                                               |
| `--attach [target]`    | (none)             | Attach to a running TUI run by pid, address, or session id; given without a value, selects the most recent run.   |
@y
| Flag                   | Default            | Description                                                                                       |
| ---------------------- | ------------------ | ------------------------------------------------------------------------------------------------- |
| `-a, --agent <name>`   | (all agents)       | Name of the agent to expose. If omitted, every agent in the config is exposed as a separate tool. |
| `--tool-name <name>`   | (agent name)       | Override the MCP tool identifier clients call; only valid when exposing a single agent.           |
| `--http`               | `false`            | Use streaming HTTP transport instead of stdio.                                                    |
| `--safety <policy>`    | `restricted`       | HTTP MCP safety policy; no effect on stdio or `--attach`.                                         |
| `--auth-token <token>` | (none)             | Required Bearer token for HTTP MCP requests.                                                       |
| `--insecure-no-auth`   | `false`            | Permit unauthenticated non-loopback HTTP MCP binding.                                              |
| `-l, --listen <addr>`  | `127.0.0.1:8081`   | Address to listen on (only used with `--http`).                                                   |
| `--mcp-keepalive <dur>`| `0` (disabled)     | Interval between MCP keep-alive pings (e.g. `30s`).                                               |
| `--attach [target]`    | (none)             | Attach to a running TUI run by pid, address, or session id; given without a value, selects the most recent run.   |
@z

@x
All [runtime configuration flags](#runtime-configuration-flags) are also accepted.
@y
All [runtime configuration flags](#runtime-configuration-flags) are also accepted.
@z

@x
```bash
# Examples
$ docker agent serve mcp agent.yaml                                # stdio transport
$ docker agent serve mcp agent.yaml --http --listen 127.0.0.1:9090 # streaming HTTP
$ docker agent serve mcp agent.yaml --working-dir /path/to/project
$ docker agent serve mcp myorg/coder
```
@y
```bash
# Examples
$ docker agent serve mcp agent.yaml                                # stdio transport
$ docker agent serve mcp agent.yaml --http --listen 127.0.0.1:9090 # streaming HTTP
$ docker agent serve mcp agent.yaml --working-dir /path/to/project
$ docker agent serve mcp myorg/coder
```
@z

@x
See [MCP Mode](../mcp-mode/index.md) for detailed setup.
@y
See [MCP Mode](../mcp-mode/index.md) for detailed setup.
@z

@x
### `docker agent serve a2a`
@y
### `docker agent serve a2a`
@z

@x
Start an A2A (Agent-to-Agent) protocol server.
@y
Start an A2A (Agent-to-Agent) protocol server.
@z

@x
```bash
$ docker agent serve a2a <config> [flags]
```
@y
```bash
$ docker agent serve a2a <config> [flags]
```
@z

@x
| Flag                   | Default            | Description                                                                                |
| ---------------------- | ------------------ | ------------------------------------------------------------------------------------------ |
| `-a, --agent <name>`   | (team default)     | Name of the agent to run. Defaults to the team's first agent if not specified.             |
| `-l, --listen <addr>`  | `127.0.0.1:8082`   | Address to listen on.                                                                       |
| `-s, --session-db <path>` | `<data-dir>/session.db` | Path to the SQLite session database.                                                 |
@y
| Flag                   | Default            | Description                                                                                |
| ---------------------- | ------------------ | ------------------------------------------------------------------------------------------ |
| `-a, --agent <name>`   | (team default)     | Name of the agent to run. Defaults to the team's first agent if not specified.             |
| `-l, --listen <addr>`  | `127.0.0.1:8082`   | Address to listen on.                                                                       |
| `-s, --session-db <path>` | `<data-dir>/session.db` | Path to the SQLite session database.                                                 |
@z

@x
All [runtime configuration flags](#runtime-configuration-flags) are also accepted.
@y
All [runtime configuration flags](#runtime-configuration-flags) are also accepted.
@z

@x
```bash
# Examples
$ docker agent serve a2a agent.yaml
$ docker agent serve a2a agent.yaml --listen 127.0.0.1:9000
$ docker agent serve a2a myorg/agent:tag
```
@y
```bash
# Examples
$ docker agent serve a2a agent.yaml
$ docker agent serve a2a agent.yaml --listen 127.0.0.1:9000
$ docker agent serve a2a myorg/agent:tag
```
@z

@x
### `docker agent serve acp`
@y
### `docker agent serve acp`
@z

@x
Start an ACP (Agent Client Protocol) server over stdio. This allows external clients to interact with your agents using the ACP protocol.
@y
Start an ACP (Agent Client Protocol) server over stdio. This allows external clients to interact with your agents using the ACP protocol.
@z

@x
```bash
$ docker agent serve acp <config> [flags]
```
@y
```bash
$ docker agent serve acp <config> [flags]
```
@z

@x
| Flag                      | Default                     | Description                                       |
| ------------------------- | --------------------------- | ------------------------------------------------- |
| `-s, --session-db <path>` | `<data-dir>/session.db`     | Path to the SQLite session database.              |
@y
| Flag                      | Default                     | Description                                       |
| ------------------------- | --------------------------- | ------------------------------------------------- |
| `-s, --session-db <path>` | `<data-dir>/session.db`     | Path to the SQLite session database.              |
@z

@x
All [runtime configuration flags](#runtime-configuration-flags) are also accepted.
@y
All [runtime configuration flags](#runtime-configuration-flags) are also accepted.
@z

@x
```bash
# Examples
$ docker agent serve acp agent.yaml
$ docker agent serve acp ./team.yaml
$ docker agent serve acp myorg/agent:tag
```
@y
```bash
# Examples
$ docker agent serve acp agent.yaml
$ docker agent serve acp ./team.yaml
$ docker agent serve acp myorg/agent:tag
```
@z

@x
See [ACP](../acp/index.md) for details on the Agent Client Protocol.
@y
See [ACP](../acp/index.md) for details on the Agent Client Protocol.
@z

@x
### `docker agent serve chat`
@y
### `docker agent serve chat`
@z

@x
Start an HTTP server that exposes one or more agents through an **OpenAI-compatible Chat Completions API** at `/v1/chat/completions` and `/v1/models`. This lets any tool that already speaks the OpenAI protocol — for example [Open WebUI](https://github.com/open-webui/open-webui), `curl`, the OpenAI Python SDK, or LangChain — drive a Docker Agent agent without any custom integration.
@y
Start an HTTP server that exposes one or more agents through an **OpenAI-compatible Chat Completions API** at `/v1/chat/completions` and `/v1/models`. This lets any tool that already speaks the OpenAI protocol — for example [Open WebUI](https://github.com/open-webui/open-webui), `curl`, the OpenAI Python SDK, or LangChain — drive a Docker Agent agent without any custom integration.
@z

@x
```bash
$ docker agent serve chat <config> [flags]
```
@y
```bash
$ docker agent serve chat <config> [flags]
```
@z

@x
| Flag                          | Default            | Description                                                                                                       |
| ----------------------------- | ------------------ | ----------------------------------------------------------------------------------------------------------------- |
| `-a, --agent <name>`          | (all agents)       | Name of the agent to expose. If omitted, every agent in the config is exposed as a separate model.                |
| `-l, --listen <addr>`         | `127.0.0.1:8083`   | Address to listen on.                                                                                             |
| `--cors-origin <origin>`      | (none)             | Allowed CORS origin (e.g. `https://example.com`). Empty disables CORS.                                            |
| `--api-key <token>`           | (none)             | Required Bearer token clients must present (`Authorization: Bearer <token>`). Empty disables auth.                |
| `--api-key-env <name>`        | (none)             | Read the required API key from this non-empty environment variable.                                      |
| `--insecure-no-auth`           | `false`            | Permit unauthenticated non-loopback binding.                                                                  |
| `--safety <policy>`            | `restricted`       | Tool safety policy; CLI value overrides agent/runtime configuration.                                           |
| `--max-request-size <bytes>`  | `1048576` (1 MiB)  | Maximum request body size. Requests exceeding this limit are rejected with HTTP 413 — see [Troubleshooting: HTTP 413](../../community/troubleshooting/index.md#http-413-request-body-too-large).                                                                                        |
| `--request-timeout <dur>`     | `5m`               | Per-request timeout (covers model + tool calls + streaming).                                                      |
| `--conversations-max <n>`     | `0`                | Cache up to N conversations server-side, keyed by `X-Conversation-Id`. `0` disables — clients must resend history. |
| `--conversation-ttl <dur>`    | `30m`              | Idle TTL after which a cached conversation is evicted.                                                            |
| `--max-idle-runtimes <n>`     | `4`                | Maximum number of idle runtimes pooled per agent. `0` disables pooling.                                           |
@y
| Flag                          | Default            | Description                                                                                                       |
| ----------------------------- | ------------------ | ----------------------------------------------------------------------------------------------------------------- |
| `-a, --agent <name>`          | (all agents)       | Name of the agent to expose. If omitted, every agent in the config is exposed as a separate model.                |
| `-l, --listen <addr>`         | `127.0.0.1:8083`   | Address to listen on.                                                                                             |
| `--cors-origin <origin>`      | (none)             | Allowed CORS origin (e.g. `https://example.com`). Empty disables CORS.                                            |
| `--api-key <token>`           | (none)             | Required Bearer token clients must present (`Authorization: Bearer <token>`). Empty disables auth.                |
| `--api-key-env <name>`        | (none)             | Read the required API key from this non-empty environment variable.                                      |
| `--insecure-no-auth`           | `false`            | Permit unauthenticated non-loopback binding.                                                                  |
| `--safety <policy>`            | `restricted`       | Tool safety policy; CLI value overrides agent/runtime configuration.                                           |
| `--max-request-size <bytes>`  | `1048576` (1 MiB)  | Maximum request body size. Requests exceeding this limit are rejected with HTTP 413 — see [Troubleshooting: HTTP 413](../../community/troubleshooting/index.md#http-413-request-body-too-large).                                                                                        |
| `--request-timeout <dur>`     | `5m`               | Per-request timeout (covers model + tool calls + streaming).                                                      |
| `--conversations-max <n>`     | `0`                | Cache up to N conversations server-side, keyed by `X-Conversation-Id`. `0` disables — clients must resend history. |
| `--conversation-ttl <dur>`    | `30m`              | Idle TTL after which a cached conversation is evicted.                                                            |
| `--max-idle-runtimes <n>`     | `4`                | Maximum number of idle runtimes pooled per agent. `0` disables pooling.                                           |
@z

@x
```bash
# Examples
$ docker agent serve chat agent.yaml
$ docker agent serve chat ./team.yaml --agent reviewer
$ docker agent serve chat myorg/agent:tag --listen 127.0.0.1:9090
$ docker agent serve chat agent.yaml --api-key-env CHAT_BEARER_TOKEN
@y
```bash
# Examples
$ docker agent serve chat agent.yaml
$ docker agent serve chat ./team.yaml --agent reviewer
$ docker agent serve chat myorg/agent:tag --listen 127.0.0.1:9090
$ docker agent serve chat agent.yaml --api-key-env CHAT_BEARER_TOKEN
@z

@x
# Drive it from any OpenAI-compatible client
$ curl http://127.0.0.1:8083/v1/chat/completions \
    -H 'Content-Type: application/json' \
    -d '{"model": "root", "messages": [{"role": "user", "content": "hello"}]}'
```
@y
# Drive it from any OpenAI-compatible client
$ curl http://127.0.0.1:8083/v1/chat/completions \
    -H 'Content-Type: application/json' \
    -d '{"model": "root", "messages": [{"role": "user", "content": "hello"}]}'
```
@z

@x
See [Chat Server](../chat-server/index.md) for the full feature reference.
@y
See [Chat Server](../chat-server/index.md) for the full feature reference.
@z

@x
### `docker agent board`
@y
### `docker agent board`
@z

@x
Launch a full-screen Kanban TUI for orchestrating multiple agents at once. Each card runs an agent in its own tmux session on an isolated git worktree; moving a card forward through the pipeline (Dev → Review → Push → Done) delivers the destination column's prompt to that card's agent. Projects and column prompts are stored in the global config file (`~/.config/cagent/config.yaml`) and can be managed from the TUI.
@y
Launch a full-screen Kanban TUI for orchestrating multiple agents at once. Each card runs an agent in its own tmux session on an isolated git worktree; moving a card forward through the pipeline (Dev → Review → Push → Done) delivers the destination column's prompt to that card's agent. Projects and column prompts are stored in the global config file (`~/.config/cagent/config.yaml`) and can be managed from the TUI.
@z

@x
```bash
$ docker agent board
```
@y
```bash
$ docker agent board
```
@z

@x
Takes no arguments or flags. Requires `tmux` and `git` to be installed.
@y
Takes no arguments or flags. Requires `tmux` and `git` to be installed.
@z

@x
See [Kanban Board](../board/index.md) for key bindings, configuration, and workflow details.
@y
See [Kanban Board](../board/index.md) for key bindings, configuration, and workflow details.
@z

@x
### `docker agent share push` / `docker agent share pull`
@y
### `docker agent share push` / `docker agent share pull`
@z

@x
Share agents via OCI registries.
@y
Share agents via OCI registries.
@z

@x
```bash
# Push an agent
$ docker agent share push ./agent.yaml docker.io/username/my-agent:latest
@y
```bash
# Push an agent
$ docker agent share push ./agent.yaml docker.io/username/my-agent:latest
@z

@x
# Pull an agent
$ docker agent share pull docker.io/username/my-agent:latest
@y
# Pull an agent
$ docker agent share pull docker.io/username/my-agent:latest
@z

@x
# Force pull, overwriting the local copy
$ docker agent share pull docker.io/username/my-agent:latest --force
```
@y
# Force pull, overwriting the local copy
$ docker agent share pull docker.io/username/my-agent:latest --force
```
@z

@x
| Flag       | Applies to | Description                                                |
| ---------- | ---------- | ---------------------------------------------------------- |
| `--force`  | `pull`     | Force pull even if the configuration already exists locally |
@y
| Flag       | Applies to | Description                                                |
| ---------- | ---------- | ---------------------------------------------------------- |
| `--force`  | `pull`     | Force pull even if the configuration already exists locally |
@z

@x
See [Agent Distribution](../../concepts/distribution/index.md) for full registry workflow details.
@y
See [Agent Distribution](../../concepts/distribution/index.md) for full registry workflow details.
@z

@x
### `docker agent sessions diff`
@y
### `docker agent sessions diff`
@z

@x
Compare two recorded sessions and report the first point where the agent behaved
differently — the triage answer when a task that worked yesterday does not work
today.
@y
Compare two recorded sessions and report the first point where the agent behaved
differently — the triage answer when a task that worked yesterday does not work
today.
@z

@x
```bash
$ docker agent sessions diff <session-a> <session-b> [flags]
```
@y
```bash
$ docker agent sessions diff <session-a> <session-b> [flags]
```
@z

@x
```console
$ docker agent sessions diff -1 -2
Comparing a1b2c3d4 (7 turns) against e5f6a7b8 (9 turns)
@y
```console
$ docker agent sessions diff -1 -2
Comparing a1b2c3d4 (7 turns) against e5f6a7b8 (9 turns)
@z

@x
❌ First divergence at turn 3 (after 3 matching turn(s)).
   a1b2c3d4 called:
     read_file({"path":"pkg/cache/cache.go"})
   e5f6a7b8 called:
     search_files_content({"query":"persistToDisk","path":"."})
@y
❌ First divergence at turn 3 (after 3 matching turn(s)).
   a1b2c3d4 called:
     read_file({"path":"pkg/cache/cache.go"})
   e5f6a7b8 called:
     search_files_content({"query":"persistToDisk","path":"."})
@z

@x
Everything after this point is downstream of the divergence and is not compared.
```
@y
Everything after this point is downstream of the divergence and is not compared.
```
@z

@x
Session references accept a full ID, a unique ID prefix, or a relative form such
as `-1` for the most recent run.
@y
Session references accept a full ID, a unique ID prefix, or a relative form such
as `-1` for the most recent run.
@z

@x
| Flag                    | Default                 | Description                                    |
| ----------------------- | ----------------------- | ------------------------------------------------ |
| `-s, --session-db`      | `<data-dir>/session.db` | Path to the session database                   |
| `--json`                | `false`                 | Emit the comparison as JSON                    |
| `--fail-on-divergence`  | `false`                 | Exit non-zero when the two sessions diverge    |
@y
| Flag                    | Default                 | Description                                    |
| ----------------------- | ----------------------- | ------------------------------------------------ |
| `-s, --session-db`      | `<data-dir>/session.db` | Path to the session database                   |
| `--json`                | `false`                 | Emit the comparison as JSON                    |
| `--fail-on-divergence`  | `false`                 | Exit non-zero when the two sessions diverge    |
@z

@x
Comparison is over the sequence of tool calls, not the assistant's prose: model
output is nondeterministic, so two runs of the same task almost always word
things differently while doing the same work. Turns taken by delegated
sub-agents are included in sequence. Reporting stops at the first divergence —
everything after it is downstream of that difference.
@y
Comparison is over the sequence of tool calls, not the assistant's prose: model
output is nondeterministic, so two runs of the same task almost always word
things differently while doing the same work. Turns taken by delegated
sub-agents are included in sequence. Reporting stops at the first divergence —
everything after it is downstream of that difference.
@z

@x
This locates *where* two runs diverged, not *why*. Re-running a session against
a different model while holding the environment fixed is a separate, unbuilt
feature.
@y
This locates *where* two runs diverged, not *why*. Re-running a session against
a different model while holding the environment fixed is a separate, unbuilt
feature.
@z

@x
### `docker agent eval`
@y
### `docker agent eval`
@z

@x
Run agent evaluations against a directory of recorded sessions.
@y
Run agent evaluations against a directory of recorded sessions.
@z

@x
```bash
$ docker agent eval <agent-file>|<registry-ref> [<eval-dir>|./evals] [flags]
```
@y
```bash
$ docker agent eval <agent-file>|<registry-ref> [<eval-dir>|./evals] [flags]
```
@z

@x
| Flag                | Default                              | Description                                                                |
| ------------------- | ------------------------------------ | -------------------------------------------------------------------------- |
| `-c, --concurrency` | num CPUs                             | Number of concurrent evaluation runs                                       |
| `--judge-model`     | `anthropic/claude-opus-5` | Model for LLM-as-a-judge relevance scoring (format: `provider/model`)      |
| `--output <dir>`    | `<eval-dir>/results`                 | Directory for results, logs, and session databases                         |
| `--only <pattern>`  | (all)                                | Only run evals with file names matching these patterns (repeatable)        |
| `--base-image`      | (default)                            | Custom base image for eval containers                                      |
| `--container-runtime` | `docker`                           | Container runtime executable for building and running evaluations (e.g. `podman`) |
| `--keep-containers` | `false`                              | Keep containers after evaluation (don't remove with `--rm`)                |
| `-e, --env`         | (none)                               | Environment variables to pass to container (`KEY` or `KEY=VALUE`, repeatable) |
| `--repeat <n>`      | `1`                                  | Number of times to repeat each evaluation (useful for computing baselines) |
| `--baseline <file>` | (none)                               | Compare against a previously saved run JSON (`<output>/<run>.json`) and exit non-zero on regression |
| `--regression-tolerance <n>` | `0`                         | How far an aggregate quality rate may fall before `--baseline` reports a regression (0–1) |
@y
| Flag                | Default                              | Description                                                                |
| ------------------- | ------------------------------------ | -------------------------------------------------------------------------- |
| `-c, --concurrency` | num CPUs                             | Number of concurrent evaluation runs                                       |
| `--judge-model`     | `anthropic/claude-opus-5` | Model for LLM-as-a-judge relevance scoring (format: `provider/model`)      |
| `--output <dir>`    | `<eval-dir>/results`                 | Directory for results, logs, and session databases                         |
| `--only <pattern>`  | (all)                                | Only run evals with file names matching these patterns (repeatable)        |
| `--base-image`      | (default)                            | Custom base image for eval containers                                      |
| `--container-runtime` | `docker`                           | Container runtime executable for building and running evaluations (e.g. `podman`) |
| `--keep-containers` | `false`                              | Keep containers after evaluation (don't remove with `--rm`)                |
| `-e, --env`         | (none)                               | Environment variables to pass to container (`KEY` or `KEY=VALUE`, repeatable) |
| `--repeat <n>`      | `1`                                  | Number of times to repeat each evaluation (useful for computing baselines) |
| `--baseline <file>` | (none)                               | Compare against a previously saved run JSON (`<output>/<run>.json`) and exit non-zero on regression |
| `--regression-tolerance <n>` | `0`                         | How far an aggregate quality rate may fall before `--baseline` reports a regression (0–1) |
@z

@x
All [runtime configuration flags](#runtime-configuration-flags) are also accepted.
@y
All [runtime configuration flags](#runtime-configuration-flags) are also accepted.
@z

@x
```bash
# Examples
$ docker agent eval agent.yaml                            # use ./evals
$ docker agent eval agent.yaml ./my-evals                 # custom directory
$ docker agent eval agent.yaml -c 8                       # 8 concurrent evaluations
$ docker agent eval agent.yaml --keep-containers          # keep containers for debugging
$ docker agent eval agent.yaml --only "auth*"             # only run matching evals
$ docker agent eval agent.yaml --repeat 5                 # repeat each eval 5 times
$ docker agent eval agent.yaml --container-runtime podman # use a Docker-compatible runtime such as Podman
```
@y
```bash
# Examples
$ docker agent eval agent.yaml                            # use ./evals
$ docker agent eval agent.yaml ./my-evals                 # custom directory
$ docker agent eval agent.yaml -c 8                       # 8 concurrent evaluations
$ docker agent eval agent.yaml --keep-containers          # keep containers for debugging
$ docker agent eval agent.yaml --only "auth*"             # only run matching evals
$ docker agent eval agent.yaml --repeat 5                 # repeat each eval 5 times
$ docker agent eval agent.yaml --container-runtime podman # use a Docker-compatible runtime such as Podman
```
@z

@x
See [Evaluation](../evaluation/index.md) for details on creating eval sessions and interpreting results.
@y
See [Evaluation](../evaluation/index.md) for details on creating eval sessions and interpreting results.
@z

@x
### `docker agent version`
@y
### `docker agent version`
@z

@x
Print the version and commit hash for your `docker-agent` install.
@y
Print the version and commit hash for your `docker-agent` install.
@z

@x
```bash
$ docker agent version
docker agent version v1.54.0
Commit: 1737035c
```
@y
```bash
$ docker agent version
docker agent version v1.54.0
Commit: 1737035c
```
@z

@x
### `docker agent alias`
@y
### `docker agent alias`
@z

@x
Manage agent aliases for quick access.
@y
Manage agent aliases for quick access.
@z

@x
```bash
# List aliases
$ docker agent alias ls
@y
```bash
# List aliases
$ docker agent alias ls
@z

@x
# List aliases as JSON
$ docker agent alias list --json
@y
# List aliases as JSON
$ docker agent alias list --json
@z

@x
# Add an alias
$ docker agent alias add pirate /path/to/pirate.yaml
$ docker agent alias add other ociReference
@y
# Add an alias
$ docker agent alias add pirate /path/to/pirate.yaml
$ docker agent alias add other ociReference
@z

@x
# Add an alias with runtime options
$ docker agent alias add yolo-coder myorg/coder --yolo
$ docker agent alias add careful-coder myorg/coder --safety balanced
$ docker agent alias add fast-coder myorg/coder --model openai/gpt-4o-mini
$ docker agent alias add safe-coder myorg/coder --sandbox
$ docker agent alias add turbo myorg/coder --yolo --model anthropic/claude-sonnet-4-5
@y
# Add an alias with runtime options
$ docker agent alias add yolo-coder myorg/coder --yolo
$ docker agent alias add careful-coder myorg/coder --safety balanced
$ docker agent alias add fast-coder myorg/coder --model openai/gpt-4o-mini
$ docker agent alias add safe-coder myorg/coder --sandbox
$ docker agent alias add turbo myorg/coder --yolo --model anthropic/claude-sonnet-4-5
@z

@x
# Use an alias
$ docker agent run pirate
$ docker agent run yolo-coder
```
@y
# Use an alias
$ docker agent run pirate
$ docker agent run yolo-coder
```
@z

@x
**Alias Options:** Aliases can include runtime options that apply automatically when used:
@y
**Alias Options:** Aliases can include runtime options that apply automatically when used:
@z

@x
- `--yolo` — Auto-approve tool calls (unless explicitly denied) when running the alias. Legacy alias for `--safety autonomous`.
- `--safety <mode>` — Default [safety mode](../../configuration/permissions/index.md#safety-modes) (`strict`, `balanced`, `restricted`, or `autonomous`) when running the alias. Wins over the alias's `yolo` option; both are stored declaratively in the user config (`aliases.<name>.safety` / `aliases.<name>.yolo`), so you can also edit them there by hand.
- `--model <ref>` — Override the model for the alias
- `--hide-tool-results` — Hide tool call results in the TUI when running the alias
- `--sandbox` — Always run the alias inside a [Docker sandbox](../../configuration/sandbox/index.md)
@y
- `--yolo` — Auto-approve tool calls (unless explicitly denied) when running the alias. Legacy alias for `--safety autonomous`.
- `--safety <mode>` — Default [safety mode](../../configuration/permissions/index.md#safety-modes) (`strict`, `balanced`, `restricted`, or `autonomous`) when running the alias. Wins over the alias's `yolo` option; both are stored declaratively in the user config (`aliases.<name>.safety` / `aliases.<name>.yolo`), so you can also edit them there by hand.
- `--model <ref>` — Override the model for the alias
- `--hide-tool-results` — Hide tool call results in the TUI when running the alias
- `--sandbox` — Always run the alias inside a [Docker sandbox](../../configuration/sandbox/index.md)
@z

@x
Alias safety options are defaults for new sessions: an explicit `--safety`/`--yolo` on the command line wins over them, they win over `settings.safety`/`settings.YOLO` and over anything declared in the agent YAML, and they never change the mode of a resumed session.
@y
Alias safety options are defaults for new sessions: an explicit `--safety`/`--yolo` on the command line wins over them, they win over `settings.safety`/`settings.YOLO` and over anything declared in the agent YAML, and they never change the mode of a resumed session.
@z

@x
When listing aliases, options are shown in brackets:
@y
When listing aliases, options are shown in brackets:
@z

@x
```bash
$ docker agent alias ls
Registered aliases (3):
@y
```bash
$ docker agent alias ls
Registered aliases (3):
@z

@x
  fast-coder  → myorg/coder [model=openai/gpt-4o-mini]
  turbo       → myorg/coder [yolo, model=anthropic/claude-sonnet-4-5]
  yolo-coder  → myorg/coder [yolo]
@y
  fast-coder  → myorg/coder [model=openai/gpt-4o-mini]
  turbo       → myorg/coder [yolo, model=anthropic/claude-sonnet-4-5]
  yolo-coder  → myorg/coder [yolo]
@z

@x
Run an alias with: docker agent run <alias>
```
@y
Run an alias with: docker agent run <alias>
```
@z

@x
Pass `--json` to output aliases as a JSON array instead of the formatted table. Each entry includes the alias `name` and its options:
@y
Pass `--json` to output aliases as a JSON array instead of the formatted table. Each entry includes the alias `name` and its options:
@z

@x
```bash
$ docker agent alias list --json
[
  {
    "name": "fast-coder",
    "path": "myorg/coder",
    "model": "openai/gpt-4o-mini"
  },
  {
    "name": "turbo",
    "path": "myorg/coder",
    "yolo": true,
    "model": "anthropic/claude-sonnet-4-5"
  },
  {
    "name": "yolo-coder",
    "path": "myorg/coder",
    "yolo": true
  }
]
```
@y
```bash
$ docker agent alias list --json
[
  {
    "name": "fast-coder",
    "path": "myorg/coder",
    "model": "openai/gpt-4o-mini"
  },
  {
    "name": "turbo",
    "path": "myorg/coder",
    "yolo": true,
    "model": "anthropic/claude-sonnet-4-5"
  },
  {
    "name": "yolo-coder",
    "path": "myorg/coder",
    "yolo": true
  }
]
```
@z

@x
JSON output is sorted by name and omits false/zero-valued fields. This is useful for scripting and automation.
@y
JSON output is sorted by name and omits false/zero-valued fields. This is useful for scripting and automation.
@z

@x
> [!TIP]
> **Override alias options**
>
> Command-line flags override alias options. For example, `docker agent run yolo-coder --yolo=false` disables yolo mode even though the alias has it enabled.
@y
> [!TIP]
> **Override alias options**
>
> Command-line flags override alias options. For example, `docker agent run yolo-coder --yolo=false` disables yolo mode even though the alias has it enabled.
@z

@x
> [!TIP]
> **Set a default agent**
>
> Create a `default` alias to customize what `docker agent` starts with no arguments:
>
> ```console
> $ docker agent alias add default /my/default/agent.yaml
> ```
>
> Then simply run `docker agent` — it will launch that agent automatically.
@y
> [!TIP]
> **Set a default agent**
>
> Create a `default` alias to customize what `docker agent` starts with no arguments:
>
> ```console
> $ docker agent alias add default /my/default/agent.yaml
> ```
>
> Then simply run `docker agent` — it will launch that agent automatically.
@z

@x
### `docker agent sandbox`
@y
### `docker agent sandbox`
@z

@x
Manage settings shared by every [`--sandbox`](../../configuration/sandbox/index.md) run — today, the persistent network allowlist that turns a `Blocked by network policy` 403 into a one-line, durable fix:
@y
Manage settings shared by every [`--sandbox`](../../configuration/sandbox/index.md) run — today, the persistent network allowlist that turns a `Blocked by network policy` 403 into a one-line, durable fix:
@z

@x
```bash
# Allow a host on every subsequent --sandbox run.
$ docker agent sandbox allow api.example.com
@y
```bash
# Allow a host on every subsequent --sandbox run.
$ docker agent sandbox allow api.example.com
@z

@x
# Or several at once.
$ docker agent sandbox allow api.example.com registry.npmjs.org:443
@y
# Or several at once.
$ docker agent sandbox allow api.example.com registry.npmjs.org:443
@z

@x
# See what's persisted in ~/.config/cagent/config.yaml.
$ docker agent sandbox list
@y
# See what's persisted in ~/.config/cagent/config.yaml.
$ docker agent sandbox list
@z

@x
# Drop a host you no longer need.
$ docker agent sandbox deny api.example.com
```
@y
# Drop a host you no longer need.
$ docker agent sandbox deny api.example.com
```
@z

@x
Entries are unioned with the gateway, the kit-resolved tool install hosts, and any `runtime.network_allowlist` declared by the agent. The launch summary lists every source separately so you can see which holes were punched by which layer.
@y
Entries are unioned with the gateway, the kit-resolved tool install hosts, and any `runtime.network_allowlist` declared by the agent. The launch summary lists every source separately so you can see which holes were punched by which layer.
@z

@x
### `docker agent plans`
@y
### `docker agent plans`
@z

@x
Manage the plans agents collaborate on, from the host — without starting a session. Two plan systems are covered:
@y
Manage the plans agents collaborate on, from the host — without starting a session. Two plan systems are covered:
@z

@x
- **Shared plans** — the named, versioned documents of the [plan toolset](../../tools/plan/index.md). Fully manageable: create, update, set status, export, delete.
- **Session plans** — the single per-session plan of the "draft, review, execute" workflow. Read-only here (`list`, `get`, `export`); they belong to their session and are changed from within it. A mutation aimed at a session plan fails with an `unsupported` error explaining what to do instead.
@y
- **Shared plans** — the named, versioned documents of the [plan toolset](../../tools/plan/index.md). Fully manageable: create, update, set status, export, delete.
- **Session plans** — the single per-session plan of the "draft, review, execute" workflow. Read-only here (`list`, `get`, `export`); they belong to their session and are changed from within it. A mutation aimed at a session plan fails with an `unsupported` error explaining what to do instead.
@z

@x
```bash
$ docker agent plans <subcommand> [flags]
```
@y
```bash
$ docker agent plans <subcommand> [flags]
```
@z

@x
| Subcommand | Description |
| ---------- | ----------- |
| `list [--session <id>]` | List shared plans with scope, name, status, version, updated time, and title. With `--session`, that session's plan is listed first when it exists. Plans that exist but cannot be read are reported as warnings on stderr (in the `warnings` field with `--json`), so they are never mistaken for missing. |
| `get <name>` | Print a plan. Content goes to stdout and a concise metadata line goes to stderr, so `> file` captures the content alone (use `export` for a byte-exact copy). `get --session <id>` prints a session's plan; the name is then omitted (`--scope shared\|session` disambiguates explicitly, and `--session` alone implies session scope). |
| `create <name> --file <path>` | Create a new shared plan with content from `--file` (required — the CLI never prompts; `--file -` reads stdin). Create-only: an existing name fails with a version conflict instead of overwriting. `--title`, `--author`, and `--status` set metadata. |
| `update <name> --file <path>` | Replace the content of an existing shared plan (never creates). Omitted `--title`/`--author`/`--status` flags preserve the current values; passing them (even empty) overwrites. |
| `status <name> <status>` | Set a shared plan's free-form status without touching its body (bumps the version). |
| `export <name> --output <path>` | Write a plan's content, byte-exact, to a file (parents created, atomic write). An existing destination is refused (`invalid_argument`) and left untouched; add `--force` to replace an existing regular file atomically. Works for both scopes: `export --session <id> --output <path>`. |
| `delete <name>` | Delete a shared plan. A `--force` delete also recovers a corrupt plan. |
@y
| Subcommand | Description |
| ---------- | ----------- |
| `list [--session <id>]` | List shared plans with scope, name, status, version, updated time, and title. With `--session`, that session's plan is listed first when it exists. Plans that exist but cannot be read are reported as warnings on stderr (in the `warnings` field with `--json`), so they are never mistaken for missing. |
| `get <name>` | Print a plan. Content goes to stdout and a concise metadata line goes to stderr, so `> file` captures the content alone (use `export` for a byte-exact copy). `get --session <id>` prints a session's plan; the name is then omitted (`--scope shared\|session` disambiguates explicitly, and `--session` alone implies session scope). |
| `create <name> --file <path>` | Create a new shared plan with content from `--file` (required — the CLI never prompts; `--file -` reads stdin). Create-only: an existing name fails with a version conflict instead of overwriting. `--title`, `--author`, and `--status` set metadata. |
| `update <name> --file <path>` | Replace the content of an existing shared plan (never creates). Omitted `--title`/`--author`/`--status` flags preserve the current values; passing them (even empty) overwrites. |
| `status <name> <status>` | Set a shared plan's free-form status without touching its body (bumps the version). |
| `export <name> --output <path>` | Write a plan's content, byte-exact, to a file (parents created, atomic write). An existing destination is refused (`invalid_argument`) and left untouched; add `--force` to replace an existing regular file atomically. Works for both scopes: `export --session <id> --output <path>`. |
| `delete <name>` | Delete a shared plan. A `--force` delete also recovers a corrupt plan. |
@z

@x
Plan content passed via `--file` (a regular file, or stdin with `--file -`) is capped at 10 MiB — the same limit the plan storage itself enforces — and a directory or non-regular file (device, named pipe) is rejected up front; violations fail with an `invalid_argument` error.
@y
Plan content passed via `--file` (a regular file, or stdin with `--file -`) is capped at 10 MiB — the same limit the plan storage itself enforces — and a directory or non-regular file (device, named pipe) is rejected up front; violations fail with an `invalid_argument` error.
@z

@x
**Concurrency guard:** every mutation (`update`, `status`, `delete`) requires exactly one of two mutually exclusive flags — the CLI is headless and never prompts:
@y
**Concurrency guard:** every mutation (`update`, `status`, `delete`) requires exactly one of two mutually exclusive flags — the CLI is headless and never prompts:
@z

@x
- `--expected-version <n>` — the version you last read (from `get` or `list`; must be ≥ 1). When the plan changed in the meantime the command fails with a version conflict, reports the current version, leaves the plan untouched, and exits with code **3** (all other failures exit with 1).
- `--force` — deliberately write without the optimistic-lock guard (last writer wins).
@y
- `--expected-version <n>` — the version you last read (from `get` or `list`; must be ≥ 1). When the plan changed in the meantime the command fails with a version conflict, reports the current version, leaves the plan untouched, and exits with code **3** (all other failures exit with 1).
- `--force` — deliberately write without the optimistic-lock guard (last writer wins).
@z

@x
`create` takes no guard: it is inherently create-only and conflicts (exit code 3) when the name already exists.
@y
`create` takes no guard: it is inherently create-only and conflicts (exit code 3) when the name already exists.
@z

@x
**JSON output:** every subcommand accepts `--json`. Success documents go to stdout with a top-level `"schema_version": "1"` marker and stable service-model keys (`plans`, `plan`, `export`, `deleted`) whose fields are snake_case (`updated_at`, `session_id`, `bytes_written`; a zero/unknown `updated_at` is omitted); empty plan lists encode as `[]`, and no prose or ANSI is mixed in. Failures print a single JSON object to stderr:
@y
**JSON output:** every subcommand accepts `--json`. Success documents go to stdout with a top-level `"schema_version": "1"` marker and stable service-model keys (`plans`, `plan`, `export`, `deleted`) whose fields are snake_case (`updated_at`, `session_id`, `bytes_written`; a zero/unknown `updated_at` is omitted); empty plan lists encode as `[]`, and no prose or ANSI is mixed in. Failures print a single JSON object to stderr:
@z

@x
```json
{"schema_version":"1","error":{"code":"conflict","message":"...","scope":"shared","name":"p","expected_version":1,"current_version":2}}
```
@y
```json
{"schema_version":"1","error":{"code":"conflict","message":"...","scope":"shared","name":"p","expected_version":1,"current_version":2}}
```
@z

@x
with `code` one of `conflict` (including `expected_version` and `current_version`), `not_found`, `invalid_argument`, `unsupported`, `corrupt`, `storage`, or `error`; `scope`, `name`, and `op` are included where the failure carries them. Validation performed before a subcommand runs is covered too: a missing required flag, a violated `--expected-version`/`--force` group rule, and wrong positional arguments are reported as the same JSON object (code `invalid_argument`) whenever `--json` is present. One residual: flags are parsed left-to-right and parsing stops at the first unknown flag or invalid flag value, so such an error is reported as JSON only when `--json` appears before it on the command line; errors raised before a `plans` subcommand is resolved at all (e.g. an unknown subcommand) also remain plain text.
@y
with `code` one of `conflict` (including `expected_version` and `current_version`), `not_found`, `invalid_argument`, `unsupported`, `corrupt`, `storage`, or `error`; `scope`, `name`, and `op` are included where the failure carries them. Validation performed before a subcommand runs is covered too: a missing required flag, a violated `--expected-version`/`--force` group rule, and wrong positional arguments are reported as the same JSON object (code `invalid_argument`) whenever `--json` is present. One residual: flags are parsed left-to-right and parsing stops at the first unknown flag or invalid flag value, so such an error is reported as JSON only when `--json` appears before it on the command line; errors raised before a `plans` subcommand is resolved at all (e.g. an unknown subcommand) also remain plain text.
@z

@x
```bash
# Examples
$ docker agent plans list
$ docker agent plans list --json | jq '.plans[].name'
$ docker agent plans create release --file ./plan.md --title "Release plan" --status draft
$ cat plan.md | docker agent plans create release --file -
$ docker agent plans get release > plan.md            # content only; metadata on stderr
$ docker agent plans update release --file ./plan.md --expected-version 1
$ docker agent plans status release done --expected-version 2
$ docker agent plans export release --output ./plan.md
$ docker agent plans export release --output ./plan.md --force   # replace an existing file
$ docker agent plans delete release --expected-version 3
$ docker agent plans delete scratch --force
$ docker agent plans get --session <session-id>       # a session's plan
$ docker agent plans export --session <session-id> --output ./session-plan.md
```
@y
```bash
# Examples
$ docker agent plans list
$ docker agent plans list --json | jq '.plans[].name'
$ docker agent plans create release --file ./plan.md --title "Release plan" --status draft
$ cat plan.md | docker agent plans create release --file -
$ docker agent plans get release > plan.md            # content only; metadata on stderr
$ docker agent plans update release --file ./plan.md --expected-version 1
$ docker agent plans status release done --expected-version 2
$ docker agent plans export release --output ./plan.md
$ docker agent plans export release --output ./plan.md --force   # replace an existing file
$ docker agent plans delete release --expected-version 3
$ docker agent plans delete scratch --force
$ docker agent plans get --session <session-id>       # a session's plan
$ docker agent plans export --session <session-id> --output ./session-plan.md
```
@z

@x
Plans live under the data directory (`~/.cagent/plans/` and `~/.cagent/session_plans/` by default), so `--data-dir` selects which store the commands operate on.
@y
Plans live under the data directory (`~/.cagent/plans/` and `~/.cagent/session_plans/` by default), so `--data-dir` selects which store the commands operate on.
@z

@x
### `docker agent debug`
@y
### `docker agent debug`
@z

@x
Troubleshooting subcommands for inspecting how an agent config resolves and generating diagnostic output — useful when a config isn't behaving the way you expect. `debug` doesn't appear in `docker agent --help` (it's a diagnostic surface, not a day-to-day command), but every subcommand below is stable and fully supported.
@y
Troubleshooting subcommands for inspecting how an agent config resolves and generating diagnostic output — useful when a config isn't behaving the way you expect. `debug` doesn't appear in `docker agent --help` (it's a diagnostic surface, not a day-to-day command), but every subcommand below is stable and fully supported.
@z

@x
```bash
$ docker agent debug <subcommand> [flags]
```
@y
```bash
$ docker agent debug <subcommand> [flags]
```
@z

@x
| Subcommand | Description |
| ---------- | ----------- |
| `config <agent-file>` | Print the fully-resolved, canonical form of an agent's configuration (defaults applied, references resolved). |
| `toolsets <agent-file>` | List every toolset each agent in the config exposes, with each tool's name and description. |
| `skills <agent-file>` | List the skills discovered for each agent, marking forked skills. |
| `title <agent-file> <question>` | Generate a session title for `<question>` using the same title-generation path the TUI uses (including any configured `title_model`), without starting a session. See [Session Titles](../sessions/index.md#session-titles). |
| `auth` | Print parsed Docker authentication info from the token in use (source, subject, issuer, expiry, username/email). Add `--json` for machine-readable output. |
| `oauth list` | List stored MCP OAuth tokens (resource, scope, expiry, redacted access token). Add `--json` for machine-readable output. |
| `oauth remove <resource-url>` | Remove a stored MCP OAuth token. |
| `oauth login <agent-file> <mcp-name>` | Perform an interactive OAuth login for a remote MCP server declared in the config, by its name or URL. See [Remote MCP Servers](../remote-mcp/index.md). |
@y
| Subcommand | Description |
| ---------- | ----------- |
| `config <agent-file>` | Print the fully-resolved, canonical form of an agent's configuration (defaults applied, references resolved). |
| `toolsets <agent-file>` | List every toolset each agent in the config exposes, with each tool's name and description. |
| `skills <agent-file>` | List the skills discovered for each agent, marking forked skills. |
| `title <agent-file> <question>` | Generate a session title for `<question>` using the same title-generation path the TUI uses (including any configured `title_model`), without starting a session. See [Session Titles](../sessions/index.md#session-titles). |
| `auth` | Print parsed Docker authentication info from the token in use (source, subject, issuer, expiry, username/email). Add `--json` for machine-readable output. |
| `oauth list` | List stored MCP OAuth tokens (resource, scope, expiry, redacted access token). Add `--json` for machine-readable output. |
| `oauth remove <resource-url>` | Remove a stored MCP OAuth token. |
| `oauth login <agent-file> <mcp-name>` | Perform an interactive OAuth login for a remote MCP server declared in the config, by its name or URL. See [Remote MCP Servers](../remote-mcp/index.md). |
@z

@x
```bash
# Examples
$ docker agent debug config agent.yaml
$ docker agent debug toolsets agent.yaml
$ docker agent debug skills agent.yaml
$ docker agent debug title agent.yaml "How do I configure a fallback model?"
$ docker agent debug auth --json
$ docker agent debug oauth list
$ docker agent debug oauth login agent.yaml github
```
@y
```bash
# Examples
$ docker agent debug config agent.yaml
$ docker agent debug toolsets agent.yaml
$ docker agent debug skills agent.yaml
$ docker agent debug title agent.yaml "How do I configure a fallback model?"
$ docker agent debug auth --json
$ docker agent debug oauth list
$ docker agent debug oauth login agent.yaml github
```
@z

@x
> [!WARNING]
> **`debug auth --json` prints the full bearer token**
>
> The text output of `debug auth` truncates the token to a short preview, but `--json` includes the complete, unredacted JWT in its `token` field. Never paste `debug auth --json` output into logs, issue trackers, or bug reports — anyone with that token can act as you against Docker. Use the plain-text output (or redact the `token` field yourself) when sharing diagnostic output.
@y
> [!WARNING]
> **`debug auth --json` prints the full bearer token**
>
> The text output of `debug auth` truncates the token to a short preview, but `--json` includes the complete, unredacted JWT in its `token` field. Never paste `debug auth --json` output into logs, issue trackers, or bug reports — anyone with that token can act as you against Docker. Use the plain-text output (or redact the `token` field yourself) when sharing diagnostic output.
@z

@x
The `Source` field says where the token came from: `docker desktop`, or `minted from the stored access token` when it was obtained by exchanging the access token `docker login` stored. See [Docker authentication](../../guides/secrets/index.md#docker-authentication).
@y
The `Source` field says where the token came from: `docker desktop`, or `minted from the stored access token` when it was obtained by exchanging the access token `docker login` stored. See [Docker authentication](../../guides/secrets/index.md#docker-authentication).
@z

@x
The `config`, `toolsets`, `skills`, and `title` subcommands also accept [runtime configuration flags](#runtime-configuration-flags) (`--working-dir`, `--models-gateway`, …); `title` additionally accepts `--model` to override the model used to resolve the config before generating the title.
@y
The `config`, `toolsets`, `skills`, and `title` subcommands also accept [runtime configuration flags](#runtime-configuration-flags) (`--working-dir`, `--models-gateway`, …); `title` additionally accepts `--model` to override the model used to resolve the config before generating the title.
@z

@x
### `docker agent completion`
@y
### `docker agent completion`
@z

@x
Generate a shell completion script for `bash`, `zsh`, `fish`, or `powershell`.
@y
Generate a shell completion script for `bash`, `zsh`, `fish`, or `powershell`.
@z

@x
```bash
$ docker agent completion <bash|zsh|fish|powershell>
@y
```bash
$ docker agent completion <bash|zsh|fish|powershell>
@z

@x
# Examples
# Bash: load for the current session
$ source <(docker agent completion bash)
@y
# Examples
# Bash: load for the current session
$ source <(docker agent completion bash)
@z

@x
# Zsh: install permanently (adjust the path for your $fpath)
$ docker agent completion zsh > "${fpath[1]}/_docker-agent"
```
@y
# Zsh: install permanently (adjust the path for your $fpath)
$ docker agent completion zsh > "${fpath[1]}/_docker-agent"
```
@z

@x
Run `docker agent completion <shell> --help` for shell-specific installation instructions.
@y
Run `docker agent completion <shell> --help` for shell-specific installation instructions.
@z

@x
### Self-update
@y
### Self-update
@z

@x
When installed from a standalone GitHub release binary, Docker Agent can opt in to updating itself. It's disabled by default; set `DOCKER_AGENT_AUTO_UPDATE` to a truthy value (`1`, `true`, `yes`, `on`) to enable it for a command or a shell session:
@y
When installed from a standalone GitHub release binary, Docker Agent can opt in to updating itself. It's disabled by default; set `DOCKER_AGENT_AUTO_UPDATE` to a truthy value (`1`, `true`, `yes`, `on`) to enable it for a command or a shell session:
@z

@x
```bash
$ DOCKER_AGENT_AUTO_UPDATE=1 docker agent run
```
@y
```bash
$ DOCKER_AGENT_AUTO_UPDATE=1 docker agent run
```
@z

@x
When enabled, every command checks the latest GitHub release before running. If a newer release exists, an interactive session asks whether to install it; a non-interactive session (CI, piped input) proceeds automatically. On yes, Docker Agent downloads the asset for your OS/architecture, verifies its checksum, replaces the current binary, and re-executes with the same arguments. The whole mechanism is fail-safe: any failure at any step falls back to running the current binary. Self-update never triggers for `version`, `help`, `--help`/`-h` (including per-subcommand help), `completion`, or the Docker CLI plugin metadata handshake.
@y
When enabled, every command checks the latest GitHub release before running. If a newer release exists, an interactive session asks whether to install it; a non-interactive session (CI, piped input) proceeds automatically. On yes, Docker Agent downloads the asset for your OS/architecture, verifies its checksum, replaces the current binary, and re-executes with the same arguments. The whole mechanism is fail-safe: any failure at any step falls back to running the current binary. Self-update never triggers for `version`, `help`, `--help`/`-h` (including per-subcommand help), `completion`, or the Docker CLI plugin metadata handshake.
@z

@x
See [Optional Self-Updates](../../getting-started/installation/index.md#optional-self-updates) for the full walkthrough. Docker Desktop and Homebrew installs already manage updates and don't need this.
@y
See [Optional Self-Updates](../../getting-started/installation/index.md#optional-self-updates) for the full walkthrough. Docker Desktop and Homebrew installs already manage updates and don't need this.
@z

@x
## Global Flags
@y
## Global Flags
@z

@x
These flags are available on every `docker agent` command:
@y
These flags are available on every `docker agent` command:
@z

@x
| Flag                      | Description                                                                            |
| ------------------------- | -------------------------------------------------------------------------------------- |
| `-d, --debug`             | Enable debug logging (default location: `~/.cagent/cagent.debug.log`)                  |
| `--log-file <path>`       | Custom debug log location (only used with `--debug`)                                   |
| `-o, --otel`              | Enable OpenTelemetry observability: traces, metrics, and logs. Requires `OTEL_EXPORTER_OTLP_ENDPOINT` to export to a collector. |
| `--cache-dir <path>`      | Override the cache directory (default: `~/Library/Caches/cagent` on macOS)             |
| `--config-dir <path>`     | Override the config directory (default: `~/.config/cagent`). Also reads `DOCKER_AGENT_CONFIG_DIR` (legacy `CAGENT_CONFIG_DIR`) env var. |
| `--data-dir <path>`       | Override the data directory (default: `~/.cagent`; holds `session.db`, worktrees, plans, …)            |
| `--help`                  | Show help for any command                                                              |
@y
| Flag                      | Description                                                                            |
| ------------------------- | -------------------------------------------------------------------------------------- |
| `-d, --debug`             | Enable debug logging (default location: `~/.cagent/cagent.debug.log`)                  |
| `--log-file <path>`       | Custom debug log location (only used with `--debug`)                                   |
| `-o, --otel`              | Enable OpenTelemetry observability: traces, metrics, and logs. Requires `OTEL_EXPORTER_OTLP_ENDPOINT` to export to a collector. |
| `--cache-dir <path>`      | Override the cache directory (default: `~/Library/Caches/cagent` on macOS)             |
| `--config-dir <path>`     | Override the config directory (default: `~/.config/cagent`). Also reads `DOCKER_AGENT_CONFIG_DIR` (legacy `CAGENT_CONFIG_DIR`) env var. |
| `--data-dir <path>`       | Override the data directory (default: `~/.cagent`; holds `session.db`, worktrees, plans, …)            |
| `--help`                  | Show help for any command                                                              |
@z

@x
### OpenTelemetry environment variables
@y
### OpenTelemetry environment variables
@z

@x
When `--otel` is enabled, the standard [OTel SDK env vars](https://opentelemetry.io/docs/specs/otel/configuration/sdk-environment-variables/) are honored (`OTEL_EXPORTER_OTLP_ENDPOINT`, `OTEL_RESOURCE_ATTRIBUTES`, etc.). Two additional Docker Agent-specific variables control GenAI instrumentation:
@y
When `--otel` is enabled, the standard [OTel SDK env vars](https://opentelemetry.io/docs/specs/otel/configuration/sdk-environment-variables/) are honored (`OTEL_EXPORTER_OTLP_ENDPOINT`, `OTEL_RESOURCE_ATTRIBUTES`, etc.). Two additional Docker Agent-specific variables control GenAI instrumentation:
@z

@x
| Variable | Default | Description |
| -------- | ------- | ----------- |
| `OTEL_INSTRUMENTATION_GENAI_CAPTURE_MESSAGE_CONTENT` | `false` | Set to `true` to capture prompt text, model responses, tool arguments, and tool results as span attributes. Off by default because these fields may contain PII. |
| `OTEL_SEMCONV_STABILITY_OPT_IN` | (dual-emit) | Set to `gen_ai_latest_experimental` to emit only the spec-defined `gen_ai.*` keys from the [GenAI semantic conventions](https://opentelemetry.io/docs/specs/semconv/gen-ai/). The default dual-emit mode emits both `gen_ai.*` and legacy keys so existing dashboards continue working. |
@y
| Variable | Default | Description |
| -------- | ------- | ----------- |
| `OTEL_INSTRUMENTATION_GENAI_CAPTURE_MESSAGE_CONTENT` | `false` | Set to `true` to capture prompt text, model responses, tool arguments, and tool results as span attributes. Off by default because these fields may contain PII. |
| `OTEL_SEMCONV_STABILITY_OPT_IN` | (dual-emit) | Set to `gen_ai_latest_experimental` to emit only the spec-defined `gen_ai.*` keys from the [GenAI semantic conventions](https://opentelemetry.io/docs/specs/semconv/gen-ai/). The default dual-emit mode emits both `gen_ai.*` and legacy keys so existing dashboards continue working. |
@z

@x
## Runtime Configuration Flags
@y
## Runtime Configuration Flags
@z

@x
These flags are accepted by every command that loads an agent (`run`, `run --exec`, `new`, `eval`, `serve api`, `serve mcp`, `serve a2a`, `serve acp`, `serve chat`). They are listed once here to avoid repetition in the per-command tables above.
@y
These flags are accepted by every command that loads an agent (`run`, `run --exec`, `new`, `eval`, `serve api`, `serve mcp`, `serve a2a`, `serve acp`, `serve chat`). They are listed once here to avoid repetition in the per-command tables above.
@z

@x
| Flag                            | Description                                                                                                              |
| ------------------------------- | ------------------------------------------------------------------------------------------------------------------------ |
| `--working-dir <path>`          | Set the working directory for the session (applies to tools and relative paths).                                         |
| `--env-from-file <path>`        | Load environment variables from file (repeatable).                                                                       |
| `--flavor <name>`               | Enable a config flavor, a YAML patch defined under the config's `flavors` section (repeatable, applied in order). See [Flavors](../../configuration/flavors/index.md). |
| `--code-mode-tools`             | Provide a single tool to call other tools via JavaScript (forces code-mode tools globally).                              |
| `--models-gateway <addr>`       | Route model traffic through a gateway. Reads `DOCKER_AGENT_MODELS_GATEWAY` (legacy `CAGENT_MODELS_GATEWAY`) env var.      |
| `--hook-pre-tool-use <cmd>`     | Add a pre-tool-use hook command (repeatable). See [Hooks](../../configuration/hooks/index.md).                 |
| `--hook-post-tool-use <cmd>`    | Add a post-tool-use hook command (repeatable).                                                                           |
| `--hook-session-start <cmd>`    | Add a session-start hook command (repeatable).                                                                           |
| `--hook-session-end <cmd>`      | Add a session-end hook command (repeatable).                                                                             |
| `--hook-on-user-input <cmd>`    | Add an on-user-input hook command (repeatable).                                                                          |
| `--hook-stop <cmd>`             | Add a stop hook command, fired when the model finishes responding (repeatable).                                          |
| `--mcp-oauth-redirect-uri <url>` | Public HTTPS URL to advertise as the OAuth `redirect_uri` for MCP servers running in unmanaged OAuth mode. When set, docker-agent drives PKCE and the code exchange in-process instead of expecting the client to. See [Remote MCP](../remote-mcp/index.md) for details. |
@y
| Flag                            | Description                                                                                                              |
| ------------------------------- | ------------------------------------------------------------------------------------------------------------------------ |
| `--working-dir <path>`          | Set the working directory for the session (applies to tools and relative paths).                                         |
| `--env-from-file <path>`        | Load environment variables from file (repeatable).                                                                       |
| `--flavor <name>`               | Enable a config flavor, a YAML patch defined under the config's `flavors` section (repeatable, applied in order). See [Flavors](../../configuration/flavors/index.md). |
| `--code-mode-tools`             | Provide a single tool to call other tools via JavaScript (forces code-mode tools globally).                              |
| `--models-gateway <addr>`       | Route model traffic through a gateway. Reads `DOCKER_AGENT_MODELS_GATEWAY` (legacy `CAGENT_MODELS_GATEWAY`) env var.      |
| `--hook-pre-tool-use <cmd>`     | Add a pre-tool-use hook command (repeatable). See [Hooks](../../configuration/hooks/index.md).                 |
| `--hook-post-tool-use <cmd>`    | Add a post-tool-use hook command (repeatable).                                                                           |
| `--hook-session-start <cmd>`    | Add a session-start hook command (repeatable).                                                                           |
| `--hook-session-end <cmd>`      | Add a session-end hook command (repeatable).                                                                             |
| `--hook-on-user-input <cmd>`    | Add an on-user-input hook command (repeatable).                                                                          |
| `--hook-stop <cmd>`             | Add a stop hook command, fired when the model finishes responding (repeatable).                                          |
| `--mcp-oauth-redirect-uri <url>` | Public HTTPS URL to advertise as the OAuth `redirect_uri` for MCP servers running in unmanaged OAuth mode. When set, docker-agent drives PKCE and the code exchange in-process instead of expecting the client to. See [Remote MCP](../remote-mcp/index.md) for details. |
@z

@x
## Agent References
@y
## Agent References
@z

@x
Commands that accept a config support multiple reference types:
@y
Commands that accept a config support multiple reference types:
@z

@x
| Type          | Example                                     |
| ------------- | ------------------------------------------- |
| Local file    | `./agent.yaml`                              |
| OCI registry  | `docker.io/username/agent:latest`           |
| Hub shorthand | `myorg/agent:tag`                           |
| Alias         | `pirate` (after `docker agent alias add`)   |
| Default       | (no argument) — uses project config or built-in default agent |
@y
| Type          | Example                                     |
| ------------- | ------------------------------------------- |
| Local file    | `./agent.yaml`                              |
| OCI registry  | `docker.io/username/agent:latest`           |
| Hub shorthand | `myorg/agent:tag`                           |
| Alias         | `pirate` (after `docker agent alias add`)   |
| Default       | (no argument) — uses project config or built-in default agent |
@z

@x
> [!NOTE]
> **Debugging**
>
> Having issues? See [Troubleshooting](../../community/troubleshooting/index.md) for debug mode, log analysis, and common solutions.
@y
> [!NOTE]
> **Debugging**
>
> Having issues? See [Troubleshooting](../../community/troubleshooting/index.md) for debug mode, log analysis, and common solutions.
@z
