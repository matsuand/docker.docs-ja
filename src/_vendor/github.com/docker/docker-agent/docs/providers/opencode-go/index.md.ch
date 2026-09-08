%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

% __SUBDIR__ 対応

@x
title: "OpenCode Go"
description: "Use OpenCode Go models with Docker Agent."
keywords: docker agent, ai agents, model providers, llm, opencode go
@y
title: "OpenCode Go"
description: "Use OpenCode Go models with Docker Agent."
keywords: docker agent, ai agents, model providers, llm, opencode go
@z

@x
canonical: https://docs.docker.com/ai/docker-agent/providers/opencode-go/
@y
canonical: __SUBDIR__/ai/docker-agent/providers/opencode-go/
@z

@x
_Use OpenCode Go models with Docker Agent._
@y
_Use OpenCode Go models with Docker Agent._
@z

@x
## Overview
@y
## Overview
@z

@x
[OpenCode Go](https://opencode.ai/docs/go) is a low-cost subscription service ($5 first month, then $10/month) that provides reliable access to popular open-source coding models. It serves models through both OpenAI-compatible and Anthropic-compatible APIs from globally distributed endpoints.
@y
[OpenCode Go](https://opencode.ai/docs/go) is a low-cost subscription service ($5 first month, then $10/month) that provides reliable access to popular open-source coding models. It serves models through both OpenAI-compatible and Anthropic-compatible APIs from globally distributed endpoints.
@z

@x
Docker Agent includes built-in support for OpenCode Go as an alias provider.
@y
Docker Agent includes built-in support for OpenCode Go as an alias provider.
@z

@x
## Setup
@y
## Setup
@z

@x
1. Subscribe to OpenCode Go at [opencode.ai/auth](https://opencode.ai/auth)
2. Copy your API key from the console
3. Set the environment variable:
@y
1. Subscribe to OpenCode Go at [opencode.ai/auth](https://opencode.ai/auth)
2. Copy your API key from the console
3. Set the environment variable:
@z

@x
   ```bash
   export OPENCODE_API_KEY=your-api-key
   ```
@y
   ```bash
   export OPENCODE_API_KEY=your-api-key
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
The simplest way to use OpenCode Go:
@y
The simplest way to use OpenCode Go:
@z

@x
```yaml
agents:
  root:
    model: opencode-go/deepseek-v4-flash
    description: Assistant using OpenCode Go
    instruction: You are a helpful assistant.
```
@y
```yaml
agents:
  root:
    model: opencode-go/deepseek-v4-flash
    description: Assistant using OpenCode Go
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
  my_model:
    provider: opencode-go
    model: deepseek-v4-pro
    temperature: 0.7
    max_tokens: 8192
@y
```yaml
models:
  my_model:
    provider: opencode-go
    model: deepseek-v4-pro
    temperature: 0.7
    max_tokens: 8192
@z

@x
agents:
  root:
    model: my_model
    description: Assistant using OpenCode Go
    instruction: You are a helpful assistant.
```
@y
agents:
  root:
    model: my_model
    description: Assistant using OpenCode Go
    instruction: You are a helpful assistant.
```
@z

@x
## Available Models
@y
## Available Models
@z

@x
You can retrieve the full, up-to-date model list at any time:
@y
You can retrieve the full, up-to-date model list at any time:
@z

@x
```bash
curl https://opencode.ai/zen/go/v1/models
```
@y
```bash
curl https://opencode.ai/zen/go/v1/models
```
@z

@x
### OpenAI-Compatible
@y
### OpenAI-Compatible
@z

@x
These models use the `/v1/chat/completions` endpoint and work directly with the `opencode-go` alias:
@y
These models use the `/v1/chat/completions` endpoint and work directly with the `opencode-go` alias:
@z

@x
| Model               | Description                           |
| ------------------- | ------------------------------------- |
| `deepseek-v4-flash` | Fast and cost-effective DeepSeek model |
| `deepseek-v4-pro`   | Most capable DeepSeek model           |
| `kimi-k2.7-code`    | Kimi K2.7 optimized for code          |
| `kimi-k2.6`         | Kimi K2.6 model                       |
| `kimi-k2.5`         | Kimi K2.5 model                       |
| `glm-5.2`           | GLM 5.2 flagship model                |
| `glm-5.1`           | GLM 5.1 model                         |
| `glm-5`             | GLM 5 model                           |
| `mimo-v2.5`         | MiMo V2.5 efficient model             |
| `mimo-v2.5-pro`     | MiMo V2.5 Pro model                   |
| `mimo-v2-pro`       | MiMo V2 Pro model                     |
| `mimo-v2-omni`      | MiMo V2 Omni model                    |
| `hy3-preview`       | HY3 preview model                     |
@y
| Model               | Description                           |
| ------------------- | ------------------------------------- |
| `deepseek-v4-flash` | Fast and cost-effective DeepSeek model |
| `deepseek-v4-pro`   | Most capable DeepSeek model           |
| `kimi-k2.7-code`    | Kimi K2.7 optimized for code          |
| `kimi-k2.6`         | Kimi K2.6 model                       |
| `kimi-k2.5`         | Kimi K2.5 model                       |
| `glm-5.2`           | GLM 5.2 flagship model                |
| `glm-5.1`           | GLM 5.1 model                         |
| `glm-5`             | GLM 5 model                           |
| `mimo-v2.5`         | MiMo V2.5 efficient model             |
| `mimo-v2.5-pro`     | MiMo V2.5 Pro model                   |
| `mimo-v2-pro`       | MiMo V2 Pro model                     |
| `mimo-v2-omni`      | MiMo V2 Omni model                    |
| `hy3-preview`       | HY3 preview model                     |
@z

@x
### Anthropic-Compatible
@y
### Anthropic-Compatible
@z

@x
These models use the `/v1/messages` endpoint and require a [custom provider definition](../custom/index.md):
@y
These models use the `/v1/messages` endpoint and require a [custom provider definition](../custom/index.md):
@z

@x
| Model             | Description              |
| ----------------- | ------------------------ |
| `minimax-m3`      | MiniMax M3 model         |
| `minimax-m2.7`    | MiniMax M2.7 model       |
| `minimax-m2.5`    | MiniMax M2.5 model       |
| `qwen3.7-max`     | Qwen 3.7 Max model       |
| `qwen3.7-plus`    | Qwen 3.7 Plus model      |
| `qwen3.6-plus`    | Qwen 3.6 Plus model      |
| `qwen3.5-plus`    | Qwen 3.5 Plus model      |
@y
| Model             | Description              |
| ----------------- | ------------------------ |
| `minimax-m3`      | MiniMax M3 model         |
| `minimax-m2.7`    | MiniMax M2.7 model       |
| `minimax-m2.5`    | MiniMax M2.5 model       |
| `qwen3.7-max`     | Qwen 3.7 Max model       |
| `qwen3.7-plus`    | Qwen 3.7 Plus model      |
| `qwen3.6-plus`    | Qwen 3.6 Plus model      |
| `qwen3.5-plus`    | Qwen 3.5 Plus model      |
@z

@x
To use an Anthropic-compatible model, define a custom provider:
@y
To use an Anthropic-compatible model, define a custom provider:
@z

@x
```yaml
providers:
  opengo-ant:
    provider: anthropic
    base_url: https://opencode.ai/zen/go
    token_key: OPENCODE_API_KEY
@y
```yaml
providers:
  opengo-ant:
    provider: anthropic
    base_url: https://opencode.ai/zen/go
    token_key: OPENCODE_API_KEY
@z

@x
models:
  qwen:
    provider: opengo-ant
    model: qwen3.7-max
@y
models:
  qwen:
    provider: opengo-ant
    model: qwen3.7-max
@z

@x
agents:
  root:
    model: qwen
    description: Assistant using Qwen through OpenCode Go
    instruction: You are a helpful assistant.
```
@y
agents:
  root:
    model: qwen
    description: Assistant using Qwen through OpenCode Go
    instruction: You are a helpful assistant.
```
@z

@x
## How It Works
@y
## How It Works
@z

@x
OpenCode Go is implemented as a built-in alias in Docker Agent:
@y
OpenCode Go is implemented as a built-in alias in Docker Agent:
@z

@x
- **API Type:** OpenAI-compatible (`openai_chatcompletions`)
- **Base URL:** `https://opencode.ai/zen/go/v1`
- **Token Variable:** `OPENCODE_API_KEY`
@y
- **API Type:** OpenAI-compatible (`openai_chatcompletions`)
- **Base URL:** `https://opencode.ai/zen/go/v1`
- **Token Variable:** `OPENCODE_API_KEY`
@z

@x
This means OpenCode Go uses the same client as OpenAI, making it fully compatible with all OpenAI features supported by Docker Agent.
@y
This means OpenCode Go uses the same client as OpenAI, making it fully compatible with all OpenAI features supported by Docker Agent.
@z

@x
For Anthropic-compatible models (MiniMax, Qwen), Docker Agent uses a custom provider pointing to the Anthropic client at `https://opencode.ai/zen/go` with the same token.
@y
For Anthropic-compatible models (MiniMax, Qwen), Docker Agent uses a custom provider pointing to the Anthropic client at `https://opencode.ai/zen/go` with the same token.
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
    model: opencode-go/deepseek-v4-flash
    description: Expert code assistant
    instruction: |
      You are an expert programmer using DeepSeek V4 Flash.
      Write clean, efficient, well-documented code.
      Explain your reasoning when helpful.
    toolsets:
      - type: filesystem
      - type: shell
      - type: think
```
@y
```yaml
agents:
  coder:
    model: opencode-go/deepseek-v4-flash
    description: Expert code assistant
    instruction: |
      You are an expert programmer using DeepSeek V4 Flash.
      Write clean, efficient, well-documented code.
      Explain your reasoning when helpful.
    toolsets:
      - type: filesystem
      - type: shell
      - type: think
```
@z

@x
## Usage Limits
@y
## Usage Limits
@z

@x
OpenCode Go subscriptions include the following limits:
@y
OpenCode Go subscriptions include the following limits:
@z

@x
- **5-hour rolling limit** — $12 of usage
- **Weekly limit** — $30 of usage
- **Monthly limit** — $60 of usage
@y
- **5-hour rolling limit** — $12 of usage
- **Weekly limit** — $30 of usage
- **Monthly limit** — $60 of usage
@z

@x
Limits are defined as dollar values. More expensive models allow fewer requests per limit period. You can also [add Zen balance](https://opencode.ai/auth) to continue usage beyond the limits.
@y
Limits are defined as dollar values. More expensive models allow fewer requests per limit period. You can also [add Zen balance](https://opencode.ai/auth) to continue usage beyond the limits.
@z
