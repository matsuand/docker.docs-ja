%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

% __SUBDIR__ 対応

@x
title: "Cloudflare AI Gateway"
description: "Use Cloudflare AI Gateway models with Docker Agent."
keywords: docker agent, ai agents, model providers, llm, cloudflare ai gateway
@y
title: "Cloudflare AI Gateway"
description: "Use Cloudflare AI Gateway models with Docker Agent."
keywords: docker agent, ai agents, model providers, llm, cloudflare ai gateway
@z

@x
canonical: https://docs.docker.com/ai/docker-agent/providers/cloudflare-ai-gateway/
@y
canonical: __SUBDIR__/ai/docker-agent/providers/cloudflare-ai-gateway/
@z

@x
_Use Cloudflare AI Gateway models with Docker Agent._
@y
_Use Cloudflare AI Gateway models with Docker Agent._
@z

@x
## Overview
@y
## Overview
@z

@x
[Cloudflare AI Gateway](https://developers.cloudflare.com/ai-gateway/) is a
single OpenAI-compatible endpoint that routes to models from OpenAI, Anthropic,
Workers AI and more, with caching, rate limiting and observability. Docker Agent
includes built-in support for AI Gateway as an alias provider.
@y
[Cloudflare AI Gateway](https://developers.cloudflare.com/ai-gateway/) is a
single OpenAI-compatible endpoint that routes to models from OpenAI, Anthropic,
Workers AI and more, with caching, rate limiting and observability. Docker Agent
includes built-in support for AI Gateway as an alias provider.
@z

@x
The alias sends your token in the standard `Authorization: Bearer` header, so it
works out of the box with a gateway that has **authentication disabled** (the
default), typically to route to your own Workers AI models through a gateway you
own. See [Authentication](#authentication) below for the unified-billing /
authenticated-gateway caveat.
@y
The alias sends your token in the standard `Authorization: Bearer` header, so it
works out of the box with a gateway that has **authentication disabled** (the
default), typically to route to your own Workers AI models through a gateway you
own. See [Authentication](#authentication) below for the unified-billing /
authenticated-gateway caveat.
@z

@x
## Setup
@y
## Setup
@z

@x
The gateway endpoint is account- and gateway-scoped, so its base URL is resolved
from your account ID and gateway ID. Three environment variables are required:
@y
The gateway endpoint is account- and gateway-scoped, so its base URL is resolved
from your account ID and gateway ID. Three environment variables are required:
@z

@x
```bash
export CLOUDFLARE_ACCOUNT_ID=your-account-id
export CLOUDFLARE_GATEWAY_ID=your-gateway-id
export CLOUDFLARE_API_TOKEN=your-api-token
```
@y
```bash
export CLOUDFLARE_ACCOUNT_ID=your-account-id
export CLOUDFLARE_GATEWAY_ID=your-gateway-id
export CLOUDFLARE_API_TOKEN=your-api-token
```
@z

@x
Create a gateway from the
[AI Gateway dashboard](https://dash.cloudflare.com/?to=/:account/ai/ai-gateway)
and an API token with the appropriate permissions.
@y
Create a gateway from the
[AI Gateway dashboard](https://dash.cloudflare.com/?to=/:account/ai/ai-gateway)
and an API token with the appropriate permissions.
@z

@x
## Usage
@y
## Usage
@z

@x
AI Gateway model IDs use the gateway's `provider/model` form (for example
`workers-ai/@cf/meta/llama-3.1-8b-instruct` or `openai/gpt-4o`); the gateway
routes each request to the underlying provider.
@y
AI Gateway model IDs use the gateway's `provider/model` form (for example
`workers-ai/@cf/meta/llama-3.1-8b-instruct` or `openai/gpt-4o`); the gateway
routes each request to the underlying provider.
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
    model: cloudflare-ai-gateway/workers-ai/@cf/meta/llama-3.1-8b-instruct
    description: Assistant using Cloudflare AI Gateway
    instruction: You are a helpful assistant.
```
@y
```yaml
agents:
  root:
    model: cloudflare-ai-gateway/workers-ai/@cf/meta/llama-3.1-8b-instruct
    description: Assistant using Cloudflare AI Gateway
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
    provider: cloudflare-ai-gateway
    model: "workers-ai/@cf/meta/llama-3.1-8b-instruct"
    temperature: 0.7
    max_tokens: 8192
@y
```yaml
models:
  cloudflare_model:
    provider: cloudflare-ai-gateway
    model: "workers-ai/@cf/meta/llama-3.1-8b-instruct"
    temperature: 0.7
    max_tokens: 8192
@z

@x
agents:
  root:
    model: cloudflare_model
    description: Assistant using Cloudflare AI Gateway
    instruction: You are a helpful assistant.
```
@y
agents:
  root:
    model: cloudflare_model
    description: Assistant using Cloudflare AI Gateway
    instruction: You are a helpful assistant.
```
@z

@x
## Available Models
@y
## Available Models
@z

@x
AI Gateway exposes models from many providers behind one endpoint. Check the
[AI Gateway documentation](https://developers.cloudflare.com/ai-gateway/) for
the current provider list, model IDs, and how billing works.
@y
AI Gateway exposes models from many providers behind one endpoint. Check the
[AI Gateway documentation](https://developers.cloudflare.com/ai-gateway/) for
the current provider list, model IDs, and how billing works.
@z

@x
> Model IDs are case-sensitive and must be passed exactly as the gateway lists
> them, including the `provider/` prefix.
@y
> Model IDs are case-sensitive and must be passed exactly as the gateway lists
> them, including the `provider/` prefix.
@z

@x
## How It Works
@y
## How It Works
@z

@x
Cloudflare AI Gateway is implemented as a built-in alias in Docker Agent:
@y
Cloudflare AI Gateway is implemented as a built-in alias in Docker Agent:
@z

@x
- **API Type:** OpenAI-compatible (`openai_chatcompletions`)
- **Base URL:** `https://gateway.ai.cloudflare.com/v1/${CLOUDFLARE_ACCOUNT_ID}/${CLOUDFLARE_GATEWAY_ID}/compat`
- **Token Variable:** `CLOUDFLARE_API_TOKEN`
@y
- **API Type:** OpenAI-compatible (`openai_chatcompletions`)
- **Base URL:** `https://gateway.ai.cloudflare.com/v1/${CLOUDFLARE_ACCOUNT_ID}/${CLOUDFLARE_GATEWAY_ID}/compat`
- **Token Variable:** `CLOUDFLARE_API_TOKEN`
@z

@x
The base URL is templated: `${CLOUDFLARE_ACCOUNT_ID}` and
`${CLOUDFLARE_GATEWAY_ID}` are substituted from the environment when the provider
is built, so both must be set in addition to `CLOUDFLARE_API_TOKEN`. Because the
gateway can route to open-weight models with strict chat templates, Docker Agent
coalesces consecutive system messages into a single leading one for this
provider.
@y
The base URL is templated: `${CLOUDFLARE_ACCOUNT_ID}` and
`${CLOUDFLARE_GATEWAY_ID}` are substituted from the environment when the provider
is built, so both must be set in addition to `CLOUDFLARE_API_TOKEN`. Because the
gateway can route to open-weight models with strict chat templates, Docker Agent
coalesces consecutive system messages into a single leading one for this
provider.
@z

@x
## Authentication
@y
## Authentication
@z

@x
Docker Agent authenticates by sending `CLOUDFLARE_API_TOKEN` in the standard
`Authorization: Bearer` header. On the `.../compat` endpoint that header is
treated as the **provider** key, so this alias works when:
@y
Docker Agent authenticates by sending `CLOUDFLARE_API_TOKEN` in the standard
`Authorization: Bearer` header. On the `.../compat` endpoint that header is
treated as the **provider** key, so this alias works when:
@z

@x
- the gateway has **authentication disabled** (the default), and
- the routed models accept that token as their provider key, which is the case
  for **Workers AI** models (`workers-ai/@cf/...`).
@y
- the gateway has **authentication disabled** (the default), and
- the routed models accept that token as their provider key, which is the case
  for **Workers AI** models (`workers-ai/@cf/...`).
@z

@x
A gateway with **authentication enabled** (required for
[unified billing](https://developers.cloudflare.com/ai-gateway/features/unified-billing/))
instead expects the token in Cloudflare's `cf-aig-authorization` header. The
alias does not send that header, and custom `provider_opts.http_headers` values
are not environment-expanded, so an authenticated gateway is **not supported out
of the box** today. For that setup, use an unauthenticated gateway, or configure
a [custom provider](../custom/index.md) against the
Cloudflare AI Gateway REST API.
@y
A gateway with **authentication enabled** (required for
[unified billing](https://developers.cloudflare.com/ai-gateway/features/unified-billing/))
instead expects the token in Cloudflare's `cf-aig-authorization` header. The
alias does not send that header, and custom `provider_opts.http_headers` values
are not environment-expanded, so an authenticated gateway is **not supported out
of the box** today. For that setup, use an unauthenticated gateway, or configure
a [custom provider](../custom/index.md) against the
Cloudflare AI Gateway REST API.
@z
