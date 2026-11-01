%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

% __SUBDIR__ 対応

@x
title: "DaoXE"
description: "Use DaoXE models with Docker Agent."
keywords: docker agent, ai agents, model providers, llm, daoxe
@y
title: "DaoXE"
description: "Use DaoXE models with Docker Agent."
keywords: docker agent, ai agents, model providers, llm, daoxe
@z

@x
canonical: https://docs.docker.com/ai/docker-agent/providers/daoxe/
@y
canonical: __SUBDIR__/ai/docker-agent/providers/daoxe/
@z

@x
_Use DaoXE models with Docker Agent._
@y
_Use DaoXE models with Docker Agent._
@z

@x
## Overview
@y
## Overview
@z

@x
[DaoXE](https://daoxe.com) is a multi-model LLM gateway that serves models from
multiple vendors behind one OpenAI-compatible endpoint. Docker Agent includes
built-in support for DaoXE as an alias provider.
@y
[DaoXE](https://daoxe.com) is a multi-model LLM gateway that serves models from
multiple vendors behind one OpenAI-compatible endpoint. Docker Agent includes
built-in support for DaoXE as an alias provider.
@z

@x
## Setup
@y
## Setup
@z

@x
1. Create an API key from your DaoXE account dashboard.
2. Set the environment variable:
@y
1. Create an API key from your DaoXE account dashboard.
2. Set the environment variable:
@z

@x
   ```bash
   export DAOXE_API_KEY=your-api-key
   ```
@y
   ```bash
   export DAOXE_API_KEY=your-api-key
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
```yaml
agents:
  root:
    model: daoxe/<model-id>
    description: Assistant using DaoXE
    instruction: You are a helpful assistant.
```
@y
```yaml
agents:
  root:
    model: daoxe/<model-id>
    description: Assistant using DaoXE
    instruction: You are a helpful assistant.
```
@z

@x
### Named Model
@y
### Named Model
@z

@x
```yaml
models:
  daoxe_model:
    provider: daoxe
    model: <model-id>
    temperature: 0.7
    max_tokens: 8192
@y
```yaml
models:
  daoxe_model:
    provider: daoxe
    model: <model-id>
    temperature: 0.7
    max_tokens: 8192
@z

@x
agents:
  root:
    model: daoxe_model
    description: Assistant using DaoXE
    instruction: You are a helpful assistant.
```
@y
agents:
  root:
    model: daoxe_model
    description: Assistant using DaoXE
    instruction: You are a helpful assistant.
```
@z

@x
## Available Models
@y
## Available Models
@z

@x
DaoXE's catalog is account-scoped and changes over time: new models appear as
upstream vendors release them. List the model IDs your account can call with:
@y
DaoXE's catalog is account-scoped and changes over time: new models appear as
upstream vendors release them. List the model IDs your account can call with:
@z

@x
```bash
curl https://api.daoxe.com/v1/models \
  -H "Authorization: Bearer $DAOXE_API_KEY"
```
@y
```bash
curl https://api.daoxe.com/v1/models \
  -H "Authorization: Bearer $DAOXE_API_KEY"
```
@z

@x
Use any ID from that response as the `model` value. Docker Agent's default for
DaoXE is `claude-sonnet-4-6`.
@y
Use any ID from that response as the `model` value. Docker Agent's default for
DaoXE is `claude-sonnet-4-6`.
@z
