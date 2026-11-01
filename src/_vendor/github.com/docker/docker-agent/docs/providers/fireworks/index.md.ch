%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

% __SUBDIR__ 対応

@x
title: "Fireworks AI"
description: "Use Fireworks AI models with Docker Agent."
keywords: docker agent, ai agents, model providers, llm, fireworks ai
@y
title: "Fireworks AI"
description: "Use Fireworks AI models with Docker Agent."
keywords: docker agent, ai agents, model providers, llm, fireworks ai
@z

@x
canonical: https://docs.docker.com/ai/docker-agent/providers/fireworks/
@y
canonical: __SUBDIR__/ai/docker-agent/providers/fireworks/
@z

@x
_Use Fireworks AI models with Docker Agent._
@y
_Use Fireworks AI models with Docker Agent._
@z

@x
## Overview
@y
## Overview
@z

@x
[Fireworks AI](https://fireworks.ai/) is a fast inference host for open-weight
models, serving Kimi, Qwen, DeepSeek, GLM and others through an
OpenAI-compatible API. Docker Agent includes built-in support for Fireworks AI
as an alias provider.
@y
[Fireworks AI](https://fireworks.ai/) is a fast inference host for open-weight
models, serving Kimi, Qwen, DeepSeek, GLM and others through an
OpenAI-compatible API. Docker Agent includes built-in support for Fireworks AI
as an alias provider.
@z

@x
Use the provider ID `fireworks-ai`. The legacy ID `fireworks` is also accepted.
@y
Use the provider ID `fireworks-ai`. The legacy ID `fireworks` is also accepted.
@z

@x
## Setup
@y
## Setup
@z

@x
1. Create an API key from the [Fireworks dashboard](https://fireworks.ai/account/api-keys).
2. Set the environment variable:
@y
1. Create an API key from the [Fireworks dashboard](https://fireworks.ai/account/api-keys).
2. Set the environment variable:
@z

@x
   ```bash
   export FIREWORKS_API_KEY=your-api-key
   ```
@y
   ```bash
   export FIREWORKS_API_KEY=your-api-key
   ```
@z

@x
## Usage
@y
## Usage
@z

@x
### Inline Syntax
@y
### Inline Syntax
@z

@x
The simplest way to use Fireworks AI:
@y
The simplest way to use Fireworks AI:
@z

@x
```yaml
agents:
  root:
    model: fireworks-ai/accounts/fireworks/models/kimi-k3
    description: Assistant using Fireworks AI
    instruction: You are a helpful assistant.
```
@y
```yaml
agents:
  root:
    model: fireworks-ai/accounts/fireworks/models/kimi-k3
    description: Assistant using Fireworks AI
    instruction: You are a helpful assistant.
```
@z

@x
### Named Model
@y
### Named Model
@z

@x
For more control over parameters:
@y
For more control over parameters:
@z

@x
```yaml
models:
  fireworks_model:
    provider: fireworks-ai
    model: accounts/fireworks/models/kimi-k3
    temperature: 0.7
    max_tokens: 8192
@y
```yaml
models:
  fireworks_model:
    provider: fireworks-ai
    model: accounts/fireworks/models/kimi-k3
    temperature: 0.7
    max_tokens: 8192
@z

@x
agents:
  root:
    model: fireworks_model
    description: Assistant using Fireworks AI
    instruction: You are a helpful assistant.
```
@y
agents:
  root:
    model: fireworks_model
    description: Assistant using Fireworks AI
    instruction: You are a helpful assistant.
```
@z

@x
## Available Models
@y
## Available Models
@z

@x
Fireworks serves a broad, changing catalog of open-weight models. Model IDs use
the `accounts/fireworks/models/<name>` form. Check the
[Fireworks model library](https://fireworks.ai/models) for current IDs, context
limits, and pricing.
@y
Fireworks serves a broad, changing catalog of open-weight models. Model IDs use
the `accounts/fireworks/models/<name>` form. Check the
[Fireworks model library](https://fireworks.ai/models) for current IDs, context
limits, and pricing.
@z

@x
| Model | Description |
| --- | --- |
| `accounts/fireworks/models/kimi-k3` | Kimi K3, large open MoE chat and tool-calling model |
| `accounts/fireworks/models/kimi-k2p7-code` | Kimi K2.7 Code, coding-focused variant |
| `accounts/fireworks/models/glm-5p3` | GLM 5.3 |
| `accounts/fireworks/models/qwen3p8-max` | Qwen 3.8 Max |
| `accounts/fireworks/models/deepseek-v4-pro-0813` | DeepSeek V4 Pro |
| `accounts/fireworks/models/gpt-oss-120b` | GPT OSS 120B |
@y
| Model | Description |
| --- | --- |
| `accounts/fireworks/models/kimi-k3` | Kimi K3, large open MoE chat and tool-calling model |
| `accounts/fireworks/models/kimi-k2p7-code` | Kimi K2.7 Code, coding-focused variant |
| `accounts/fireworks/models/glm-5p3` | GLM 5.3 |
| `accounts/fireworks/models/qwen3p8-max` | Qwen 3.8 Max |
| `accounts/fireworks/models/deepseek-v4-pro-0813` | DeepSeek V4 Pro |
| `accounts/fireworks/models/gpt-oss-120b` | GPT OSS 120B |
@z

@x
> Model IDs are case-sensitive and must be passed exactly as the catalogue lists
> them.
@y
> Model IDs are case-sensitive and must be passed exactly as the catalogue lists
> them.
@z

@x
## How It Works
@y
## How It Works
@z

@x
Fireworks AI is implemented as a built-in alias in Docker Agent:
@y
Fireworks AI is implemented as a built-in alias in Docker Agent:
@z

@x
- **API Type:** OpenAI-compatible (`openai_chatcompletions`)
- **Base URL:** `https://api.fireworks.ai/inference/v1`
- **Token Variable:** `FIREWORKS_API_KEY`
@y
- **API Type:** OpenAI-compatible (`openai_chatcompletions`)
- **Base URL:** `https://api.fireworks.ai/inference/v1`
- **Token Variable:** `FIREWORKS_API_KEY`
@z

@x
Because Fireworks fronts open-weight models whose chat templates may reject more
than one leading system message, Docker Agent coalesces its per-source system
messages into a single one for this provider.
@y
Because Fireworks fronts open-weight models whose chat templates may reject more
than one leading system message, Docker Agent coalesces its per-source system
messages into a single one for this provider.
@z

@x
## Example: Code Assistant
@y
## Example: Code Assistant
@z

@x
```yaml
agents:
  coder:
    model: fireworks-ai/accounts/fireworks/models/kimi-k2p7-code
    description: Code assistant using Kimi K2.7 Code on Fireworks AI
    instruction: |
      You are an expert programmer.
      Write clean, well-documented code and follow language best practices.
    toolsets:
      - type: filesystem
      - type: shell
      - type: think
```
@y
```yaml
agents:
  coder:
    model: fireworks-ai/accounts/fireworks/models/kimi-k2p7-code
    description: Code assistant using Kimi K2.7 Code on Fireworks AI
    instruction: |
      You are an expert programmer.
      Write clean, well-documented code and follow language best practices.
    toolsets:
      - type: filesystem
      - type: shell
      - type: think
```
@z
