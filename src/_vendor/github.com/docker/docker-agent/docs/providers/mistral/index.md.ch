%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

% __SUBDIR__ 対応

@x
title: "Mistral"
description: "Use Mistral AI models with Docker Agent."
keywords: docker agent, ai agents, model providers, llm, mistral
@y
title: "Mistral"
description: "Use Mistral AI models with Docker Agent."
keywords: docker agent, ai agents, model providers, llm, mistral
@z

@x
canonical: https://docs.docker.com/ai/docker-agent/providers/mistral/
@y
canonical: __SUBDIR__/ai/docker-agent/providers/mistral/
@z

@x
_Use Mistral AI models with Docker Agent._
@y
_Use Mistral AI models with Docker Agent._
@z

@x
## Overview
@y
## Overview
@z

@x
Mistral AI provides powerful language models through an OpenAI-compatible API. Docker Agent includes built-in support for Mistral as an alias provider.
@y
Mistral AI provides powerful language models through an OpenAI-compatible API. Docker Agent includes built-in support for Mistral as an alias provider.
@z

@x
## Setup
@y
## Setup
@z

@x
1. Get an API key from [Mistral Console](https://console.mistral.ai/)
2. Set the environment variable:
@y
1. Get an API key from [Mistral Console](https://console.mistral.ai/)
2. Set the environment variable:
@z

@x
   ```bash
   export MISTRAL_API_KEY=your-api-key
   ```
@y
   ```bash
   export MISTRAL_API_KEY=your-api-key
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
The simplest way to use Mistral:
@y
The simplest way to use Mistral:
@z

@x
```yaml
agents:
  root:
    model: mistral/mistral-large-latest
    description: Assistant using Mistral
    instruction: You are a helpful assistant.
```
@y
```yaml
agents:
  root:
    model: mistral/mistral-large-latest
    description: Assistant using Mistral
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
  mistral:
    provider: mistral
    model: mistral-large-latest
    temperature: 0.7
    max_tokens: 8192
@y
```yaml
models:
  mistral:
    provider: mistral
    model: mistral-large-latest
    temperature: 0.7
    max_tokens: 8192
@z

@x
agents:
  root:
    model: mistral
    description: Assistant using Mistral
    instruction: You are a helpful assistant.
```
@y
agents:
  root:
    model: mistral
    description: Assistant using Mistral
    instruction: You are a helpful assistant.
```
@z

@x
## Available Models
@y
## Available Models
@z

@x
| Model                   | Description                       | Context |
| ----------------------- | --------------------------------- | ------- |
| `mistral-large-latest`  | Most capable Mistral model        | 128K    |
| `mistral-medium-latest` | Balanced performance and cost     | 128K    |
| `mistral-small-latest`  | Fast and cost-effective (default) | 128K    |
| `codestral-latest`      | Optimized for code generation     | 32K     |
| `open-mistral-nemo`     | Open-weight model                 | 128K    |
| `ministral-8b-latest`   | Compact 8B parameter model        | 128K    |
| `ministral-3b-latest`   | Smallest Mistral model            | 128K    |
@y
| Model                   | Description                       | Context |
| ----------------------- | --------------------------------- | ------- |
| `mistral-large-latest`  | Most capable Mistral model        | 128K    |
| `mistral-medium-latest` | Balanced performance and cost     | 128K    |
| `mistral-small-latest`  | Fast and cost-effective (default) | 128K    |
| `codestral-latest`      | Optimized for code generation     | 32K     |
| `open-mistral-nemo`     | Open-weight model                 | 128K    |
| `ministral-8b-latest`   | Compact 8B parameter model        | 128K    |
| `ministral-3b-latest`   | Smallest Mistral model            | 128K    |
@z

@x
Check the [Mistral Models documentation](https://docs.mistral.ai/getting-started/models/) for the latest available models.
@y
Check the [Mistral Models documentation](https://docs.mistral.ai/getting-started/models/) for the latest available models.
@z

@x
## Auto-Detection
@y
## Auto-Detection
@z

@x
When you run `docker agent run` without specifying a config and no project-level `docker-agent.yaml`, `docker-agent.yml`, or `docker-agent.hcl` exists, Docker Agent automatically detects available providers. If `MISTRAL_API_KEY` is set and higher-priority providers (OpenAI, Anthropic, Google) are not available, Mistral will be used with `mistral-small-latest` as the default model.
@y
When you run `docker agent run` without specifying a config and no project-level `docker-agent.yaml`, `docker-agent.yml`, or `docker-agent.hcl` exists, Docker Agent automatically detects available providers. If `MISTRAL_API_KEY` is set and higher-priority providers (OpenAI, Anthropic, Google) are not available, Mistral will be used with `mistral-small-latest` as the default model.
@z

@x
## Extended Thinking
@y
## Extended Thinking
@z

@x
Docker Agent's `thinking_budget` field is **not applied** to Mistral models: the underlying OpenAI-compatible client only sends `reasoning_effort` for OpenAI reasoning model names (o-series, gpt-5). Setting `thinking_budget` on a Mistral model passes config validation but has no effect on the request.
@y
Docker Agent's `thinking_budget` field is **not applied** to Mistral models: the underlying OpenAI-compatible client only sends `reasoning_effort` for OpenAI reasoning model names (o-series, gpt-5). Setting `thinking_budget` on a Mistral model passes config validation but has no effect on the request.
@z

@x
Mistral reasoning models (e.g. `magistral`) reason on their own without configuration. For non-reasoning models, use the [think tool](../../tools/think/index.md) instead.
@y
Mistral reasoning models (e.g. `magistral`) reason on their own without configuration. For non-reasoning models, use the [think tool](../../tools/think/index.md) instead.
@z

@x
## How It Works
@y
## How It Works
@z

@x
Mistral is implemented as a built-in alias in Docker Agent:
@y
Mistral is implemented as a built-in alias in Docker Agent:
@z

@x
- **API Type:** OpenAI-compatible (`openai_chatcompletions`)
- **Base URL:** `https://api.mistral.ai/v1`
- **Token Variable:** `MISTRAL_API_KEY`
@y
- **API Type:** OpenAI-compatible (`openai_chatcompletions`)
- **Base URL:** `https://api.mistral.ai/v1`
- **Token Variable:** `MISTRAL_API_KEY`
@z

@x
This means Mistral uses the same client as OpenAI, making it fully compatible with all OpenAI features supported by Docker Agent.
@y
This means Mistral uses the same client as OpenAI, making it fully compatible with all OpenAI features supported by Docker Agent.
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
    model: mistral/codestral-latest
    description: Expert code assistant
    instruction: |
      You are an expert programmer using Codestral.
      Write clean, efficient, well-documented code.
      Explain your reasoning when helpful.
    toolsets:
      - type: filesystem
      - type: shell
      - type: think
```
@y
```yaml
agents:
  coder:
    model: mistral/codestral-latest
    description: Expert code assistant
    instruction: |
      You are an expert programmer using Codestral.
      Write clean, efficient, well-documented code.
      Explain your reasoning when helpful.
    toolsets:
      - type: filesystem
      - type: shell
      - type: think
```
@z
