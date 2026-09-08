%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

% __SUBDIR__ 対応

@x
title: "Provider Definitions"
description: "Define reusable provider configurations with shared defaults for any provider type — OpenAI, Anthropic, Google, Bedrock, and more."
keywords: docker agent, ai agents, model providers, llm, provider definitions
@y
title: "Provider Definitions"
description: "Define reusable provider configurations with shared defaults for any provider type — OpenAI, Anthropic, Google, Bedrock, and more."
keywords: docker agent, ai agents, model providers, llm, provider definitions
@z

@x
canonical: https://docs.docker.com/ai/docker-agent/providers/custom/
@y
canonical: __SUBDIR__/ai/docker-agent/providers/custom/
@z

@x
_Define reusable provider configurations with shared defaults for any provider type — OpenAI, Anthropic, Google, Bedrock, and more._
@y
_Define reusable provider configurations with shared defaults for any provider type — OpenAI, Anthropic, Google, Bedrock, and more._
@z

@x
## Overview
@y
## Overview
@z

@x
The `providers` section in your agent YAML lets you define named provider configurations that models can reference. This is useful for:
@y
The `providers` section in your agent YAML lets you define named provider configurations that models can reference. This is useful for:
@z

@x
- **Grouping shared defaults** — Set temperature, max_tokens, thinking_budget once and share across models
- **Custom endpoints** — Connect to self-hosted models, API proxies, or gateways
- **Centralizing credentials** — Define token_key once for all models using a provider
- **Any provider type** — Works with OpenAI, Anthropic, Google, Bedrock, and any OpenAI-compatible API
@y
- **Grouping shared defaults** — Set temperature, max_tokens, thinking_budget once and share across models
- **Custom endpoints** — Connect to self-hosted models, API proxies, or gateways
- **Centralizing credentials** — Define token_key once for all models using a provider
- **Any provider type** — Works with OpenAI, Anthropic, Google, Bedrock, and any OpenAI-compatible API
@z

@x
> [!NOTE]
> **Works with any provider**
>
> The `providers` section supports all provider types: `openai`, `anthropic`, `google`, `amazon-bedrock`, `dmr`, and any built-in alias. When the `provider` field is not set, it defaults to `openai` for backward compatibility.
@y
> [!NOTE]
> **Works with any provider**
>
> The `providers` section supports all provider types: `openai`, `anthropic`, `google`, `amazon-bedrock`, `dmr`, and any built-in alias. When the `provider` field is not set, it defaults to `openai` for backward compatibility.
@z

@x
## Configuration
@y
## Configuration
@z

@x
### OpenAI-compatible endpoint
@y
### OpenAI-compatible endpoint
@z

@x
```yaml
providers:
  my_gateway:
    base_url: https://api.example.com/v1
    token_key: MY_API_KEY
@y
```yaml
providers:
  my_gateway:
    base_url: https://api.example.com/v1
    token_key: MY_API_KEY
@z

@x
models:
  my_model:
    provider: my_gateway
    model: gpt-4o
@y
models:
  my_model:
    provider: my_gateway
    model: gpt-4o
@z

@x
agents:
  root:
    model: my_model
    instruction: You are a helpful assistant.
```
@y
agents:
  root:
    model: my_model
    instruction: You are a helpful assistant.
```
@z

@x
### Anthropic with shared defaults
@y
### Anthropic with shared defaults
@z

@x
```yaml
providers:
  my_anthropic:
    provider: anthropic
    token_key: MY_ANTHROPIC_KEY
    max_tokens: 16384
    thinking_budget: 8192
@y
```yaml
providers:
  my_anthropic:
    provider: anthropic
    token_key: MY_ANTHROPIC_KEY
    max_tokens: 16384
    thinking_budget: 8192
@z

@x
models:
  claude_smart:
    provider: my_anthropic
    model: claude-sonnet-4-5
    # Inherits max_tokens: 16384, thinking_budget: 8192
@y
models:
  claude_smart:
    provider: my_anthropic
    model: claude-sonnet-4-5
    # Inherits max_tokens: 16384, thinking_budget: 8192
@z

@x
  claude_fast:
    provider: my_anthropic
    model: claude-haiku-4-5
    thinking_budget: 1024  # Overrides provider default
@y
  claude_fast:
    provider: my_anthropic
    model: claude-haiku-4-5
    thinking_budget: 1024  # Overrides provider default
@z

@x
agents:
  root:
    model: claude_smart
    instruction: You are a helpful assistant.
```
@y
agents:
  root:
    model: claude_smart
    instruction: You are a helpful assistant.
```
@z

