%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

% __SUBDIR__ 対応

@x
title: "xAI (Grok)"
description: "Use xAI's Grok models with Docker Agent."
keywords: docker agent, ai agents, model providers, llm, xai (grok)
@y
title: "xAI (Grok)"
description: "Use xAI's Grok models with Docker Agent."
keywords: docker agent, ai agents, model providers, llm, xai (grok)
@z

@x
canonical: https://docs.docker.com/ai/docker-agent/providers/xai/
@y
canonical: __SUBDIR__/ai/docker-agent/providers/xai/
@z

@x
_Use xAI's Grok models with Docker Agent._
@y
_Use xAI's Grok models with Docker Agent._
@z

@x
## Overview
@y
## Overview
@z

@x
xAI provides the Grok family of models through an OpenAI-compatible API. Docker Agent includes built-in support for xAI as an alias provider.
@y
xAI provides the Grok family of models through an OpenAI-compatible API. Docker Agent includes built-in support for xAI as an alias provider.
@z

@x
## Setup
@y
## Setup
@z

@x
1. Get an API key from [xAI Console](https://console.x.ai/)
2. Set the environment variable:
@y
1. Get an API key from [xAI Console](https://console.x.ai/)
2. Set the environment variable:
@z

@x
   ```bash
   export XAI_API_KEY=your-api-key
   ```
@y
   ```bash
   export XAI_API_KEY=your-api-key
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
The simplest way to use xAI:
@y
The simplest way to use xAI:
@z

@x
```yaml
agents:
  root:
    model: xai/grok-3
    description: Assistant using Grok
    instruction: You are a helpful assistant.
```
@y
```yaml
agents:
  root:
    model: xai/grok-3
    description: Assistant using Grok
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
  grok:
    provider: xai
    model: grok-3
    temperature: 0.7
    max_tokens: 8192
@y
```yaml
models:
  grok:
    provider: xai
    model: grok-3
    temperature: 0.7
    max_tokens: 8192
@z

@x
agents:
  root:
    model: grok
    description: Assistant using Grok
    instruction: You are a helpful assistant.
```
@y
agents:
  root:
    model: grok
    description: Assistant using Grok
    instruction: You are a helpful assistant.
```
@z

@x
## Available Models
@y
## Available Models
@z

@x
| Model              | Description                        | Context |
| ------------------ | ---------------------------------- | ------- |
| `grok-3`           | Latest and most capable Grok model | 131K    |
| `grok-3-fast`      | Faster variant with lower latency  | 131K    |
| `grok-3-mini`      | Compact model for simpler tasks    | 131K    |
| `grok-3-mini-fast` | Fast variant of the mini model     | 131K    |
| `grok-2`           | Previous generation model          | 128K    |
| `grok-vision`      | Vision-capable model               | 32K     |
@y
| Model              | Description                        | Context |
| ------------------ | ---------------------------------- | ------- |
| `grok-3`           | Latest and most capable Grok model | 131K    |
| `grok-3-fast`      | Faster variant with lower latency  | 131K    |
| `grok-3-mini`      | Compact model for simpler tasks    | 131K    |
| `grok-3-mini-fast` | Fast variant of the mini model     | 131K    |
| `grok-2`           | Previous generation model          | 128K    |
| `grok-vision`      | Vision-capable model               | 32K     |
@z

@x
Check the [xAI documentation](https://docs.x.ai/docs) for the latest available models.
@y
Check the [xAI documentation](https://docs.x.ai/docs) for the latest available models.
@z

@x
## Extended Thinking
@y
## Extended Thinking
@z

@x
Docker Agent's `thinking_budget` field is **not applied** to xAI models: the underlying OpenAI-compatible client only sends `reasoning_effort` for OpenAI reasoning model names (o-series, gpt-5). Setting `thinking_budget` on a Grok model passes config validation but has no effect on the request.
@y
Docker Agent's `thinking_budget` field is **not applied** to xAI models: the underlying OpenAI-compatible client only sends `reasoning_effort` for OpenAI reasoning model names (o-series, gpt-5). Setting `thinking_budget` on a Grok model passes config validation but has no effect on the request.
@z

@x
Grok reasoning models (e.g. `grok-3-mini`) reason on their own without configuration. For non-reasoning models, use the [think tool](../../tools/think/index.md) instead.
@y
Grok reasoning models (e.g. `grok-3-mini`) reason on their own without configuration. For non-reasoning models, use the [think tool](../../tools/think/index.md) instead.
@z

@x
## How It Works
@y
## How It Works
@z

@x
xAI is implemented as a built-in alias in Docker Agent:
@y
xAI is implemented as a built-in alias in Docker Agent:
@z

@x
- **API Type:** OpenAI-compatible (`openai_chatcompletions`)
- **Base URL:** `https://api.x.ai/v1`
- **Token Variable:** `XAI_API_KEY`
@y
- **API Type:** OpenAI-compatible (`openai_chatcompletions`)
- **Base URL:** `https://api.x.ai/v1`
- **Token Variable:** `XAI_API_KEY`
@z

@x
## Example: Research Assistant
@y
## Example: Research Assistant
@z

@x
```yaml
agents:
  researcher:
    model: xai/grok-3
    description: Research assistant with real-time knowledge
    instruction: |
      You are a research assistant using Grok.
      Provide well-researched, factual responses.
      Cite sources when available.
    toolsets:
      - type: mcp
        ref: docker:duckduckgo
      - type: think
```
@y
```yaml
agents:
  researcher:
    model: xai/grok-3
    description: Research assistant with real-time knowledge
    instruction: |
      You are a research assistant using Grok.
      Provide well-researched, factual responses.
      Cite sources when available.
    toolsets:
      - type: mcp
        ref: docker:duckduckgo
      - type: think
```
@z
