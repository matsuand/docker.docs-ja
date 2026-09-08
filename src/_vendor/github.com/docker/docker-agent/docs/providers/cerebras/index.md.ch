%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

% __SUBDIR__ 対応

@x
title: "Cerebras"
description: "Use Cerebras models with Docker Agent."
keywords: docker agent, ai agents, model providers, llm, cerebras
@y
title: "Cerebras"
description: "Use Cerebras models with Docker Agent."
keywords: docker agent, ai agents, model providers, llm, cerebras
@z

@x
canonical: https://docs.docker.com/ai/docker-agent/providers/cerebras/
@y
canonical: __SUBDIR__/ai/docker-agent/providers/cerebras/
@z

@x
_Use Cerebras models with Docker Agent._
@y
_Use Cerebras models with Docker Agent._
@z

@x
## Overview
@y
## Overview
@z

@x
[Cerebras](https://www.cerebras.ai/) serves open-weight models such as GPT-OSS
and GLM through an OpenAI-compatible API on its wafer-scale hardware, delivering
some of the highest tokens/sec available. That speed makes it a strong fit for
latency-sensitive coding workflows. Docker Agent includes built-in support for
Cerebras as an alias provider.
@y
[Cerebras](https://www.cerebras.ai/) serves open-weight models such as GPT-OSS
and GLM through an OpenAI-compatible API on its wafer-scale hardware, delivering
some of the highest tokens/sec available. That speed makes it a strong fit for
latency-sensitive coding workflows. Docker Agent includes built-in support for
Cerebras as an alias provider.
@z

@x
## Setup
@y
## Setup
@z

@x
1. Create an API key from the [Cerebras Cloud console](https://cloud.cerebras.ai/).
2. Set the environment variable:
@y
1. Create an API key from the [Cerebras Cloud console](https://cloud.cerebras.ai/).
2. Set the environment variable:
@z

@x
   ```bash
   export CEREBRAS_API_KEY=your-api-key
   ```
@y
   ```bash
   export CEREBRAS_API_KEY=your-api-key
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
The simplest way to use Cerebras:
@y
The simplest way to use Cerebras:
@z

@x
```yaml
agents:
  root:
    model: cerebras/gpt-oss-120b
    description: Assistant using Cerebras
    instruction: You are a helpful assistant.
```
@y
```yaml
agents:
  root:
    model: cerebras/gpt-oss-120b
    description: Assistant using Cerebras
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
  cerebras_model:
    provider: cerebras
    model: gpt-oss-120b
    temperature: 0.7
    max_tokens: 8192
@y
```yaml
models:
  cerebras_model:
    provider: cerebras
    model: gpt-oss-120b
    temperature: 0.7
    max_tokens: 8192
@z

@x
agents:
  root:
    model: cerebras_model
    description: Assistant using Cerebras
    instruction: You are a helpful assistant.
```
@y
agents:
  root:
    model: cerebras_model
    description: Assistant using Cerebras
    instruction: You are a helpful assistant.
```
@z

@x
## Available Models
@y
## Available Models
@z

@x
Cerebras hosts a curated set of open-weight models. Check the
[Cerebras models documentation](https://inference-docs.cerebras.ai/models/overview)
for current model IDs, context limits, and pricing.
@y
Cerebras hosts a curated set of open-weight models. Check the
[Cerebras models documentation](https://inference-docs.cerebras.ai/models/overview)
for current model IDs, context limits, and pricing.
@z

@x
| Model | Description |
| --- | --- |
| `gpt-oss-120b` | Open-weight GPT-OSS reasoning model with tool calling |
| `zai-glm-4.7` | Z.AI GLM-4.7 reasoning model with tool calling |
@y
| Model | Description |
| --- | --- |
| `gpt-oss-120b` | Open-weight GPT-OSS reasoning model with tool calling |
| `zai-glm-4.7` | Z.AI GLM-4.7 reasoning model with tool calling |
@z

@x
> Model IDs are case-sensitive and must be passed exactly as the catalogue lists
> them. Cerebras may serve additional models not in the built-in catalog; those
> still work but resolve to default capability metadata locally.
@y
> Model IDs are case-sensitive and must be passed exactly as the catalogue lists
> them. Cerebras may serve additional models not in the built-in catalog; those
> still work but resolve to default capability metadata locally.
@z

@x
## How It Works
@y
## How It Works
@z

@x
Cerebras is implemented as a built-in alias in Docker Agent:
@y
Cerebras is implemented as a built-in alias in Docker Agent:
@z

@x
- **API Type:** OpenAI-compatible (`openai_chatcompletions`)
- **Base URL:** `https://api.cerebras.ai/v1`
- **Token Variable:** `CEREBRAS_API_KEY`
@y
- **API Type:** OpenAI-compatible (`openai_chatcompletions`)
- **Base URL:** `https://api.cerebras.ai/v1`
- **Token Variable:** `CEREBRAS_API_KEY`
@z

@x
Because Cerebras fronts open-weight models whose chat templates may only accept
a single leading system message, Docker Agent coalesces its per-source system
messages (agent instruction plus each toolset's instructions) into one before
sending the request.
@y
Because Cerebras fronts open-weight models whose chat templates may only accept
a single leading system message, Docker Agent coalesces its per-source system
messages (agent instruction plus each toolset's instructions) into one before
sending the request.
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
    model: cerebras/gpt-oss-120b
    description: Fast code assistant using Cerebras
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
    model: cerebras/gpt-oss-120b
    description: Fast code assistant using Cerebras
    instruction: |
      You are an expert programmer.
      Write clean, well-documented code and follow language best practices.
    toolsets:
      - type: filesystem
      - type: shell
      - type: think
```
@z