@x
### Google with shared temperature
@y
### Google with shared temperature
@z

@x
```yaml
providers:
  my_google:
    provider: google
    temperature: 0.3
@y
```yaml
providers:
  my_google:
    provider: google
    temperature: 0.3
@z

@x
models:
  gemini:
    provider: my_google
    model: gemini-2.5-flash
    # Inherits temperature: 0.3
@y
models:
  gemini:
    provider: my_google
    model: gemini-2.5-flash
    # Inherits temperature: 0.3
@z

@x
agents:
  root:
    model: gemini
    instruction: You are a helpful assistant.
```
@y
agents:
  root:
    model: gemini
    instruction: You are a helpful assistant.
```
@z

@x
## Provider Properties
@y
## Provider Properties
@z

@x
| Property              | Type       | Description                                                                           | Default                  |
| --------------------- | ---------- | ------------------------------------------------------------------------------------- | ------------------------ |
| `provider`            | string     | Underlying provider type: `openai`, `anthropic`, `google`, `amazon-bedrock`, `dmr`, etc. | `openai`                 |
| `api_type`            | string     | API schema: `openai_chatcompletions` or `openai_responses`. Only for OpenAI-compatible providers. When omitted, the API type is selected automatically based on the model name: newer models (gpt-4.1, o-series, gpt-5, Codex) default to `openai_responses`; all others default to `openai_chatcompletions`. | `auto (model-dependent)` |
| `base_url`            | string     | Base URL for the API endpoint. Required for OpenAI-compatible providers, optional for native providers. | —                        |
| `token_key`           | string     | Environment variable name containing the API token.                                   | —                        |
| `unload_api`          | string     | Optional path (or absolute URL) to the provider's model-unload endpoint. Used by the [`unload`](../../configuration/hooks/index.md#available-built-ins) built-in hook to release model resources between agent switches. Relative paths resolve against `base_url`'s scheme + host; absolute URLs are used verbatim. Today only Docker Model Runner ships a provider that calls this endpoint; cloud providers don't implement the underlying interface and the hook silently skips them. | —                        |
| `temperature`         | float      | Default sampling temperature (0.0–2.0).                                               | —                        |
| `max_tokens`          | int        | Default maximum response tokens.                                                      | —                        |
| `top_p`               | float      | Default nucleus sampling threshold (0.0–1.0).                                         | —                        |
| `frequency_penalty`   | float      | Default frequency penalty (-2.0–2.0).                                                 | —                        |
| `presence_penalty`    | float      | Default presence penalty (-2.0–2.0).                                                  | —                        |
| `parallel_tool_calls` | boolean    | Whether to enable parallel tool calls by default.                                     | —                        |
| `track_usage`         | boolean    | Whether to track token usage by default.                                              | —                        |
| `thinking_budget`     | string/int | Default reasoning effort/budget.                                                      | —                        |
| `task_budget`         | int/object | Default total token budget for an agentic task (forwarded to Anthropic; honored by Claude Opus 4.7 today). Integer shorthand or `{type: tokens, total: N}`. | —                        |
| `compaction_model`    | string     | Default model used for session compaction (summary generation) by agents whose model uses this provider. Named model or inline `provider/model` string. Agent-level and model-level `compaction_model` take precedence. | —                        |
| `provider_opts`       | object     | Provider-specific options passed through to the client.                               | —                        |
@y
| Property              | Type       | Description                                                                           | Default                  |
| --------------------- | ---------- | ------------------------------------------------------------------------------------- | ------------------------ |
| `provider`            | string     | Underlying provider type: `openai`, `anthropic`, `google`, `amazon-bedrock`, `dmr`, etc. | `openai`                 |
| `api_type`            | string     | API schema: `openai_chatcompletions` or `openai_responses`. Only for OpenAI-compatible providers. When omitted, the API type is selected automatically based on the model name: newer models (gpt-4.1, o-series, gpt-5, Codex) default to `openai_responses`; all others default to `openai_chatcompletions`. | `auto (model-dependent)` |
| `base_url`            | string     | Base URL for the API endpoint. Required for OpenAI-compatible providers, optional for native providers. | —                        |
| `token_key`           | string     | Environment variable name containing the API token.                                   | —                        |
| `unload_api`          | string     | Optional path (or absolute URL) to the provider's model-unload endpoint. Used by the [`unload`](../../configuration/hooks/index.md#available-built-ins) built-in hook to release model resources between agent switches. Relative paths resolve against `base_url`'s scheme + host; absolute URLs are used verbatim. Today only Docker Model Runner ships a provider that calls this endpoint; cloud providers don't implement the underlying interface and the hook silently skips them. | —                        |
| `temperature`         | float      | Default sampling temperature (0.0–2.0).                                               | —                        |
| `max_tokens`          | int        | Default maximum response tokens.                                                      | —                        |
| `top_p`               | float      | Default nucleus sampling threshold (0.0–1.0).                                         | —                        |
| `frequency_penalty`   | float      | Default frequency penalty (-2.0–2.0).                                                 | —                        |
| `presence_penalty`    | float      | Default presence penalty (-2.0–2.0).                                                  | —                        |
| `parallel_tool_calls` | boolean    | Whether to enable parallel tool calls by default.                                     | —                        |
| `track_usage`         | boolean    | Whether to track token usage by default.                                              | —                        |
| `thinking_budget`     | string/int | Default reasoning effort/budget.                                                      | —                        |
| `task_budget`         | int/object | Default total token budget for an agentic task (forwarded to Anthropic; honored by Claude Opus 4.7 today). Integer shorthand or `{type: tokens, total: N}`. | —                        |
| `compaction_model`    | string     | Default model used for session compaction (summary generation) by agents whose model uses this provider. Named model or inline `provider/model` string. Agent-level and model-level `compaction_model` take precedence. | —                        |
| `provider_opts`       | object     | Provider-specific options passed through to the client.                               | —                        |
@z

