%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

% __SUBDIR__ 対応

@x
title: "Moonshot AI"
description: "Use Moonshot AI (Kimi) models with Docker Agent."
keywords: docker agent, ai agents, model providers, llm, moonshot ai
@y
title: "Moonshot AI"
description: "Use Moonshot AI (Kimi) models with Docker Agent."
keywords: docker agent, ai agents, model providers, llm, moonshot ai
@z

@x
canonical: https://docs.docker.com/ai/docker-agent/providers/moonshot/
@y
canonical: __SUBDIR__/ai/docker-agent/providers/moonshot/
@z

@x
_Use Moonshot AI (Kimi) models with Docker Agent._
@y
_Use Moonshot AI (Kimi) models with Docker Agent._
@z

@x
## Overview
@y
## Overview
@z

@x
[Moonshot AI](https://www.moonshot.ai/) serves its Kimi model family through an
OpenAI-compatible API. The Kimi K2 models have strong momentum for coding and
agentic tasks. Docker Agent includes built-in support for Moonshot AI as an
alias provider.
@y
[Moonshot AI](https://www.moonshot.ai/) serves its Kimi model family through an
OpenAI-compatible API. The Kimi K2 models have strong momentum for coding and
agentic tasks. Docker Agent includes built-in support for Moonshot AI as an
alias provider.
@z

@x
## Setup
@y
## Setup
@z

@x
1. Create an API key from the [Moonshot AI console](https://platform.moonshot.ai/console/api-keys).
2. Set the environment variable:
@y
1. Create an API key from the [Moonshot AI console](https://platform.moonshot.ai/console/api-keys).
2. Set the environment variable:
@z

@x
   ```bash
   export MOONSHOT_API_KEY=your-api-key
   ```
@y
   ```bash
   export MOONSHOT_API_KEY=your-api-key
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
The simplest way to use Moonshot AI:
@y
The simplest way to use Moonshot AI:
@z

@x
```yaml
agents:
  root:
    model: moonshot/kimi-k2-0905-preview
    description: Assistant using Moonshot AI
    instruction: You are a helpful assistant.
```
@y
```yaml
agents:
  root:
    model: moonshot/kimi-k2-0905-preview
    description: Assistant using Moonshot AI
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
  moonshot_model:
    provider: moonshot
    model: kimi-k2-0905-preview
    temperature: 0.7
    max_tokens: 8192
@y
```yaml
models:
  moonshot_model:
    provider: moonshot
    model: kimi-k2-0905-preview
    temperature: 0.7
    max_tokens: 8192
@z

@x
agents:
  root:
    model: moonshot_model
    description: Assistant using Moonshot AI
    instruction: You are a helpful assistant.
```
@y
agents:
  root:
    model: moonshot_model
    description: Assistant using Moonshot AI
    instruction: You are a helpful assistant.
```
@z

@x
## Available Models
@y
## Available Models
@z

@x
Moonshot AI exposes a vendor-controlled Kimi model lineup. Check the
[Moonshot API documentation](https://platform.moonshot.ai/docs/api) for current
model IDs, context limits, and pricing.
@y
Moonshot AI exposes a vendor-controlled Kimi model lineup. Check the
[Moonshot API documentation](https://platform.moonshot.ai/docs/api) for current
model IDs, context limits, and pricing.
@z

@x
| Model | Description |
| --- | --- |
| `kimi-k2-0905-preview` | Kimi K2, general-purpose chat, coding, and tool calling |
| `kimi-k2-turbo-preview` | Kimi K2 optimized for higher throughput |
| `kimi-k2-thinking` | Kimi K2 extended-reasoning model |
@y
| Model | Description |
| --- | --- |
| `kimi-k2-0905-preview` | Kimi K2, general-purpose chat, coding, and tool calling |
| `kimi-k2-turbo-preview` | Kimi K2 optimized for higher throughput |
| `kimi-k2-thinking` | Kimi K2 extended-reasoning model |
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
Moonshot AI is implemented as a built-in alias in Docker Agent:
@y
Moonshot AI is implemented as a built-in alias in Docker Agent:
@z

@x
- **API Type:** OpenAI-compatible (`openai_chatcompletions`)
- **Base URL:** `https://api.moonshot.ai/v1`
- **Token Variable:** `MOONSHOT_API_KEY`
@y
- **API Type:** OpenAI-compatible (`openai_chatcompletions`)
- **Base URL:** `https://api.moonshot.ai/v1`
- **Token Variable:** `MOONSHOT_API_KEY`
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
    model: moonshot/kimi-k2-0905-preview
    description: Code assistant using Kimi K2
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
    model: moonshot/kimi-k2-0905-preview
    description: Code assistant using Kimi K2
    instruction: |
      You are an expert programmer.
      Write clean, well-documented code and follow language best practices.
    toolsets:
      - type: filesystem
      - type: shell
      - type: think
```
@z
