%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
title: "Date and Time Tool"
description: "Obtain the current date, time, or datetime in a model-chosen format."
keywords: docker agent, ai agents, tools, toolsets, datetime, date, time
linkTitle: "Date and Time"
@y
title: "Date and Time Tool"
description: "Obtain the current date, time, or datetime in a model-chosen format."
keywords: docker agent, ai agents, tools, toolsets, datetime, date, time
linkTitle: "Date and Time"
@z

@x
canonical: https://docs.docker.com/ai/docker-agent/tools/datetime/
@y
canonical: __SUBDIR__/ai/docker-agent/tools/datetime/
@z

@x
_Obtain the current date, time, or datetime in a model-chosen format._
@y
_Obtain the current date, time, or datetime in a model-chosen format._
@z

@x
## Overview
@y
## Overview
@z

@x
The `datetime` toolset exposes one read-only tool, `get_datetime`. It reads the
current clock on each call and returns only the formatted string. No shell or
external service is needed. It works in native and browser builds.
@y
The `datetime` toolset exposes one read-only tool, `get_datetime`. It reads the
current clock on each call and returns only the formatted string. No shell or
external service is needed. It works in native and browser builds.
@z

@x
## Configuration
@y
## Configuration
@z

@x
```yaml
agents:
  root:
    model: openai/gpt-5-mini
    instruction: Use get_datetime for the current date or time.
    toolsets:
      - type: datetime
```
@y
```yaml
agents:
  root:
    model: openai/gpt-5-mini
    instruction: Use get_datetime for the current date or time.
    toolsets:
      - type: datetime
```
@z

@x
No toolset-specific configuration is required. The model chooses the format and
optional timezone in each tool call.
@y
No toolset-specific configuration is required. The model chooses the format and
optional timezone in each tool call.
@z

@x
## Tool arguments
@y
## Tool arguments
@z

@x
| Argument | Required | Description |
| --- | --- | --- |
| `format` | Yes | A Go time layout based on the reference time `Mon Jan 2 15:04:05 MST 2006`. |
| `timezone` | No | An IANA timezone such as `Europe/Paris`, `America/New_York`, or `UTC`. Defaults to the host's local timezone; `Local` also selects it. |
@y
| Argument | Required | Description |
| --- | --- | --- |
| `format` | Yes | A Go time layout based on the reference time `Mon Jan 2 15:04:05 MST 2006`. |
| `timezone` | No | An IANA timezone such as `Europe/Paris`, `America/New_York`, or `UTC`. Defaults to the host's local timezone; `Local` also selects it. |
@z

@x
Choose a layout containing only the parts needed:
@y
Choose a layout containing only the parts needed:
@z

@x
| Desired output | `format` | Example result |
| --- | --- | --- |
| Date | `2006-01-02` | `2026-10-07` |
| Time | `15:04:05` | `23:04:05` |
| 12-hour time | `3:04 PM` | `11:04 PM` |
| RFC3339 datetime | `2006-01-02T15:04:05Z07:00` | `2026-10-07T23:04:05Z` |
| Long date | `Monday, January 2, 2006` | `Wednesday, October 7, 2026` |
@y
| Desired output | `format` | Example result |
| --- | --- | --- |
| Date | `2006-01-02` | `2026-10-07` |
| Time | `15:04:05` | `23:04:05` |
| 12-hour time | `3:04 PM` | `11:04 PM` |
| RFC3339 datetime | `2006-01-02T15:04:05Z07:00` | `2026-10-07T23:04:05Z` |
| Long date | `Monday, January 2, 2006` | `Wednesday, October 7, 2026` |
@z

@x
For example:
@y
For example:
@z

@x
```json
{"format":"2006-01-02T15:04:05Z07:00","timezone":"UTC"}
```
@y
```json
{"format":"2006-01-02T15:04:05Z07:00","timezone":"UTC"}
```
@z

@x
The result is plain text, for example `2026-10-07T23:04:05Z`, with no label or
JSON wrapper.
@y
The result is plain text, for example `2026-10-07T23:04:05Z`, with no label or
JSON wrapper.
@z

@x
Use Go layouts, not `strftime` directives (`%Y-%m-%d`) or tokens such as
`YYYY-MM-DD`. Literal text in the layout is preserved. See the
[Go time layout documentation](https://pkg.go.dev/time#Layout) for more formats.
Empty or whitespace-only formats and unknown timezones return tool errors.
@y
Use Go layouts, not `strftime` directives (`%Y-%m-%d`) or tokens such as
`YYYY-MM-DD`. Literal text in the layout is preserved. See the
[Go time layout documentation](https://pkg.go.dev/time#Layout) for more formats.
Empty or whitespace-only formats and unknown timezones return tool errors.
@z

@x
The tool has no side effects and carries `ReadOnlyHint`. Approval still depends
on the session's [safety mode and permission rules](../../configuration/permissions/index.md).
@y
The tool has no side effects and carries `ReadOnlyHint`. Approval still depends
on the session's [safety mode and permission rules](../../configuration/permissions/index.md).
@z

@x
See [the example configuration](https://github.com/docker/docker-agent/blob/main/examples/datetime.yaml).
@y
See [the example configuration](https://github.com/docker/docker-agent/blob/main/examples/datetime.yaml).
@z
