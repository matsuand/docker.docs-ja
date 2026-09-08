%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

% __SUBDIR__ 対応

@x
title: "Groq"
description: "Use Groq fast-inference models with Docker Agent."
keywords: docker agent, ai agents, model providers, llm, groq
@y
title: "Groq"
description: "Use Groq fast-inference models with Docker Agent."
keywords: docker agent, ai agents, model providers, llm, groq
@z

@x
canonical: https://docs.docker.com/ai/docker-agent/providers/groq/
@y
canonical: __SUBDIR__/ai/docker-agent/providers/groq/
@z

@x
_Use Groq models with Docker Agent._
@y
_Use Groq models with Docker Agent._
@z

@x
## Overview
@y
## Overview
@z

@x
[Groq](https://groq.com/) serves open-weight models on its LPU inference engine
through an OpenAI-compatible API, with a focus on very low latency. Docker Agent
includes built-in support for Groq as an alias provider.
@y
[Groq](https://groq.com/) serves open-weight models on its LPU inference engine
through an OpenAI-compatible API, with a focus on very low latency. Docker Agent
includes built-in support for Groq as an alias provider.
@z

@x
## Setup
@y
## Setup
@z

@x
1. Create an API key from the [Groq Console](https://console.groq.com/keys).
2. Set the environment variable:
@y
1. Create an API key from the [Groq Console](https://console.groq.com/keys).
2. Set the environment variable:
@z

@x
   ```bash
   export GROQ_API_KEY=your-api-key
   ```
@y
   ```bash
   export GROQ_API_KEY=your-api-key
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
The simplest way to use Groq:
@y
The simplest way to use Groq:
@z

@x
```yaml
agents:
  root:
    model: groq/llama-3.3-70b-versatile
    description: Assistant using Groq
    instruction: You are a helpful assistant.
```
@y
```yaml
agents:
  root:
    model: groq/llama-3.3-70b-versatile
    description: Assistant using Groq
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
  groq_model:
    provider: groq
    model: llama-3.3-70b-versatile
    temperature: 0.7
    max_tokens: 8192
@y
```yaml
models:
  groq_model:
    provider: groq
    model: llama-3.3-70b-versatile
    temperature: 0.7
    max_tokens: 8192
@z

@x
agents:
  root:
    model: groq_model
    description: Assistant using Groq
    instruction: You are a helpful assistant.
```
@y
agents:
  root:
    model: groq_model
    description: Assistant using Groq
    instruction: You are a helpful assistant.
```
@z

@x
## Available Models
@y
## Available Models
@z

@x
Groq hosts a rotating catalogue of open-weight models. Check the
[Groq models documentation](https://console.groq.com/docs/models) for current
model IDs, context limits, and rate limits.
@y
Groq hosts a rotating catalogue of open-weight models. Check the
[Groq models documentation](https://console.groq.com/docs/models) for current
model IDs, context limits, and rate limits.
@z

@x
| Model | Description |
| --- | --- |
| `llama-3.3-70b-versatile` | Llama 3.3 70B, reliable general-purpose chat and tool calling |
| `llama-3.1-8b-instant` | Llama 3.1 8B, fastest and cheapest |
| `openai/gpt-oss-120b` | GPT-OSS 120B, strong reasoning and tool calling |
| `openai/gpt-oss-20b` | GPT-OSS 20B, compact reasoning model |
| `qwen/qwen3-32b` | Qwen3 32B, reasoning and tool calling |
| `meta-llama/llama-4-scout-17b-16e-instruct` | Llama 4 Scout MoE |
@y
| Model | Description |
| --- | --- |
| `llama-3.3-70b-versatile` | Llama 3.3 70B, reliable general-purpose chat and tool calling |
| `llama-3.1-8b-instant` | Llama 3.1 8B, fastest and cheapest |
| `openai/gpt-oss-120b` | GPT-OSS 120B, strong reasoning and tool calling |
| `openai/gpt-oss-20b` | GPT-OSS 20B, compact reasoning model |
| `qwen/qwen3-32b` | Qwen3 32B, reasoning and tool calling |
| `meta-llama/llama-4-scout-17b-16e-instruct` | Llama 4 Scout MoE |
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
Groq is implemented as a built-in alias in Docker Agent:
@y
Groq is implemented as a built-in alias in Docker Agent:
@z

@x
- **API Type:** OpenAI-compatible (`openai_chatcompletions`)
- **Base URL:** `https://api.groq.com/openai/v1`
- **Token Variable:** `GROQ_API_KEY`
@y
- **API Type:** OpenAI-compatible (`openai_chatcompletions`)
- **Base URL:** `https://api.groq.com/openai/v1`
- **Token Variable:** `GROQ_API_KEY`
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
    model: groq/llama-3.3-70b-versatile
    description: Code assistant using Llama 3.3
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
    model: groq/llama-3.3-70b-versatile
    description: Code assistant using Llama 3.3
    instruction: |
      You are an expert programmer.
      Write clean, well-documented code and follow language best practices.
    toolsets:
      - type: filesystem
      - type: shell
      - type: think
```
@z
