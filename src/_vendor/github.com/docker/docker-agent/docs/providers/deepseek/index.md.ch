%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

% __SUBDIR__ 対応

@x
title: "DeepSeek"
description: "Use DeepSeek models with Docker Agent."
keywords: docker agent, ai agents, model providers, llm, deepseek
@y
title: "DeepSeek"
description: "Use DeepSeek models with Docker Agent."
keywords: docker agent, ai agents, model providers, llm, deepseek
@z

@x
canonical: https://docs.docker.com/ai/docker-agent/providers/deepseek/
@y
canonical: __SUBDIR__/ai/docker-agent/providers/deepseek/
@z

@x
_Use DeepSeek models with Docker Agent._
@y
_Use DeepSeek models with Docker Agent._
@z

@x
## Overview
@y
## Overview
@z

@x
[DeepSeek](https://www.deepseek.com/) serves its frontier chat and reasoning
models through an OpenAI-compatible API, with strong price/performance on coding
and reasoning tasks. Docker Agent includes built-in support for DeepSeek as an
alias provider.
@y
[DeepSeek](https://www.deepseek.com/) serves its frontier chat and reasoning
models through an OpenAI-compatible API, with strong price/performance on coding
and reasoning tasks. Docker Agent includes built-in support for DeepSeek as an
alias provider.
@z

@x
## Setup
@y
## Setup
@z

@x
1. Create an API key from the [DeepSeek Platform](https://platform.deepseek.com/api_keys).
2. Set the environment variable:
@y
1. Create an API key from the [DeepSeek Platform](https://platform.deepseek.com/api_keys).
2. Set the environment variable:
@z

@x
   ```bash
   export DEEPSEEK_API_KEY=your-api-key
   ```
@y
   ```bash
   export DEEPSEEK_API_KEY=your-api-key
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
The simplest way to use DeepSeek:
@y
The simplest way to use DeepSeek:
@z

@x
```yaml
agents:
  root:
    model: deepseek/deepseek-chat
    description: Assistant using DeepSeek
    instruction: You are a helpful assistant.
```
@y
```yaml
agents:
  root:
    model: deepseek/deepseek-chat
    description: Assistant using DeepSeek
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
  deepseek_model:
    provider: deepseek
    model: deepseek-chat
    temperature: 0.7
    max_tokens: 8192
@y
```yaml
models:
  deepseek_model:
    provider: deepseek
    model: deepseek-chat
    temperature: 0.7
    max_tokens: 8192
@z

@x
agents:
  root:
    model: deepseek_model
    description: Assistant using DeepSeek
    instruction: You are a helpful assistant.
```
@y
agents:
  root:
    model: deepseek_model
    description: Assistant using DeepSeek
    instruction: You are a helpful assistant.
```
@z

@x
## Available Models
@y
## Available Models
@z

@x
DeepSeek exposes a small, vendor-controlled model lineup. Check the
[DeepSeek models documentation](https://api-docs.deepseek.com/quick_start/pricing)
for current model IDs, context limits, and pricing.
@y
DeepSeek exposes a small, vendor-controlled model lineup. Check the
[DeepSeek models documentation](https://api-docs.deepseek.com/quick_start/pricing)
for current model IDs, context limits, and pricing.
@z

@x
| Model | Description |
| --- | --- |
| `deepseek-chat` | DeepSeek-V3, general-purpose chat and tool calling |
| `deepseek-reasoner` | DeepSeek-R1, extended-reasoning model |
@y
| Model | Description |
| --- | --- |
| `deepseek-chat` | DeepSeek-V3, general-purpose chat and tool calling |
| `deepseek-reasoner` | DeepSeek-R1, extended-reasoning model |
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
DeepSeek is implemented as a built-in alias in Docker Agent:
@y
DeepSeek is implemented as a built-in alias in Docker Agent:
@z

@x
- **API Type:** OpenAI-compatible (`openai_chatcompletions`)
- **Base URL:** `https://api.deepseek.com/v1`
- **Token Variable:** `DEEPSEEK_API_KEY`
@y
- **API Type:** OpenAI-compatible (`openai_chatcompletions`)
- **Base URL:** `https://api.deepseek.com/v1`
- **Token Variable:** `DEEPSEEK_API_KEY`
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
    model: deepseek/deepseek-chat
    description: Code assistant using DeepSeek-V3
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
    model: deepseek/deepseek-chat
    description: Code assistant using DeepSeek-V3
    instruction: |
      You are an expert programmer.
      Write clean, well-documented code and follow language best practices.
    toolsets:
      - type: filesystem
      - type: shell
      - type: think
```
@z
