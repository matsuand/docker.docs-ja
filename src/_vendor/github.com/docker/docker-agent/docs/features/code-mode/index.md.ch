%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

% __SUBDIR__ 対応

@x
title: "Code Mode"
description: "Let an agent write JavaScript that orchestrates several tool calls in one turn instead of calling tools one at a time."
keywords: docker agent, ai agents, features, code mode
@y
title: "Code Mode"
description: "Let an agent write JavaScript that orchestrates several tool calls in one turn instead of calling tools one at a time."
keywords: docker agent, ai agents, features, code mode
@z

@x
canonical: https://docs.docker.com/ai/docker-agent/features/code-mode/
@y
canonical: __SUBDIR__/ai/docker-agent/features/code-mode/
@z

@x
_Let an agent write JavaScript that orchestrates several tool calls in one turn instead of calling tools one at a time._
@y
_Let an agent write JavaScript that orchestrates several tool calls in one turn instead of calling tools one at a time._
@z

@x
## What Code Mode Is
@y
## What Code Mode Is
@z

@x
By default, a model calls one tool at a time: it emits a tool call, waits for the result, then decides what to call next. For a task that chains many tool calls together — "list every open issue, then for each one fetch its comments, then summarize" — that means one model round-trip per step.
@y
By default, a model calls one tool at a time: it emits a tool call, waits for the result, then decides what to call next. For a task that chains many tool calls together — "list every open issue, then for each one fetch its comments, then summarize" — that means one model round-trip per step.
@z

@x
**Code Mode** replaces the agent's individual tools with a single tool, `run_tools_with_javascript`, that runs a JavaScript script. Every tool the agent would otherwise call directly is exposed to that script as a plain JavaScript function (synchronous — no `await`/`async` needed). The model writes a script that calls as many of them as it needs, combines and filters the results, and returns a single string — all in one tool call.
@y
**Code Mode** replaces the agent's individual tools with a single tool, `run_tools_with_javascript`, that runs a JavaScript script. Every tool the agent would otherwise call directly is exposed to that script as a plain JavaScript function (synchronous — no `await`/`async` needed). The model writes a script that calls as many of them as it needs, combines and filters the results, and returns a single string — all in one tool call.
@z

@x
## Enabling Code Mode
@y
## Enabling Code Mode
@z

@x
Set `code_mode_tools: true` on an agent:
@y
Set `code_mode_tools: true` on an agent:
@z

@x
```yaml
# examples/code_mode.yaml
agents:
  root:
    model: anthropic/claude-sonnet-4-5
    description: Demonstrates the use of Code Mode with tools
    instruction: Use your tool to help the user with their github requests.
    code_mode_tools: true
    commands:
      demo: How many issues in docker/docker-agent have a number that is prime?
    toolsets:
      - type: mcp
        ref: docker:github-official
```
@y
```yaml
# examples/code_mode.yaml
agents:
  root:
    model: anthropic/claude-sonnet-4-5
    description: Demonstrates the use of Code Mode with tools
    instruction: Use your tool to help the user with their github requests.
    code_mode_tools: true
    commands:
      demo: How many issues in docker/docker-agent have a number that is prime?
    toolsets:
      - type: mcp
        ref: docker:github-official
```
@z

@x
Every toolset configured on the agent (the GitHub MCP server here) is wrapped: the model no longer sees the individual GitHub tools, only `run_tools_with_javascript`, with each wrapped tool documented as TypeScript interfaces, type aliases, and function declarations inside its description.
@y
Every toolset configured on the agent (the GitHub MCP server here) is wrapped: the model no longer sees the individual GitHub tools, only `run_tools_with_javascript`, with each wrapped tool documented as TypeScript interfaces, type aliases, and function declarations inside its description.
@z

