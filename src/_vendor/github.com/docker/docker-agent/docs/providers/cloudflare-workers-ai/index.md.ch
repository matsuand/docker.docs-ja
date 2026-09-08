%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

% __SUBDIR__ 対応

@x
title: "Cloudflare Workers AI"
description: "Use Cloudflare Workers AI models with Docker Agent."
keywords: docker agent, ai agents, model providers, llm, cloudflare workers ai
@y
title: "Cloudflare Workers AI"
description: "Use Cloudflare Workers AI models with Docker Agent."
keywords: docker agent, ai agents, model providers, llm, cloudflare workers ai
@z

@x
canonical: https://docs.docker.com/ai/docker-agent/providers/cloudflare-workers-ai/
@y
canonical: __SUBDIR__/docker-agent/providers/cloudflare-workers-ai/
@z

@x
_Use Cloudflare Workers AI models with Docker Agent._
@y
_Use Cloudflare Workers AI models with Docker Agent._
@z

@x
## Overview
@y
## Overview
@z

@x
[Cloudflare Workers AI](https://developers.cloudflare.com/workers-ai/) runs
open-weight models (Llama, Mistral, Qwen, Gemma, and more) on Cloudflare's
global edge network through an OpenAI-compatible endpoint. No separate provider
accounts are needed for the supported models. Docker Agent includes built-in
support for Workers AI as an alias provider.
@y
[Cloudflare Workers AI](https://developers.cloudflare.com/workers-ai/) runs
open-weight models (Llama, Mistral, Qwen, Gemma, and more) on Cloudflare's
global edge network through an OpenAI-compatible endpoint. No separate provider
accounts are needed for the supported models. Docker Agent includes built-in
support for Workers AI as an alias provider.
@z

@x
## Setup
@y
## Setup
@z

@x
Workers AI is account-scoped, so its base URL is resolved from your account ID.
Two environment variables are required:
@y
Workers AI is account-scoped, so its base URL is resolved from your account ID.
Two environment variables are required:
@z

@x
```bash
export CLOUDFLARE_ACCOUNT_ID=your-account-id
export CLOUDFLARE_API_TOKEN=your-api-token
```
@y
```bash
export CLOUDFLARE_ACCOUNT_ID=your-account-id
export CLOUDFLARE_API_TOKEN=your-api-token
```
@z

@x
Create an API token with the `Workers AI` permission from the
[Cloudflare dashboard](https://dash.cloudflare.com/profile/api-tokens). Your
account ID is shown on the Workers AI page.
@y
Create an API token with the `Workers AI` permission from the
[Cloudflare dashboard](https://dash.cloudflare.com/profile/api-tokens). Your
account ID is shown on the Workers AI page.
@z

@x
## Usage
@y
## Usage
@z

@x
Workers AI model IDs use the `@cf/...` form (for example
`@cf/meta/llama-3.1-8b-instruct`).
@y
Workers AI model IDs use the `@cf/...` form (for example
`@cf/meta/llama-3.1-8b-instruct`).
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
    model: cloudflare-workers-ai/@cf/meta/llama-3.1-8b-instruct
    description: Assistant using Cloudflare Workers AI
    instruction: You are a helpful assistant.
```
@y
```yaml
agents:
  root:
    model: cloudflare-workers-ai/@cf/meta/llama-3.1-8b-instruct
    description: Assistant using Cloudflare Workers AI
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
  cloudflare_model:
    provider: cloudflare-workers-ai
    model: "@cf/meta/llama-3.1-8b-instruct"
    temperature: 0.7
    max_tokens: 8192
@y
```yaml
models:
  cloudflare_model:
    provider: cloudflare-workers-ai
    model: "@cf/meta/llama-3.1-8b-instruct"
    temperature: 0.7
    max_tokens: 8192
@z

@x
agents:
  root:
    model: cloudflare_model
    description: Assistant using Cloudflare Workers AI
    instruction: You are a helpful assistant.
```
@y
agents:
  root:
    model: cloudflare_model
    description: Assistant using Cloudflare Workers AI
    instruction: You are a helpful assistant.
```
@z

@x
## Available Models
@y
## Available Models
@z

@x
Check the
[Workers AI models catalog](https://developers.cloudflare.com/workers-ai/models/)
for the current list, IDs, and pricing.
@y
Check the
[Workers AI models catalog](https://developers.cloudflare.com/workers-ai/models/)
for the current list, IDs, and pricing.
@z

@x
| Model | Description |
| --- | --- |
| `@cf/meta/llama-3.1-8b-instruct` | Meta Llama 3.1 8B Instruct |
| `@cf/mistralai/mistral-small-3.1-24b-instruct` | Mistral Small 3.1 24B Instruct |
| `@cf/qwen/qwen2.5-coder-32b-instruct` | Qwen 2.5 Coder 32B Instruct |
@y
| Model | Description |
| --- | --- |
| `@cf/meta/llama-3.1-8b-instruct` | Meta Llama 3.1 8B Instruct |
| `@cf/mistralai/mistral-small-3.1-24b-instruct` | Mistral Small 3.1 24B Instruct |
| `@cf/qwen/qwen2.5-coder-32b-instruct` | Qwen 2.5 Coder 32B Instruct |
@z

@x
## How It Works
@y
## How It Works
@z

@x
Cloudflare Workers AI is implemented as a built-in alias in Docker Agent:
@y
Cloudflare Workers AI is implemented as a built-in alias in Docker Agent:
@z

@x
- **API Type:** OpenAI-compatible (`openai_chatcompletions`)
- **Base URL:** `https://api.cloudflare.com/client/v4/accounts/${CLOUDFLARE_ACCOUNT_ID}/ai/v1`
- **Token Variable:** `CLOUDFLARE_API_TOKEN`
@y
- **API Type:** OpenAI-compatible (`openai_chatcompletions`)
- **Base URL:** `https://api.cloudflare.com/client/v4/accounts/${CLOUDFLARE_ACCOUNT_ID}/ai/v1`
- **Token Variable:** `CLOUDFLARE_API_TOKEN`
@z

@x
The base URL is templated: `${CLOUDFLARE_ACCOUNT_ID}` is substituted from the
environment when the provider is built, so `CLOUDFLARE_ACCOUNT_ID` must be set in
addition to `CLOUDFLARE_API_TOKEN`. Because Workers AI serves open-weight models
with strict chat templates, Docker Agent coalesces consecutive system messages
into a single leading one for this provider.
@y
The base URL is templated: `${CLOUDFLARE_ACCOUNT_ID}` is substituted from the
environment when the provider is built, so `CLOUDFLARE_ACCOUNT_ID` must be set in
addition to `CLOUDFLARE_API_TOKEN`. Because Workers AI serves open-weight models
with strict chat templates, Docker Agent coalesces consecutive system messages
into a single leading one for this provider.
@z
