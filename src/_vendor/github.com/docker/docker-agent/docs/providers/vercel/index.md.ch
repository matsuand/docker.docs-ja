%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

% __SUBDIR__ 対応

@x
title: "Vercel AI Gateway"
description: "Use Vercel AI Gateway models with Docker Agent."
keywords: docker agent, ai agents, model providers, llm, vercel ai gateway
@y
title: "Vercel AI Gateway"
description: "Use Vercel AI Gateway models with Docker Agent."
keywords: docker agent, ai agents, model providers, llm, vercel ai gateway
@z

@x
canonical: https://docs.docker.com/ai/docker-agent/providers/vercel/
@y
canonical: __SUBDIR__/ai/docker-agent/providers/vercel/
@z

@x
_Use Vercel AI Gateway models with Docker Agent._
@y
_Use Vercel AI Gateway models with Docker Agent._
@z

@x
## Overview
@y
## Overview
@z

@x
[Vercel AI Gateway](https://vercel.com/docs/ai-gateway) is a single, unified
OpenAI-compatible endpoint that routes to models from OpenAI, Anthropic, Google,
xAI and more at list price with no markup, plus provider routing and failover.
It lets you reach many providers with one API key. Docker Agent includes
built-in support for Vercel AI Gateway as an alias provider.
@y
[Vercel AI Gateway](https://vercel.com/docs/ai-gateway) is a single, unified
OpenAI-compatible endpoint that routes to models from OpenAI, Anthropic, Google,
xAI and more at list price with no markup, plus provider routing and failover.
It lets you reach many providers with one API key. Docker Agent includes
built-in support for Vercel AI Gateway as an alias provider.
@z

@x
## Setup
@y
## Setup
@z

@x
1. Create an API key from the [Vercel AI Gateway dashboard](https://vercel.com/docs/ai-gateway).
2. Set the environment variable:
@y
1. Create an API key from the [Vercel AI Gateway dashboard](https://vercel.com/docs/ai-gateway).
2. Set the environment variable:
@z

@x
   ```bash
   export AI_GATEWAY_API_KEY=your-api-key
   ```
@y
   ```bash
   export AI_GATEWAY_API_KEY=your-api-key
   ```
@z

@x
## Usage
@y
## Usage
@z

@x
Vercel AI Gateway model IDs use a `creator/model` form (for example
`openai/gpt-5.6-sol` or `anthropic/claude-sonnet-4.5`); the gateway routes each
request to the underlying provider. The gateway lists explicit variant slugs
only (`openai/gpt-5.6-sol`, `-terra`, `-luna`) — there is no unsuffixed
`openai/gpt-5.6` alias on the gateway.
@y
Vercel AI Gateway model IDs use a `creator/model` form (for example
`openai/gpt-5.6-sol` or `anthropic/claude-sonnet-4.5`); the gateway routes each
request to the underlying provider. The gateway lists explicit variant slugs
only (`openai/gpt-5.6-sol`, `-terra`, `-luna`) — there is no unsuffixed
`openai/gpt-5.6` alias on the gateway.
@z

@x
### Inline Syntax
@y
### Inline Syntax
@z

@x
The simplest way to use Vercel AI Gateway:
@y
The simplest way to use Vercel AI Gateway:
@z

@x
```yaml
agents:
  root:
    model: vercel/openai/gpt-5.6-sol
    description: Assistant using Vercel AI Gateway
    instruction: You are a helpful assistant.
```
@y
```yaml
agents:
  root:
    model: vercel/openai/gpt-5.6-sol
    description: Assistant using Vercel AI Gateway
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
  vercel_model:
    provider: vercel
    model: openai/gpt-5.6-sol
    max_tokens: 8192
@y
```yaml
models:
  vercel_model:
    provider: vercel
    model: openai/gpt-5.6-sol
    max_tokens: 8192
@z

@x
agents:
  root:
    model: vercel_model
    description: Assistant using Vercel AI Gateway
    instruction: You are a helpful assistant.
```
@y
agents:
  root:
    model: vercel_model
    description: Assistant using Vercel AI Gateway
    instruction: You are a helpful assistant.
```
@z

@x
## Available Models
@y
## Available Models
@z

@x
Vercel AI Gateway exposes models from many providers behind one endpoint. Check
the [Vercel AI Gateway documentation](https://vercel.com/docs/ai-gateway) for
the current model list, IDs, and pricing.
@y
Vercel AI Gateway exposes models from many providers behind one endpoint. Check
the [Vercel AI Gateway documentation](https://vercel.com/docs/ai-gateway) for
the current model list, IDs, and pricing.
@z

@x
| Model | Description |
| --- | --- |
| `openai/gpt-5.6-sol` | OpenAI GPT-5.6 Sol (frontier) routed through the gateway |
| `openai/gpt-5.6-terra` | OpenAI GPT-5.6 Terra (workhorse) routed through the gateway |
| `openai/gpt-5.6-luna` | OpenAI GPT-5.6 Luna (high-volume) routed through the gateway |
| `anthropic/claude-sonnet-4.5` | Anthropic Claude Sonnet routed through the gateway |
| `google/gemini-2.5-flash` | Google Gemini routed through the gateway |
@y
| Model | Description |
| --- | --- |
| `openai/gpt-5.6-sol` | OpenAI GPT-5.6 Sol (frontier) routed through the gateway |
| `openai/gpt-5.6-terra` | OpenAI GPT-5.6 Terra (workhorse) routed through the gateway |
| `openai/gpt-5.6-luna` | OpenAI GPT-5.6 Luna (high-volume) routed through the gateway |
| `anthropic/claude-sonnet-4.5` | Anthropic Claude Sonnet routed through the gateway |
| `google/gemini-2.5-flash` | Google Gemini routed through the gateway |
@z

@x
> Model IDs are case-sensitive and must be passed exactly as the gateway lists
> them, including the `creator/` prefix.
@y
> Model IDs are case-sensitive and must be passed exactly as the gateway lists
> them, including the `creator/` prefix.
@z

@x
## How It Works
@y
## How It Works
@z

@x
Vercel AI Gateway is implemented as a built-in alias in Docker Agent:
@y
Vercel AI Gateway is implemented as a built-in alias in Docker Agent:
@z

@x
- **API Type:** OpenAI-compatible (`openai_chatcompletions`)
- **Base URL:** `https://ai-gateway.vercel.sh/v1`
- **Token Variable:** `AI_GATEWAY_API_KEY`
@y
- **API Type:** OpenAI-compatible (`openai_chatcompletions`)
- **Base URL:** `https://ai-gateway.vercel.sh/v1`
- **Token Variable:** `AI_GATEWAY_API_KEY`
@z

@x
Because the gateway can route to open-weight models with strict chat templates,
Docker Agent coalesces consecutive system messages into a single leading one for
this provider.
@y
Because the gateway can route to open-weight models with strict chat templates,
Docker Agent coalesces consecutive system messages into a single leading one for
this provider.
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
    model: vercel/anthropic/claude-sonnet-4.5
    description: Code assistant via Vercel AI Gateway
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
    model: vercel/anthropic/claude-sonnet-4.5
    description: Code assistant via Vercel AI Gateway
    instruction: |
      You are an expert programmer.
      Write clean, well-documented code and follow language best practices.
    toolsets:
      - type: filesystem
      - type: shell
      - type: think
```
@z
