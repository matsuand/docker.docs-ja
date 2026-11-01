%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

% __SUBDIR__ 対応

@x
title: "Telemetry"
description: "Docker Agent collects usage data to help improve the tool. Telemetry can be disabled at any time."
keywords: docker agent, ai agents, configuration, telemetry
@y
title: "Telemetry"
description: "Docker Agent collects usage data to help improve the tool. Telemetry can be disabled at any time."
keywords: docker agent, ai agents, configuration, telemetry
@z

@x
canonical: https://docs.docker.com/ai/docker-agent/configuration/telemetry/
@y
canonical: __SUBDIR__/ai/docker-agent/configuration/telemetry/
@z

@x
_Docker Agent collects usage data to help improve the tool. Telemetry can be disabled at any time._
@y
_Docker Agent collects usage data to help improve the tool. Telemetry can be disabled at any time._
@z

@x
On first startup, Docker Agent displays a notice about telemetry collection so you're always informed. Ordinary telemetry events are sent asynchronously; selected error events are sent synchronously before exit.
@y
On first startup, Docker Agent displays a notice about telemetry collection so you're always informed. Ordinary telemetry events are sent asynchronously; selected error events are sent synchronously before exit.
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
- Command names, positional arguments, and success/failure status
- Agent names and model types
- Tool names and whether calls succeed or fail
- Token counts (input/output totals) and estimated costs
- Session metadata (durations, error counts)
@y
- Command names, positional arguments, and success/failure status
- Agent names and model types
- Tool names and whether calls succeed or fail
- Token counts (input/output totals) and estimated costs
- Session metadata (durations, error counts)
@z

@x
## Sensitive Data
@y
## Sensitive Data
@z

@x
Command events include positional arguments. For `run` and `exec`, these can include prompts, file paths, and registry references. Error events also include error text. Do not assume telemetry is free of secrets or personally identifying information: either can appear in arguments or errors.
@y
Command events include positional arguments. For `run` and `exec`, these can include prompts, file paths, and registry references. Error events also include error text. Do not assume telemetry is free of secrets or personally identifying information: either can appear in arguments or errors.
@z

@x
Conversation transcripts and file contents are not collected as separate telemetry fields, but text included in command arguments or errors can still be transmitted. Set `TELEMETRY_ENABLED=false` before running commands that may contain sensitive data.
@y
Conversation transcripts and file contents are not collected as separate telemetry fields, but text included in command arguments or errors can still be transmitted. Set `TELEMETRY_ENABLED=false` before running commands that may contain sensitive data.
@z

@x
> [!TIP]
> **See events locally**
>
> Use `--debug` to see telemetry events in the debug log. Enabled telemetry is still transmitted, using Docker's staging telemetry endpoint in debug mode. Combine it with `TELEMETRY_ENABLED=false` to inspect events without transmitting them.
@y
> [!TIP]
> **See events locally**
>
> Use `--debug` to see telemetry events in the debug log. Enabled telemetry is still transmitted, using Docker's staging telemetry endpoint in debug mode. Combine it with `TELEMETRY_ENABLED=false` to inspect events without transmitting them.
@z

@x
```bash
TELEMETRY_ENABLED=false docker agent run agent.yaml --debug
```
@y
```bash
TELEMETRY_ENABLED=false docker agent run agent.yaml --debug
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
```go
// Recommended: context-based telemetry (clean, testable)
if telemetryClient := telemetry.FromContext(ctx); telemetryClient != nil {
    telemetryClient.RecordToolCall(ctx, "filesystem", "session-id", "agentName", time.Millisecond*500, nil)
    telemetryClient.RecordTokenUsage(ctx, "gpt-4", 100, 50, 0.01)
}
@y
```go
// Recommended: context-based telemetry (clean, testable)
if telemetryClient := telemetry.FromContext(ctx); telemetryClient != nil {
    telemetryClient.RecordToolCall(ctx, "filesystem", "session-id", "agentName", time.Millisecond*500, nil)
    telemetryClient.RecordTokenUsage(ctx, "gpt-4", 100, 50, 0.01)
}
@z

@x
// Or use direct calls
telemetry.TrackCommand(ctx, "run", args)
```
@y
// Or use direct calls
telemetry.TrackCommand(ctx, "run", args)
```
@z

@x
`Track()` prepares the event and sends it asynchronously. `TrackSynchronous()` waits for the HTTP request; command-error tracking uses it before the process exits.
@y
`Track()` prepares the event and sends it asynchronously. `TrackSynchronous()` waits for the HTTP request; command-error tracking uses it before the process exits.
@z
