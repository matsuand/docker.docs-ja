%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

% __SUBDIR__ 対応

@x
title: "OpenRouter"
description: "Use OpenRouter models with Docker Agent."
keywords: docker agent, ai agents, model providers, llm, openrouter
@y
title: "OpenRouter"
description: "Use OpenRouter models with Docker Agent."
keywords: docker agent, ai agents, model providers, llm, openrouter
@z

@x
canonical: https://docs.docker.com/ai/docker-agent/providers/openrouter/
@y
canonical: __SUBDIR__/ai/docker-agent/providers/openrouter/
@z

@x
_Use OpenRouter models with Docker Agent._
@y
_Use OpenRouter models with Docker Agent._
@z

@x
## Overview
@y
## Overview
@z

@x
OpenRouter provides access to models from many providers through an OpenAI-compatible API. Docker Agent includes built-in support for OpenRouter as an alias provider.
@y
OpenRouter provides access to models from many providers through an OpenAI-compatible API. Docker Agent includes built-in support for OpenRouter as an alias provider.
@z

@x
## Setup
@y
## Setup
@z

@x
1. Get an API key from [OpenRouter](https://openrouter.ai/settings/keys)
2. Set the environment variable:
@y
1. Get an API key from [OpenRouter](https://openrouter.ai/settings/keys)
2. Set the environment variable:
@z

@x
   ```bash
   export OPENROUTER_API_KEY=your-api-key
   ```
@y
   ```bash
   export OPENROUTER_API_KEY=your-api-key
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
The simplest way to use OpenRouter:
@y
The simplest way to use OpenRouter:
@z

@x
```yaml
agents:
  root:
    model: openrouter/meta-llama/llama-3.3-70b-instruct
    description: Assistant using OpenRouter
    instruction: You are a helpful assistant.
```
@y
```yaml
agents:
  root:
    model: openrouter/meta-llama/llama-3.3-70b-instruct
    description: Assistant using OpenRouter
    instruction: You are a helpful assistant.
```
@z

@x
OpenRouter model IDs usually include the upstream provider name, such as `anthropic/claude-sonnet-4-5` or `meta-llama/llama-3.3-70b-instruct`. Docker Agent splits only the first slash, so the full upstream model ID is preserved.
@y
OpenRouter model IDs usually include the upstream provider name, such as `anthropic/claude-sonnet-4-5` or `meta-llama/llama-3.3-70b-instruct`. Docker Agent splits only the first slash, so the full upstream model ID is preserved.
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
  openrouter_llama:
    provider: openrouter
    model: meta-llama/llama-3.3-70b-instruct
    temperature: 0.7
    max_tokens: 8192
@y
```yaml
models:
  openrouter_llama:
    provider: openrouter
    model: meta-llama/llama-3.3-70b-instruct
    temperature: 0.7
    max_tokens: 8192
@z

@x
agents:
  root:
    model: openrouter_llama
    description: Assistant using OpenRouter
    instruction: You are a helpful assistant.
```
@y
agents:
  root:
    model: openrouter_llama
    description: Assistant using OpenRouter
    instruction: You are a helpful assistant.
```
@z

@x
## Pricing and Model Metadata
@y
## Pricing and Model Metadata
@z

@x
Docker Agent fetches OpenRouter model metadata from [models.dev](https://models.dev/), including pricing per 1M input/output tokens, cache pricing when available, context limits, output limits, and modalities. This powers cost tracking and the model picker in the same way as other first-class providers.
@y
Docker Agent fetches OpenRouter model metadata from [models.dev](https://models.dev/), including pricing per 1M input/output tokens, cache pricing when available, context limits, output limits, and modalities. This powers cost tracking and the model picker in the same way as other first-class providers.
@z

@x
If models.dev is unavailable, Docker Agent falls back to its embedded catalog snapshot.
@y
If models.dev is unavailable, Docker Agent falls back to its embedded catalog snapshot.
@z

@x
## How It Works
@y
## How It Works
@z

@x
OpenRouter is implemented as a built-in alias in Docker Agent:
@y
OpenRouter is implemented as a built-in alias in Docker Agent:
@z

@x
- **API Type:** OpenAI-compatible (`openai`)
- **Base URL:** `https://openrouter.ai/api/v1`
- **Token Variable:** `OPENROUTER_API_KEY`
@y
- **API Type:** OpenAI-compatible (`openai`)
- **Base URL:** `https://openrouter.ai/api/v1`
- **Token Variable:** `OPENROUTER_API_KEY`
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
    model: openrouter/meta-llama/llama-3.3-70b-instruct
    description: Code assistant using OpenRouter
    instruction: |
      You are an expert programmer.
      Write clean, maintainable code.
      Explain trade-offs when helpful.
    toolsets:
      - type: filesystem
      - type: shell
      - type: think
```
@y
```yaml
agents:
  coder:
    model: openrouter/meta-llama/llama-3.3-70b-instruct
    description: Code assistant using OpenRouter
    instruction: |
      You are an expert programmer.
      Write clean, maintainable code.
      Explain trade-offs when helpful.
    toolsets:
      - type: filesystem
      - type: shell
      - type: think
```
@z