@x
## Default Inheritance
@y
## Default Inheritance
@z

@x
Models referencing a provider inherit all its defaults. Model-level settings always take precedence:
@y
Models referencing a provider inherit all its defaults. Model-level settings always take precedence:
@z

@x
```yaml
providers:
  my_anthropic:
    provider: anthropic
    token_key: MY_ANTHROPIC_KEY
    max_tokens: 16384
    temperature: 0.7
    thinking_budget: high
@y
```yaml
providers:
  my_anthropic:
    provider: anthropic
    token_key: MY_ANTHROPIC_KEY
    max_tokens: 16384
    temperature: 0.7
    thinking_budget: high
@z

@x
models:
  # Inherits everything from provider
  claude_default:
    provider: my_anthropic
    model: claude-sonnet-4-5
@y
models:
  # Inherits everything from provider
  claude_default:
    provider: my_anthropic
    model: claude-sonnet-4-5
@z

@x
  # Overrides temperature and thinking_budget, inherits the rest
  claude_custom:
    provider: my_anthropic
    model: claude-sonnet-4-5
    temperature: 0.2
    thinking_budget: low
```
@y
  # Overrides temperature and thinking_budget, inherits the rest
  claude_custom:
    provider: my_anthropic
    model: claude-sonnet-4-5
    temperature: 0.2
    thinking_budget: low
```
@z

@x
`compaction_model` works slightly differently: it is not merged into the model
but resolved per agent, with the agent-level `compaction_model` winning over
the model-level one, which wins over the provider-level default.
@y
`compaction_model` works slightly differently: it is not merged into the model
but resolved per agent, with the agent-level `compaction_model` winning over
the model-level one, which wins over the provider-level default.
@z

@x
## Shorthand Syntax
@y
## Shorthand Syntax
@z

@x
Once a provider is defined, you can use the shorthand `provider_name/model` syntax:
@y
Once a provider is defined, you can use the shorthand `provider_name/model` syntax:
@z

@x
```yaml
agents:
  root:
    model: my_gateway/gpt-4o-mini  # uses the provider's defaults
  researcher:
    model: my_anthropic/claude-sonnet-4-5  # uses anthropic provider defaults
```
@y
```yaml
agents:
  root:
    model: my_gateway/gpt-4o-mini  # uses the provider's defaults
  researcher:
    model: my_anthropic/claude-sonnet-4-5  # uses anthropic provider defaults
```
@z

@x
## API Types
@y
## API Types
@z

@x
Only applicable for OpenAI-compatible providers (when `provider` is `openai` or unset):
@y
Only applicable for OpenAI-compatible providers (when `provider` is `openai` or unset):
@z

@x
- **`openai_chatcompletions`** — Standard OpenAI Chat Completions API. Works with most OpenAI-compatible endpoints.
- **`openai_responses`** — OpenAI Responses API. For newer models that require the Responses API format.
@y
- **`openai_chatcompletions`** — Standard OpenAI Chat Completions API. Works with most OpenAI-compatible endpoints.
- **`openai_responses`** — OpenAI Responses API. For newer models that require the Responses API format.
@z

