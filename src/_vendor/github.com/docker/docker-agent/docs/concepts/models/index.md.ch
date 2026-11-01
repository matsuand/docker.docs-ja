%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

% __SUBDIR__ 対応

@x
title: "Models"
description: "Models are the AI brains behind your agents. Docker Agent supports multiple providers and flexible configuration."
keywords: docker agent, ai agents, concepts, models
@y
title: "Models"
description: "Models are the AI brains behind your agents. Docker Agent supports multiple providers and flexible configuration."
keywords: docker agent, ai agents, concepts, models
@z

@x
canonical: https://docs.docker.com/ai/docker-agent/concepts/models/
@y
canonical: __SUBDIR__/ai/docker-agent/concepts/models/
@z

@x
_Models are the AI brains behind your agents. Docker Agent supports multiple providers and flexible configuration._
@y
_Models are the AI brains behind your agents. Docker Agent supports multiple providers and flexible configuration._
@z

@x
## Inline vs. Named Models
@y
## Inline vs. Named Models
@z

@x
There are two ways to assign a model to an agent:
@y
There are two ways to assign a model to an agent:
@z

@x
### Inline (Quick)
@y
### Inline (Quick)
@z

@x
Use the `provider/model` shorthand directly in the agent definition:
@y
Use the `provider/model` shorthand directly in the agent definition:
@z

@x
```yaml
agents:
  root:
    model: openai/gpt-5
    instruction: You are a helpful assistant.
```
@y
```yaml
agents:
  root:
    model: openai/gpt-5
    instruction: You are a helpful assistant.
```
@z

@x
### Named (Full Control)
@y
### Named (Full Control)
@z

@x
Define models in a `models` section and reference them by name:
@y
Define models in a `models` section and reference them by name:
@z

@x
```yaml
models:
  claude:
    provider: anthropic
    model: claude-sonnet-4-5
    max_tokens: 64000
    temperature: 0.7
@y
```yaml
models:
  claude:
    provider: anthropic
    model: claude-sonnet-4-5
    max_tokens: 64000
    temperature: 0.7
@z

@x
agents:
  root:
    model: claude
    instruction: You are a helpful assistant.
```
@y
agents:
  root:
    model: claude
    instruction: You are a helpful assistant.
```
@z

@x
Named models let you configure temperature, token limits, thinking budgets, and other parameters. They're also reusable across multiple agents.
@y
Named models let you configure temperature, token limits, thinking budgets, and other parameters. They're also reusable across multiple agents.
@z

@x
## First Available Models
@y
## First Available Models
@z

@x
A named model can also select the first usable model from a priority list. This
is useful for shared configs that should prefer paid cloud models when their API
keys are present, but still work with a local fallback:
@y
A named model can also select the first usable model from a priority list. This
is useful for shared configs that should prefer paid cloud models when their API
keys are present, but still work with a local fallback:
@z

@x
```yaml
models:
  smart:
    first_available:
      - anthropic/claude-sonnet-4-5
      - openai/gpt-5
      - dmr/ai/qwen3
@y
```yaml
models:
  smart:
    first_available:
      - anthropic/claude-sonnet-4-5
      - openai/gpt-5
      - dmr/ai/qwen3
@z

@x
agents:
  root:
    model: smart
    instruction: You are a helpful assistant.
```
@y
agents:
  root:
    model: smart
    instruction: You are a helpful assistant.
```
@z

