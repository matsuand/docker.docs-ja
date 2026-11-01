%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

% __SUBDIR__ 対応

@x
title: "Atlas Cloud"
description: "Use Atlas Cloud models with Docker Agent."
keywords: docker agent, ai agents, model providers, llm, atlas cloud
@y
title: "Atlas Cloud"
description: "Use Atlas Cloud models with Docker Agent."
keywords: docker agent, ai agents, model providers, llm, atlas cloud
@z

@x
canonical: https://docs.docker.com/ai/docker-agent/providers/atlascloud/
@y
canonical: __SUBDIR__/ai/docker-agent/providers/atlascloud/
@z

@x
_Use Atlas Cloud models with Docker Agent._
@y
_Use Atlas Cloud models with Docker Agent._
@z

@x
## Overview
@y
## Overview
@z

@x
Atlas Cloud provides access to multiple model families through an OpenAI-compatible API. Docker Agent includes built-in support for Atlas Cloud as an alias provider.
@y
Atlas Cloud provides access to multiple model families through an OpenAI-compatible API. Docker Agent includes built-in support for Atlas Cloud as an alias provider.
@z

@x
## Setup
@y
## Setup
@z

@x
1. [Create an Atlas Cloud API key](https://www.atlascloud.ai/docs/api-keys)
2. Set the environment variable:
@y
1. [Create an Atlas Cloud API key](https://www.atlascloud.ai/docs/api-keys)
2. Set the environment variable:
@z

@x
   ```bash
   export ATLASCLOUD_API_KEY=your-api-key
   ```
@y
   ```bash
   export ATLASCLOUD_API_KEY=your-api-key
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
Use an Atlas Cloud model by prefixing its model ID with `atlascloud/`:
@y
Use an Atlas Cloud model by prefixing its model ID with `atlascloud/`:
@z

@x
```yaml
agents:
  root:
    model: atlascloud/qwen/qwen3.8-max
    description: Assistant using Atlas Cloud
    instruction: You are a helpful assistant.
```
@y
```yaml
agents:
  root:
    model: atlascloud/qwen/qwen3.8-max
    description: Assistant using Atlas Cloud
    instruction: You are a helpful assistant.
```
@z

@x
Docker Agent splits only the first slash, so model IDs that include a model family prefix are preserved.
@y
Docker Agent splits only the first slash, so model IDs that include a model family prefix are preserved.
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
  atlas_qwen:
    provider: atlascloud
    model: qwen/qwen3.8-max
    temperature: 0.7
    max_tokens: 8192
@y
```yaml
models:
  atlas_qwen:
    provider: atlascloud
    model: qwen/qwen3.8-max
    temperature: 0.7
    max_tokens: 8192
@z

@x
agents:
  root:
    model: atlas_qwen
    description: Assistant using Atlas Cloud
    instruction: You are a helpful assistant.
```
@y
agents:
  root:
    model: atlas_qwen
    description: Assistant using Atlas Cloud
    instruction: You are a helpful assistant.
```
@z

@x
## Available Models
@y
## Available Models
@z

@x
Atlas Cloud's catalog includes the following exact model ID used by the examples:
@y
Atlas Cloud's catalog includes the following exact model ID used by the examples:
@z

@x
| Model ID | Model |
| --- | --- |
| `qwen/qwen3.8-max` | Qwen3.8 Max |
@y
| Model ID | Model |
| --- | --- |
| `qwen/qwen3.8-max` | Qwen3.8 Max |
@z

@x
Model IDs are case-sensitive. Check the [Atlas Cloud model catalog](https://www.atlascloud.ai/models)
or the live [`/v1/models` endpoint](https://api.atlascloud.ai/v1/models) for current IDs
and availability. A catalog listing does not guarantee that inference is currently available.
@y
Model IDs are case-sensitive. Check the [Atlas Cloud model catalog](https://www.atlascloud.ai/models)
or the live [`/v1/models` endpoint](https://api.atlascloud.ai/v1/models) for current IDs
and availability. A catalog listing does not guarantee that inference is currently available.
@z

@x
Atlas Cloud is not in the models.dev catalog. Docker Agent does not import metadata
from Atlas Cloud's model list, so it has no catalog-derived pricing or context limits
for these models. Attachment capabilities conservatively fall back to text-only;
image and PDF attachments are dropped, with a warning logged once per model.
@y
Atlas Cloud is not in the models.dev catalog. Docker Agent does not import metadata
from Atlas Cloud's model list, so it has no catalog-derived pricing or context limits
for these models. Attachment capabilities conservatively fall back to text-only;
image and PDF attachments are dropped, with a warning logged once per model.
@z

@x
If you have verified that your chosen model and endpoint accept a particular
attachment type, set `models.<name>.capabilities` to override detection. For example,
`capabilities: {image: true, pdf: false}` enables image attachments only. This is not
a claim that the example model supports them: enable only types the endpoint actually
accepts. See [Attachment Capability Overrides](../../configuration/models/index.md#attachment-capability-overrides)
for all supported flags.
@y
If you have verified that your chosen model and endpoint accept a particular
attachment type, set `models.<name>.capabilities` to override detection. For example,
`capabilities: {image: true, pdf: false}` enables image attachments only. This is not
a claim that the example model supports them: enable only types the endpoint actually
accepts. See [Attachment Capability Overrides](../../configuration/models/index.md#attachment-capability-overrides)
for all supported flags.
@z

@x
## How It Works
@y
## How It Works
@z

@x
Atlas Cloud is implemented as a built-in alias in Docker Agent:
@y
Atlas Cloud is implemented as a built-in alias in Docker Agent:
@z

@x
- **API Type:** OpenAI-compatible Chat Completions (`openai_chatcompletions`)
- **Base URL:** `https://api.atlascloud.ai/v1`
- **Token Variable:** `ATLASCLOUD_API_KEY`
@y
- **API Type:** OpenAI-compatible Chat Completions (`openai_chatcompletions`)
- **Base URL:** `https://api.atlascloud.ai/v1`
- **Token Variable:** `ATLASCLOUD_API_KEY`
@z

@x
Because Atlas Cloud can serve models whose chat templates reject multiple leading
system messages, Docker Agent coalesces its per-source system messages into one.
@y
Because Atlas Cloud can serve models whose chat templates reject multiple leading
system messages, Docker Agent coalesces its per-source system messages into one.
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
    model: atlascloud/qwen/qwen3.8-max
    description: Code assistant using Atlas Cloud
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
    model: atlascloud/qwen/qwen3.8-max
    description: Code assistant using Atlas Cloud
    instruction: |
      You are an expert programmer.
      Write clean code and follow language best practices.
    toolsets:
      - type: filesystem
      - type: shell
      - type: think
```
@z
