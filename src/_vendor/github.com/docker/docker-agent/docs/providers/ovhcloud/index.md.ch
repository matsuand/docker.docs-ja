%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

% __SUBDIR__ 対応

@x
title: "OVHcloud"
description: "Use OVHcloud AI Endpoints models with Docker Agent."
keywords: docker agent, ai agents, model providers, llm, ovhcloud
@y
title: "OVHcloud"
description: "Use OVHcloud AI Endpoints models with Docker Agent."
keywords: docker agent, ai agents, model providers, llm, ovhcloud
@z

@x
canonical: https://docs.docker.com/ai/docker-agent/providers/ovhcloud/
@y
canonical: __SUBDIR__/ai/docker-agent/providers/ovhcloud/
@z

@x
_Use OVHcloud AI Endpoints models with Docker Agent._
@y
_Use OVHcloud AI Endpoints models with Docker Agent._
@z

@x
## Overview
@y
## Overview
@z

@x
[OVHcloud AI Endpoints](https://endpoints.ai.cloud.ovh.net/) serves open-weight
models through an OpenAI-compatible API, hosted in the EU. Docker Agent includes
built-in support for OVHcloud as an alias provider.
@y
[OVHcloud AI Endpoints](https://endpoints.ai.cloud.ovh.net/) serves open-weight
models through an OpenAI-compatible API, hosted in the EU. Docker Agent includes
built-in support for OVHcloud as an alias provider.
@z

@x
## Setup
@y
## Setup
@z

@x
1. Create an access token from the
   [OVHcloud AI Endpoints portal](https://endpoints.ai.cloud.ovh.net/).
2. Set the environment variable:
@y
1. Create an access token from the
   [OVHcloud AI Endpoints portal](https://endpoints.ai.cloud.ovh.net/).
2. Set the environment variable:
@z

@x
   ```bash
   export OVH_AI_ENDPOINTS_ACCESS_TOKEN=your-access-token
   ```
@y
   ```bash
   export OVH_AI_ENDPOINTS_ACCESS_TOKEN=your-access-token
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
    model: ovhcloud/Qwen3.5-397B-A17B
    description: Assistant using OVHcloud
    instruction: You are a helpful assistant.
```
@y
```yaml
agents:
  root:
    model: ovhcloud/Qwen3.5-397B-A17B
    description: Assistant using OVHcloud
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
  ovhcloud_model:
    provider: ovhcloud
    model: Qwen3.5-397B-A17B
    temperature: 0.7
    max_tokens: 8192
@y
```yaml
models:
  ovhcloud_model:
    provider: ovhcloud
    model: Qwen3.5-397B-A17B
    temperature: 0.7
    max_tokens: 8192
@z

@x
agents:
  root:
    model: ovhcloud_model
    description: Assistant using OVHcloud
    instruction: You are a helpful assistant.
```
@y
agents:
  root:
    model: ovhcloud_model
    description: Assistant using OVHcloud
    instruction: You are a helpful assistant.
```
@z

@x
## Available Models
@y
## Available Models
@z

@x
OVHcloud hosts a rotating catalogue of open-weight models. Check the
[AI Endpoints catalogue](https://endpoints.ai.cloud.ovh.net/) for current model
IDs, context limits, and free-tier availability.
@y
OVHcloud hosts a rotating catalogue of open-weight models. Check the
[AI Endpoints catalogue](https://endpoints.ai.cloud.ovh.net/) for current model
IDs, context limits, and free-tier availability.
@z

@x
| Model | Description |
| --- | --- |
| `Qwen3.5-397B-A17B` | Large Qwen3.5 MoE — strong general, coding, and reasoning |
| `Qwen3-32B` | Mid-size Qwen3 — fast, tool-calling, reasoning |
| `Qwen3.6-27B` | Compact Qwen3.6 — fast and efficient |
| `Qwen3.5-9B` | Small Qwen3.5 — lightweight, free-tier friendly |
| `Qwen3-Coder-30B-A3B-Instruct` | Qwen3 Coder MoE — optimised for code generation |
| `Meta-Llama-3_3-70B-Instruct` | Llama 3.3 70B — reliable general-purpose chat |
| `Mistral-Small-3.2-24B-Instruct-2506` | Compact, fast, tool-calling |
@y
| Model | Description |
| --- | --- |
| `Qwen3.5-397B-A17B` | Large Qwen3.5 MoE — strong general, coding, and reasoning |
| `Qwen3-32B` | Mid-size Qwen3 — fast, tool-calling, reasoning |
| `Qwen3.6-27B` | Compact Qwen3.6 — fast and efficient |
| `Qwen3.5-9B` | Small Qwen3.5 — lightweight, free-tier friendly |
| `Qwen3-Coder-30B-A3B-Instruct` | Qwen3 Coder MoE — optimised for code generation |
| `Meta-Llama-3_3-70B-Instruct` | Llama 3.3 70B — reliable general-purpose chat |
| `Mistral-Small-3.2-24B-Instruct-2506` | Compact, fast, tool-calling |
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
OVHcloud is implemented as a built-in alias in Docker Agent:
@y
OVHcloud is implemented as a built-in alias in Docker Agent:
@z

@x
- **API Type:** OpenAI-compatible (`openai_chatcompletions`)
- **Base URL:** `https://oai.endpoints.kepler.ai.cloud.ovh.net/v1`
- **Token Variable:** `OVH_AI_ENDPOINTS_ACCESS_TOKEN`
@y
- **API Type:** OpenAI-compatible (`openai_chatcompletions`)
- **Base URL:** `https://oai.endpoints.kepler.ai.cloud.ovh.net/v1`
- **Token Variable:** `OVH_AI_ENDPOINTS_ACCESS_TOKEN`
@z

@x
Docker Agent automatically coalesces consecutive system messages into one for
OVHcloud, because some OVHcloud models return an empty stream when a request
carries more than one system message.
@y
Docker Agent automatically coalesces consecutive system messages into one for
OVHcloud, because some OVHcloud models return an empty stream when a request
carries more than one system message.
@z

@x
## Free tier
@y
## Free tier
@z

@x
OVHcloud offers rate-limited free access to several models. Under heavy
rate-limiting the endpoint may return an empty response; Docker Agent surfaces
this as a warning rather than failing. For sustained use, an access token with a
paid plan avoids the free-tier request-rate cap.
@y
OVHcloud offers rate-limited free access to several models. Under heavy
rate-limiting the endpoint may return an empty response; Docker Agent surfaces
this as a warning rather than failing. For sustained use, an access token with a
paid plan avoids the free-tier request-rate cap.
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
    model: ovhcloud/Qwen3.5-397B-A17B
    description: Code assistant using Qwen3.5
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
    model: ovhcloud/Qwen3.5-397B-A17B
    description: Code assistant using Qwen3.5
    instruction: |
      You are an expert programmer.
      Write clean, well-documented code and follow language best practices.
    toolsets:
      - type: filesystem
      - type: shell
      - type: think
```
@z
