%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

% __SUBDIR__ 対応

@x
title: "MiniMax"
description: "Use MiniMax AI models with Docker Agent."
keywords: docker agent, ai agents, model providers, llm, minimax
@y
title: "MiniMax"
description: "Use MiniMax AI models with Docker Agent."
keywords: docker agent, ai agents, model providers, llm, minimax
@z

@x
canonical: https://docs.docker.com/ai/docker-agent/providers/minimax/
@y
canonical: __SUBDIR__/ai/docker-agent/providers/minimax/
@z

@x
_Use MiniMax AI models with Docker Agent._
@y
_Use MiniMax AI models with Docker Agent._
@z

@x
## Overview
@y
## Overview
@z

@x
MiniMax provides AI models through an OpenAI-compatible API. Docker Agent includes built-in support for MiniMax as an alias provider.
@y
MiniMax provides AI models through an OpenAI-compatible API. Docker Agent includes built-in support for MiniMax as an alias provider.
@z

@x
## Setup
@y
## Setup
@z

@x
1. Get an API key from [MiniMax](https://www.minimaxi.com/)
2. Set the environment variable:
@y
1. Get an API key from [MiniMax](https://www.minimaxi.com/)
2. Set the environment variable:
@z

@x
   ```bash
   export MINIMAX_API_KEY=your-api-key
   ```
@y
   ```bash
   export MINIMAX_API_KEY=your-api-key
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
The simplest way to use MiniMax:
@y
The simplest way to use MiniMax:
@z

@x
```yaml
agents:
  root:
    model: minimax/MiniMax-M2.5
    description: Assistant using MiniMax
    instruction: You are a helpful assistant.
```
@y
```yaml
agents:
  root:
    model: minimax/MiniMax-M2.5
    description: Assistant using MiniMax
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
  minimax_model:
    provider: minimax
    model: MiniMax-M2.5
    temperature: 0.7
    max_tokens: 8192
@y
```yaml
models:
  minimax_model:
    provider: minimax
    model: MiniMax-M2.5
    temperature: 0.7
    max_tokens: 8192
@z

@x
agents:
  root:
    model: minimax_model
    description: Assistant using MiniMax
    instruction: You are a helpful assistant.
```
@y
agents:
  root:
    model: minimax_model
    description: Assistant using MiniMax
    instruction: You are a helpful assistant.
```
@z

@x
## Available Models
@y
## Available Models
@z

@x
Check the [MiniMax documentation](https://www.minimaxi.com/document/introduction) for the current model catalog.
@y
Check the [MiniMax documentation](https://www.minimaxi.com/document/introduction) for the current model catalog.
@z

@x
| Model                    | Description                                     |
| ------------------------ | ----------------------------------------------- |
| `MiniMax-M2.5`           | Peak performance, 204K context                  |
| `MiniMax-M2.5-highspeed` | Same as M2.5 but faster (~100 tps)              |
| `MiniMax-M2.1`           | Multi-language programming capabilities         |
| `MiniMax-M2.1-highspeed` | Faster variant of M2.1 (~100 tps)               |
| `MiniMax-M2`             | Agentic capabilities, advanced reasoning        |
@y
| Model                    | Description                                     |
| ------------------------ | ----------------------------------------------- |
| `MiniMax-M2.5`           | Peak performance, 204K context                  |
| `MiniMax-M2.5-highspeed` | Same as M2.5 but faster (~100 tps)              |
| `MiniMax-M2.1`           | Multi-language programming capabilities         |
| `MiniMax-M2.1-highspeed` | Faster variant of M2.1 (~100 tps)               |
| `MiniMax-M2`             | Agentic capabilities, advanced reasoning        |
@z

@x
## How It Works
@y
## How It Works
@z

@x
MiniMax is implemented as a built-in alias in Docker Agent:
@y
MiniMax is implemented as a built-in alias in Docker Agent:
@z

@x
- **API Type:** OpenAI-compatible (`openai`)
- **Base URL:** `https://api.minimax.io/v1`
- **Token Variable:** `MINIMAX_API_KEY`
@y
- **API Type:** OpenAI-compatible (`openai`)
- **Base URL:** `https://api.minimax.io/v1`
- **Token Variable:** `MINIMAX_API_KEY`
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
    model: minimax/MiniMax-M2.5
    description: Code assistant using MiniMax
    instruction: |
      You are an expert programmer using MiniMax M2.5.
      Write clean, well-documented code.
      Follow best practices for the language being used.
    toolsets:
      - type: filesystem
      - type: shell
      - type: think
```
@y
```yaml
agents:
  coder:
    model: minimax/MiniMax-M2.5
    description: Code assistant using MiniMax
    instruction: |
      You are an expert programmer using MiniMax M2.5.
      Write clean, well-documented code.
      Follow best practices for the language being used.
    toolsets:
      - type: filesystem
      - type: shell
      - type: think
```
@z
