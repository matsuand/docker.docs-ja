%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

% __SUBDIR__ 対応

@x
title: "Transfer Task Tool"
description: "Delegate tasks to sub-agents in multi-agent setups."
keywords: docker agent, ai agents, tools, toolsets, transfer task tool
linkTitle: "Transfer Task"
@y
title: "Transfer Task Tool"
description: "Delegate tasks to sub-agents in multi-agent setups."
keywords: docker agent, ai agents, tools, toolsets, transfer task tool
linkTitle: "Transfer Task"
@z

@x
canonical: https://docs.docker.com/ai/docker-agent/tools/transfer-task/
@y
canonical: __SUBDIR__/ai/docker-agent/tools/transfer-task/
@z

@x
_Delegate tasks to sub-agents in multi-agent setups._
@y
_Delegate tasks to sub-agents in multi-agent setups._
@z

@x
## Overview
@y
## Overview
@z

@x
The `transfer_task` tool allows an agent to delegate tasks to specialized sub-agents and receive their results. This is the core mechanism for multi-agent orchestration.
@y
The `transfer_task` tool allows an agent to delegate tasks to specialized sub-agents and receive their results. This is the core mechanism for multi-agent orchestration.
@z

@x
**You don't need to add it manually** — it's automatically available when an agent has `sub_agents` configured.
@y
**You don't need to add it manually** — it's automatically available when an agent has `sub_agents` configured.
@z

@x
## Configuration
@y
## Configuration
@z

@x
The tool is enabled implicitly when `sub_agents` is set:
@y
The tool is enabled implicitly when `sub_agents` is set:
@z

@x
```yaml
agents:
  coordinator:
    model: openai/gpt-4o
    description: Coordinates work across specialists
    instruction: Analyze requests and delegate to the right specialist.
    sub_agents: [developer, researcher]
@y
```yaml
agents:
  coordinator:
    model: openai/gpt-4o
    description: Coordinates work across specialists
    instruction: Analyze requests and delegate to the right specialist.
    sub_agents: [developer, researcher]
@z

@x
  developer:
    model: anthropic/claude-sonnet-4-5
    description: Expert software developer
    instruction: Write clean, production-ready code.
    toolsets:
      - type: filesystem
      - type: shell
@y
  developer:
    model: anthropic/claude-sonnet-4-5
    description: Expert software developer
    instruction: Write clean, production-ready code.
    toolsets:
      - type: filesystem
      - type: shell
@z

@x
  researcher:
    model: openai/gpt-4o
    description: Web researcher
    instruction: Search for information online.
    toolsets:
      - type: mcp
        ref: docker:duckduckgo
```
@y
  researcher:
    model: openai/gpt-4o
    description: Web researcher
    instruction: Search for information online.
    toolsets:
      - type: mcp
        ref: docker:duckduckgo
```
@z

@x
The coordinator agent automatically gets a `transfer_task` tool that can delegate to `developer` or `researcher`.
@y
The coordinator agent automatically gets a `transfer_task` tool that can delegate to `developer` or `researcher`.
@z

@x
## Tool Interface
@y
## Tool Interface
@z

@x
The `transfer_task` tool takes three parameters:
@y
The `transfer_task` tool takes three parameters:
@z

@x
| Parameter         | Type   | Required | Description                                                                                 |
| ----------------- | ------ | -------- | ------------------------------------------------------------------------------------------- |
| `agent`           | string | ✓        | Name of the sub-agent to delegate to. Must be listed under the caller's `sub_agents`.        |
| `task`            | string | ✓        | Clear, concise description of the task the sub-agent should achieve.                        |
| `expected_output` | string | ✓        | Description of the result/format the caller expects back.                                   |
@y
| Parameter         | Type   | Required | Description                                                                                 |
| ----------------- | ------ | -------- | ------------------------------------------------------------------------------------------- |
| `agent`           | string | ✓        | Name of the sub-agent to delegate to. Must be listed under the caller's `sub_agents`.        |
| `task`            | string | ✓        | Clear, concise description of the task the sub-agent should achieve.                        |
| `expected_output` | string | ✓        | Description of the result/format the caller expects back.                                   |
@z

@x
The call blocks until the sub-agent returns its result, which becomes the tool's response. For non-blocking parallel delegation, use [`background_agents`](../background-agents/index.md) instead.
@y
The call blocks until the sub-agent returns its result, which becomes the tool's response. For non-blocking parallel delegation, use [`background_agents`](../background-agents/index.md) instead.
@z

@x
## Delegation Limits
@y
## Delegation Limits
@z

@x
Sub-agents can have `sub_agents` of their own, so multi-level delegation chains are supported. Two runtime guards keep chains sane, applied to both `transfer_task` and `run_background_agent`:
@y
Sub-agents can have `sub_agents` of their own, so multi-level delegation chains are supported. Two runtime guards keep chains sane, applied to both `transfer_task` and `run_background_agent`:
@z

@x
- **Cycles are rejected.** A delegation targeting an agent that is already part of the active delegation chain (for example `a -> b -> a`) fails with an error naming the cycle.
- **Depth is capped at 10 nested delegations.** The root agent delegating to its first sub-agent counts as depth 1; a call that would exceed the cap fails with an error stating the attempted depth.
@y
- **Cycles are rejected.** A delegation targeting an agent that is already part of the active delegation chain (for example `a -> b -> a`) fails with an error naming the cycle.
- **Depth is capped at 10 nested delegations.** The root agent delegating to its first sub-agent counts as depth 1; a call that would exceed the cap fails with an error stating the attempted depth.
@z

@x
A rejected delegation returns a tool error to the calling agent and never starts the sub-agent.
@y
A rejected delegation returns a tool error to the calling agent and never starts the sub-agent.
@z

@x
> [!TIP]
> **See also**
>
> For parallel task delegation, see [Background Agents](../background-agents/index.md). For multi-agent patterns, see [Multi-Agent](../../concepts/multi-agent/index.md).
@y
> [!TIP]
> **See also**
>
> For parallel task delegation, see [Background Agents](../background-agents/index.md). For multi-agent patterns, see [Multi-Agent](../../concepts/multi-agent/index.md).
@z
