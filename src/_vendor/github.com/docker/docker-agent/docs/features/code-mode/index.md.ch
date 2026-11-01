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
**Code Mode** replaces the agent's individual tools with a single tool, `run_tools_with_javascript`, that runs a JavaScript script. Wrapped tools are exposed to that script as JavaScript functions returning Promises; some tools remain directly callable (see [Limits & Security Notes](#limits--security-notes)). Scripts support top-level `await`; use `await` for dependent calls and `Promise.all` to run independent calls in parallel. The model writes a script that calls as many of them as it needs, combines and filters the results, and returns a single string — all in one tool call.
@y
**Code Mode** replaces the agent's individual tools with a single tool, `run_tools_with_javascript`, that runs a JavaScript script. Wrapped tools are exposed to that script as JavaScript functions returning Promises; some tools remain directly callable (see [Limits & Security Notes](#limits--security-notes)). Scripts support top-level `await`; use `await` for dependent calls and `Promise.all` to run independent calls in parallel. The model writes a script that calls as many of them as it needs, combines and filters the results, and returns a single string — all in one tool call.
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
## Parallel Tool Calls
@y
## Parallel Tool Calls
@z

@x
Each tool call starts immediately and returns a Promise. Await a call before using its result, or group independent calls with `Promise.all`:
@y
Each tool call starts immediately and returns a Promise. Await a call before using its result, or group independent calls with `Promise.all`:
@z

@x
```javascript
const results = await Promise.all([
  SearchIssues({query: "repo:docker/docker-agent is:open is:issue"}),
  SearchIssues({query: "repo:docker/docker-agent is:open is:pr"}),
]);
return results.join("\n");
```
@y
```javascript
const results = await Promise.all([
  SearchIssues({query: "repo:docker/docker-agent is:open is:issue"}),
  SearchIssues({query: "repo:docker/docker-agent is:open is:pr"}),
]);
return results.join("\n");
```
@z

@x
Use the function names and arguments listed in the tool description. Tool failures reject their Promises and can be handled with `try`/`catch` or `Promise.allSettled`. Unhandled rejections include tool-call history in the response. All started tool calls finish before the script response is returned, unless execution is cancelled; parallel calls are not rolled back if one fails. Existing scripts must await tool results before inspecting or combining them.
@y
Use the function names and arguments listed in the tool description. Tool failures reject their Promises and can be handled with `try`/`catch` or `Promise.allSettled`. Unhandled rejections include tool-call history in the response. All started tool calls finish before the script response is returned, unless execution is cancelled; parallel calls are not rolled back if one fails. Existing scripts must await tool results before inspecting or combining them.
@z

@x
## Tool Call Visibility
@y
## Tool Call Visibility
@z

@x
Both terminal UIs show the JavaScript script with syntax highlighting, followed by the individual tool calls it invokes. Calls stay in invocation order even when parallel calls finish in a different order. Each inner call shows its own execution status, streamed output (when supported by the tool), and result or error.
@y
Both terminal UIs show the JavaScript script with syntax highlighting, followed by the individual tool calls it invokes. Calls stay in invocation order even when parallel calls finish in a different order. Each inner call shows its own execution status, streamed output (when supported by the tool), and result or error.
@z

@x
The terminal UIs hide the outer script's result, `stdout`, and `stderr` to avoid duplicating the inner tool results. The complete script response is still returned to the model.
@y
The terminal UIs hide the outer script's result, `stdout`, and `stderr` to avoid duplicating the inner tool results. The complete script response is still returned to the model.
@z