@x
To force Code Mode for every agent in a run regardless of their individual config, use the `--code-mode-tools` CLI flag (or the equivalent `--code-mode-tools` [runtime configuration flag](../cli/index.md#runtime-configuration-flags), accepted by `run`, `run --exec`, `serve api`, `serve mcp`, and the other commands that load an agent):
@y
To force Code Mode for every agent in a run regardless of their individual config, use the `--code-mode-tools` CLI flag (or the equivalent `--code-mode-tools` [runtime configuration flag](../cli/index.md#runtime-configuration-flags), accepted by `run`, `run --exec`, `serve api`, `serve mcp`, and the other commands that load an agent):
@z

@x
```bash
$ docker agent run agent.yaml --code-mode-tools
```
@y
```bash
$ docker agent run agent.yaml --code-mode-tools
```
@z

@x
## When It Helps
@y
## When It Helps
@z

@x
Code Mode is worth enabling when an agent's task typically needs **many tool calls chained together**, especially with conditional logic or filtering in between — for example, paging through a large result set, cross-referencing several API calls, or reducing a large payload down to the few fields the model actually needs before it ever sees them. Each of those becomes one model turn instead of many, which cuts both latency and token spend on tool-call/response round-trips.
@y
Code Mode is worth enabling when an agent's task typically needs **many tool calls chained together**, especially with conditional logic or filtering in between — for example, paging through a large result set, cross-referencing several API calls, or reducing a large payload down to the few fields the model actually needs before it ever sees them. Each of those becomes one model turn instead of many, which cuts both latency and token spend on tool-call/response round-trips.
@z

@x
It is not a general-purpose replacement for direct tool calls: for an agent that mostly makes one or two independent tool calls per turn, Code Mode adds the overhead of writing and reasoning about a script for no real benefit.
@y
It is not a general-purpose replacement for direct tool calls: for an agent that mostly makes one or two independent tool calls per turn, Code Mode adds the overhead of writing and reasoning about a script for no real benefit.
@z

@x
## Limits & Security Notes
@y
## Limits & Security Notes
@z

@x
- **One string result.** The script must return a string; use `console.*` inside the script to print debug information if something doesn't behave as expected — it comes back as `stdout`/`stderr` alongside the result.
- **Failures are diagnosable.** If the script throws or returns unexpectedly, the response includes the tool calls it made before failing (name, arguments, and result or error), so the model can see what happened and adjust the script on the next attempt.
- **Not every tool is wrapped.** Tools in the `todo` category are excluded from the script environment and stay directly callable as ordinary tools — Code Mode does not replace them.
- **The script runs in an embedded, sandboxed JS engine** ([goja](https://github.com/dop251/goja)), not Node.js or a browser: there is no filesystem, network, or process access beyond the tool functions injected into it.
@y
- **One string result.** The script must return a string; use `console.*` inside the script to print debug information if something doesn't behave as expected — it comes back as `stdout`/`stderr` alongside the result.
- **Failures are diagnosable.** If the script throws or returns unexpectedly, the response includes the tool calls it made before failing (name, arguments, and result or error), so the model can see what happened and adjust the script on the next attempt.
- **Not every tool is wrapped.** Tools in the `todo` category are excluded from the script environment and stay directly callable as ordinary tools — Code Mode does not replace them.
- **The script runs in an embedded, sandboxed JS engine** ([goja](https://github.com/dop251/goja)), not Node.js or a browser: there is no filesystem, network, or process access beyond the tool functions injected into it.
@z

@x
## Interaction With Permissions and Tool Approval
@y
## Interaction With Permissions and Tool Approval
@z

@x
[Permissions](../../configuration/permissions/index.md) and interactive tool-call approval are enforced when the **runtime dispatches a tool call requested by the model** — which, with Code Mode enabled, is only `run_tools_with_javascript` itself. The individual tool calls a script makes from inside that JavaScript are invoked directly and do **not** go through a second round of permission checks or approval prompts.
@y
[Permissions](../../configuration/permissions/index.md) and interactive tool-call approval are enforced when the **runtime dispatches a tool call requested by the model** — which, with Code Mode enabled, is only `run_tools_with_javascript` itself. The individual tool calls a script makes from inside that JavaScript are invoked directly and do **not** go through a second round of permission checks or approval prompts.
@z

@x
In practice this means enabling `code_mode_tools` collapses the approval granularity from "one prompt per tool call" down to "one prompt for the whole script". Treat that single approval as authorizing everything the script's toolset could do:
@y
In practice this means enabling `code_mode_tools` collapses the approval granularity from "one prompt per tool call" down to "one prompt for the whole script". Treat that single approval as authorizing everything the script's toolset could do:
@z

@x
> [!WARNING]
> **Coarser approval granularity**
>
> Approving a `run_tools_with_javascript` call approves every tool it might invoke internally, including ones that would otherwise need a separate `ask` or be blocked by a `deny` pattern under [Permissions](../../configuration/permissions/index.md). If an agent's toolset includes anything destructive, consider whether Code Mode's coarser granularity is acceptable for that agent before enabling it. Delegating to a separate, non-Code-Mode agent isn't a way out either: [handoff](../../tools/handoff/index.md) and [transfer_task](../../tools/transfer-task/index.md) are themselves wrapped like any other tool once `code_mode_tools` is on, but they have no code-mode-compatible handler — the model's script gets `tool "handoff" is not available in code mode` if it tries to call them. This only rules out the model *choosing* to delegate from inside the script: a configured `force_handoff` target on the agent still runs deterministically after the agent's turn naturally stops, regardless of Code Mode, since it's applied by the runtime outside the tool-call dispatch path Code Mode replaces. Keep `code_mode_tools` off any agent whose model needs to hand off or transfer to one that holds a destructive toolset.
@y
> [!WARNING]
> **Coarser approval granularity**
>
> Approving a `run_tools_with_javascript` call approves every tool it might invoke internally, including ones that would otherwise need a separate `ask` or be blocked by a `deny` pattern under [Permissions](../../configuration/permissions/index.md). If an agent's toolset includes anything destructive, consider whether Code Mode's coarser granularity is acceptable for that agent before enabling it. Delegating to a separate, non-Code-Mode agent isn't a way out either: [handoff](../../tools/handoff/index.md) and [transfer_task](../../tools/transfer-task/index.md) are themselves wrapped like any other tool once `code_mode_tools` is on, but they have no code-mode-compatible handler — the model's script gets `tool "handoff" is not available in code mode` if it tries to call them. This only rules out the model *choosing* to delegate from inside the script: a configured `force_handoff` target on the agent still runs deterministically after the agent's turn naturally stops, regardless of Code Mode, since it's applied by the runtime outside the tool-call dispatch path Code Mode replaces. Keep `code_mode_tools` off any agent whose model needs to hand off or transfer to one that holds a destructive toolset.
@z
