%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

% __SUBDIR__ 対応

@x
title: "Agents"
description: "Agents are the core building blocks of Docker Agent. Each agent is an AI-powered entity with a model, instructions, tools, and optional sub-agents."
keywords: docker agent, ai agents, concepts, agents
@y
title: "Agents"
description: "Agents are the core building blocks of Docker Agent. Each agent is an AI-powered entity with a model, instructions, tools, and optional sub-agents."
keywords: docker agent, ai agents, concepts, agents
@z

@x
canonical: https://docs.docker.com/ai/docker-agent/concepts/agents/
@y
canonical: __SUBDIR__/ai/docker-agent/concepts/agents/
@z

@x
_Agents are the core building blocks of Docker Agent. Each agent is an AI-powered entity with a model, instructions, tools, and optional sub-agents._
@y
_Agents are the core building blocks of Docker Agent. Each agent is an AI-powered entity with a model, instructions, tools, and optional sub-agents._
@z

@x
## What is an Agent?
@y
## What is an Agent?
@z

@x
An agent in Docker Agent is defined by:
@y
An agent in Docker Agent is defined by:
@z

@x
- **Model** — The AI model powering it (e.g., Claude, GPT-5, Gemini). See [Models](../models/index.md).
- **Description** — A brief summary of what the agent does (used by other agents for delegation)
- **Instruction** — The system prompt that defines the agent's behavior and personality
- **Tools** — Capabilities like filesystem access, shell commands, or external APIs
- **Sub-agents** — Other agents it can delegate tasks to
@y
- **Model** — The AI model powering it (e.g., Claude, GPT-5, Gemini). See [Models](../models/index.md).
- **Description** — A brief summary of what the agent does (used by other agents for delegation)
- **Instruction** — The system prompt that defines the agent's behavior and personality
- **Tools** — Capabilities like filesystem access, shell commands, or external APIs
- **Sub-agents** — Other agents it can delegate tasks to
@z

@x
```yaml
agents:
  root:
    model: anthropic/claude-sonnet-4-5
    description: Expert software developer
    instruction: |
      You are an expert developer. Write clean, efficient code
      and explain your reasoning step by step.
    toolsets:
      - type: filesystem
      - type: shell
      - type: think
```
@y
```yaml
agents:
  root:
    model: anthropic/claude-sonnet-4-5
    description: Expert software developer
    instruction: |
      You are an expert developer. Write clean, efficient code
      and explain your reasoning step by step.
    toolsets:
      - type: filesystem
      - type: shell
      - type: think
```
@z

@x
## The Root Agent
@y
## The Root Agent
@z

@x
Every Docker Agent configuration has a **root agent** — the entry point that receives user messages. In a single-agent setup, this is the only agent. In a multi-agent setup, the root agent acts as a coordinator, delegating tasks to specialized sub-agents.
@y
Every Docker Agent configuration has a **root agent** — the entry point that receives user messages. In a single-agent setup, this is the only agent. In a multi-agent setup, the root agent acts as a coordinator, delegating tasks to specialized sub-agents.
@z

@x
> [!NOTE]
> **Naming**
>
> The first agent defined in your YAML (or the one named `root`) is the root agent by default. You can also specify which agent to start with using `docker agent run config.yaml -a agent_name`.
@y
> [!NOTE]
> **Naming**
>
> The first agent defined in your YAML (or the one named `root`) is the root agent by default. You can also specify which agent to start with using `docker agent run config.yaml -a agent_name`.
@z

@x
## Agent Properties
@y
## Agent Properties
@z

