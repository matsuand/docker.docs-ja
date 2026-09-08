%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

% __SUBDIR__ 対応

@x
title: "Session Context Tool"
description: "Reference a previous session as context in the current one."
keywords: docker agent, ai agents, tools, toolsets, session context tool
linkTitle: "Session Context"
@y
title: "Session Context Tool"
description: "Reference a previous session as context in the current one."
keywords: docker agent, ai agents, tools, toolsets, session context tool
linkTitle: "Session Context"
@z

@x
canonical: https://docs.docker.com/ai/docker-agent/tools/session_context/
@y
canonical: __SUBDIR__/ai/docker-agent/tools/session_context/
@z

@x
_Reference a previous session as context, without manual export/import._
@y
_Reference a previous session as context, without manual export/import._
@z

@x
## Overview
@y
## Overview
@z

@x
The `session_context` toolset lets an agent discover earlier sessions and pull one in as context for the current session. It removes the manual workaround of exporting a conversation to HTML and re-attaching it with an `@` mention.
@y
The `session_context` toolset lets an agent discover earlier sessions and pull one in as context for the current session. It removes the manual workaround of exporting a conversation to HTML and re-attaching it with an `@` mention.
@z

@x
The tool surface is two read-only tools:
@y
The tool surface is two read-only tools:
@z

@x
| Tool            | Description                                                                                                  |
| --------------- | ------------------------------------------------------------------------------------------------------------ |
| `list_sessions` | List previous sessions (most recent first) with id, title, creation time and message count.                  |
| `read_session`  | Return the transcript of a previous session, by id or by a relative reference like `-1`.                      |
@y
| Tool            | Description                                                                                                  |
| --------------- | ------------------------------------------------------------------------------------------------------------ |
| `list_sessions` | List previous sessions (most recent first) with id, title, creation time and message count.                  |
| `read_session`  | Return the transcript of a previous session, by id or by a relative reference like `-1`.                      |
@z

@x
The session the agent is currently running in is never listed by `list_sessions` and cannot be read by `read_session` (a circular reference returns an error).
@y
The session the agent is currently running in is never listed by `list_sessions` and cannot be read by `read_session` (a circular reference returns an error).
@z

@x
## Configuration
@y
## Configuration
@z

@x
```yaml
toolsets:
  - type: session_context
```
@y
```yaml
toolsets:
  - type: session_context
```
@z

@x
No configuration options. Both tools are read-only and operate against the same session store the runtime already uses for persistence.
@y
No configuration options. Both tools are read-only and operate against the same session store the runtime already uses for persistence.
@z

@x
Restrict the toolset to a subset of tools the standard way:
@y
Restrict the toolset to a subset of tools the standard way:
@z

@x
```yaml
# An agent that may browse but never pull a full transcript into context.
toolsets:
  - type: session_context
    tools:
      - list_sessions
```
@y
```yaml
# An agent that may browse but never pull a full transcript into context.
toolsets:
  - type: session_context
    tools:
      - list_sessions
```
@z

@x
## Selecting a session
@y
## Selecting a session
@z

@x
`read_session` accepts either form:
@y
`read_session` accepts either form:
@z

@x
- A concrete id returned by `list_sessions`, e.g. `read_session("a1b2c3...")`.
- A relative reference: `-1` is the most recent session, `-2` the second most recent, and so on. Relative references resolve against the same ordering `list_sessions` uses (most recent first), excluding sub-sessions.
@y
- A concrete id returned by `list_sessions`, e.g. `read_session("a1b2c3...")`.
- A relative reference: `-1` is the most recent session, `-2` the second most recent, and so on. Relative references resolve against the same ordering `list_sessions` uses (most recent first), excluding sub-sessions.
@z

@x
## Transcript size
@y
## Transcript size
@z

@x
A long session could overflow the current context window, so `read_session` caps the rendered transcript. When a transcript is larger than the budget, the oldest messages are dropped (the most recent are usually the most useful for continuing work) and a note records how many were omitted:
@y
A long session could overflow the current context window, so `read_session` caps the rendered transcript. When a transcript is larger than the budget, the oldest messages are dropped (the most recent are usually the most useful for continuing work) and a note records how many were omitted:
@z

@x
```text
[12 earlier message(s) omitted to fit the context budget; showing the most recent 8]
```
@y
```text
[12 earlier message(s) omitted to fit the context budget; showing the most recent 8]
```
@z

@x
## Notes
@y
## Notes
@z

@x
- `list_sessions` defaults to 20 sessions and is capped at 100; pass `limit` to request fewer.
- `read_session` returns an error when the session is not found, when the reference cannot be resolved, or when it points at the current session.
- Both tools are read-only: they never modify, branch, or delete sessions.
@y
- `list_sessions` defaults to 20 sessions and is capped at 100; pass `limit` to request fewer.
- `read_session` returns an error when the session is not found, when the reference cannot be resolved, or when it points at the current session.
- Both tools are read-only: they never modify, branch, or delete sessions.
@z

@x
## Example
@y
## Example
@z

@x
See [`examples/session_context.yaml`](https://github.com/docker/docker-agent/blob/main/examples/session_context.yaml) for a complete working example.
@y
See [`examples/session_context.yaml`](https://github.com/docker/docker-agent/blob/main/examples/session_context.yaml) for a complete working example.
@z