@x
> If `api_type` is not set, Docker Agent automatically selects the API type based on the model name. You only need to set `api_type` explicitly to override the detected default.
@y
> If `api_type` is not set, Docker Agent automatically selects the API type based on the model name. You only need to set `api_type` explicitly to override the detected default.
@z

@x
## Examples
@y
## Examples
@z

@x
### vLLM / Ollama
@y
### vLLM / Ollama
@z

@x
```yaml
providers:
  local_llm:
    base_url: http://localhost:8000/v1
@y
```yaml
providers:
  local_llm:
    base_url: http://localhost:8000/v1
@z

@x
agents:
  root:
    model: local_llm/llama-3.1-8b
```
@y
agents:
  root:
    model: local_llm/llama-3.1-8b
```
@z

@x
> [!NOTE]
> **Reasoning tokens from OpenAI-compatible providers**
>
> Models that stream reasoning under `delta.reasoning` (e.g. Qwen3 served via OVHcloud AI Endpoints, OpenRouter, or a self-hosted vLLM / SGLang deployment) are fully supported. Docker Agent reads both the `delta.reasoning_content` and `delta.reasoning` fields from the stream, so thinking blocks are captured and shown in the TUI regardless of which field the server uses.
@y
> [!NOTE]
> **Reasoning tokens from OpenAI-compatible providers**
>
> Models that stream reasoning under `delta.reasoning` (e.g. Qwen3 served via OVHcloud AI Endpoints, OpenRouter, or a self-hosted vLLM / SGLang deployment) are fully supported. Docker Agent reads both the `delta.reasoning_content` and `delta.reasoning` fields from the stream, so thinking blocks are captured and shown in the TUI regardless of which field the server uses.
@z

@x
### API Router (Requesty, LiteLLM)
@y
### API Router (Requesty, LiteLLM)
@z

@x
```yaml
providers:
  router:
    base_url: https://router.requesty.ai/v1
    token_key: REQUESTY_API_KEY
@y
```yaml
providers:
  router:
    base_url: https://router.requesty.ai/v1
    token_key: REQUESTY_API_KEY
@z

@x
agents:
  root:
    model: router/anthropic/claude-sonnet-4-5
```
@y
agents:
  root:
    model: router/anthropic/claude-sonnet-4-5
```
@z

@x
### Azure OpenAI
@y
### Azure OpenAI
@z

@x
```yaml
models:
  azure_model:
    provider: azure
    model: gpt-4o
    base_url: https://your-llm.openai.azure.com
    provider_opts:
      api_version: 2024-12-01-preview
```
@y
```yaml
models:
  azure_model:
    provider: azure
    model: gpt-4o
    base_url: https://your-llm.openai.azure.com
    provider_opts:
      api_version: 2024-12-01-preview
```
@z

@x
### Anthropic Team Setup
@y
### Anthropic Team Setup
@z

@x
```yaml
providers:
  team_anthropic:
    provider: anthropic
    token_key: TEAM_ANTHROPIC_KEY
    max_tokens: 32768
    thinking_budget: high
    temperature: 0.5
@y
```yaml
providers:
  team_anthropic:
    provider: anthropic
    token_key: TEAM_ANTHROPIC_KEY
    max_tokens: 32768
    thinking_budget: high
    temperature: 0.5
@z

@x
models:
  architect:
    provider: team_anthropic
    model: claude-sonnet-4-5
@y
models:
  architect:
    provider: team_anthropic
    model: claude-sonnet-4-5
@z

@x
  reviewer:
    provider: team_anthropic
    model: claude-haiku-4-5
    thinking_budget: low  # faster reviews
@y
  reviewer:
    provider: team_anthropic
    model: claude-haiku-4-5
    thinking_budget: low  # faster reviews
@z

@x
agents:
  root:
    model: architect
    sub_agents: [code_reviewer]
  code_reviewer:
    model: reviewer
```
@y
agents:
  root:
    model: architect
    sub_agents: [code_reviewer]
  code_reviewer:
    model: reviewer
```
@z

@x
### Multi-Provider with Shared Defaults
@y
### Multi-Provider with Shared Defaults
@z

@x
```yaml
providers:
  fast_openai:
    base_url: https://api.openai.com/v1
    token_key: OPENAI_API_KEY
    temperature: 0.3
    max_tokens: 8192
@y
```yaml
providers:
  fast_openai:
    base_url: https://api.openai.com/v1
    token_key: OPENAI_API_KEY
    temperature: 0.3
    max_tokens: 8192
@z

@x
  smart_anthropic:
    provider: anthropic
    token_key: ANTHROPIC_API_KEY
    max_tokens: 64000
    thinking_budget: high