@x
| Property               | Type    | Required | Description                                                    |
| ---------------------- | ------- | -------- | -------------------------------------------------------------- |
| `model`                | string  | ✓        | Model reference (inline like `openai/gpt-5` or a named model) |
| `description`          | string  | ✓        | What the agent does — used by other agents for delegation      |
| `instruction`          | string  | ✓        | System prompt defining behavior                                |
| `toolsets`             | array   | ✗        | List of tool configurations                                    |
| `sub_agents`           | array   | ✗        | Names of agents this agent can delegate to                     |
| `fallback`             | object  | ✗        | Fallback model configuration for resilience                    |
| `add_date`             | boolean | ✗        | Include current date in context                                |
| `add_environment_info` | boolean | ✗        | Include OS, working directory, git info in context             |
| `max_iterations`       | int     | ✗        | Max tool-calling loops (default: unlimited)                    |
| `commands`             | object  | ✗        | Named prompts callable via `/command`                          |
| `skills`               | boolean \| list | ✗    | Enable skill discovery and loading. `true` = `["local"]`; list values may combine `"local"` with remote skill-server URLs. |
@y
| Property               | Type    | Required | Description                                                    |
| ---------------------- | ------- | -------- | -------------------------------------------------------------- |
| `model`                | string  | ✓        | Model reference (inline like `openai/gpt-5` or a named model) |
| `description`          | string  | ✓        | What the agent does — used by other agents for delegation      |
| `instruction`          | string  | ✓        | System prompt defining behavior                                |
| `toolsets`             | array   | ✗        | List of tool configurations                                    |
| `sub_agents`           | array   | ✗        | Names of agents this agent can delegate to                     |
| `fallback`             | object  | ✗        | Fallback model configuration for resilience                    |
| `add_date`             | boolean | ✗        | Include current date in context                                |
| `add_environment_info` | boolean | ✗        | Include OS, working directory, git info in context             |
| `max_iterations`       | int     | ✗        | Max tool-calling loops (default: unlimited)                    |
| `commands`             | object  | ✗        | Named prompts callable via `/command`                          |
| `skills`               | boolean \| list | ✗    | Enable skill discovery and loading. `true` = `["local"]`; list values may combine `"local"` with remote skill-server URLs. |
@z

@x
## Model Fallbacks
@y
## Model Fallbacks
@z

@x
Agents can automatically fail over to alternative models when the primary model is unavailable:
@y
Agents can automatically fail over to alternative models when the primary model is unavailable:
@z

@x
```yaml
agents:
  root:
    model: anthropic/claude-sonnet-4-5
    fallback:
      models:
        - openai/gpt-5
        - google/gemini-3.5-flash
      retries: 2 # retries per model for 5xx errors
      cooldown: 1m # stick with fallback after 429
```
@y
```yaml
agents:
  root:
    model: anthropic/claude-sonnet-4-5
    fallback:
      models:
        - openai/gpt-5
        - google/gemini-3.5-flash
      retries: 2 # retries per model for 5xx errors
      cooldown: 1m # stick with fallback after 429
```
@z

@x
## Named Commands
@y
## Named Commands
@z

@x
Define reusable prompts that can be invoked as commands:
@y
Define reusable prompts that can be invoked as commands:
@z

@x
```yaml
agents:
  root:
    model: openai/gpt-5
    instruction: You are a helpful assistant.
    commands:
      df: "Check how much free space I have on my disk"
      greet: "Say hello to ${env.USER}"
```
@y
```yaml
agents:
  root:
    model: openai/gpt-5
    instruction: You are a helpful assistant.
    commands:
      df: "Check how much free space I have on my disk"
      greet: "Say hello to ${env.USER}"
```
@z

@x
```bash
# Run a named command
$ docker agent run agent.yaml /df
$ docker agent run agent.yaml /greet
```
@y
```bash
# Run a named command
$ docker agent run agent.yaml /df
$ docker agent run agent.yaml /greet
```
@z

@x
Commands support environment variable interpolation using JavaScript template literal syntax. Undefined variables expand to empty strings.
@y
Commands support environment variable interpolation using JavaScript template literal syntax. Undefined variables expand to empty strings.
@z

@x
## Default Agent
@y
## Default Agent
@z

@x
Running `docker agent run` without a config argument uses `docker-agent.yaml`, `docker-agent.yml`, or `docker-agent.hcl` from the current directory when present. Otherwise, it uses a capable built-in default agent for quick tasks without needing any configuration.
@y
Running `docker agent run` without a config argument uses `docker-agent.yaml`, `docker-agent.yml`, or `docker-agent.hcl` from the current directory when present. Otherwise, it uses a capable built-in default agent for quick tasks without needing any configuration.
@z

@x
```bash
# Use the project config or built-in default agent
$ docker agent run
@y
```bash
# Use the project config or built-in default agent
$ docker agent run
@z

@x
# Override the default with an alias
$ docker agent alias add default /path/to/my-agent.yaml
$ docker agent run  # now runs your custom agent
```
@y
# Override the default with an alias
$ docker agent alias add default /path/to/my-agent.yaml
$ docker agent run  # now runs your custom agent
```
@z

@x
> [!TIP]
> **See also**
>
> For reusable task-specific instructions, see [Skills](../../features/skills/index.md). For multi-agent patterns, see [Multi-Agent](../multi-agent/index.md). For full config reference, see [Agent Config](../../configuration/agents/index.md).
@y
> [!TIP]
> **See also**
>
> For reusable task-specific instructions, see [Skills](../../features/skills/index.md). For multi-agent patterns, see [Multi-Agent](../multi-agent/index.md). For full config reference, see [Agent Config](../../configuration/agents/index.md).
@z