@x
At load time, Docker Agent selects the first candidate whose credentials are
configured. You only need credentials for one candidate. See
[Model Configuration](../../configuration/models/index.md#first-available-models)
for details.
@y
At load time, Docker Agent selects the first candidate whose credentials are
configured. You only need credentials for one candidate. See
[Model Configuration](../../configuration/models/index.md#first-available-models)
for details.
@z

@x
## Supported Providers
@y
## Supported Providers
@z

@x
See [Model Providers](../../providers/overview/index.md) for provider comparisons and the complete [provider keys and credentials table](../../providers/overview/index.md#provider-credentials). Each provider's page covers its models and setup.
@y
See [Model Providers](../../providers/overview/index.md) for provider comparisons and the complete [provider keys and credentials table](../../providers/overview/index.md#provider-credentials). Each provider's page covers its models and setup.
@z

@x
## Model Properties
@y
## Model Properties
@z

@x
| Property            | Type       | Description                                       |
| ------------------- | ---------- | ------------------------------------------------- |
| `provider`          | string     | Provider identifier (required)                    |
| `model`             | string     | Model name (required)                             |
| `description`       | string     | Human-readable summary of the model's purpose     |
| `temperature`       | float      | Randomness: 0.0 (deterministic) to 1.0 (creative) |
| `max_tokens`        | int        | Maximum response length                           |
| `top_p`             | float      | Nucleus sampling: 0.0 to 1.0                      |
| `frequency_penalty` | float      | Reduce repetition: 0.0 to 2.0                     |
| `presence_penalty`  | float      | Encourage topic diversity: 0.0 to 2.0             |
| `base_url`          | string     | Custom API endpoint                               |
| `thinking_budget`   | string/int | Reasoning effort configuration                    |
| `task_budget`       | int/object | Total token budget for an agentic task (Anthropic; honored by Opus 4.7 today) |
| `provider_opts`     | object     | Provider-specific options                         |
@y
| Property            | Type       | Description                                       |
| ------------------- | ---------- | ------------------------------------------------- |
| `provider`          | string     | Provider identifier (required)                    |
| `model`             | string     | Model name (required)                             |
| `description`       | string     | Human-readable summary of the model's purpose     |
| `temperature`       | float      | Randomness: 0.0 (deterministic) to 1.0 (creative) |
| `max_tokens`        | int        | Maximum response length                           |
| `top_p`             | float      | Nucleus sampling: 0.0 to 1.0                      |
| `frequency_penalty` | float      | Reduce repetition: 0.0 to 2.0                     |
| `presence_penalty`  | float      | Encourage topic diversity: 0.0 to 2.0             |
| `base_url`          | string     | Custom API endpoint                               |
| `thinking_budget`   | string/int | Reasoning effort configuration                    |
| `task_budget`       | int/object | Total token budget for an agentic task (Anthropic; honored by Opus 4.7 today) |
| `provider_opts`     | object     | Provider-specific options                         |
@z

@x
## Reasoning / Thinking Budget
@y
## Reasoning / Thinking Budget
@z

@x
Control how much the model "thinks" before responding:
@y
Control how much the model "thinks" before responding:
@z

@x
| Provider   | Format     | Values                                                              | Default                          |
| ---------- | ---------- | ------------------------------------------------------------------- | -------------------------------- |
| OpenAI     | string     | `minimal`, `low`, `medium`, `high`, `xhigh`, `max`                  | `medium` (always-reasoning models only) |
| Anthropic  | int or str | 1024–32768 tokens, or `adaptive`, `adaptive/<effort>`, effort level | off                              |
| Gemini 2.5 | int        | 0 (off), -1 (dynamic), or token count                               | -1 (dynamic)                     |
| Gemini 3   | string     | `minimal`, `low`, `medium`, `high`                                  | varies                           |
| All        | string/int | `none` or `0` clears Docker Agent's local config                    | —                                |
@y
| Provider   | Format     | Values                                                              | Default                          |
| ---------- | ---------- | ------------------------------------------------------------------- | -------------------------------- |
| OpenAI     | string     | `minimal`, `low`, `medium`, `high`, `xhigh`, `max`                  | `medium` (always-reasoning models only) |
| Anthropic  | int or str | 1024–32768 tokens, or `adaptive`, `adaptive/<effort>`, effort level | off                              |
| Gemini 2.5 | int        | 0 (off), -1 (dynamic), or token count                               | -1 (dynamic)                     |
| Gemini 3   | string     | `minimal`, `low`, `medium`, `high`                                  | varies                           |
| All        | string/int | `none` or `0` clears Docker Agent's local config                    | —                                |
@z

@x
`none` and `0` are not universal API-level disable switches. On genuine OpenAI
endpoints running GPT-5.x from 5.6 onward or GPT-6 Sol/Luna, `none` is a real
`reasoning_effort` value that Docker Agent sends as-is and the model does not
reason. On GPT-6 Astra and older OpenAI models, `none`/`0` only clear the local `thinking_budget` — omitting the field
has the same effect — and the model falls back to the API's own default effort
(still reasoning internally for always-reasoning models like the o-series).
Providers with a true optional-thinking switch (Gemini 2.5, Claude, local
models) are fully disabled by `none`/`0`. See the
[Thinking / Reasoning guide](../../guides/thinking/index.md#disabling-thinking)
for the full per-provider breakdown.
@y
`none` and `0` are not universal API-level disable switches. On genuine OpenAI
endpoints running GPT-5.x from 5.6 onward or GPT-6 Sol/Luna, `none` is a real
`reasoning_effort` value that Docker Agent sends as-is and the model does not
reason. On GPT-6 Astra and older OpenAI models, `none`/`0` only clear the local `thinking_budget` — omitting the field
has the same effect — and the model falls back to the API's own default effort
(still reasoning internally for always-reasoning models like the o-series).
Providers with a true optional-thinking switch (Gemini 2.5, Claude, local
models) are fully disabled by `none`/`0`. See the
[Thinking / Reasoning guide](../../guides/thinking/index.md#disabling-thinking)
for the full per-provider breakdown.
@z

@x
```yaml
models:
  deep-thinker:
    provider: anthropic
    model: claude-sonnet-4-5
    thinking_budget: 16384
@y
```yaml
models:
  deep-thinker:
    provider: anthropic
    model: claude-sonnet-4-5
    thinking_budget: 16384
@z

@x
  fast-responder:
    provider: openai
    model: gpt-5.6
    thinking_budget: none # real API-level disable on gpt-5.6
```
@y
  fast-responder:
    provider: openai
    model: gpt-5.6
    thinking_budget: none # real API-level disable on gpt-5.6
```
@z

@x
> [!NOTE]
> **Multi-provider teams**
>
> Different agents can use different providers in the same config. See [Multi-Agent](../multi-agent/index.md) for patterns.
@y
> [!NOTE]
> **Multi-provider teams**
>
> Different agents can use different providers in the same config. See [Multi-Agent](../multi-agent/index.md) for patterns.
@z

@x
## Alloy Models
@y
## Alloy Models
@z

@x
"Alloy models" let you use more than one model in the same conversation — Docker Agent alternates between them to leverage the strengths of each:
@y
"Alloy models" let you use more than one model in the same conversation — Docker Agent alternates between them to leverage the strengths of each:
@z

@x
```yaml
agents:
  root:
    model: anthropic/claude-sonnet-4-5,openai/gpt-5
    instruction: You are a helpful assistant.
```
@y
```yaml
agents:
  root:
    model: anthropic/claude-sonnet-4-5,openai/gpt-5
    instruction: You are a helpful assistant.
```
@z

@x
Read more about the alloy model concept at [xbow.com/blog/alloy-agents](https://xbow.com/blog/alloy-agents).
@y
Read more about the alloy model concept at [xbow.com/blog/alloy-agents](https://xbow.com/blog/alloy-agents).
@z
