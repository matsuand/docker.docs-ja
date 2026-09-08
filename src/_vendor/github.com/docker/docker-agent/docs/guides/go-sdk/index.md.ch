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
)
@y
    dagentcfg "github.com/docker/docker-agent/pkg/config"
    dagentruntime "github.com/docker/docker-agent/pkg/runtime"
    "github.com/docker/docker-agent/pkg/embeddedchat"
)
@z

@x
chat, err := embeddedchat.New(ctx, embeddedchat.Config{
    // AgentSource can be a file path, raw YAML bytes, or an OCI reference.
    AgentSource: dagentcfg.NewBytesSource("agent", []byte(agentYAML)),
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
| `RuntimeEvent` | The original `runtime.Event` for callers that need the full stream.      |
@z

@x
For advanced use (custom elicitation, raw event inspection), call `chat.Runtime()` to access the underlying `runtime.Runtime` directly.
@y
For advanced use (custom elicitation, raw event inspection), call `chat.Runtime()` to access the underlying `runtime.Runtime` directly.
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
## Optional Provider Build Tags
@y
## Optional Provider Build Tags
@z

@x
By default Docker Agent includes all four cloud providers (OpenAI, Anthropic, Google, Amazon Bedrock). When embedding Docker Agent in your own binary you can compile out unneeded providers — together with their transitive SDK dependencies — to reduce binary size.
@y
By default Docker Agent includes all four cloud providers (OpenAI, Anthropic, Google, Amazon Bedrock). When embedding Docker Agent in your own binary you can compile out unneeded providers — together with their transitive SDK dependencies — to reduce binary size.
@z

@x
Each provider is gated by a negative build tag prefixed `docker_agent_` to avoid collisions with your own project's tags:
@y
Each provider is gated by a negative build tag prefixed `docker_agent_` to avoid collisions with your own project's tags:
@z

@x
| Build tag                    | Provider dropped         | Major dependency removed                          |
| ---------------------------- | ------------------------ | ------------------------------------------------- |
| `docker_agent_no_openai`     | OpenAI                   | `github.com/openai/openai-go`                     |
| `docker_agent_no_anthropic`  | Anthropic                | `github.com/anthropics/anthropic-sdk-go` (partial — see note) |
| `docker_agent_no_google`     | Google / Vertex AI       | `google.golang.org/genai`, Vertex auth stack, and indirectly the Anthropic and OpenAI SDKs via Vertex Model Garden |
| `docker_agent_no_bedrock`    | Amazon Bedrock           | `github.com/aws/aws-sdk-go-v2` stack (the largest provider dependency tree) |
@y
| Build tag                    | Provider dropped         | Major dependency removed                          |
| ---------------------------- | ------------------------ | ------------------------------------------------- |
| `docker_agent_no_openai`     | OpenAI                   | `github.com/openai/openai-go`                     |
| `docker_agent_no_anthropic`  | Anthropic                | `github.com/anthropics/anthropic-sdk-go` (partial — see note) |
| `docker_agent_no_google`     | Google / Vertex AI       | `google.golang.org/genai`, Vertex auth stack, and indirectly the Anthropic and OpenAI SDKs via Vertex Model Garden |
| `docker_agent_no_bedrock`    | Amazon Bedrock           | `github.com/aws/aws-sdk-go-v2` stack (the largest provider dependency tree) |
@z

@x
To build without Bedrock and OpenAI:
@y
To build without Bedrock and OpenAI:
@z

@x
```bash
go build -tags 'docker_agent_no_bedrock docker_agent_no_openai' ./...
```
@y
```bash
go build -tags 'docker_agent_no_bedrock docker_agent_no_openai' ./...
```
@z

@x
Requesting a model whose provider was compiled out fails at construction time with a clear `"not compiled into this build"` error. The `dmr` (Docker Model Runner) provider and the rule-based router are always compiled in.
@y
Requesting a model whose provider was compiled out fails at construction time with a clear `"not compiled into this build"` error. The `dmr` (Docker Model Runner) provider and the rule-based router are always compiled in.
@z

@x
> [!WARNING]
> **Anthropic + Google dependency**
>
> The Google provider's Vertex Model Garden support also imports the Anthropic SDK, so the Anthropic dependency is only fully removed when _both_ `docker_agent_no_anthropic` and `docker_agent_no_google` are set.
@y
> [!WARNING]
> **Anthropic + Google dependency**
>
> The Google provider's Vertex Model Garden support also imports the Anthropic SDK, so the Anthropic dependency is only fully removed when _both_ `docker_agent_no_anthropic` and `docker_agent_no_google` are set.
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
If you want to exclude the RAG toolset from your binary entirely — surfacing a load-time warning on the agent rather than a deferred runtime error from the `!cgo` stub — remove it from the registry before passing it to `teamloader.Load`:
@y
If you want to exclude the RAG toolset from your binary entirely — surfacing a load-time warning on the agent rather than a deferred runtime error from the `!cgo` stub — remove it from the registry before passing it to `teamloader.Load`:
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
Pass the custom registry via `teamloader.WithToolsetRegistry(registry)` when calling `teamloader.Load`. Note that `teamloader.Load()` does not return an error for unknown toolset types — the failure is recorded as a load-time warning and can be retrieved with `agent.DrainWarnings()`; it is also surfaced via logging and TUI notifications.
@y
Pass the custom registry via `teamloader.WithToolsetRegistry(registry)` when calling `teamloader.Load`. Note that `teamloader.Load()` does not return an error for unknown toolset types — the failure is recorded as a load-time warning and can be retrieved with `agent.DrainWarnings()`; it is also surfaced via logging and TUI notifications.
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
The CLI, `teamloader.Load()`, `pkg/cli.Run()` and `embeddedchat/defaults` enable it automatically. If you build teams in code, call `runtime.ResolveCommand` (or `cli.PrepareUserMessage`) directly **and** use `${...}` expressions in commands, register the evaluator yourself:
@y
The CLI, `teamloader.Load()`, `pkg/cli.Run()` and `embeddedchat/defaults` enable it automatically. If you build teams in code, call `runtime.ResolveCommand` (or `cli.PrepareUserMessage`) directly **and** use `${...}` expressions in commands, register the evaluator yourself:
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
    rt, err := runtime.New(t)
    if err != nil {
        return err
    }
@y
    // Create team and runtime
    t := team.New(team.WithAgents(assistant))
    rt, err := runtime.New(t)
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
    "encoding/json"
    "fmt"
@y
import (
    "context"
    "encoding/json"
    "fmt"
@z

@x
    "github.com/docker/docker-agent/pkg/tools"
)
@y
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
func addNumbers(_ context.Context, toolCall tools.ToolCall) (*tools.ToolCallResult, error) {
    var args AddNumbersArgs
    if err := json.Unmarshal([]byte(toolCall.Function.Arguments), &args); err != nil {
        return nil, err
    }
@y
// Implement the tool handler
func addNumbers(_ context.Context, toolCall tools.ToolCall) (*tools.ToolCallResult, error) {
    var args AddNumbersArgs
    if err := json.Unmarshal([]byte(toolCall.Function.Arguments), &args); err != nil {
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
func main() {
    // Create the tool definition
    addTool := tools.Tool{
        Name:        "add",
        Category:    "math",
        Description: "Add two numbers together",
        Parameters:  tools.MustSchemaFor[AddNumbersArgs](),
        Handler:     addNumbers,
    }
@y
func main() {
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
    calculator := agent.New(
        "root",
        "You are a calculator. Use the add tool for arithmetic.",
        agent.WithModel(llm),
        agent.WithTools(addTool),
    )
    // ...
}
```
@y
    // Use with an agent
    calculator := agent.New(
        "root",
        "You are a calculator. Use the add tool for arithmetic.",
        agent.WithModel(llm),
        agent.WithTools(addTool),
    )
    // ...
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
    "github.com/docker/docker-agent/pkg/team"
    "github.com/docker/docker-agent/pkg/tools/builtin"
)
@y
import (
    "github.com/docker/docker-agent/pkg/agent"
    "github.com/docker/docker-agent/pkg/team"
    "github.com/docker/docker-agent/pkg/tools/builtin"
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
        agent.WithToolSets(builtin.NewTransferTaskTool()),
    )
@y
    // Create root agent with sub-agents
    coordinator := agent.New(
        "root",
        "You coordinate research tasks.",
        agent.WithModel(llm),
        agent.WithDescription("Team coordinator"),
        agent.WithSubAgents(researcher),
        agent.WithToolSets(builtin.NewTransferTaskTool()),
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
    "github.com/docker/docker-agent/pkg/config"
    "github.com/docker/docker-agent/pkg/tools/builtin"
)
@y
```go
import (
    "github.com/docker/docker-agent/pkg/config"
    "github.com/docker/docker-agent/pkg/tools/builtin"
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
            builtin.NewShellTool(os.Environ(), rtConfig),
            // Filesystem tools
            builtin.NewFilesystemTool(rtConfig.Config.WorkingDir),
            // Think tool for reasoning
            builtin.NewThinkTool(),
            // Todo tool for task tracking
            builtin.NewTodoTool(),
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
            builtin.NewShellTool(os.Environ(), rtConfig),
            // Filesystem tools
            builtin.NewFilesystemTool(rtConfig.Config.WorkingDir),
            // Think tool for reasoning
            builtin.NewThinkTool(),
            // Todo tool for task tracking
            builtin.NewTodoTool(),
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
> **Vertex AI not supported**
>
> Vertex AI uses an ADC-managed HTTP client that Docker Agent cannot intercept. When a transport wrapper is set, Docker Agent falls back to the GeminiAPI backend instead of Vertex AI — a debug message is logged.
@y
> [!WARNING]
> **Vertex AI not supported**
>
> Vertex AI uses an ADC-managed HTTP client that Docker Agent cannot intercept. When a transport wrapper is set, Docker Agent falls back to the GeminiAPI backend instead of Vertex AI — a debug message is logged.
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
@y
- `simple/` — Basic agent with no tools
- `tool/` — Custom tool implementation
- `stream/` — Streaming event handling
- `multi/` — Multi-agent with sub-agents
- `builtintool/` — Using built-in tools
@z