@x
API event consumers receive the standard `tool_call`, `tool_call_output`, and `tool_call_response` events for inner calls, with a unique call ID and the inner tool's definition. These events are for live display only: inner calls do not add separate messages to the model conversation or the saved session history. They also do not introduce additional approval prompts; see [Interaction With Permissions and Tool Approval](#interaction-with-permissions-and-tool-approval).
@y
API event consumers receive the standard `tool_call`, `tool_call_output`, and `tool_call_response` events for inner calls, with a unique call ID and the inner tool's definition. These events are for live display only: inner calls do not add separate messages to the model conversation or the saved session history. They also do not introduce additional approval prompts; see [Interaction With Permissions and Tool Approval](#interaction-with-permissions-and-tool-approval).
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
- **One string result.** The script must return a string; use `console.*` inside the script to print debug information if something doesn't behave as expected — it comes back to the model as `stdout`/`stderr` alongside the result, but is not displayed by the terminal UIs.
- **Failures are diagnosable.** If the script throws or returns unexpectedly, the response includes the tool calls it made before failing (name, arguments, and result or error), so the model can see what happened and adjust the script on the next attempt.
- **Not every tool is wrapped.** Tools in the `todo` category and repeatable tools such as `random_int` and `get_datetime` stay directly callable as ordinary tools. Repeatable tools are unavailable inside scripts so successful calls retain their duplicate-loop exemption without exempting failed or unrelated scripts.
- **The script runs in an embedded, sandboxed JS engine** ([goja](https://github.com/dop251/goja)), not Node.js or a browser: there is no filesystem, network, or process access beyond the tool functions injected into it.
- **Partial startup is supported.** If one toolset fails to initialize (for example, an MCP server that won't connect), Code Mode remains available with the successfully loaded toolsets. The failed toolset is omitted from the JavaScript environment and retried on subsequent turns. A warning is emitted once when the failure first occurs, but not on subsequent turns while the failure persists. When the toolset recovers, its tools silently reappear in the environment. When the failed toolset's cause is retryable (e.g. an MCP server or RAG knowledge base hitting rate limits), its retries are paced by the same [backoff gate](../../tools/mcp/index.md#lifecycle-auto-restart-profiles) used outside code mode, instead of retrying on every turn.
@y
- **One string result.** The script must return a string; use `console.*` inside the script to print debug information if something doesn't behave as expected — it comes back to the model as `stdout`/`stderr` alongside the result, but is not displayed by the terminal UIs.
- **Failures are diagnosable.** If the script throws or returns unexpectedly, the response includes the tool calls it made before failing (name, arguments, and result or error), so the model can see what happened and adjust the script on the next attempt.
- **Not every tool is wrapped.** Tools in the `todo` category and repeatable tools such as `random_int` and `get_datetime` stay directly callable as ordinary tools. Repeatable tools are unavailable inside scripts so successful calls retain their duplicate-loop exemption without exempting failed or unrelated scripts.
- **The script runs in an embedded, sandboxed JS engine** ([goja](https://github.com/dop251/goja)), not Node.js or a browser: there is no filesystem, network, or process access beyond the tool functions injected into it.
- **Partial startup is supported.** If one toolset fails to initialize (for example, an MCP server that won't connect), Code Mode remains available with the successfully loaded toolsets. The failed toolset is omitted from the JavaScript environment and retried on subsequent turns. A warning is emitted once when the failure first occurs, but not on subsequent turns while the failure persists. When the toolset recovers, its tools silently reappear in the environment. When the failed toolset's cause is retryable (e.g. an MCP server or RAG knowledge base hitting rate limits), its retries are paced by the same [backoff gate](../../tools/mcp/index.md#lifecycle-auto-restart-profiles) used outside code mode, instead of retrying on every turn.
@z

@x
## Interaction With Permissions and Tool Approval
@y
## Interaction With Permissions and Tool Approval
@z

@x
[Permissions](../../configuration/permissions/index.md) and interactive tool-call approval are enforced when the **runtime dispatches a tool call requested by the model** — which, with Code Mode enabled, includes `run_tools_with_javascript` and any tools that remain directly callable. The individual tool calls a script makes from inside that JavaScript are invoked directly and do **not** go through a second round of permission checks or approval prompts.
@y
[Permissions](../../configuration/permissions/index.md) and interactive tool-call approval are enforced when the **runtime dispatches a tool call requested by the model** — which, with Code Mode enabled, includes `run_tools_with_javascript` and any tools that remain directly callable. The individual tool calls a script makes from inside that JavaScript are invoked directly and do **not** go through a second round of permission checks or approval prompts.
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
