%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

% __SUBDIR__ 対応

@x
title: "Go SDK"
description: "Use Docker Agent as a Go library to embed AI agents in your applications."
keywords: docker agent, ai agents, guides, go sdk
@y
title: "Go SDK"
description: "Use Docker Agent as a Go library to embed AI agents in your applications."
keywords: docker agent, ai agents, guides, go sdk
@z

@x
canonical: https://docs.docker.com/ai/docker-agent/guides/go-sdk/
@y
canonical: __SUBDIR__/ai/docker-agent/guides/go-sdk/
@z

@x
_Use Docker Agent as a Go library to embed AI agents in your applications._
@y
_Use Docker Agent as a Go library to embed AI agents in your applications._
@z

@x
## Overview
@y
## Overview
@z

@x
Docker Agent can be used as a Go library, allowing you to build AI agents directly into your Go applications. This gives you full programmatic control over agent creation, tool integration, and execution.
@y
Docker Agent can be used as a Go library, allowing you to build AI agents directly into your Go applications. This gives you full programmatic control over agent creation, tool integration, and execution.
@z

@x
> [!NOTE]
> **Import Path**
>
> ```go
> import "github.com/docker/docker-agent/pkg/..."
> ```
@y
> [!NOTE]
> **Import Path**
>
> ```go
> import "github.com/docker/docker-agent/pkg/..."
> ```
@z

@x
## Core Packages
@y
## Core Packages
@z

@x
| Package                | Purpose                                  |
| ---------------------- | ---------------------------------------- |
| `pkg/agent`            | Agent creation and configuration         |
| `pkg/runtime`          | Agent execution and event streaming      |
| `pkg/session`          | Conversation state management            |
| `pkg/team`             | Multi-agent team composition             |
| `pkg/tools`            | Tool interface and utilities             |
| `pkg/tools/builtin`    | Built-in tools (shell, filesystem, etc.) |
| `pkg/model/provider/*` | Model provider clients                   |
| `pkg/config/latest`    | Configuration types                      |
| `pkg/environment`      | Environment and secrets                  |
| `pkg/embeddedchat`     | Headless chat session for embedding the agent runtime in a custom UI |
| `pkg/tui/components/toolconfirm` | Tool-confirmation policy: `Decision` enum, `BuildPermissionPattern`, key bindings, and rejection-reason presets. Share this instead of copying the permission-pattern logic. |
| `pkg/tui/service`      | `StaticSessionState` — a `SessionStateReader` with conservative fixed values, for rendering message/tool views outside the full TUI app. Replaces hand-rolled nine-method stubs. |
| `pkg/tui/animation`    | `Stopper` / `StopView` — animation lifecycle contract. Call `StopAnimation` on views removed from the UI to prevent leaked tick subscriptions. |
| `pkg/tui/components/transcript` | Embedded transcript view with read-only `Messages()` accessor for observing conversation structure in host tests and persistence layers. |
@y
| Package                | Purpose                                  |
| ---------------------- | ---------------------------------------- |
| `pkg/agent`            | Agent creation and configuration         |
| `pkg/runtime`          | Agent execution and event streaming      |
| `pkg/session`          | Conversation state management            |
| `pkg/team`             | Multi-agent team composition             |
| `pkg/tools`            | Tool interface and utilities             |
| `pkg/tools/builtin`    | Built-in tools (shell, filesystem, etc.) |
| `pkg/model/provider/*` | Model provider clients                   |
| `pkg/config/latest`    | Configuration types                      |
| `pkg/environment`      | Environment and secrets                  |
| `pkg/embeddedchat`     | Headless chat session for embedding the agent runtime in a custom UI |
| `pkg/tui/components/toolconfirm` | Tool-confirmation policy: `Decision` enum, `BuildPermissionPattern`, key bindings, and rejection-reason presets. Share this instead of copying the permission-pattern logic. |
| `pkg/tui/service`      | `StaticSessionState` — a `SessionStateReader` with conservative fixed values, for rendering message/tool views outside the full TUI app. Replaces hand-rolled nine-method stubs. |
| `pkg/tui/animation`    | `Stopper` / `StopView` — animation lifecycle contract. Call `StopAnimation` on views removed from the UI to prevent leaked tick subscriptions. |
| `pkg/tui/components/transcript` | Embedded transcript view with read-only `Messages()` accessor for observing conversation structure in host tests and persistence layers. |
@z

@x
## Embedding TUI Components
@y
## Embedding TUI Components
@z

@x
When building custom UIs on top of Docker Agent's TUI primitives, four packages define the contracts that keep the runtime and the UI in sync:
@y
When building custom UIs on top of Docker Agent's TUI primitives, four packages define the contracts that keep the runtime and the UI in sync:
@z

@x
- **`pkg/tui/components/toolconfirm`** — import this package for the permission-decision policy rather than copying the pattern-building logic. The `Decision` enum, `BuildPermissionPattern` helper, and rejection-reason presets are the canonical source of truth: whatever pattern is shown to the user in the confirmation dialog is exactly the pattern granted to the runtime.
- **`pkg/tui/service`** — use `StaticSessionState` as a stub `SessionStateReader` when rendering individual message or tool views outside the full TUI app. It returns conservative fixed values for all nine interface methods, eliminating the need for hand-rolled stubs.
- **`pkg/tui/animation`** — implement `animation.Stopper` on any view that owns a tick-based animation. Call `StopAnimation` whenever a view is removed from the UI hierarchy to prevent leaked `time.Tick` subscriptions from firing against a dead view.
- **`pkg/tui/components/transcript`** — embed the transcript view for displaying conversation history. Use the `Messages()` method to read the current slice of transcript messages (treat as read-only — mutations desync renders). This is useful for host-side tests asserting on chat history, and for persistence layers that need to snapshot conversation state.
@y
- **`pkg/tui/components/toolconfirm`** — import this package for the permission-decision policy rather than copying the pattern-building logic. The `Decision` enum, `BuildPermissionPattern` helper, and rejection-reason presets are the canonical source of truth: whatever pattern is shown to the user in the confirmation dialog is exactly the pattern granted to the runtime.
- **`pkg/tui/service`** — use `StaticSessionState` as a stub `SessionStateReader` when rendering individual message or tool views outside the full TUI app. It returns conservative fixed values for all nine interface methods, eliminating the need for hand-rolled stubs.
- **`pkg/tui/animation`** — implement `animation.Stopper` on any view that owns a tick-based animation. Call `StopAnimation` whenever a view is removed from the UI hierarchy to prevent leaked `time.Tick` subscriptions from firing against a dead view.
- **`pkg/tui/components/transcript`** — embed the transcript view for displaying conversation history. Use the `Messages()` method to read the current slice of transcript messages (treat as read-only — mutations desync renders). This is useful for host-side tests asserting on chat history, and for persistence layers that need to snapshot conversation state.
@z

@x
### Dependency-light editor, dialogs, and tool rendering
@y
### Dependency-light editor, dialogs, and tool rendering
@z

@x
- Use `pkg/tui/commands` for command items and slash parsing, and
  `components/editor/completions.NewCommandCompletion` for completions. The
  application builder moved to `pkg/tui/commands/defaults.BuildCommandCategories`;
  embedders should supply their own categories. Argument providers stay lazy.
- Use `pkg/tui/dialog/common` for dialog interfaces, open/close messages, and
  multi-choice results. Use `pkg/tui/dialog/toolconfirmation` for confirmation,
  rejection, and `RuntimeResumeMsg`. The parent `dialog` package retains
  application-facing compatibility wrappers, but imports the application dialogs.
- `components/messages`, `components/transcript`, and `components/reasoningblock`
  default to generic/API tool views. Supply an instance registry with their
  `WithToolRenderers` option. For rich builtin views, explicitly import
  `pkg/tui/components/tool/defaults` and use `defaults.NewRegistry()` instead.
@y
- Use `pkg/tui/commands` for command items and slash parsing, and
  `components/editor/completions.NewCommandCompletion` for completions. The
  application builder moved to `pkg/tui/commands/defaults.BuildCommandCategories`;
  embedders should supply their own categories. Argument providers stay lazy.
- Use `pkg/tui/dialog/common` for dialog interfaces, open/close messages, and
  multi-choice results. Use `pkg/tui/dialog/toolconfirmation` for confirmation,
  rejection, and `RuntimeResumeMsg`. The parent `dialog` package retains
  application-facing compatibility wrappers, but imports the application dialogs.
- `components/messages`, `components/transcript`, and `components/reasoningblock`
  default to generic/API tool views. Supply an instance registry with their
  `WithToolRenderers` option. For rich builtin views, explicitly import
  `pkg/tui/components/tool/defaults` and use `defaults.NewRegistry()` instead.
@z

@x
```go
registry := tool.NewRegistry() // generic fallback, fetch, and category:api
registry.Register("my_tool", myRenderer)
list := messages.New(ar, state, messages.WithToolRenderers(registry))
confirmation := toolconfirmation.NewToolConfirmationDialog(
    ar, event, state, messages.WithToolRenderers(registry),
)
```
@y
```go
registry := tool.NewRegistry() // generic fallback, fetch, and category:api
registry.Register("my_tool", myRenderer)
list := messages.New(ar, state, messages.WithToolRenderers(registry))
confirmation := toolconfirmation.NewToolConfirmationDialog(
    ar, event, state, messages.WithToolRenderers(registry),
)
```
@z

@x
`Registry.Register` replaces process-global `tool.Register`. Resolution is exact
name, then `category:<name>`, then generic fallback; a custom renderer wins over
its builtin counterpart at each tier. `tui.WithToolRenderers` still accepts a
builder map, now scoped to that TUI. Docker Agent's normal TUI explicitly uses
all builtin renderers, including inside reasoning blocks and confirmations.
Shared tool names, wire arguments, and result metadata live in
`pkg/tools/builtin/<tool>/types`; importing them does not import execution.
@y
`Registry.Register` replaces process-global `tool.Register`. Resolution is exact
name, then `category:<name>`, then generic fallback; a custom renderer wins over
its builtin counterpart at each tier. `tui.WithToolRenderers` still accepts a
builder map, now scoped to that TUI. Docker Agent's normal TUI explicitly uses
all builtin renderers, including inside reasoning blocks and confirmations.
Shared tool names, wire arguments, and result metadata live in
`pkg/tools/builtin/<tool>/types`; importing them does not import execution.
@z

@x
For Gordon-style hosts, replace parent `dialog` imports with `common` and
`toolconfirmation`, keeping the existing message adapter and session lifecycle.
Keep close/open/result commands sequenced: cancelling the rejection picker must
return to confirmation without resuming execution. Approval-mode state changes
still occur synchronously during `Update`. Continue calling `Init` and executing
its returned command at the same point in the host lifecycle. Hosts using
`transcript.Rebuild` with shared-cache renderers can call
`registry.InvalidateCaches()` before rebuilding on theme changes; registry
isolation applies to registration, not a renderer's own caches.
@y
For Gordon-style hosts, replace parent `dialog` imports with `common` and
`toolconfirmation`, keeping the existing message adapter and session lifecycle.
Keep close/open/result commands sequenced: cancelling the rejection picker must
return to confirmation without resuming execution. Approval-mode state changes
still occur synchronously during `Update`. Continue calling `Init` and executing
its returned command at the same point in the host lifecycle. Hosts using
`transcript.Rebuild` with shared-cache renderers can call
`registry.InvalidateCaches()` before rebuilding on theme changes; registry
isolation applies to registration, not a renderer's own caches.
@z

@x
These entry points exclude the application, CLI, MCP toolset implementation, and
JavaScript engine. Runtime event types still retain MCP protocol support and the
runtime's own builtin tools; this is not a runtime or remote-session refactor.
@y
These entry points exclude the application, CLI, MCP toolset implementation, and
JavaScript engine. Runtime event types still retain MCP protocol support and the
runtime's own builtin tools; this is not a runtime or remote-session refactor.
@z

