%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

% __SUBDIR__ 対応

@x
title: "Baseten"
description: "Use Baseten AI models with Docker Agent."
keywords: docker agent, ai agents, model providers, llm, baseten
@y
title: "Baseten"
description: "Use Baseten AI models with Docker Agent."
keywords: docker agent, ai agents, model providers, llm, baseten
@z

@x
canonical: https://docs.docker.com/ai/docker-agent/providers/baseten/
@y
canonical: __SUBDIR__/ai/docker-agent/providers/baseten/
@z

@x
_Use Baseten AI models with Docker Agent._
@y
_Use Baseten AI models with Docker Agent._
@z

@x
## Overview
@y
## Overview
@z

@x
Baseten provides AI models through an OpenAI-compatible API. Docker Agent includes built-in support for Baseten as an alias provider.
@y
Baseten provides AI models through an OpenAI-compatible API. Docker Agent includes built-in support for Baseten as an alias provider.
@z

@x
## Setup
@y
## Setup
@z

@x
1. Get an API key from [Baseten](https://www.baseten.co/)
2. Set the environment variable:
@y
1. Get an API key from [Baseten](https://www.baseten.co/)
2. Set the environment variable:
@z

@x
   ```bash
   export BASETEN_API_KEY=your-api-key
   ```
@y
   ```bash
   export BASETEN_API_KEY=your-api-key
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
The simplest way to use Baseten:
@y
The simplest way to use Baseten:
@z

@x
```yaml
agents:
  root:
    model: baseten/deepseek-ai/DeepSeek-V3.1
    description: Assistant using Baseten
    instruction: You are a helpful assistant.
```
@y
```yaml
agents:
  root:
    model: baseten/deepseek-ai/DeepSeek-V3.1
    description: Assistant using Baseten
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
  baseten_model:
    provider: baseten
    model: deepseek-ai/DeepSeek-V3.1
    temperature: 0.7
    max_tokens: 8192
@y
```yaml
models:
  baseten_model:
    provider: baseten
    model: deepseek-ai/DeepSeek-V3.1
    temperature: 0.7
    max_tokens: 8192
@z

@x
agents:
  root:
    model: baseten_model
    description: Assistant using Baseten
    instruction: You are a helpful assistant.
```
@y
agents:
  root:
    model: baseten_model
    description: Assistant using Baseten
    instruction: You are a helpful assistant.
```
@z

@x
## Available Models
@y
## Available Models
@z

@x
Baseten hosts various open models through its Model APIs. Check the [Baseten documentation](https://docs.baseten.co/) for the current model catalog.
@y
Baseten hosts various open models through its Model APIs. Check the [Baseten documentation](https://docs.baseten.co/) for the current model catalog.
@z

@x
| Model                          | Description                    |
| ------------------------------ | ------------------------------ |
| `deepseek-ai/DeepSeek-V3.1`    | DeepSeek V3.1 model            |
| `moonshotai/Kimi-K2.5`         | Moonshot Kimi K2.5 model       |
| `openai/gpt-oss-120b`          | GPT-OSS 120B model             |
| `zai-org/GLM-5`                | GLM-5 model                    |
@y
| Model                          | Description                    |
| ------------------------------ | ------------------------------ |
| `deepseek-ai/DeepSeek-V3.1`    | DeepSeek V3.1 model            |
| `moonshotai/Kimi-K2.5`         | Moonshot Kimi K2.5 model       |
| `openai/gpt-oss-120b`          | GPT-OSS 120B model             |
| `zai-org/GLM-5`                | GLM-5 model                    |
@z

@x
## How It Works
@y
## How It Works
@z

@x
Baseten is implemented as a built-in alias in Docker Agent:
@y
Baseten is implemented as a built-in alias in Docker Agent:
@z

@x
- **API Type:** OpenAI-compatible (`openai_chatcompletions`)
- **Base URL:** `https://inference.baseten.co/v1`
- **Token Variable:** `BASETEN_API_KEY`
@y
- **API Type:** OpenAI-compatible (`openai_chatcompletions`)
- **Base URL:** `https://inference.baseten.co/v1`
- **Token Variable:** `BASETEN_API_KEY`
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
    model: baseten/deepseek-ai/DeepSeek-V3.1
    description: Code assistant using DeepSeek
    instruction: |
      You are an expert programmer using DeepSeek V3.1.
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
    model: baseten/deepseek-ai/DeepSeek-V3.1
    description: Code assistant using DeepSeek
    instruction: |
      You are an expert programmer using DeepSeek V3.1.
      Write clean, well-documented code.
      Follow best practices for the language being used.
    toolsets:
      - type: filesystem
      - type: shell
      - type: think
```
@z