@y
  smart_anthropic:
    provider: anthropic
    token_key: ANTHROPIC_API_KEY
    max_tokens: 64000
    thinking_budget: high
@z

@x
agents:
  root:
    model: smart_anthropic/claude-sonnet-4-5
    sub_agents: [helper]
  helper:
    model: fast_openai/gpt-4o-mini
```
@y
agents:
  root:
    model: smart_anthropic/claude-sonnet-4-5
    sub_agents: [helper]
  helper:
    model: fast_openai/gpt-4o-mini
```
@z

@x
## Global Providers (User Configuration)
@y
## Global Providers (User Configuration)
@z

@x
Providers defined in an agent file only apply to that file. To make a custom
provider available to every command (`docker agent run`, `new`, `models`, ...),
define it once in your user configuration (`~/.config/cagent/config.yaml`)
under the same `providers` key:
@y
Providers defined in an agent file only apply to that file. To make a custom
provider available to every command (`docker agent run`, `new`, `models`, ...),
define it once in your user configuration (`~/.config/cagent/config.yaml`)
under the same `providers` key:
@z

@x
```yaml
# ~/.config/cagent/config.yaml
providers:
  myprovider:
    base_url: https://llm.corp.example.com/v1
    api_type: openai_chatcompletions
    token_key: MYPROVIDER_API_KEY
```
@y
```yaml
# ~/.config/cagent/config.yaml
providers:
  myprovider:
    base_url: https://llm.corp.example.com/v1
    api_type: openai_chatcompletions
    token_key: MYPROVIDER_API_KEY
```
@z

@x
The easiest way to register one is the interactive wizard:
@y
The easiest way to register one is the interactive wizard:
@z

@x
```bash
docker agent setup
# pick "3. Custom OpenAI-compatible endpoint", then enter the base URL,
# API format, and the environment variable holding the API key
```
@y
```bash
docker agent setup
# pick "3. Custom OpenAI-compatible endpoint", then enter the base URL,
# API format, and the environment variable holding the API key
```
@z

@x
Once registered, the provider works everywhere:
@y
Once registered, the provider works everywhere:
@z

@x
```bash
docker agent models --provider myprovider   # list the endpoint's models
docker agent new --model myprovider/mymodel # build agents with it
docker agent run --model myprovider/mymodel # chat with it
```
@y
```bash
docker agent models --provider myprovider   # list the endpoint's models
docker agent new --model myprovider/mymodel # build agents with it
docker agent run --model myprovider/mymodel # chat with it
```
@z

@x
Global providers are merged into every loaded agent configuration; when an
agent file defines a provider with the same name, the agent file wins. Note
that automatic model selection (`model: auto`) never picks a custom provider,
so reference its models explicitly with `--model <name>/<model>` or
`default_model`.
@y
Global providers are merged into every loaded agent configuration; when an
agent file defines a provider with the same name, the agent file wins. Note
that automatic model selection (`model: auto`) never picks a custom provider,
so reference its models explicitly with `--model <name>/<model>` or
`default_model`.
@z

@x
## How It Works
@y
## How It Works
@z

@x
When you reference a provider:
@y
When you reference a provider:
@z

@x
1. The provider's `provider` field determines which API client to use (defaults to `openai`)
2. The provider's `base_url` and `token_key` are applied to the model (if not already set on the model)
3. All model-level defaults (temperature, max_tokens, thinking_budget, etc.) are inherited (model settings take precedence)
4. For OpenAI-compatible providers, the `api_type` is stored in `provider_opts.api_type`
5. The model is used with the appropriate API client
@y
1. The provider's `provider` field determines which API client to use (defaults to `openai`)
2. The provider's `base_url` and `token_key` are applied to the model (if not already set on the model)
3. All model-level defaults (temperature, max_tokens, thinking_budget, etc.) are inherited (model settings take precedence)
4. For OpenAI-compatible providers, the `api_type` is stored in `provider_opts.api_type`
5. The model is used with the appropriate API client
@z

@x
A provider with a `base_url` implies `bypass_models_gateway: true` for every
model that references it: user-chosen endpoints are never routed through a
configured models gateway, and such models authenticate with the provider's
own credentials (`token_key`). See
[Gateway Bypass](../../configuration/models/index.md#gateway-bypass).
@y
A provider with a `base_url` implies `bypass_models_gateway: true` for every
model that references it: user-chosen endpoints are never routed through a
configured models gateway, and such models authenticate with the provider's
own credentials (`token_key`). See
[Gateway Bypass](../../configuration/models/index.md#gateway-bypass).
@z