@x
## Explicit Loader Defaults
@y
## Explicit Loader Defaults
@z

@x
`pkg/teamloader/defaults.LoaderOpts()` supplies the full provider, toolset and
source registries without registering runtime factories. Enable optional
execution features on each runtime with
`runtime.WithHarnessFactory(codingharness.Factory)` and
`runtime.WithCommandEvaluatorFactory(jscommands.Factory)`.
@y
`pkg/teamloader/defaults.LoaderOpts()` supplies the full provider, toolset and
source registries without registering runtime factories. Enable optional
execution features on each runtime with
`runtime.WithHarnessFactory(codingharness.Factory)` and
`runtime.WithCommandEvaluatorFactory(jscommands.Factory)`.
@z

@x
The existing `loaderdefaults.Opts()` remains a compatibility helper: it returns
those loader options and also registers the harness and JavaScript factories
globally. Both helpers link the full defaults; dependency-light embedders should
continue supplying their own registries.
@y
The existing `loaderdefaults.Opts()` remains a compatibility helper: it returns
those loader options and also registers the harness and JavaScript factories
globally. Both helpers link the full defaults; dependency-light embedders should
continue supplying their own registries.
@z

@x
## Loaded Configuration to Runtime
@y
## Loaded Configuration to Runtime
@z

@x
`pkg/bootstrap.RuntimeOpts(loaded, runConfig)` translates a
`teamloader.LoadResult` into model-switching and budget options. It reuses the
shared model catalog and the encrypted configuration resolved during loading.
It does not load a team, create a session, register factories or own resources.
@y
`pkg/bootstrap.RuntimeOpts(loaded, runConfig)` translates a
`teamloader.LoadResult` into model-switching and budget options. It reuses the
shared model catalog and the encrypted configuration resolved during loading.
It does not load a team, create a session, register factories or own resources.
@z

@x
```go
opts := bootstrap.RuntimeOpts(loaded, runConfig)
opts = append(opts,
    runtime.WithSessionStore(store),
    runtime.WithCurrentAgent(agentName),
    runtime.WithWorkingDir(workingDir),
    runtime.WithHarnessFactory(codingharness.Factory),
    runtime.WithCommandEvaluatorFactory(jscommands.Factory),
)
rt, err := runtime.New(ctx, loaded.Team, opts...)
```
@y
```go
opts := bootstrap.RuntimeOpts(loaded, runConfig)
opts = append(opts,
    runtime.WithSessionStore(store),
    runtime.WithCurrentAgent(agentName),
    runtime.WithWorkingDir(workingDir),
    runtime.WithHarnessFactory(codingharness.Factory),
    runtime.WithCommandEvaluatorFactory(jscommands.Factory),
)
rt, err := runtime.New(ctx, loaded.Team, opts...)
```
@z

@x
Environment and catalog initialization happen when `RuntimeOpts` is called.
Catalog initialization failures retain the runtime's lazy fallback. Later
options can override the assembly defaults; callers still select interaction
policy, tracing, storage and cleanup. In particular, callers own the supplied
session store, and a shared team's toolsets must outlive all its runtimes.
@y
Environment and catalog initialization happen when `RuntimeOpts` is called.
Catalog initialization failures retain the runtime's lazy fallback. Later
options can override the assembly defaults; callers still select interaction
policy, tracing, storage and cleanup. In particular, callers own the supplied
session store, and a shared team's toolsets must outlive all its runtimes.
@z

@x
The CLI uses this helper for both its initial runtime and TUI-spawned runtimes.
The HTTP API wires the same manifest budgets into its native runtimes; other
serving adapters retain their existing wiring and budget behavior.
@y
The CLI uses this helper for both its initial runtime and TUI-spawned runtimes.
The HTTP API wires the same manifest budgets into its native runtimes; other
serving adapters retain their existing wiring and budget behavior.
@z

@x
## Execution Capability Inspection
@y
## Execution Capability Inspection
@z

