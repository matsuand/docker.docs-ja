%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

% __SUBDIR__ 対応

@x
title: "Handoff Tool"
description: "Hand off the active conversation to another local agent defined in the same config."
keywords: docker agent, ai agents, tools, toolsets, handoff tool
linkTitle: "Handoff"
@y
title: "Handoff Tool"
description: "Hand off the active conversation to another local agent defined in the same config."
keywords: docker agent, ai agents, tools, toolsets, handoff tool
linkTitle: "Handoff"
@z

@x
canonical: https://docs.docker.com/ai/docker-agent/tools/handoff/
@y
canonical: __SUBDIR__/ai/docker-agent/tools/handoff/
@z

@x
_Hand off the active conversation to another local agent defined in the same config._
@y
_Hand off the active conversation to another local agent defined in the same config._
@z

@x
## Overview
@y
## Overview
@z

@x
The `handoff` tool lets an agent transfer control of the **current conversation** to another agent in the **same config file**. Unlike [`transfer_task`](../transfer-task/index.md), which delegates a sub-task and collects the result, `handoff` rewires the session so the receiving agent continues the conversation directly with the user.
@y
The `handoff` tool lets an agent transfer control of the **current conversation** to another agent in the **same config file**. Unlike [`transfer_task`](../transfer-task/index.md), which delegates a sub-task and collects the result, `handoff` rewires the session so the receiving agent continues the conversation directly with the user.
@z

@x
This is the core mechanism for **handoffs routing** — a pattern where a router agent classifies the user's request and hands it off to a specialist, which then owns the rest of the session.
@y
This is the core mechanism for **handoffs routing** — a pattern where a router agent classifies the user's request and hands it off to a specialist, which then owns the rest of the session.
@z

@x
> [!NOTE]
> **Local only**
>
> The `handoff` tool only targets agents declared in the **same** config file by their local name. It does **not** open network connections. To delegate to a remote agent over the network, use the [A2A toolset](../a2a/index.md) instead.
@y
> [!NOTE]
> **Local only**
>
> The `handoff` tool only targets agents declared in the **same** config file by their local name. It does **not** open network connections. To delegate to a remote agent over the network, use the [A2A toolset](../a2a/index.md) instead.
@z

@x
## Configuration
@y
## Configuration
@z

@x
The tool is enabled implicitly when an agent declares a non-empty `handoffs:` list. You do **not** add `- type: handoff` under `toolsets:` — it is not a toolset type.
@y
The tool is enabled implicitly when an agent declares a non-empty `handoffs:` list. You do **not** add `- type: handoff` under `toolsets:` — it is not a toolset type.
@z

@x
```yaml
agents:
  router:
    model: openai/gpt-4o
    description: Routes questions to the right specialist
    instruction: |
      Classify the user's question and hand off to the most appropriate
      specialist. If unsure, ask a clarifying question first.
    handoffs: [billing, support]
@y
```yaml
agents:
  router:
    model: openai/gpt-4o
    description: Routes questions to the right specialist
    instruction: |
      Classify the user's question and hand off to the most appropriate
      specialist. If unsure, ask a clarifying question first.
    handoffs: [billing, support]
@z

@x
  billing:
    model: openai/gpt-4o
    description: Billing specialist
    instruction: Answer billing questions.
@y
  billing:
    model: openai/gpt-4o
    description: Billing specialist
    instruction: Answer billing questions.
@z

@x
  support:
    model: openai/gpt-4o
    description: Technical support specialist
    instruction: Help with technical issues.
```
@y
  support:
    model: openai/gpt-4o
    description: Technical support specialist
    instruction: Help with technical issues.
```
@z

@x
The router agent automatically gets a `handoff` tool it can call to switch the conversation to `billing` or `support`.
@y
The router agent automatically gets a `handoff` tool it can call to switch the conversation to `billing` or `support`.
@z

@x
## Tool Interface
@y
## Tool Interface
@z

@x
The `handoff` tool takes a single parameter:
@y
The `handoff` tool takes a single parameter:
@z

@x
| Parameter | Type   | Required | Description                                                       |
| --------- | ------ | -------- | ----------------------------------------------------------------- |
| `agent`   | string | ✓        | The local name of the agent to hand off the conversation to.      |
@y
| Parameter | Type   | Required | Description                                                       |
| --------- | ------ | -------- | ----------------------------------------------------------------- |
| `agent`   | string | ✓        | The local name of the agent to hand off the conversation to.      |
@z

@x
Only names listed in the current agent's `handoffs:` field are valid targets.
@y
Only names listed in the current agent's `handoffs:` field are valid targets.
@z

@x
> [!TIP]
> **See also**
>
> For sub-task delegation (caller stays in control, waits for the result), see [Transfer Task](../transfer-task/index.md). For remote agent connections over the network, see the [A2A toolset](../a2a/index.md). For the broader pattern, see [Handoffs Routing](../../concepts/multi-agent/index.md#handoffs-routing).
@y
> [!TIP]
> **See also**
>
> For sub-task delegation (caller stays in control, waits for the result), see [Transfer Task](../transfer-task/index.md). For remote agent connections over the network, see the [A2A toolset](../a2a/index.md). For the broader pattern, see [Handoffs Routing](../../concepts/multi-agent/index.md#handoffs-routing).
@z
