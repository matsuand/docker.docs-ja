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
models, serving Kimi K2, Llama, Qwen, DeepSeek, GLM and others through an
OpenAI-compatible API. Docker Agent includes built-in support for Fireworks AI
as an alias provider.
@y
[Fireworks AI](https://fireworks.ai/) is a fast inference host for open-weight
models, serving Kimi K2, Llama, Qwen, DeepSeek, GLM and others through an
OpenAI-compatible API. Docker Agent includes built-in support for Fireworks AI
as an alias provider.
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
    model: fireworks/accounts/fireworks/models/kimi-k2-instruct
    description: Assistant using Fireworks AI
    instruction: You are a helpful assistant.
```
@y
```yaml
agents:
  root:
    model: fireworks/accounts/fireworks/models/kimi-k2-instruct
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
    provider: fireworks
    model: accounts/fireworks/models/kimi-k2-instruct
    temperature: 0.7
    max_tokens: 8192
@y
```yaml
models:
  fireworks_model:
    provider: fireworks
    model: accounts/fireworks/models/kimi-k2-instruct
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
| `accounts/fireworks/models/kimi-k2-instruct` | Kimi K2, large open MoE chat and tool-calling model |
| `accounts/fireworks/models/llama-v3p3-70b-instruct` | Llama 3.3 70B instruct |
| `accounts/fireworks/models/qwen3-235b-a22b` | Qwen 3 235B MoE |
@y
| Model | Description |
| --- | --- |
| `accounts/fireworks/models/kimi-k2-instruct` | Kimi K2, large open MoE chat and tool-calling model |
| `accounts/fireworks/models/llama-v3p3-70b-instruct` | Llama 3.3 70B instruct |
| `accounts/fireworks/models/qwen3-235b-a22b` | Qwen 3 235B MoE |
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
    model: fireworks/accounts/fireworks/models/kimi-k2-instruct
    description: Code assistant using Kimi K2 on Fireworks AI
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
    model: fireworks/accounts/fireworks/models/kimi-k2-instruct
    description: Code assistant using Kimi K2 on Fireworks AI
    instruction: |
      You are an expert programmer.
      Write clean, well-documented code and follow language best practices.
    toolsets:
      - type: filesystem
      - type: shell
      - type: think
```
@z