@x
`(*runtime.LocalRuntime).AgentExecutionCapabilities(name)` returns a static
native/harness profile without starting tools, constructing drivers or
initializing budget counters. Unknown agents return nil. The same optional
profile is available on `runtime.AgentConfigInfo`, `runtime.AgentDetails` in
`team_info`, and local startup/refresh `runtime.AgentInfoEvent` values.
See [Execution capabilities](../../features/api-server/index.md#execution-capabilities)
for field meanings and unknown/remote behavior.
@y
`(*runtime.LocalRuntime).AgentExecutionCapabilities(name)` returns a static
native/harness profile without starting tools, constructing drivers or
initializing budget counters. Unknown agents return nil. The same optional
profile is available on `runtime.AgentConfigInfo`, `runtime.AgentDetails` in
`team_info`, and local startup/refresh `runtime.AgentInfoEvent` values.
See [Execution capabilities](../../features/api-server/index.md#execution-capabilities)
for field meanings and unknown/remote behavior.
@z

@x
`runtime.Runtime` and existing function signatures are unchanged. The exported
inspection/event structs have new optional fields: downstream code using
**unkeyed** composite literals for these structs must switch to keyed literals.
Existing keyed literals and JSON consumers accepting additional fields remain
compatible. Capability support is not proof an adapter installed configuration
or a policy requires approval.
@y
`runtime.Runtime` and existing function signatures are unchanged. The exported
inspection/event structs have new optional fields: downstream code using
**unkeyed** composite literals for these structs must switch to keyed literals.
Existing keyed literals and JSON consumers accepting additional fields remain
compatible. Capability support is not proof an adapter installed configuration
or a policy requires approval.
@z

@x
## Headless Embedded Chat (`pkg/embeddedchat`)
@y
## Headless Embedded Chat (`pkg/embeddedchat`)
@z

@x
`pkg/embeddedchat` is a thin wrapper around the Docker Agent runtime that lets you drive an agent from your own UI instead of running Docker Agent's Bubble Tea application. It handles runtime construction, event projection, and conversation state, exposing a simple `Send` / `Confirm` / `Restart` / `Close` API.
@y
`pkg/embeddedchat` is a thin wrapper around the Docker Agent runtime that lets you drive an agent from your own UI instead of running Docker Agent's Bubble Tea application. It handles runtime construction, event projection, and conversation state, exposing a simple `Send` / `Confirm` / `Restart` / `Close` API.
@z

@x
### Creating a session
@y
### Creating a session
@z

@x
```go
import (
    "context"
    "fmt"
    "strings"
@y
```go
import (
    "context"
    "fmt"
    "strings"
@z

@x
    dagentcfg "github.com/docker/docker-agent/pkg/config"
    dagentruntime "github.com/docker/docker-agent/pkg/runtime"
    "github.com/docker/docker-agent/pkg/embeddedchat"
    "github.com/docker/docker-agent/pkg/embeddedchat/defaults"
)
@y
    dagentcfg "github.com/docker/docker-agent/pkg/config"
    dagentruntime "github.com/docker/docker-agent/pkg/runtime"
    "github.com/docker/docker-agent/pkg/embeddedchat"
    "github.com/docker/docker-agent/pkg/embeddedchat/defaults"
)
@z

@x
chat, err := embeddedchat.New(ctx, embeddedchat.Config{
    // AgentSource can be a file path, raw YAML bytes, or an OCI reference.
    AgentSource: dagentcfg.NewBytesSource("agent", []byte(agentYAML)),
    LoadOpts: defaults.Opts(),
})
if err != nil {
    return err
}
defer chat.Close()
```
@y
chat, err := embeddedchat.New(ctx, embeddedchat.Config{
    // AgentSource can be a file path, raw YAML bytes, or an OCI reference.
    AgentSource: dagentcfg.NewBytesSource("agent", []byte(agentYAML)),
    LoadOpts: defaults.Opts(),
})
if err != nil {
    return err
}
defer chat.Close()
```
@z

@x
### Sending a message and reading events
@y
### Sending a message and reading events
@z

@x
`Send` appends the user message to the conversation and returns a channel of `Event` values. Drain the channel until it closes.
@y
`Send` appends the user message to the conversation and returns a channel of `Event` values. Drain the channel until it closes.
@z

@x
```go
events, err := chat.Send(ctx, "Hello! What can you do?")
if err != nil {
    return err
}
@y
```go
events, err := chat.Send(ctx, "Hello! What can you do?")
if err != nil {
    return err
}
@z

@x
var response strings.Builder
for ev := range events {
    switch {
    case ev.Text != "":
        response.WriteString(ev.Text)
    case ev.Tool != nil && ev.Tool.NeedsConfirmation:
        // Approve the pending tool call (use ResumeApproveSession to allow all).
        if err := chat.Confirm(ctx, dagentruntime.ResumeApprove()); err != nil {
            return err
        }
    case ev.Tool != nil && ev.Tool.Finished:
        fmt.Printf("[tool %s finished]\n", ev.Tool.Def.Name)
    case ev.Err != nil:
        fmt.Printf("error: %v\n", ev.Err)
    case ev.Done:
        fmt.Println("\n[turn complete]")
    }
}
fmt.Print(response.String())
```
@y
var response strings.Builder
for ev := range events {
    switch {
    case ev.Text != "":
        response.WriteString(ev.Text)
    case ev.Tool != nil && ev.Tool.NeedsConfirmation:
        // Approve the pending tool call (use ResumeApproveSession to allow all).
        if err := chat.Confirm(ctx, dagentruntime.ResumeApprove()); err != nil {
            return err
        }
    case ev.Tool != nil && ev.Tool.Finished:
        fmt.Printf("[tool %s finished]\n", ev.Tool.Def.Name)
    case ev.Err != nil:
        fmt.Printf("error: %v\n", ev.Err)
    case ev.Done:
        fmt.Println("\n[turn complete]")
    }
}
fmt.Print(response.String())
```
@z

@x
### Restarting the conversation
@y
### Restarting the conversation
@z

@x
To start a fresh conversation without recreating the runtime:
@y
To start a fresh conversation without recreating the runtime:
@z

@x
```go
if err := chat.Restart(); err != nil {
    return err
}
```
@y
```go
if err := chat.Restart(); err != nil {
    return err
}
```
@z

@x
### Event types
@y
### Event types
@z

@x
| Field          | When set                                                                 |
| -------------- | ------------------------------------------------------------------------ |
| `Text`         | Assistant text delta; accumulate into a string for the full reply.       |
| `Tool`         | A tool call started, needs confirmation, or finished.                    |
| `Tool.NeedsConfirmation` | Runtime is blocked until `Confirm` is called.              |
| `Tool.Finished` | Tool call completed; `Tool.IsError` is true if it errored.             |
| `Err`          | A user-facing runtime error; no further content events follow.           |
| `Done`         | Clean end of turn; no more events.                                       |
| `Elicitation`  | A pending MCP elicitation request (`Config.ForwardElicitation` only); answer with `RespondToElicitation`. |
| `RuntimeEvent` | The original `runtime.Event` for callers that need the full stream.      |
@y
| Field          | When set                                                                 |
| -------------- | ------------------------------------------------------------------------ |
| `Text`         | Assistant text delta; accumulate into a string for the full reply.       |
| `Tool`         | A tool call started, needs confirmation, or finished.                    |
| `Tool.NeedsConfirmation` | Runtime is blocked until `Confirm` is called.              |
| `Tool.Finished` | Tool call completed; `Tool.IsError` is true if it errored.             |
| `Err`          | A user-facing runtime error; no further content events follow.           |
| `Done`         | Clean end of turn; no more events.                                       |
| `Elicitation`  | A pending MCP elicitation request (`Config.ForwardElicitation` only); answer with `RespondToElicitation`. |
| `RuntimeEvent` | The original `runtime.Event` for callers that need the full stream.      |
@z

@x
### Opt-in behaviors
@y
### Opt-in behaviors
@z

@x
The defaults suit a plain chat UI; a richer host (a JS bridge, a browser build) can opt into more:
@y
The defaults suit a plain chat UI; a richer host (a JS bridge, a browser build) can opt into more:
@z

@x
```go
chat, err := embeddedchat.New(ctx, embeddedchat.Config{
    Team: myTeam,
    // Do not record the process working directory as workspace provenance
    // (wasm hosts, servers). Conversations get a WorkingDir only if
    // SessionOptions set one.
    NonLocal: true,
    // Surface MCP elicitation requests instead of declining them.
    ForwardElicitation: true,
    // Also deliver events the compact projection drops (reasoning, handoffs,
    // model fallback, token usage, ...) with only RuntimeEvent set.
    ForwardAllEvents: true,
})
```
@y
```go
chat, err := embeddedchat.New(ctx, embeddedchat.Config{
    Team: myTeam,
    // Do not record the process working directory as workspace provenance
    // (wasm hosts, servers). Conversations get a WorkingDir only if
    // SessionOptions set one.
    NonLocal: true,
    // Surface MCP elicitation requests instead of declining them.
    ForwardElicitation: true,
    // Also deliver events the compact projection drops (reasoning, handoffs,
    // model fallback, token usage, ...) with only RuntimeEvent set.
    ForwardAllEvents: true,
})
```
@z

@x
With `ForwardElicitation`, the runtime stays blocked until you answer; requests are declined for you once the run errored or was cancelled:
@y
With `ForwardElicitation`, the runtime stays blocked until you answer; requests are declined for you once the run errored or was cancelled:
@z

@x
```go
case ev.Elicitation != nil:
    err := chat.RespondToElicitation(ctx, tools.ElicitationActionAccept,
        map[string]any{"token": token}, ev.Elicitation.ElicitationID)
```
@y
```go
case ev.Elicitation != nil:
    err := chat.RespondToElicitation(ctx, tools.ElicitationActionAccept,
        map[string]any{"token": token}, ev.Elicitation.ElicitationID)
```
@z

@x
For anything beyond that, call `chat.Runtime()` to access the underlying `runtime.Runtime` directly.
@y
For anything beyond that, call `chat.Runtime()` to access the underlying `runtime.Runtime` directly.
@z

@x
> [!WARNING]
> **Breaking change: `Runtime.ResumeElicitation` (#3584)**
>
> `Runtime.ResumeElicitation` gained an `elicitationID` parameter so responses can
> be correlated with a specific concurrent elicitation request (needed once
> multiple background jobs can be eliciting input at the same time). It is
> declared **variadic** (`elicitationID ...string`) specifically so existing
> *callers* of the 3-argument form keep compiling unchanged — `rt.ResumeElicitation(ctx, action, content)`
> still works and falls back to resolving the sole pending request.
>
> If you implement your own `runtime.Runtime` (rather than embedding
> `runtime.LocalRuntime`/`runtime.RemoteRuntime`), you do need to update your
> method's signature to match, and also add an `OnElicitationRequest(handler
> func(runtime.Event))` method (a no-op is fine if your runtime never raises
> elicitations) — both are required interface methods, matching the existing
> no-op-able pattern already used by `OnToolsChanged`/`OnBackgroundEvent`.
@y
> [!WARNING]
> **Breaking change: `Runtime.ResumeElicitation` (#3584)**
>
> `Runtime.ResumeElicitation` gained an `elicitationID` parameter so responses can
> be correlated with a specific concurrent elicitation request (needed once
> multiple background jobs can be eliciting input at the same time). It is
> declared **variadic** (`elicitationID ...string`) specifically so existing
> *callers* of the 3-argument form keep compiling unchanged — `rt.ResumeElicitation(ctx, action, content)`
> still works and falls back to resolving the sole pending request.
>
> If you implement your own `runtime.Runtime` (rather than embedding
> `runtime.LocalRuntime`/`runtime.RemoteRuntime`), you do need to update your
> method's signature to match, and also add an `OnElicitationRequest(handler
> func(runtime.Event))` method (a no-op is fine if your runtime never raises
> elicitations) — both are required interface methods, matching the existing
> no-op-able pattern already used by `OnToolsChanged`/`OnBackgroundEvent`.
@z

@x
### Direct runtime elicitation handler
@y
### Direct runtime elicitation handler
@z

@x
`runtime.WithElicitationHandler(tools.ElicitationHandler)` installs a synchronous request-context-aware handler on a local runtime. With this option, requests are handled directly rather than also emitting elicitation events or awaiting `ResumeElicitation`. The handler must honor cancellation and validate the response before returning it. Background requests retain their own operation lifetime. `WithNonInteractive(true)` still takes precedence and declines requests without invoking the handler. Runtimes without this option keep the existing event/waiter behavior.
@y
`runtime.WithElicitationHandler(tools.ElicitationHandler)` installs a synchronous request-context-aware handler on a local runtime. With this option, requests are handled directly rather than also emitting elicitation events or awaiting `ResumeElicitation`. The handler must honor cancellation and validate the response before returning it. Background requests retain their own operation lifetime. `WithNonInteractive(true)` still takes precedence and declines requests without invoking the handler. Runtimes without this option keep the existing event/waiter behavior.
@z

@x
## RAG Toolset (opt-out)
@y
## RAG Toolset (opt-out)
@z

@x
The RAG toolset (`type: rag`) is included in `NewDefaultToolsetRegistry()` (from `pkg/teamloader/toolsets`) and `loaderdefaults.Opts()` (from `pkg/teamloader/defaults`, using the conventional import alias `loaderdefaults`).
@y
The RAG toolset (`type: rag`) is included in `NewDefaultToolsetRegistry()` (from `pkg/teamloader/toolsets`) and `loaderdefaults.Opts()` (from `pkg/teamloader/defaults`, using the conventional import alias `loaderdefaults`).
@z

@x
The underlying tree-sitter code parser uses cgo, but build-tag guards in `pkg/rag/treesitter` mean importing the package is safe regardless of `CGO_ENABLED`: with `CGO_ENABLED=0` the parser stub compiles in and returns a runtime error on first use rather than failing at compile time.
@y
The underlying tree-sitter code parser uses cgo, but build-tag guards in `pkg/rag/treesitter` mean importing the package is safe regardless of `CGO_ENABLED`: with `CGO_ENABLED=0` the parser stub compiles in and returns a runtime error on first use rather than failing at compile time.
@z

@x
To disable the RAG toolset at runtime — surfacing a load-time warning rather than a deferred error from the `!cgo` stub — remove it from the registry before passing it to `teamloader.Load`. This does not remove its package dependencies; use a hand-picked registry without importing the full defaults for that:
@y
To disable the RAG toolset at runtime — surfacing a load-time warning rather than a deferred error from the `!cgo` stub — remove it from the registry before passing it to `teamloader.Load`. This does not remove its package dependencies; use a hand-picked registry without importing the full defaults for that:
@z

@x
```go
import (
    "github.com/docker/docker-agent/pkg/teamloader"
    loadertoolsets "github.com/docker/docker-agent/pkg/teamloader/toolsets"
)
@y
```go
import (
    "github.com/docker/docker-agent/pkg/teamloader"
    loadertoolsets "github.com/docker/docker-agent/pkg/teamloader/toolsets"
)
@z

@x
// Opt out of the RAG toolset; a config that declares type: rag attaches
// a load-time warning to the agent instead of failing at document processing.
creators := loadertoolsets.DefaultToolsetCreators()
delete(creators, "rag")
registry := teamloader.NewToolsetRegistry(creators)
```
@y
// Opt out of the RAG toolset; a config that declares type: rag attaches
// a load-time warning to the agent instead of failing at document processing.
creators := loadertoolsets.DefaultToolsetCreators()
delete(creators, "rag")
registry := teamloader.NewToolsetRegistry(creators)
```
@z

@x
Pass the custom registry via `teamloader.WithToolsetRegistry(registry)` when calling `teamloader.Load`. Note that `teamloader.Load()` does not return an error for unknown toolset types unless `teamloader.WithStrict` is set — the failure is recorded as a load-time warning and can be retrieved with `agent.DrainWarnings()`; it is also surfaced via logging and TUI notifications.
@y
Pass the custom registry via `teamloader.WithToolsetRegistry(registry)` when calling `teamloader.Load`. Note that `teamloader.Load()` does not return an error for unknown toolset types unless `teamloader.WithStrict` is set — the failure is recorded as a load-time warning and can be retrieved with `agent.DrainWarnings()`; it is also surfaced via logging and TUI notifications.
@z

@x
### RAG over in-memory documents
@y
### RAG over in-memory documents
@z

@x
Hosts without a filesystem (browsers, servers holding uploads in memory) can hand `pkg/rag` the documents directly. Set `ManagersBuildConfig.Documents`, a `rag.Documents` map keyed by logical path, and the manager indexes those instead of reading files: the RAG's `docs` select among the paths (exact path, directory prefix or glob), each strategy indexes the selection through its normal pipeline (`bm25`, `chunked-embeddings`, `semantic-embeddings`, fusion, reranking), `return_full_content` reads the supplied document, and change checks and the file watcher become no-ops. A `docs` entry selecting no document fails `NewManager`; a nil `Documents` keeps the filesystem behaviour.
@y
Hosts without a filesystem (browsers, servers holding uploads in memory) can hand `pkg/rag` the documents directly. Set `ManagersBuildConfig.Documents`, a `rag.Documents` map keyed by logical path, and the manager indexes those instead of reading files: the RAG's `docs` select among the paths (exact path, directory prefix or glob), each strategy indexes the selection through its normal pipeline (`bm25`, `chunked-embeddings`, `semantic-embeddings`, fusion, reranking), `return_full_content` reads the supplied document, and change checks and the file watcher become no-ops. A `docs` entry selecting no document fails `NewManager`; a nil `Documents` keeps the filesystem behaviour.
@z

@x
```go
mgr, err := rag.NewManager(ctx, "handbook", ragCfg, rag.ManagersBuildConfig{
    ParentDir:     "/",
    Env:           runConfig.EnvProvider(),
    RuntimeConfig: runConfig,
    Documents:     rag.Documents{"handbook/leave.md": leave, "handbook/expenses.md": expenses},
})
if err != nil {
    return err
}
ts := ragtool.New(mgr, mgr.ToolName(), ragtool.WithIndexingTimeout(ragCfg.GetIndexingTimeout()))
```
@y
```go
mgr, err := rag.NewManager(ctx, "handbook", ragCfg, rag.ManagersBuildConfig{
    ParentDir:     "/",
    Env:           runConfig.EnvProvider(),
    RuntimeConfig: runConfig,
    Documents:     rag.Documents{"handbook/leave.md": leave, "handbook/expenses.md": expenses},
})
if err != nil {
    return err
}
ts := ragtool.New(mgr, mgr.ToolName(), ragtool.WithIndexingTimeout(ragCfg.GetIndexingTimeout()))
```
@z

@x
`cmd/wasm/toolsets.go` registers exactly this as the browser's `type: rag` creator, fed by `createSession`'s `documents` option.
@y
`cmd/wasm/toolsets.go` registers exactly this as the browser's `type: rag` creator, fed by `createSession`'s `documents` option.
@z

@x
## Loading YAML with Hand-Picked Registries (lean embedding)
@y
## Loading YAML with Hand-Picked Registries (lean embedding)
@z

@x
`loaderdefaults.Opts()` links every provider SDK, every built-in toolset and every agent-source type. When you embed docker-agent and load agents from YAML (a file shipped in your binary, or an OCI artifact), you can instead declare exactly what your binary supports and have docker-agent reject anything else **before** any model or toolset is built:
@y
`loaderdefaults.Opts()` links every provider SDK, every built-in toolset and every agent-source type. When you embed docker-agent and load agents from YAML (a file shipped in your binary, or an OCI artifact), you can instead declare exactly what your binary supports and have docker-agent reject anything else **before** any model or toolset is built:
@z

@x
```go
import (
    "github.com/docker/docker-agent/pkg/config"
    "github.com/docker/docker-agent/pkg/config/ocisource"
    "github.com/docker/docker-agent/pkg/model/provider"
    "github.com/docker/docker-agent/pkg/model/provider/anthropic"
    "github.com/docker/docker-agent/pkg/teamloader"
    "github.com/docker/docker-agent/pkg/tools/builtin/api/client"
    "github.com/docker/docker-agent/pkg/tools/builtin/think"
)
@y
```go
import (
    "github.com/docker/docker-agent/pkg/config"
    "github.com/docker/docker-agent/pkg/config/ocisource"
    "github.com/docker/docker-agent/pkg/model/provider"
    "github.com/docker/docker-agent/pkg/model/provider/anthropic"
    "github.com/docker/docker-agent/pkg/teamloader"
    "github.com/docker/docker-agent/pkg/tools/builtin/api/client"
    "github.com/docker/docker-agent/pkg/tools/builtin/think"
)
@z

@x
team, err := teamloader.Load(ctx, ocisource.New("myorg/agent:v1"), runConfig,
    teamloader.WithProviderRegistry(provider.NewRegistry(map[string]provider.Factory{
        "anthropic": provider.Adapt(anthropic.NewClient),
    })),
    teamloader.WithToolsetRegistry(teamloader.NewToolsetRegistry(map[string]teamloader.ToolsetCreator{
        "api":   client.Creator(teamloader.NewEnvExpander),
        "think": teamloader.Creator(think.CreateToolSet),
    })),
    // Deny every optional feature; pass e.g. config.FeatureSkills to allow one.
    teamloader.WithStrict(),
)
```
@y
team, err := teamloader.Load(ctx, ocisource.New("myorg/agent:v1"), runConfig,
    teamloader.WithProviderRegistry(provider.NewRegistry(map[string]provider.Factory{
        "anthropic": provider.Adapt(anthropic.NewClient),
    })),
    teamloader.WithToolsetRegistry(teamloader.NewToolsetRegistry(map[string]teamloader.ToolsetCreator{
        "api":   client.Creator(teamloader.NewEnvExpander),
        "think": teamloader.Creator(think.CreateToolSet),
    })),
    // Deny every optional feature; pass e.g. config.FeatureSkills to allow one.
    teamloader.WithStrict(),
)
```
@z

@x
- **Providers**: every provider package's `NewClient` becomes a `provider.Factory` through `provider.Adapt`. Providers are matched on the type the registry resolves them to — a custom `providers:` entry or an alias such as `mistral` counts as `openai`. `providers.DefaultFactories()` (from `pkg/model/provider/providers`) is the full table if you prefer to copy and trim it.
- **Toolsets**: built-in toolset packages whose constructor needs the runtime config (plus `pkg/tools/mcp` and `pkg/tools/a2a`) export a `Creator` matching `teamloader.ToolsetCreator`; the config-free ones (`think`, `todo`, `plan`, ...) are wrapped with `teamloader.Creator(think.CreateToolSet)` or `teamloader.CreatorFromToolset(todo.CreateToolSet)`, which keeps those packages free of `pkg/config` so they still cross-compile to wasm/plan9. `toolsets.DefaultToolsetCreators()` (from `pkg/teamloader/toolsets`) is the full table.
- **Agent sources**: `config.NewFileSource` / `config.NewBytesSource` / `config.NewURLSource` live in `pkg/config`; the OCI source lives in `pkg/config/ocisource`; HCL support is a source decorator, `hcl.NewSource(inner)`, in `pkg/config/hcl`. `pkg/config/sources` resolves any reference (files, directories, URLs, OCI, user aliases, built-in agents) at the cost of linking all of them. Sub-agents referencing external agents (`sub_agents: [myorg/reviewer]`) need a `teamloader.WithSourceResolver` that wraps `sources.Resolve` (as `loaderdefaults.Opts()` does) — or your own resolver.
- **Optional loader features**: everything the loader used to link unconditionally is now an option, so `pkg/teamloader` adds no module over `pkg/runtime`. Enable what your configs use: `teamloader.WithExpander(js.NewJsExpander)` for `${...}` JavaScript in instructions/commands (the default only resolves `${env.NAME}`; also call `jscommands.Register()` for slash commands), `teamloader.WithCodeMode(codemode.Wrap)` for `code_mode_tools`, `teamloader.WithToon(toon.Wrap)` for the `toon` field, `teamloader.WithDeferredTools(deferred.New)` for `defer`, and `runtime.RegisterHarness(codingharness.Factory)` for `harness:` agents. A config that uses a feature you did not enable fails to load with an error naming the option.
- **Strict mode**: `teamloader.WithStrict(features...)` fails the load with a `*config.UnsupportedError` listing **every** provider type, toolset type and optional feature the config relies on that you did not enable, with the config locations that need them. Optional features are `config.FeatureHooks`, `config.FeatureHarness`, `config.FeatureAgentRouting`, `config.FeatureSkills`, `config.FeatureExternalAgents`, `config.FeatureCodeMode`, `config.FeatureToon` and `config.FeatureDeferredTools`; none is enabled unless listed. Agents on the `auto` model are resolved eagerly so the provider they land on is checked too. Without `WithStrict`, unknown toolset types stay load-time warnings and unknown providers fail when their model is built.
@y
- **Providers**: every provider package's `NewClient` becomes a `provider.Factory` through `provider.Adapt`. Providers are matched on the type the registry resolves them to — a custom `providers:` entry or an alias such as `mistral` counts as `openai`. `providers.DefaultFactories()` (from `pkg/model/provider/providers`) is the full table if you prefer to copy and trim it.
- **Toolsets**: built-in toolset packages whose constructor needs the runtime config (plus `pkg/tools/mcp` and `pkg/tools/a2a`) export a `Creator` matching `teamloader.ToolsetCreator`; the config-free ones (`think`, `todo`, `plan`, ...) are wrapped with `teamloader.Creator(think.CreateToolSet)` or `teamloader.CreatorFromToolset(todo.CreateToolSet)`, which keeps those packages free of `pkg/config` so they still cross-compile to wasm/plan9. `toolsets.DefaultToolsetCreators()` (from `pkg/teamloader/toolsets`) is the full table.
- **Agent sources**: `config.NewFileSource` / `config.NewBytesSource` / `config.NewURLSource` live in `pkg/config`; the OCI source lives in `pkg/config/ocisource`; HCL support is a source decorator, `hcl.NewSource(inner)`, in `pkg/config/hcl`. `pkg/config/sources` resolves any reference (files, directories, URLs, OCI, user aliases, built-in agents) at the cost of linking all of them. Sub-agents referencing external agents (`sub_agents: [myorg/reviewer]`) need a `teamloader.WithSourceResolver` that wraps `sources.Resolve` (as `loaderdefaults.Opts()` does) — or your own resolver.
- **Optional loader features**: everything the loader used to link unconditionally is now an option, so `pkg/teamloader` adds no module over `pkg/runtime`. Enable what your configs use: `teamloader.WithExpander(js.NewJsExpander)` for `${...}` JavaScript in instructions/commands (the default only resolves `${env.NAME}`; also call `jscommands.Register()` for slash commands), `teamloader.WithCodeMode(codemode.Wrap)` for `code_mode_tools`, `teamloader.WithToon(toon.Wrap)` for the `toon` field, `teamloader.WithDeferredTools(deferred.New)` for `defer`, and `runtime.RegisterHarness(codingharness.Factory)` for `harness:` agents. A config that uses a feature you did not enable fails to load with an error naming the option.
- **Strict mode**: `teamloader.WithStrict(features...)` fails the load with a `*config.UnsupportedError` listing **every** provider type, toolset type and optional feature the config relies on that you did not enable, with the config locations that need them. Optional features are `config.FeatureHooks`, `config.FeatureHarness`, `config.FeatureAgentRouting`, `config.FeatureSkills`, `config.FeatureExternalAgents`, `config.FeatureCodeMode`, `config.FeatureToon` and `config.FeatureDeferredTools`; none is enabled unless listed. Agents on the `auto` model are resolved eagerly so the provider they land on is checked too. Without `WithStrict`, unknown toolset types stay load-time warnings and unknown providers fail when their model is built.
@z

@x
`config.Requires(cfg)` exposes the same audit for your own checks. `pkg/embeddedchat` accepts all of this through `Config.LoadOpts`. A complete example lives in [examples/golibrary/yamlstrict](https://github.com/docker/docker-agent/tree/main/examples/golibrary/yamlstrict).
@y
`config.Requires(cfg)` exposes the same audit for your own checks. `pkg/embeddedchat` accepts all of this through `Config.LoadOpts`. A complete example lives in [examples/golibrary/yamlstrict](https://github.com/docker/docker-agent/tree/main/examples/golibrary/yamlstrict).
@z

@x
> [!WARNING]
> **Breaking change: agent sources moved out of `pkg/config`**
>
> `config.Resolve`, `config.ResolveSources`, `config.ResolveAlias` and `config.BuiltinAgentNames` are now in `pkg/config/sources`; `config.NewOCISource` is `ocisource.New` in `pkg/config/ocisource`; and `config.Load` no longer auto-detects HCL — wrap the source with `hcl.NewSource` (which `sources.Resolve` does for you). `teamloader.ToolsetRegistry` gained a `Has(toolsetType string) bool` method.
>
> If you call `teamloader.Load` without `loaderdefaults.Opts()`, JavaScript expansion, code mode, TOON, deferred tools and harness agents are now off until you enable them (see *Optional loader features* above). Code-built teams that use `harness:` agents must call `runtime.RegisterHarness(codingharness.Factory)`; `codingharness.Label` moved into the runtime.
@y
> [!WARNING]
> **Breaking change: agent sources moved out of `pkg/config`**
>
> `config.Resolve`, `config.ResolveSources`, `config.ResolveAlias` and `config.BuiltinAgentNames` are now in `pkg/config/sources`; `config.NewOCISource` is `ocisource.New` in `pkg/config/ocisource`; and `config.Load` no longer auto-detects HCL — wrap the source with `hcl.NewSource` (which `sources.Resolve` does for you). `teamloader.ToolsetRegistry` gained a `Has(toolsetType string) bool` method.
>
> If you call `teamloader.Load` without `loaderdefaults.Opts()`, JavaScript expansion, code mode, TOON, deferred tools and harness agents are now off until you enable them (see *Optional loader features* above). Code-built teams that use `harness:` agents must call `runtime.RegisterHarness(codingharness.Factory)`; `codingharness.Label` moved into the runtime.
@z

@x
### Per-runtime feature configuration
@y
### Per-runtime feature configuration
@z

@x
Prefer instance options over `runtime.RegisterHarness` and
`runtime.RegisterCommandEvaluator`, which affect the entire process:
@y
Prefer instance options over `runtime.RegisterHarness` and
`runtime.RegisterCommandEvaluator`, which affect the entire process:
@z

@x
```go
rt, err := runtime.New(ctx, team,
    runtime.WithProviderRegistry(providers),
    runtime.WithHarnessFactory(codingharness.Factory),
    runtime.WithCommandEvaluatorFactory(jscommands.Factory),
)
```
@y
```go
rt, err := runtime.New(ctx, team,
    runtime.WithProviderRegistry(providers),
    runtime.WithHarnessFactory(codingharness.Factory),
    runtime.WithCommandEvaluatorFactory(jscommands.Factory),
)
```
@z

@x
Import `pkg/codingharness` or `pkg/runtime/jscommands` only when needed.
Passing `nil` to either factory option explicitly disables that feature for
this runtime, even if another caller registered a global default. Omitting the
options retains the legacy global fallback, including registrations made after
runtime construction. Factories are still invoked lazily, at execution time.
Runtime decorators used with `ResolveCommand` should forward
`CommandEvaluatorFactory() runtime.CommandEvaluatorFactory` to preserve this
selection. The `runtime.Runtime` interface itself is unchanged.
@y
Import `pkg/codingharness` or `pkg/runtime/jscommands` only when needed.
Passing `nil` to either factory option explicitly disables that feature for
this runtime, even if another caller registered a global default. Omitting the
options retains the legacy global fallback, including registrations made after
runtime construction. Factories are still invoked lazily, at execution time.
Runtime decorators used with `ResolveCommand` should forward
`CommandEvaluatorFactory() runtime.CommandEvaluatorFactory` to preserve this
selection. The `runtime.Runtime` interface itself is unchanged.
@z

@x
These options also work through `embeddedchat.Config.RuntimeOptions`. Loader
policy remains separate: `teamloader.WithStrict(config.FeatureHarness)` permits
harness declarations but does not install a driver. Likewise, supplying an
implementation does not automatically authorize a feature in strict mode.
@y
These options also work through `embeddedchat.Config.RuntimeOptions`. Loader
policy remains separate: `teamloader.WithStrict(config.FeatureHarness)` permits
harness declarations but does not install a driver. Likewise, supplying an
implementation does not automatically authorize a feature in strict mode.
@z

@x
### HTTP tools without JavaScript
@y
### HTTP tools without JavaScript
@z

@x
The `pkg/tools/builtin/api/client` package accepts an expander instead of
importing JavaScript. Register a placeholder-only HTTP tool with:
@y
The `pkg/tools/builtin/api/client` package accepts an expander instead of
importing JavaScript. Register a placeholder-only HTTP tool with:
@z

@x
```go
"api": client.Creator(teamloader.NewEnvExpander),
```
@y
```go
"api": client.Creator(teamloader.NewEnvExpander),
```
@z

@x
This supports `${env.NAME}` and bound `${argument}` placeholders and resolves
credentials on each request. Unknown placeholders and JavaScript expressions
remain unchanged. `api.Creator` and `api.New` retain the full JavaScript and
upstream-header behavior for existing callers. The leaf package does **not**
automatically expand `${headers.NAME}`; use `client.WithHeaderResolver` to supply
that policy. Passing `upstream.ResolveHeaders` restores the legacy behavior but
also imports JavaScript.
@y
This supports `${env.NAME}` and bound `${argument}` placeholders and resolves
credentials on each request. Unknown placeholders and JavaScript expressions
remain unchanged. `api.Creator` and `api.New` retain the full JavaScript and
upstream-header behavior for existing callers. The leaf package does **not**
automatically expand `${headers.NAME}`; use `client.WithHeaderResolver` to supply
that policy. Passing `upstream.ResolveHeaders` restores the legacy behavior but
also imports JavaScript.
@z

@x
A complete placeholder-only example lives in
[examples/golibrary/leanapi](https://github.com/docker/docker-agent/tree/main/examples/golibrary/leanapi).
The older `yamlstrict` example intentionally retains JavaScript-capable API and
fetch tools.
@y
A complete placeholder-only example lives in
[examples/golibrary/leanapi](https://github.com/docker/docker-agent/tree/main/examples/golibrary/leanapi).
The older `yamlstrict` example intentionally retains JavaScript-capable API and
fetch tools.
@z

@x
Selecting the leaf removes four external modules from the HTTP tool's import
closure: Goja, regexp2, go-sourcemap, and pprof. Importing the full defaults and
then deleting registry entries does **not** remove those package dependencies.
@y
Selecting the leaf removes four external modules from the HTTP tool's import
closure: Goja, regexp2, go-sourcemap, and pprof. Importing the full defaults and
then deleting registry entries does **not** remove those package dependencies.
@z

@x
Go package dependencies and module requirements are different: these changes
reduce the packages compiled and their required source modules. Docker Agent
still has one `go.mod`, so this does not promise an equally small
`go list -m all` graph or a small `go mod download all`. Independently versioned
optional modules would be a separate packaging change.
@y
Go package dependencies and module requirements are different: these changes
reduce the packages compiled and their required source modules. Docker Agent
still has one `go.mod`, so this does not promise an equally small
`go list -m all` graph or a small `go mod download all`. Independently versioned
optional modules would be a separate packaging change.
@z

@x
## Registering Custom Built-in Themes
@y
## Registering Custom Built-in Themes
@z

@x
When embedding Docker Agent, you can contribute your own built-in themes via `styles.RegisterBuiltinThemes`. Registered themes integrate seamlessly with the existing theme picker, `/theme` command, and `settings.theme` config key — they behave exactly like Docker Agent's own bundled themes.
@y
When embedding Docker Agent, you can contribute your own built-in themes via `styles.RegisterBuiltinThemes`. Registered themes integrate seamlessly with the existing theme picker, `/theme` command, and `settings.theme` config key — they behave exactly like Docker Agent's own bundled themes.
@z

@x
```go
import (
    "embed"
@y
```go
import (
    "embed"
@z

@x
    "github.com/docker/docker-agent/pkg/tui/styles"
)
@y
    "github.com/docker/docker-agent/pkg/tui/styles"
)
@z

@x
//go:embed themes/*.yaml
var brandThemes embed.FS
@y
//go:embed themes/*.yaml
var brandThemes embed.FS
@z

@x
// Call at startup, before applying any persisted theme:
if err := styles.RegisterBuiltinThemes(brandThemes); err != nil {
    return err
}
```
@y
// Call at startup, before applying any persisted theme:
if err := styles.RegisterBuiltinThemes(brandThemes); err != nil {
    return err
}
```
@z

@x
Each theme file lives at `themes/<name>.yaml` inside the embedded filesystem and is a **partial override** — only the colors you want to change are required; everything else falls back to `DefaultTheme()`.
@y
Each theme file lives at `themes/<name>.yaml` inside the embedded filesystem and is a **partial override** — only the colors you want to change are required; everything else falls back to `DefaultTheme()`.
@z

@x
```yaml
# themes/brand.yaml
name: Brand
colors:
  accent: "#FF6A00"
  background: "#1A0F0A"
```
@y
```yaml
# themes/brand.yaml
name: Brand
colors:
  accent: "#FF6A00"
  background: "#1A0F0A"
```
@z

@x
If `name:` is omitted, Docker Agent uses the filename stem as the display name in the theme picker (e.g. `brand` from `themes/brand.yaml`).
@y
If `name:` is omitted, Docker Agent uses the filename stem as the display name in the theme picker (e.g. `brand` from `themes/brand.yaml`).
@z

@x
To replace Docker Agent's default theme entirely, ship the file as `themes/default.yaml` — it masks the bundled default while inheriting any colors you don't set.
@y
To replace Docker Agent's default theme entirely, ship the file as `themes/default.yaml` — it masks the bundled default while inheriting any colors you don't set.
@z

@x
**Semantics:**
@y
**Semantics:**
@z

@x
- Registered sources take precedence over bundled themes; a registered ref overrides a bundled theme of the same name.
- Among multiple registered sources, last-registered wins on a collision.
- `RegisterBuiltinThemes` validates eagerly (nil fs, missing `themes/` dir) so errors surface at registration time, not at picker time.
@y
- Registered sources take precedence over bundled themes; a registered ref overrides a bundled theme of the same name.
- Among multiple registered sources, last-registered wins on a collision.
- `RegisterBuiltinThemes` validates eagerly (nil fs, missing `themes/` dir) so errors surface at registration time, not at picker time.
@z

@x
## MCP OAuth Token Persistence
@y
## MCP OAuth Token Persistence
@z

@x
By default, MCP OAuth tokens are stored in-memory only and are not persisted across process restarts. The CLI registers a keyring-backed store automatically at startup; when embedding Docker Agent as a library you must do this yourself if you want tokens to survive restarts.
@y
By default, MCP OAuth tokens are stored in-memory only and are not persisted across process restarts. The CLI registers a keyring-backed store automatically at startup; when embedding Docker Agent as a library you must do this yourself if you want tokens to survive restarts.
@z

@x
Call `keyringstore.Register()` **before** any MCP toolset is initialised to enable the OS keyring-backed token store:
@y
Call `keyringstore.Register()` **before** any MCP toolset is initialised to enable the OS keyring-backed token store:
@z

@x
```go
import "github.com/docker/docker-agent/pkg/tools/mcp/keyringstore"
@y
```go
import "github.com/docker/docker-agent/pkg/tools/mcp/keyringstore"
@z

@x
func main() {
    // Must be called before teamloader.Load() on configs with remote MCP
    // toolsets; calling it after the store is created panics.
    keyringstore.Register()
    // ... rest of your startup code
}
```
@y
func main() {
    // Must be called before teamloader.Load() on configs with remote MCP
    // toolsets; calling it after the store is created panics.
    keyringstore.Register()
    // ... rest of your startup code
}
```
@z

@x
> [!WARNING]
> **Call order matters**
>
> If `keyringstore.Register()` is called after the default token store has already been lazily initialised, Docker Agent panics. The store is initialised when any remote MCP toolset is constructed — which happens inside `teamloader.Load()`. Always call `keyringstore.Register()` before calling `teamloader.Load()` on a config that includes remote MCP toolsets.
@y
> [!WARNING]
> **Call order matters**
>
> If `keyringstore.Register()` is called after the default token store has already been lazily initialised, Docker Agent panics. The store is initialised when any remote MCP toolset is constructed — which happens inside `teamloader.Load()`. Always call `keyringstore.Register()` before calling `teamloader.Load()` on a config that includes remote MCP toolsets.
@z

@x
If you do not need persistent OAuth tokens (for example, in short-lived batch jobs or tests), omit the call and tokens will be kept in-memory for the process lifetime.
@y
If you do not need persistent OAuth tokens (for example, in short-lived batch jobs or tests), omit the call and tokens will be kept in-memory for the process lifetime.
@z

@x
### Session-scoped token stores
@y
### Session-scoped token stores
@z

@x
The process-wide store (keyring-backed or in-memory) is shared by every remote MCP toolset in the process. A host that keeps several isolated sessions in one process (a server, a wasm bridge) uses `mcp.WithOAuthTokenStore` to give one session's toolsets a private store instead, so sessions never see each other's tokens:
@y
The process-wide store (keyring-backed or in-memory) is shared by every remote MCP toolset in the process. A host that keeps several isolated sessions in one process (a server, a wasm bridge) uses `mcp.WithOAuthTokenStore` to give one session's toolsets a private store instead, so sessions never see each other's tokens:
@z

@x
```go
import "github.com/docker/docker-agent/pkg/tools/mcp"
@y
```go
import "github.com/docker/docker-agent/pkg/tools/mcp"
@z

@x
ctx := mcp.WithOAuthTokenStore(ctx, mcp.NewInMemoryTokenStore())
team, err := teamloader.Load(ctx, source, runConfig, opts...)
```
@y
ctx := mcp.WithOAuthTokenStore(ctx, mcp.NewInMemoryTokenStore())
team, err := teamloader.Load(ctx, source, runConfig, opts...)
```
@z

@x
The override is read by `mcp.CreateToolSet` / `mcp.Creator`, so it only takes effect for remote MCP toolsets built from that context; a nil store (or no override) falls back to the process-wide default. Passing the same context to multiple `teamloader.Load` calls shares one store across them, matching the process-wide default's behavior for a single session.
@y
The override is read by `mcp.CreateToolSet` / `mcp.Creator`, so it only takes effect for remote MCP toolsets built from that context; a nil store (or no override) falls back to the process-wide default. Passing the same context to multiple `teamloader.Load` calls shares one store across them, matching the process-wide default's behavior for a single session.
@z

@x
## JavaScript Command Expressions (opt-in)
@y
## JavaScript Command Expressions (opt-in)
@z

@x
Slash-command instructions can embed `${...}` JavaScript expressions (`${args[0]}`, `${args.join(" ")}`, `${tool({...})}`). Evaluating them requires the goja JavaScript engine, which is deliberately kept out of `pkg/runtime`'s import graph so code-built embedders don't link it by default.
@y
Slash-command instructions can embed `${...}` JavaScript expressions (`${args[0]}`, `${args.join(" ")}`, `${tool({...})}`). Evaluating them requires the goja JavaScript engine, which is deliberately kept out of `pkg/runtime`'s import graph so code-built embedders don't link it by default.
@z

@x
The CLI, `loaderdefaults.Opts()`, `pkg/cli.Run()` and `embeddedchat/defaults` enable it automatically. If you build teams in code, call `runtime.ResolveCommand` (or `cli.PrepareUserMessage`) directly **and** use `${...}` expressions in commands, register the evaluator yourself:
@y
The CLI, `loaderdefaults.Opts()`, `pkg/cli.Run()` and `embeddedchat/defaults` enable it automatically. If you build teams in code, call `runtime.ResolveCommand` (or `cli.PrepareUserMessage`) directly **and** use `${...}` expressions in commands, register the evaluator yourself:
@z

@x
```go
import "github.com/docker/docker-agent/pkg/runtime/jscommands"
@y
```go
import "github.com/docker/docker-agent/pkg/runtime/jscommands"
@z

@x
func main() {
    jscommands.Register()
    // ... rest of your startup code
}
```
@y
func main() {
    jscommands.Register()
    // ... rest of your startup code
}
```
@z

@x
Without the registration, `${...}` expressions are left unexpanded and a warning naming the fix is logged; everything else about command resolution (including the legacy `!tool(...)` syntax) works as usual.
@y
Without the registration, `${...}` expressions are left unexpanded and a warning naming the fix is logged; everything else about command resolution (including the legacy `!tool(...)` syntax) works as usual.
@z

@x
## Basic Example
@y
## Basic Example
@z

@x
Create a simple agent and run it:
@y
Create a simple agent and run it:
@z

@x
```go
package main
@y
```go
package main
@z

@x
import (
    "context"
    "fmt"
    "log"
    "os/signal"
    "syscall"
@y
import (
    "context"
    "fmt"
    "log"
    "os/signal"
    "syscall"
@z

@x
    "github.com/docker/docker-agent/pkg/agent"
    "github.com/docker/docker-agent/pkg/config/latest"
    "github.com/docker/docker-agent/pkg/environment"
    "github.com/docker/docker-agent/pkg/model/provider/openai"
    "github.com/docker/docker-agent/pkg/runtime"
    "github.com/docker/docker-agent/pkg/session"
    "github.com/docker/docker-agent/pkg/team"
)
@y
    "github.com/docker/docker-agent/pkg/agent"
    "github.com/docker/docker-agent/pkg/config/latest"
    "github.com/docker/docker-agent/pkg/environment"
    "github.com/docker/docker-agent/pkg/model/provider/openai"
    "github.com/docker/docker-agent/pkg/runtime"
    "github.com/docker/docker-agent/pkg/session"
    "github.com/docker/docker-agent/pkg/team"
)
@z

@x
func main() {
    ctx, cancel := signal.NotifyContext(context.Background(),
        syscall.SIGINT, syscall.SIGTERM)
    defer cancel()
@y
func main() {
    ctx, cancel := signal.NotifyContext(context.Background(),
        syscall.SIGINT, syscall.SIGTERM)
    defer cancel()
@z

@x
    if err := run(ctx); err != nil {
        log.Fatal(err)
    }
}
@y
    if err := run(ctx); err != nil {
        log.Fatal(err)
    }
}
@z

@x
func run(ctx context.Context) error {
    // Create model provider
    llm, err := openai.NewClient(
        ctx,
        &latest.ModelConfig{
            Provider: "openai",
            Model:    "gpt-4o",
        },
        environment.NewDefaultProvider(),
    )
    if err != nil {
        return err
    }
@y
func run(ctx context.Context) error {
    // Create model provider
    llm, err := openai.NewClient(
        ctx,
        &latest.ModelConfig{
            Provider: "openai",
            Model:    "gpt-4o",
        },
        environment.NewDefaultProvider(),
    )
    if err != nil {
        return err
    }
@z

@x
    // Create agent
    assistant := agent.New(
        "root",
        "You are a helpful assistant.",
        agent.WithModel(llm),
        agent.WithDescription("A helpful assistant"),
    )
@y
    // Create agent
    assistant := agent.New(
        "root",
        "You are a helpful assistant.",
        agent.WithModel(llm),
        agent.WithDescription("A helpful assistant"),
    )
@z

@x
    // Create team and runtime
    t := team.New(team.WithAgents(assistant))
    rt, err := runtime.New(ctx, t)
    if err != nil {
        return err
    }
@y
    // Create team and runtime
    t := team.New(team.WithAgents(assistant))
    rt, err := runtime.New(ctx, t)
    if err != nil {
        return err
    }
@z

@x
    // Run with a user message
    sess := session.New(
        session.WithUserMessage("What is 2 + 2?"),
    )
@y
    // Run with a user message
    sess := session.New(
        session.WithUserMessage("What is 2 + 2?"),
    )
@z

@x
    messages, err := rt.Run(ctx, sess)
    if err != nil {
        return err
    }
@y
    messages, err := rt.Run(ctx, sess)
    if err != nil {
        return err
    }
@z

@x
    // Print the response
    fmt.Println(messages[len(messages)-1].Message.Content)
    return nil
}
```
@y
    // Print the response
    fmt.Println(messages[len(messages)-1].Message.Content)
    return nil
}
```
@z

@x
## Custom Tools
@y
## Custom Tools
@z

@x
Define custom tools for your agent:
@y
Define custom tools for your agent:
@z

@x
```go
package main
@y
```go
package main
@z

@x
import (
    "context"
    "fmt"
@y
import (
    "context"
    "fmt"
@z

@x
    "github.com/docker/docker-agent/pkg/agent"
    "github.com/docker/docker-agent/pkg/model/provider"
    "github.com/docker/docker-agent/pkg/tools"
)
@y
    "github.com/docker/docker-agent/pkg/agent"
    "github.com/docker/docker-agent/pkg/model/provider"
    "github.com/docker/docker-agent/pkg/tools"
)
@z

@x
// Define the tool's input schema
type AddNumbersArgs struct {
    A int `json:"a"`
    B int `json:"b"`
}
@y
// Define the tool's input schema
type AddNumbersArgs struct {
    A int `json:"a"`
    B int `json:"b"`
}
@z

@x
// Implement the tool handler
func addNumbers(ctx context.Context, toolCall tools.ToolCall, _ tools.Runtime) (*tools.ToolCallResult, error) {
    var args AddNumbersArgs
    // Use tools.UnmarshalToolArguments instead of encoding/json directly so
    // aijson repairs (and repair telemetry) apply to tool-call arguments.
    if err := tools.UnmarshalToolArguments(ctx, toolCall, &args); err != nil {
        return nil, err
    }
@y
// Implement the tool handler
func addNumbers(ctx context.Context, toolCall tools.ToolCall, _ tools.Runtime) (*tools.ToolCallResult, error) {
    var args AddNumbersArgs
    // Use tools.UnmarshalToolArguments instead of encoding/json directly so
    // aijson repairs (and repair telemetry) apply to tool-call arguments.
    if err := tools.UnmarshalToolArguments(ctx, toolCall, &args); err != nil {
        return nil, err
    }
@z

@x
    result := args.A + args.B
    return tools.ResultSuccess(fmt.Sprintf("%d", result)), nil
}
@y
    result := args.A + args.B
    return tools.ResultSuccess(fmt.Sprintf("%d", result)), nil
}
@z

@x
func createCalculator(llm provider.Provider) *agent.Agent {
    // Create the tool definition
    addTool := tools.Tool{
        Name:        "add",
        Category:    "math",
        Description: "Add two numbers together",
        Parameters:  tools.MustSchemaFor[AddNumbersArgs](),
        Handler:     addNumbers,
    }
@y
func createCalculator(llm provider.Provider) *agent.Agent {
    // Create the tool definition
    addTool := tools.Tool{
        Name:        "add",
        Category:    "math",
        Description: "Add two numbers together",
        Parameters:  tools.MustSchemaFor[AddNumbersArgs](),
        Handler:     addNumbers,
    }
@z

@x
    // Use with an agent
    return agent.New(
        "root",
        "You are a calculator. Use the add tool for arithmetic.",
        agent.WithModel(llm),
        agent.WithTools(addTool),
    )
}
```
@y
    // Use with an agent
    return agent.New(
        "root",
        "You are a calculator. Use the add tool for arithmetic.",
        agent.WithModel(llm),
        agent.WithTools(addTool),
    )
}
```
@z

@x
## Streaming Responses
@y
## Streaming Responses
@z

@x
Process events as they happen:
@y
Process events as they happen:
@z

@x
```go
func runStreaming(ctx context.Context, rt runtime.Runtime, sess *session.Session) error {
    events := rt.RunStream(ctx, sess)
@y
```go
func runStreaming(ctx context.Context, rt runtime.Runtime, sess *session.Session) error {
    events := rt.RunStream(ctx, sess)
@z

@x
    for event := range events {
        switch e := event.(type) {
        case *runtime.StreamStartedEvent:
            fmt.Println("Stream started")
@y
    for event := range events {
        switch e := event.(type) {
        case *runtime.StreamStartedEvent:
            fmt.Println("Stream started")
@z

@x
        case *runtime.AgentChoiceEvent:
            // Print response chunks as they arrive
            fmt.Print(e.Content)
@y
        case *runtime.AgentChoiceEvent:
            // Print response chunks as they arrive
            fmt.Print(e.Content)
@z

@x
        case *runtime.ToolCallEvent:
            fmt.Printf("\n[Tool call: %s]\n", e.ToolCall.Function.Name)
@y
        case *runtime.ToolCallEvent:
            fmt.Printf("\n[Tool call: %s]\n", e.ToolCall.Function.Name)
@z

@x
        case *runtime.ToolCallConfirmationEvent:
            // Auto-approve tool calls
            rt.Resume(ctx, runtime.ResumeRequest{
                Type: runtime.ResumeTypeApproveSession,
            })
@y
        case *runtime.ToolCallConfirmationEvent:
            // Auto-approve tool calls
            rt.Resume(ctx, runtime.ResumeRequest{
                Type: runtime.ResumeTypeApproveSession,
            })
@z

@x
        case *runtime.ToolCallResponseEvent:
            fmt.Printf("[Tool response: %s]\n", e.Response)
@y
        case *runtime.ToolCallResponseEvent:
            fmt.Printf("[Tool response: %s]\n", e.Response)
@z

@x
        case *runtime.StreamStoppedEvent:
            fmt.Println("\nStream stopped")
@y
        case *runtime.StreamStoppedEvent:
            fmt.Println("\nStream stopped")
@z

@x
        case *runtime.ErrorEvent:
            return fmt.Errorf("error: %s", e.Error)
        }
    }
@y
        case *runtime.ErrorEvent:
            return fmt.Errorf("error: %s", e.Error)
        }
    }
@z

@x
    return nil
}
```
@y
    return nil
}
```
@z

@x
## Multi-Agent Teams
@y
## Multi-Agent Teams
@z

@x
Create agents that delegate to sub-agents:
@y
Create agents that delegate to sub-agents:
@z

@x
```go
package main
@y
```go
package main
@z

@x
import (
    "github.com/docker/docker-agent/pkg/agent"
    "github.com/docker/docker-agent/pkg/model/provider"
    "github.com/docker/docker-agent/pkg/team"
    "github.com/docker/docker-agent/pkg/tools/builtin/transfertask"
)
@y
import (
    "github.com/docker/docker-agent/pkg/agent"
    "github.com/docker/docker-agent/pkg/model/provider"
    "github.com/docker/docker-agent/pkg/team"
    "github.com/docker/docker-agent/pkg/tools/builtin/transfertask"
)
@z

@x
func createTeam(llm provider.Provider) *team.Team {
    // Create a child agent
    researcher := agent.New(
        "researcher",
        "You research topics thoroughly.",
        agent.WithModel(llm),
        agent.WithDescription("Research specialist"),
    )
@y
func createTeam(llm provider.Provider) *team.Team {
    // Create a child agent
    researcher := agent.New(
        "researcher",
        "You research topics thoroughly.",
        agent.WithModel(llm),
        agent.WithDescription("Research specialist"),
    )
@z

@x
    // Create root agent with sub-agents
    coordinator := agent.New(
        "root",
        "You coordinate research tasks.",
        agent.WithModel(llm),
        agent.WithDescription("Team coordinator"),
        agent.WithSubAgents(researcher),
        agent.WithToolSets(transfertask.New()),
    )
@y
    // Create root agent with sub-agents
    coordinator := agent.New(
        "root",
        "You coordinate research tasks.",
        agent.WithModel(llm),
        agent.WithDescription("Team coordinator"),
        agent.WithSubAgents(researcher),
        agent.WithToolSets(transfertask.New()),
    )
@z

@x
    return team.New(team.WithAgents(coordinator, researcher))
}
```
@y
    return team.New(team.WithAgents(coordinator, researcher))
}
```
@z

@x
## Built-in Tools
@y
## Built-in Tools
@z

@x
Use Docker Agent's built-in tools:
@y
Use Docker Agent's built-in tools:
@z

@x
```go
import (
    "os"
@y
```go
import (
    "os"
@z

@x
    "github.com/docker/docker-agent/pkg/agent"
    "github.com/docker/docker-agent/pkg/config"
    "github.com/docker/docker-agent/pkg/model/provider"
    "github.com/docker/docker-agent/pkg/tools/builtin/filesystem"
    "github.com/docker/docker-agent/pkg/tools/builtin/shell"
    "github.com/docker/docker-agent/pkg/tools/builtin/think"
    "github.com/docker/docker-agent/pkg/tools/builtin/todo"
)
@y
    "github.com/docker/docker-agent/pkg/agent"
    "github.com/docker/docker-agent/pkg/config"
    "github.com/docker/docker-agent/pkg/model/provider"
    "github.com/docker/docker-agent/pkg/tools/builtin/filesystem"
    "github.com/docker/docker-agent/pkg/tools/builtin/shell"
    "github.com/docker/docker-agent/pkg/tools/builtin/think"
    "github.com/docker/docker-agent/pkg/tools/builtin/todo"
)
@z

@x
func createAgentWithBuiltinTools(llm provider.Provider) *agent.Agent {
    // Runtime config for tools that need it
    rtConfig := &config.RuntimeConfig{
        Config: config.Config{
            WorkingDir: "/path/to/workdir",
        },
    }
@y
func createAgentWithBuiltinTools(llm provider.Provider) *agent.Agent {
    // Runtime config for tools that need it
    rtConfig := &config.RuntimeConfig{
        Config: config.Config{
            WorkingDir: "/path/to/workdir",
        },
    }
@z

@x
    return agent.New(
        "root",
        "You are a developer assistant.",
        agent.WithModel(llm),
        agent.WithToolSets(
            // Shell tool for running commands
            shell.New(os.Environ(), rtConfig),
            // Filesystem tools
            filesystem.New(rtConfig.Config.WorkingDir),
            // Think tool for reasoning
            think.New(),
            // Todo tool for task tracking
            todo.New(),
        ),
    )
}
```
@y
    return agent.New(
        "root",
        "You are a developer assistant.",
        agent.WithModel(llm),
        agent.WithToolSets(
            // Shell tool for running commands
            shell.New(os.Environ(), rtConfig),
            // Filesystem tools
            filesystem.New(rtConfig.Config.WorkingDir),
            // Think tool for reasoning
            think.New(),
            // Todo tool for task tracking
            todo.New(),
        ),
    )
}
```
@z

@x
## HTTP Middleware / Transport Wrappers
@y
## HTTP Middleware / Transport Wrappers
@z

@x
Use `options.WithHTTPTransportWrapper` to inject HTTP middleware into the transport chain of all provider clients built by Docker Agent. This is useful for request tracing, injecting custom headers, collecting metrics, or any other cross-cutting concern at the HTTP layer.
@y
Use `options.WithHTTPTransportWrapper` to inject HTTP middleware into the transport chain of all provider clients built by Docker Agent. This is useful for request tracing, injecting custom headers, collecting metrics, or any other cross-cutting concern at the HTTP layer.
@z

@x
```go
import (
    "net/http"
@y
```go
import (
    "net/http"
@z

@x
    "github.com/docker/docker-agent/pkg/model/provider/options"
)
@y
    "github.com/docker/docker-agent/pkg/model/provider/options"
)
@z

@x
type headerTransport struct {
    base http.RoundTripper
}
@y
type headerTransport struct {
    base http.RoundTripper
}
@z

@x
func (t *headerTransport) RoundTrip(req *http.Request) (*http.Response, error) {
    req = req.Clone(req.Context())
    req.Header.Set("X-Request-Source", "my-app")
    return t.base.RoundTrip(req)
}
@y
func (t *headerTransport) RoundTrip(req *http.Request) (*http.Response, error) {
    req = req.Clone(req.Context())
    req.Header.Set("X-Request-Source", "my-app")
    return t.base.RoundTrip(req)
}
@z

@x
// Example: add a custom header to every outbound LLM request
wrapper := options.WithHTTPTransportWrapper(
    func(base http.RoundTripper) http.RoundTripper {
        return &headerTransport{base: base}
    },
)
@y
// Example: add a custom header to every outbound LLM request
wrapper := options.WithHTTPTransportWrapper(
    func(base http.RoundTripper) http.RoundTripper {
        return &headerTransport{base: base}
    },
)
@z

@x
client, err := openai.NewClient(ctx, &latest.ModelConfig{
    Provider: "openai",
    Model:    "gpt-4o",
}, env, wrapper)
```
@y
client, err := openai.NewClient(ctx, &latest.ModelConfig{
    Provider: "openai",
    Model:    "gpt-4o",
}, env, wrapper)
```
@z

@x
The wrapper receives the already-instrumented transport (OpenTelemetry, SSE decompression, Desktop proxy support) as its `base` argument, so wrapping it preserves all built-in behaviour.
@y
The wrapper receives the already-instrumented transport (OpenTelemetry, SSE decompression, Desktop proxy support) as its `base` argument, so wrapping it preserves all built-in behaviour.
@z

@x
**Supported providers:** Anthropic, OpenAI, Gemini (GeminiAPI backend), Bedrock. Works in both direct and gateway/proxy mode.
@y
**Supported providers:** Anthropic, OpenAI, Gemini (GeminiAPI backend), Bedrock. Works in both direct and gateway/proxy mode.
@z

@x
> [!WARNING]
> **Vertex AI authentication**
>
> Gemini on Vertex AI supports transport wrappers when `options.WithTokenSource` supplies the access token. Without an explicit token source, a wrapper selects the Gemini API backend instead of the ADC-managed Vertex client. For Model Garden, use `vertexai.NewClientWithTokenSource` (or `anthropic/vertex.NewClientWithTokenSource`) to bypass ADC and resolve credentials with each request's context.
@y
> [!WARNING]
> **Vertex AI authentication**
>
> Gemini on Vertex AI supports transport wrappers when `options.WithTokenSource` supplies the access token. Without an explicit token source, a wrapper selects the Gemini API backend instead of the ADC-managed Vertex client. For Model Garden, use `vertexai.NewClientWithTokenSource` (or `anthropic/vertex.NewClientWithTokenSource`) to bypass ADC and resolve credentials with each request's context.
@z

@x
In **gateway mode** the wrapper is called on every LLM request because gateway clients are rebuilt each call for short-lived auth tokens. In **direct mode** it is called once at client construction. Rate-limit responses (HTTP 429) are classified as non-retryable by the runtime and cause the model chain to skip to the next fallback, so wrappers that track per-request outcomes will observe these as failures rather than retried calls.
@y
In **gateway mode** the wrapper is called on every LLM request because gateway clients are rebuilt each call for short-lived auth tokens. In **direct mode** it is called once at client construction. Rate-limit responses (HTTP 429) are classified as non-retryable by the runtime and cause the model chain to skip to the next fallback, so wrappers that track per-request outcomes will observe these as failures rather than retried calls.
@z

@x
Returning `nil` from your wrapper function is not allowed; Docker Agent logs a warning and keeps the original transport instead.
@y
Returning `nil` from your wrapper function is not allowed; Docker Agent logs a warning and keeps the original transport instead.
@z

@x
## Request-Time Token Authentication
@y
## Request-Time Token Authentication
@z

@x
Use `options.WithTokenSource` to supply a short-lived bearer token to the OpenAI provider client, refreshed on every request instead of being read once from an environment variable.
@y
Use `options.WithTokenSource` to supply a short-lived bearer token to the OpenAI provider client, refreshed on every request instead of being read once from an environment variable.
@z

@x
```go
import (
    "context"
@y
```go
import (
    "context"
@z

@x
    "github.com/docker/docker-agent/pkg/model/provider/openai"
    "github.com/docker/docker-agent/pkg/model/provider/options"
)
@y
    "github.com/docker/docker-agent/pkg/model/provider/openai"
    "github.com/docker/docker-agent/pkg/model/provider/options"
)
@z

@x
tokenSource := options.TokenSource(func(ctx context.Context) (string, error) {
    // Resolve or refresh a bearer token, e.g. from an OAuth2 token source.
    return fetchAccessToken(ctx)
})
@y
tokenSource := options.TokenSource(func(ctx context.Context) (string, error) {
    // Resolve or refresh a bearer token, e.g. from an OAuth2 token source.
    return fetchAccessToken(ctx)
})
@z

@x
client, err := openai.NewClient(ctx, &latest.ModelConfig{
    Provider: "openai",
    Model:    "gpt-4o",
}, env, options.WithTokenSource(tokenSource))
```
@y
client, err := openai.NewClient(ctx, &latest.ModelConfig{
    Provider: "openai",
    Model:    "gpt-4o",
}, env, options.WithTokenSource(tokenSource))
```
@z

@x
The OpenAI client checks for a configured `TokenSource` before falling back to `token_key`, and uses it to set the `Authorization` header on both HTTP and WebSocket requests. Static API-key, ChatGPT, and gateway auth paths are unaffected. `FromModelOptions` round-trips the token source, so a cloned provider config keeps it. Vertex AI Model Garden's default constructor refreshes GCP access tokens through ADC unless `options.WithTokenSource` is supplied. Its `NewClientWithTokenSource` constructor instead accepts a host-managed request-time token source; neither host credential files nor instance metadata are consulted on that path.
@y
The OpenAI client checks for a configured `TokenSource` before falling back to `token_key`, and uses it to set the `Authorization` header on both HTTP and WebSocket requests. Static API-key, ChatGPT, and gateway auth paths are unaffected. `FromModelOptions` round-trips the token source, so a cloned provider config keeps it. Vertex AI Model Garden's default constructor refreshes GCP access tokens through ADC unless `options.WithTokenSource` is supplied. Its `NewClientWithTokenSource` constructor instead accepts a host-managed request-time token source; neither host credential files nor instance metadata are consulted on that path.
@z

@x
## Cloning Providers
@y
## Cloning Providers
@z

@x
Use the checked `provider.Clone` API when adjusting a provider for an auxiliary
request. Options are applied in order; later overrides win.
@y
Use the checked `provider.Clone` API when adjusting a provider for an auxiliary
request. Options are applied in order; later overrides win.
@z

@x
```go
summaryModel, err := provider.Clone(ctx, model,
    options.WithStructuredOutput(nil),
    options.WithMaxTokens(4096),
    options.WithCompacting(),
)
if err != nil {
    return fmt.Errorf("creating summary model: %w", err)
}
```
@y
```go
summaryModel, err := provider.Clone(ctx, model,
    options.WithStructuredOutput(nil),
    options.WithMaxTokens(4096),
    options.WithCompacting(),
)
if err != nil {
    return fmt.Errorf("creating summary model: %w", err)
}
```
@z

@x
Providers constructed through a `provider.Registry` retain their reconstruction
function, environment and routing model references. Custom implementations must
supply `contracts.Config.RebuildProvider` (or `SetProviderRebuilder`), including
in test doubles. Missing reconstruction support returns `provider.ErrNoRebuilder`;
reconstruction errors are wrapped in `*provider.CloneError` and support
`errors.Is` / `errors.As`.
@y
Providers constructed through a `provider.Registry` retain their reconstruction
function, environment and routing model references. Custom implementations must
supply `contracts.Config.RebuildProvider` (or `SetProviderRebuilder`), including
in test doubles. Missing reconstruction support returns `provider.ErrNoRebuilder`;
reconstruction errors are wrapped in `*provider.CloneError` and support
`errors.Is` / `errors.As`.
@z

@x
Clones isolate mutable model configuration, custom-provider definitions and
structured-output schemas. Transport wrappers, token-source callbacks and the
models.dev store remain shared services. Public option setters retain reference
semantics; isolation happens when cloning. Scalar types and exact numeric values are preserved. Values in `provider_opts`,
schemas and custom providers must be copyable scalars, maps, slices, arrays or
plain structs. Functions, channels, unsafe pointers, cyclic values and structs
with unexported reference-bearing fields fail closed with
`provider.ErrUncopyableConfig`, rather than panic or share mutable state. Copies
are bounded to 128 levels and 100,000 visited values. Cumulative clones preserve explicit structured-output
removal, gateway clearing and no-thinking overrides. A non-zero `WithMaxTokens`
cap supplied to `Clone` overrides direct, matched-route and fallback limits,
subject to existing provider token floors. Cumulative clones retain that cap
when it is omitted or zero; the last non-zero cap wins, including within one
clone call. Ordinary construction-time `WithMaxTokens(0)` reset semantics are
unchanged. Named routing definitions are
captured at construction and copied for each child, so later input-map mutations
do not change clones.
@y
Clones isolate mutable model configuration, custom-provider definitions and
structured-output schemas. Transport wrappers, token-source callbacks and the
models.dev store remain shared services. Public option setters retain reference
semantics; isolation happens when cloning. Scalar types and exact numeric values are preserved. Values in `provider_opts`,
schemas and custom providers must be copyable scalars, maps, slices, arrays or
plain structs. Functions, channels, unsafe pointers, cyclic values and structs
with unexported reference-bearing fields fail closed with
`provider.ErrUncopyableConfig`, rather than panic or share mutable state. Copies
are bounded to 128 levels and 100,000 visited values. Cumulative clones preserve explicit structured-output
removal, gateway clearing and no-thinking overrides. A non-zero `WithMaxTokens`
cap supplied to `Clone` overrides direct, matched-route and fallback limits,
subject to existing provider token floors. Cumulative clones retain that cap
when it is omitted or zero; the last non-zero cap wins, including within one
clone call. Ordinary construction-time `WithMaxTokens(0)` reset semantics are
unchanged. Named routing definitions are
captured at construction and copied for each child, so later input-map mutations
do not change clones.
@z

@x
Configuration-declared thinking off (`none` or `0`, including provider defaults)
is retained as an option before normalization. Reconstruction applies that option
to each leaf's config too, so config-driven and option-driven providers agree.
Routed children inherit strict-off overrides and explicit clone caps. Ordinary
construction-time router limits still leave each child's token defaults unchanged.
@y
Configuration-declared thinking off (`none` or `0`, including provider defaults)
is retained as an option before normalization. Reconstruction applies that option
to each leaf's config too, so config-driven and option-driven providers agree.
Routed children inherit strict-off overrides and explicit clone caps. Ordinary
construction-time router limits still leave each child's token defaults unchanged.
@z

@x
`CloneWithOptions` retains its public signature but is deprecated. On failure it
returns an error-only provider whose stream creation returns the clone error. It
never performs inference on the original provider or exposes its optional
embedding, context-discovery or compaction capabilities.
@y
`CloneWithOptions` retains its public signature but is deprecated. On failure it
returns an error-only provider whose stream creation returns the clone error. It
never performs inference on the original provider or exposes its optional
embedding, context-discovery or compaction capabilities.
@z

@x
| Caller | Clone failure behavior |
| --- | --- |
| Session title | Tries the next configured candidate; exhaustion does not interrupt chat. |
| MCP sampling, with or without tools | Returns the actionable clone error before inference. |
| LLM compaction | Reports failure and leaves the session history intact. |
| Compaction window resolution | The checked resolver returns zero plus the error; the LLM compaction path reports it. UI gauges remain best-effort. |
@y
| Caller | Clone failure behavior |
| --- | --- |
| Session title | Tries the next configured candidate; exhaustion does not interrupt chat. |
| MCP sampling, with or without tools | Returns the actionable clone error before inference. |
| LLM compaction | Reports failure and leaves the session history intact. |
| Compaction window resolution | The checked resolver returns zero plus the error; the LLM compaction path reports it. UI gauges remain best-effort. |
@z

@x
Hook-supplied summaries and provider-native compaction remain usable without a
clonable summary model. For Model Garden, catalogue identity and dispatch identity
are separate: `ModelConfig` supplies capability lookups, while
`DispatchConfig` / `CloneSource()` preserves the original Google configuration for
reconstruction. Both ADC and request-context token sources retain native Vertex
transport, project, location and model-in-URL semantics. Model Garden token-source
precedence is an explicit `NewClientWithTokenSource` argument, then a stored
`options.WithTokenSource`, then ADC. Register that source only for the intended
Google provider, not as a process-wide option for unrelated routed models.
@y
Hook-supplied summaries and provider-native compaction remain usable without a
clonable summary model. For Model Garden, catalogue identity and dispatch identity
are separate: `ModelConfig` supplies capability lookups, while
`DispatchConfig` / `CloneSource()` preserves the original Google configuration for
reconstruction. Both ADC and request-context token sources retain native Vertex
transport, project, location and model-in-URL semantics. Model Garden token-source
precedence is an explicit `NewClientWithTokenSource` argument, then a stored
`options.WithTokenSource`, then ADC. Register that source only for the intended
Google provider, not as a process-wide option for unrelated routed models.
@z

@x
This API change adds no YAML configuration surface or schema version.
@y
This API change adds no YAML configuration surface or schema version.
@z

@x
## Using Different Providers
@y
## Using Different Providers
@z

@x
```go
import (
    "github.com/docker/docker-agent/pkg/model/provider/anthropic"
    "github.com/docker/docker-agent/pkg/model/provider/gemini"
    "github.com/docker/docker-agent/pkg/model/provider/openai"
)
@y
```go
import (
    "github.com/docker/docker-agent/pkg/model/provider/anthropic"
    "github.com/docker/docker-agent/pkg/model/provider/gemini"
    "github.com/docker/docker-agent/pkg/model/provider/openai"
)
@z

@x
// OpenAI
openaiClient, _ := openai.NewClient(ctx, &latest.ModelConfig{
    Provider: "openai",
    Model:    "gpt-4o",
}, env)
@y
// OpenAI
openaiClient, _ := openai.NewClient(ctx, &latest.ModelConfig{
    Provider: "openai",
    Model:    "gpt-4o",
}, env)
@z

@x
// Anthropic
anthropicClient, _ := anthropic.NewClient(ctx, &latest.ModelConfig{
    Provider: "anthropic",
    Model:    "claude-sonnet-4-5",
}, env)
@y
// Anthropic
anthropicClient, _ := anthropic.NewClient(ctx, &latest.ModelConfig{
    Provider: "anthropic",
    Model:    "claude-sonnet-4-5",
}, env)
@z

@x
// Google Gemini
geminiClient, _ := gemini.NewClient(ctx, &latest.ModelConfig{
    Provider: "google",
    Model:    "gemini-3.5-flash",
}, env)
```
@y
// Google Gemini
geminiClient, _ := gemini.NewClient(ctx, &latest.ModelConfig{
    Provider: "google",
    Model:    "gemini-3.5-flash",
}, env)
```
@z

@x
## Session Options
@y
## Session Options
@z

@x
```go
import "github.com/docker/docker-agent/pkg/session"
@y
```go
import "github.com/docker/docker-agent/pkg/session"
@z

@x
sess := session.New(
    // Set a title for the session
    session.WithTitle("Code Review Task"),
@y
sess := session.New(
    // Set a title for the session
    session.WithTitle("Code Review Task"),
@z

@x
    // Add user message
    session.WithUserMessage("Review this code for bugs"),
@y
    // Add user message
    session.WithUserMessage("Review this code for bugs"),
@z

@x
    // Limit iterations
    session.WithMaxIterations(20),
)
```
@y
    // Limit iterations
    session.WithMaxIterations(20),
)
```
@z

@x
## Error Handling
@y
## Error Handling
@z

@x
```go
messages, err := rt.Run(ctx, sess)
if err != nil {
    if errors.Is(err, context.Canceled) {
        // User cancelled
        log.Println("Operation cancelled")
        return nil
    }
    if errors.Is(err, context.DeadlineExceeded) {
        // Timeout
        log.Println("Operation timed out")
        return nil
    }
    // Other error
    return fmt.Errorf("runtime error: %w", err)
}
@y
```go
messages, err := rt.Run(ctx, sess)
if err != nil {
    if errors.Is(err, context.Canceled) {
        // User cancelled
        log.Println("Operation cancelled")
        return nil
    }
    if errors.Is(err, context.DeadlineExceeded) {
        // Timeout
        log.Println("Operation timed out")
        return nil
    }
    // Other error
    return fmt.Errorf("runtime error: %w", err)
}
@z

@x
// Check for errors in the event stream
for event := range rt.RunStream(ctx, sess) {
    if errEvent, ok := event.(*runtime.ErrorEvent); ok {
        return fmt.Errorf("stream error: %s", errEvent.Error)
    }
}
```
@y
// Check for errors in the event stream
for event := range rt.RunStream(ctx, sess) {
    if errEvent, ok := event.(*runtime.ErrorEvent); ok {
        return fmt.Errorf("stream error: %s", errEvent.Error)
    }
}
```
@z

@x
## Complete Example
@y
## Complete Example
@z

@x
See the [examples/golibrary](https://github.com/docker/docker-agent/tree/main/examples/golibrary) directory for complete working examples:
@y
See the [examples/golibrary](https://github.com/docker/docker-agent/tree/main/examples/golibrary) directory for complete working examples:
@z

@x
- `simple/` — Basic agent with no tools
- `tool/` — Custom tool implementation
- `stream/` — Streaming event handling
- `multi/` — Multi-agent with sub-agents
- `builtintool/` — Using built-in tools
- `yamlstrict/` — Loading YAML (file or OCI) with hand-picked providers/toolsets and strict mode
@y
- `simple/` — Basic agent with no tools
- `tool/` — Custom tool implementation
- `stream/` — Streaming event handling
- `multi/` — Multi-agent with sub-agents
- `builtintool/` — Using built-in tools
- `yamlstrict/` — Loading YAML (file or OCI) with hand-picked providers/toolsets and strict mode
@z
