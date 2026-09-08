%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

% __SUBDIR__ 対応

@x
title: "Nebius"
description: "Use Nebius AI models with Docker Agent."
keywords: docker agent, ai agents, model providers, llm, nebius
@y
title: "Nebius"
description: "Use Nebius AI models with Docker Agent."
keywords: docker agent, ai agents, model providers, llm, nebius
@z

@x
canonical: https://docs.docker.com/ai/docker-agent/providers/nebius/
@y
canonical: __SUBDIR__/ai/docker-agent/providers/nebius/
@z

@x
_Use Nebius AI models with Docker Agent._
@y
_Use Nebius AI models with Docker Agent._
@z

@x
## Overview
@y
## Overview
@z

@x
Nebius provides AI models through an OpenAI-compatible API. Docker Agent includes built-in support for Nebius as an alias provider.
@y
Nebius provides AI models through an OpenAI-compatible API. Docker Agent includes built-in support for Nebius as an alias provider.
@z

@x
## Setup
@y
## Setup
@z

@x
1. Get an API key from [Nebius AI](https://nebius.ai/)
2. Set the environment variable:
@y
1. Get an API key from [Nebius AI](https://nebius.ai/)
2. Set the environment variable:
@z

@x
   ```bash
   export NEBIUS_API_KEY=your-api-key
   ```
@y
   ```bash
   export NEBIUS_API_KEY=your-api-key
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
The simplest way to use Nebius:
@y
The simplest way to use Nebius:
@z

@x
```yaml
agents:
  root:
    model: nebius/deepseek-ai/DeepSeek-V3
    description: Assistant using Nebius
    instruction: You are a helpful assistant.
```
@y
```yaml
agents:
  root:
    model: nebius/deepseek-ai/DeepSeek-V3
    description: Assistant using Nebius
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
  nebius_model:
    provider: nebius
    model: deepseek-ai/DeepSeek-V3
    temperature: 0.7
    max_tokens: 8192
@y
```yaml
models:
  nebius_model:
    provider: nebius
    model: deepseek-ai/DeepSeek-V3
    temperature: 0.7
    max_tokens: 8192
@z

@x
agents:
  root:
    model: nebius_model
    description: Assistant using Nebius
    instruction: You are a helpful assistant.
```
@y
agents:
  root:
    model: nebius_model
    description: Assistant using Nebius
    instruction: You are a helpful assistant.
```
@z

@x
## Available Models
@y
## Available Models
@z

@x
Nebius hosts various open models. Check the [Nebius documentation](https://nebius.ai/docs) for the current model catalog.
@y
Nebius hosts various open models. Check the [Nebius documentation](https://nebius.ai/docs) for the current model catalog.
@z

@x
| Model                               | Description                     |
| ----------------------------------- | ------------------------------- |
| `deepseek-ai/DeepSeek-V3`           | DeepSeek V3 model               |
| `Qwen/Qwen2.5-72B-Instruct`         | Qwen 2.5 72B instruction-tuned  |
| `meta-llama/Llama-3.3-70B-Instruct` | Llama 3.3 70B instruction-tuned |
@y
| Model                               | Description                     |
| ----------------------------------- | ------------------------------- |
| `deepseek-ai/DeepSeek-V3`           | DeepSeek V3 model               |
| `Qwen/Qwen2.5-72B-Instruct`         | Qwen 2.5 72B instruction-tuned  |
| `meta-llama/Llama-3.3-70B-Instruct` | Llama 3.3 70B instruction-tuned |
@z

@x
## How It Works
@y
## How It Works
@z

@x
Nebius is implemented as a built-in alias in Docker Agent:
@y
Nebius is implemented as a built-in alias in Docker Agent:
@z

@x
- **API Type:** OpenAI-compatible (`openai_chatcompletions`)
- **Base URL:** `https://api.studio.nebius.com/v1`
- **Token Variable:** `NEBIUS_API_KEY`
@y
- **API Type:** OpenAI-compatible (`openai_chatcompletions`)
- **Base URL:** `https://api.studio.nebius.com/v1`
- **Token Variable:** `NEBIUS_API_KEY`
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
    model: nebius/deepseek-ai/DeepSeek-V3
    description: Code assistant using DeepSeek
    instruction: |
      You are an expert programmer using DeepSeek V3.
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
    model: nebius/deepseek-ai/DeepSeek-V3
    description: Code assistant using DeepSeek
    instruction: |
      You are an expert programmer using DeepSeek V3.
      Write clean, well-documented code.
      Follow best practices for the language being used.
    toolsets:
      - type: filesystem
      - type: shell
      - type: think
```
@z
