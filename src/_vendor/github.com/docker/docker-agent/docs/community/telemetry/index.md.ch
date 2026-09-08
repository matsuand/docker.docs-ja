%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

% __SUBDIR__ 対応

@x
title: "Telemetry"
description: "Docker Agent collects anonymous usage data to help improve the tool. Telemetry can be disabled at any time."
keywords: docker agent, ai agents, community, telemetry
@y
title: "Telemetry"
description: "Docker Agent collects anonymous usage data to help improve the tool. Telemetry can be disabled at any time."
keywords: docker agent, ai agents, community, telemetry
@z

@x
canonical: https://docs.docker.com/ai/docker-agent/community/telemetry/
@y
canonical: __SUBDIR__/ai/docker-agent/community/telemetry/
@z

@x
_Docker Agent collects anonymous usage data to help improve the tool. Telemetry can be disabled at any time._
@y
_Docker Agent collects anonymous usage data to help improve the tool. Telemetry can be disabled at any time._
@z

@x
On first startup, Docker Agent displays a notice about telemetry collection so you're always informed. All events are processed synchronously when recorded.
@y
On first startup, Docker Agent displays a notice about telemetry collection so you're always informed. All events are processed synchronously when recorded.
@z

@x
## Disabling Telemetry
@y
## Disabling Telemetry
@z

@x
```bash
# Disable via environment variable
$ TELEMETRY_ENABLED=false docker agent run agent.yaml
@y
```bash
# Disable via environment variable
$ TELEMETRY_ENABLED=false docker agent run agent.yaml
@z

@x
# Or export it in your shell profile
$ export TELEMETRY_ENABLED=false
```
@y
# Or export it in your shell profile
$ export TELEMETRY_ENABLED=false
```
@z

@x
> [!NOTE]
> **Default**
>
> Telemetry is **enabled by default**. Set `TELEMETRY_ENABLED=false` to opt out.
@y
> [!NOTE]
> **Default**
>
> Telemetry is **enabled by default**. Set `TELEMETRY_ENABLED=false` to opt out.
@z

@x
## What's Collected ✅
@y
## What's Collected ✅
@z

@x
- Command names and success/failure status
- Agent names and model types
- Tool names and whether calls succeed or fail
- Token counts (input/output totals) and estimated costs
- Session metadata (durations, error counts)
@y
- Command names and success/failure status
- Agent names and model types
- Tool names and whether calls succeed or fail
- Token counts (input/output totals) and estimated costs
- Session metadata (durations, error counts)
@z

@x
## What's NOT Collected ❌
@y
## What's NOT Collected ❌
@z

@x
- User input or prompts
- Agent responses or generated content
- File contents
- API keys or credentials
- Personally identifying information (PII)
@y
- User input or prompts
- Agent responses or generated content
- File contents
- API keys or credentials
- Personally identifying information (PII)
@z

@x
> [!TIP]
> **See events locally**
>
> Use `--debug` to see telemetry events printed to the debug log without sending them anywhere additional.
@y
> [!TIP]
> **See events locally**
>
> Use `--debug` to see telemetry events printed to the debug log without sending them anywhere additional.
@z

@x
```bash
docker agent run agent.yaml --debug
```
@y
```bash
docker agent run agent.yaml --debug
```
@z

@x
## Event Types
@y
## Event Types
@z

@x
The telemetry system uses structured, type-safe events:
@y
The telemetry system uses structured, type-safe events:
@z

@x
| Event Type  | What It Tracks                                                      |
| ----------- | ------------------------------------------------------------------- |
| **Command** | CLI command execution with success status                           |
| **Tool**    | Agent tool calls with timing and error information                  |
| **Token**   | LLM token usage by model, session, and cost                         |
| **Session** | Agent session lifecycle with start/end events and aggregate metrics |
@y
| Event Type  | What It Tracks                                                      |
| ----------- | ------------------------------------------------------------------- |
| **Command** | CLI command execution with success status                           |
| **Tool**    | Agent tool calls with timing and error information                  |
| **Token**   | LLM token usage by model, session, and cost                         |
| **Session** | Agent session lifecycle with start/end events and aggregate metrics |
@z

@x
## For Developers
@y
## For Developers
@z

@x
Telemetry is automatically wrapped around all commands. To record additional events, use the context-based API:
@y
Telemetry is automatically wrapped around all commands. To record additional events, use the context-based API:
@z

@x
```bash
// Recommended: context-based telemetry (clean, testable)
if telemetryClient := telemetry.FromContext(ctx); telemetryClient != nil {
    telemetryClient.RecordToolCall(ctx, "filesystem", "session-id", "agentName", time.Millisecond*500, nil)
    telemetryClient.RecordTokenUsage(ctx, "gpt-4", 100, 50, 0.01)
}
@y
```bash
// Recommended: context-based telemetry (clean, testable)
if telemetryClient := telemetry.FromContext(ctx); telemetryClient != nil {
    telemetryClient.RecordToolCall(ctx, "filesystem", "session-id", "agentName", time.Millisecond*500, nil)
    telemetryClient.RecordTokenUsage(ctx, "gpt-4", 100, 50, 0.01)
}
@z

@x
// Or use direct calls
telemetry.TrackCommand("run", args)
```
@y
// Or use direct calls
telemetry.TrackCommand("run", args)
```
@z

@x
Events are processed synchronously when `Track()` is called, sending HTTP requests immediately.
@y
Events are processed synchronously when `Track()` is called, sending HTTP requests immediately.
@z
