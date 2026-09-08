%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

% __SUBDIR__ 対応

@x
title: "Think Tool"
description: "Step-by-step reasoning scratchpad for planning and decision-making."
keywords: docker agent, ai agents, tools, toolsets, think tool
linkTitle: "Think"
@y
title: "Think Tool"
description: "Step-by-step reasoning scratchpad for planning and decision-making."
keywords: docker agent, ai agents, tools, toolsets, think tool
linkTitle: "Think"
@z

@x
canonical: https://docs.docker.com/ai/docker-agent/tools/think/
@y
canonical: __SUBDIR__/ai/docker-agent/tools/think/
@z

@x
_Step-by-step reasoning scratchpad for planning and decision-making._
@y
_Step-by-step reasoning scratchpad for planning and decision-making._
@z

@x
## Overview
@y
## Overview
@z

@x
The think tool is a reasoning scratchpad that lets agents think step-by-step before acting. The agent can write its thoughts without producing visible output to the user — ideal for planning complex tasks, breaking down problems, and reasoning through multi-step solutions.
@y
The think tool is a reasoning scratchpad that lets agents think step-by-step before acting. The agent can write its thoughts without producing visible output to the user — ideal for planning complex tasks, breaking down problems, and reasoning through multi-step solutions.
@z

@x
This is a lightweight tool with no side effects. It is most useful for models that lack built-in reasoning or thinking capabilities (e.g., smaller or older models). For models that already support native thinking — such as Claude with extended thinking, OpenAI o-series, or Gemini with a thinking budget — this tool is unnecessary since the model can reason internally.
@y
This is a lightweight tool with no side effects. It is most useful for models that lack built-in reasoning or thinking capabilities (e.g., smaller or older models). For models that already support native thinking — such as Claude with extended thinking, OpenAI o-series, or Gemini with a thinking budget — this tool is unnecessary since the model can reason internally.
@z

@x
## Configuration
@y
## Configuration
@z

@x
```yaml
toolsets:
  - type: think
```
@y
```yaml
toolsets:
  - type: think
```
@z

@x
No configuration options.
@y
No configuration options.
@z

@x
> [!TIP]
> **When to use**
>
> Use the think tool with models that don't have native reasoning capabilities. If your model already supports a [thinking budget](../../configuration/models/index.md#thinking-budget), you likely don't need this tool.
@y
> [!TIP]
> **When to use**
>
> Use the think tool with models that don't have native reasoning capabilities. If your model already supports a [thinking budget](../../configuration/models/index.md#thinking-budget), you likely don't need this tool.
@z
