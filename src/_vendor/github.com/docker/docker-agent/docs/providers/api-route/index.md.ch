%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
title: "API Route"
description: "Use API Route models with Docker Agent."
keywords: docker agent, ai agents, model providers, llm, api route
@y
title: "API Route"
description: "Use API Route models with Docker Agent."
keywords: docker agent, ai agents, model providers, llm, api route
@z

@x
canonical: https://docs.docker.com/ai/docker-agent/providers/api-route/
@y
canonical: __SUBDIR__/ai/docker-agent/providers/api-route/
@z

@x
_Use API Route models with Docker Agent._
@y
_Use API Route models with Docker Agent._
@z

@x
## Overview
@y
## Overview
@z

@x
[API Route](https://api-route.com) provides access to multiple model families
through an OpenAI-compatible API. Docker Agent includes API Route as a built-in
alias provider using the global endpoint.
@y
[API Route](https://api-route.com) provides access to multiple model families
through an OpenAI-compatible API. Docker Agent includes API Route as a built-in
alias provider using the global endpoint.
@z

@x
## Setup
@y
## Setup
@z

@x
1. Create an API key in your [API Route account](https://api-route.com).
2. Set the environment variable:
@y
1. Create an API key in your [API Route account](https://api-route.com).
2. Set the environment variable:
@z

@x
   ```bash
   export API_ROUTE_API_KEY=your-api-key
   ```
@y
   ```bash
   export API_ROUTE_API_KEY=your-api-key
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
    model: api-route/gpt-6.1-sol
    description: Assistant using API Route
    instruction: You are a helpful assistant.
```
@y
```yaml
agents:
  root:
    model: api-route/gpt-6.1-sol
    description: Assistant using API Route
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
  api_route_model:
    provider: api-route
    model: gpt-6.1-sol
@y
```yaml
models:
  api_route_model:
    provider: api-route
    model: gpt-6.1-sol
@z

@x
agents:
  root:
    model: api_route_model
    description: Assistant using API Route
    instruction: You are a helpful assistant.
```
@y
agents:
  root:
    model: api_route_model
    description: Assistant using API Route
    instruction: You are a helpful assistant.
```
@z

@x
## Available Models
@y
## Available Models
@z

@x
The examples use the exact model ID `gpt-6.1-sol`. Retrieve your account's current
model IDs before choosing another model:
@y
The examples use the exact model ID `gpt-6.1-sol`. Retrieve your account's current
model IDs before choosing another model:
@z

@x
```bash
curl https://global.api-route.com/v1/models \
  -H "Authorization: Bearer $API_ROUTE_API_KEY"
```
@y
```bash
curl https://global.api-route.com/v1/models \
  -H "Authorization: Bearer $API_ROUTE_API_KEY"
```
@z

@x
Use an ID from the response unchanged as the `model` value. A catalog listing
does not guarantee that inference is currently available.
@y
Use an ID from the response unchanged as the `model` value. A catalog listing
does not guarantee that inference is currently available.
@z

@x
API Route is absent from Docker Agent's embedded models.dev catalog. Docker
Agent does not import pricing, context limits or attachment capabilities from
API Route's model list. Attachment detection falls back to text-only, so image
and PDF attachments are dropped with a warning. If you have verified support
for an attachment type on your chosen model and endpoint, set
`models.<name>.capabilities`; see
[Attachment Capability Overrides](../../configuration/models/index.md#attachment-capability-overrides).
@y
API Route is absent from Docker Agent's embedded models.dev catalog. Docker
Agent does not import pricing, context limits or attachment capabilities from
API Route's model list. Attachment detection falls back to text-only, so image
and PDF attachments are dropped with a warning. If you have verified support
for an attachment type on your chosen model and endpoint, set
`models.<name>.capabilities`; see
[Attachment Capability Overrides](../../configuration/models/index.md#attachment-capability-overrides).
@z

@x
## How It Works
@y
## How It Works
@z

@x
- **API type:** OpenAI-compatible Chat Completions (`openai_chatcompletions`)
- **Base URL:** `https://global.api-route.com/v1`
- **Token variable:** `API_ROUTE_API_KEY`
@y
- **API type:** OpenAI-compatible Chat Completions (`openai_chatcompletions`)
- **Base URL:** `https://global.api-route.com/v1`
- **Token variable:** `API_ROUTE_API_KEY`
@z

@x
As with other multi-model hosts, Docker Agent combines consecutive system
messages for compatibility with models that require a single leading system
message.
@y
As with other multi-model hosts, Docker Agent combines consecutive system
messages for compatibility with models that require a single leading system
message.
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
    model: api-route/gpt-6.1-sol
    description: Code assistant using API Route
    instruction: |
      You are an expert programmer.
      Write clean code and follow language best practices.
    toolsets:
      - type: filesystem
      - type: shell
      - type: think
```
@y
```yaml
agents:
  coder:
    model: api-route/gpt-6.1-sol
    description: Code assistant using API Route
    instruction: |
      You are an expert programmer.
      Write clean code and follow language best practices.
    toolsets:
      - type: filesystem
      - type: shell
      - type: think
```
@z
