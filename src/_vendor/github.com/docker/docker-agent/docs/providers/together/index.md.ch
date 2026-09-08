%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

% __SUBDIR__ 対応

@x
title: "Together AI"
description: "Use Together AI models with Docker Agent."
keywords: docker agent, ai agents, model providers, llm, together ai
@y
title: "Together AI"
description: "Use Together AI models with Docker Agent."
keywords: docker agent, ai agents, model providers, llm, together ai
@z

@x
canonical: https://docs.docker.com/ai/docker-agent/providers/together/
@y
canonical: __SUBDIR__/ai/docker-agent/providers/together/
@z

@x
_Use Together AI models with Docker Agent._
@y
_Use Together AI models with Docker Agent._
@z

@x
## Overview
@y
## Overview
@z

@x
[Together AI](https://www.together.ai/) is one of the largest hosts of open
models, serving Llama, Qwen, DeepSeek, Kimi, GLM and others through an
OpenAI-compatible API. Docker Agent includes built-in support for Together AI as
an alias provider.
@y
[Together AI](https://www.together.ai/) is one of the largest hosts of open
models, serving Llama, Qwen, DeepSeek, Kimi, GLM and others through an
OpenAI-compatible API. Docker Agent includes built-in support for Together AI as
an alias provider.
@z

@x
## Setup
@y
## Setup
@z

@x
1. Create an API key from the [Together AI settings](https://api.together.ai/settings/api-keys).
2. Set the environment variable:
@y
1. Create an API key from the [Together AI settings](https://api.together.ai/settings/api-keys).
2. Set the environment variable:
@z

@x
   ```bash
   export TOGETHER_API_KEY=your-api-key
   ```
@y
   ```bash
   export TOGETHER_API_KEY=your-api-key
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
The simplest way to use Together AI:
@y
The simplest way to use Together AI:
@z

@x
```yaml
agents:
  root:
    model: together/meta-llama/Llama-3.3-70B-Instruct-Turbo
    description: Assistant using Together AI
    instruction: You are a helpful assistant.
```
@y
```yaml
agents:
  root:
    model: together/meta-llama/Llama-3.3-70B-Instruct-Turbo
    description: Assistant using Together AI
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
  together_model:
    provider: together
    model: meta-llama/Llama-3.3-70B-Instruct-Turbo
    temperature: 0.7
    max_tokens: 8192
@y
```yaml
models:
  together_model:
    provider: together
    model: meta-llama/Llama-3.3-70B-Instruct-Turbo
    temperature: 0.7
    max_tokens: 8192
@z

@x
agents:
  root:
    model: together_model
    description: Assistant using Together AI
    instruction: You are a helpful assistant.
```
@y
agents:
  root:
    model: together_model
    description: Assistant using Together AI
    instruction: You are a helpful assistant.
```
@z

@x
## Available Models
@y
## Available Models
@z

@x
Together AI serves a broad, changing catalog of open-weight models. Check the
[Together AI model library](https://docs.together.ai/docs/serverless-models) for
current model IDs, context limits, and pricing.
@y
Together AI serves a broad, changing catalog of open-weight models. Check the
[Together AI model library](https://docs.together.ai/docs/serverless-models) for
current model IDs, context limits, and pricing.
@z

@x
| Model | Description |
| --- | --- |
| `meta-llama/Llama-3.3-70B-Instruct-Turbo` | Llama 3.3 70B, general-purpose chat and tool calling |
| `Qwen/Qwen3-235B-A22B-Instruct-2507-tput` | Qwen3 235B mixture-of-experts instruct model |
| `deepseek-ai/DeepSeek-V3` | DeepSeek-V3, strong coding and reasoning |
@y
| Model | Description |
| --- | --- |
| `meta-llama/Llama-3.3-70B-Instruct-Turbo` | Llama 3.3 70B, general-purpose chat and tool calling |
| `Qwen/Qwen3-235B-A22B-Instruct-2507-tput` | Qwen3 235B mixture-of-experts instruct model |
| `deepseek-ai/DeepSeek-V3` | DeepSeek-V3, strong coding and reasoning |
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
Together AI is implemented as a built-in alias in Docker Agent:
@y
Together AI is implemented as a built-in alias in Docker Agent:
@z

@x
- **API Type:** OpenAI-compatible (`openai_chatcompletions`)
- **Base URL:** `https://api.together.xyz/v1`
- **Token Variable:** `TOGETHER_API_KEY`
@y
- **API Type:** OpenAI-compatible (`openai_chatcompletions`)
- **Base URL:** `https://api.together.xyz/v1`
- **Token Variable:** `TOGETHER_API_KEY`
@z

@x
Because Together AI fronts open-weight models whose chat templates may reject
more than one leading system message, Docker Agent coalesces its per-source
system messages into a single one for this provider.
@y
Because Together AI fronts open-weight models whose chat templates may reject
more than one leading system message, Docker Agent coalesces its per-source
system messages into a single one for this provider.
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
    model: together/Qwen/Qwen3-235B-A22B-Instruct-2507-tput
    description: Code assistant using Qwen3 on Together AI
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
    model: together/Qwen/Qwen3-235B-A22B-Instruct-2507-tput
    description: Code assistant using Qwen3 on Together AI
    instruction: |
      You are an expert programmer.
      Write clean, well-documented code and follow language best practices.
    toolsets:
      - type: filesystem
      - type: shell
      - type: think
```
@z
