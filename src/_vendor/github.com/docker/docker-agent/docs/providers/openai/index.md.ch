%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

% __SUBDIR__ 対応

@x
title: "OpenAI"
description: "Use GPT-5.6, GPT-4o, GPT-5, GPT-5-mini, and other OpenAI models with Docker Agent."
keywords: docker agent, ai agents, model providers, llm, openai
@y
title: "OpenAI"
description: "Use GPT-5.6, GPT-4o, GPT-5, GPT-5-mini, and other OpenAI models with Docker Agent."
keywords: docker agent, ai agents, model providers, llm, openai
@z

@x
canonical: https://docs.docker.com/ai/docker-agent/providers/openai/
@y
canonical: __SUBDIR__/ai/docker-agent/providers/openai/
@z

@x
_Use GPT-5.6, GPT-4o, GPT-5, GPT-5-mini, and other OpenAI models with Docker Agent._
@y
_Use GPT-5.6, GPT-4o, GPT-5, GPT-5-mini, and other OpenAI models with Docker Agent._
@z

@x
## Setup
@y
## Setup
@z

@x
```bash
# Set your API key
export OPENAI_API_KEY="sk-..."
```
@y
```bash
# Set your API key
export OPENAI_API_KEY="sk-..."
```
@z

@x
> [!TIP]
> No API key? A ChatGPT Plus/Pro/Business subscription can be used instead
> through the [`chatgpt` provider](../chatgpt/index.md): sign in once with
> `docker agent setup` (pick chatgpt).
@y
> [!TIP]
> No API key? A ChatGPT Plus/Pro/Business subscription can be used instead
> through the [`chatgpt` provider](../chatgpt/index.md): sign in once with
> `docker agent setup` (pick chatgpt).
@z

@x
## Configuration
@y
## Configuration
@z

@x
### Inline
@y
### Inline
@z

@x
```yaml
agents:
  root:
    model: openai/gpt-5.6
```
@y
```yaml
agents:
  root:
    model: openai/gpt-5.6
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
  gpt:
    provider: openai
    model: gpt-5.6
    max_tokens: 4000
```
@y
```yaml
models:
  gpt:
    provider: openai
    model: gpt-5.6
    max_tokens: 4000
```
@z

@x
## Available Models
@y
## Available Models
@z

@x
| Model            | Best For                                             |
| ---------------- | ----------------------------------------------------- |
| `gpt-5.6`         | Alias for `gpt-5.6-sol`; tracks the flagship model    |
| `gpt-5.6-sol`     | Frontier model, most capable, complex reasoning       |
| `gpt-5.6-terra`   | Everyday workhorse; successor to the `-mini` tier     |
| `gpt-5.6-luna`    | High-volume, cost-efficient; successor to `-nano` tier |
| `gpt-5`           | Previous-generation flagship                          |
| `gpt-5-mini`      | Previous-generation fast, cost-effective model        |
| `gpt-4o`          | Multimodal, balanced performance                      |
| `gpt-4o-mini`     | Cheapest, fast for simple tasks                       |
@y
| Model            | Best For                                             |
| ---------------- | ----------------------------------------------------- |
| `gpt-5.6`         | Alias for `gpt-5.6-sol`; tracks the flagship model    |
| `gpt-5.6-sol`     | Frontier model, most capable, complex reasoning       |
| `gpt-5.6-terra`   | Everyday workhorse; successor to the `-mini` tier     |
| `gpt-5.6-luna`    | High-volume, cost-efficient; successor to `-nano` tier |
| `gpt-5`           | Previous-generation flagship                          |
| `gpt-5-mini`      | Previous-generation fast, cost-effective model        |
| `gpt-4o`          | Multimodal, balanced performance                      |
| `gpt-4o-mini`     | Cheapest, fast for simple tasks                       |
@z

@x
Starting with GPT-5.6, OpenAI renamed the `-mini`/`-nano` size tiers to `-terra`/`-luna` (with `-sol` denoting the frontier tier previously left unsuffixed).
@y
Starting with GPT-5.6, OpenAI renamed the `-mini`/`-nano` size tiers to `-terra`/`-luna` (with `-sol` denoting the frontier tier previously left unsuffixed).
@z

@x
Find more model names at [modelnames.ai](https://modelnames.ai/) or in the [official OpenAI docs](https://platform.openai.com/docs/models).
@y
Find more model names at [modelnames.ai](https://modelnames.ai/) or in the [official OpenAI docs](https://platform.openai.com/docs/models).
@z

@x
## Thinking Budget
@y
## Thinking Budget
@z

@x
OpenAI reasoning models (o-series, gpt-5, gpt-5-mini, gpt-5.6 family) support extended thinking through the `reasoning_effort` API parameter. Set `thinking_budget` to control the effort level:
@y
OpenAI reasoning models (o-series, gpt-5, gpt-5-mini, gpt-5.6 family) support extended thinking through the `reasoning_effort` API parameter. Set `thinking_budget` to control the effort level:
@z

@x
```yaml
models:
  gpt-thinker:
    provider: openai
    model: gpt-5.6
    thinking_budget: high   # none | minimal | low | medium | high | xhigh | max
```
@y
```yaml
models:
  gpt-thinker:
    provider: openai
    model: gpt-5.6
    thinking_budget: high   # none | minimal | low | medium | high | xhigh | max
```
@z

@x
**Effort levels:**
@y
**Effort levels:**
@z

@x
| Level     | Description                                              |
| --------- | -------------------------------------------------------- |
| `none`    | No reasoning. On `gpt-5.6`+ this is a real API value that is sent as-is; on older models it just disables the local `thinking_budget` (the API's own default still applies). |
| `minimal` | Fastest; lightest reasoning pass. Not accepted on `gpt-5.6`+ (dropped from the API). |
| `low`     | Quick reasoning for straightforward tasks.               |
| `medium`  | Balanced default.                                        |
| `high`    | More thorough; recommended for complex tasks.            |
| `xhigh`   | Near-maximum effort; slower but most accurate. Requires `gpt-5.2`+. |
| `max`     | Maximum effort. Requires `gpt-5.6`+ (Sol/Terra/Luna).    |
@y
| Level     | Description                                              |
| --------- | -------------------------------------------------------- |
| `none`    | No reasoning. On `gpt-5.6`+ this is a real API value that is sent as-is; on older models it just disables the local `thinking_budget` (the API's own default still applies). |
| `minimal` | Fastest; lightest reasoning pass. Not accepted on `gpt-5.6`+ (dropped from the API). |
| `low`     | Quick reasoning for straightforward tasks.               |
| `medium`  | Balanced default.                                        |
| `high`    | More thorough; recommended for complex tasks.            |
| `xhigh`   | Near-maximum effort; slower but most accurate. Requires `gpt-5.2`+. |
| `max`     | Maximum effort. Requires `gpt-5.6`+ (Sol/Terra/Luna).    |
@z

@x
Token counts, `adaptive`, and `adaptive/<effort>` are rejected with a configuration error at request time. Older models (o1, o3-mini) only accept `low`/`medium`/`high`; `xhigh` requires `gpt-5.2`+; `none` and `max` require `gpt-5.6`+; `minimal` is not accepted on `gpt-5.6`+.
@y
Token counts, `adaptive`, and `adaptive/<effort>` are rejected with a configuration error at request time. Older models (o1, o3-mini) only accept `low`/`medium`/`high`; `xhigh` requires `gpt-5.2`+; `none` and `max` require `gpt-5.6`+; `minimal` is not accepted on `gpt-5.6`+.
@z

@x
> [!WARNING]
> **Hidden reasoning tokens**
>
> OpenAI reasoning models always produce hidden reasoning tokens that count against `max_tokens` — even with `thinking_budget: none` on older models. Docker Agent automatically raises the output-token floor for its internal low-effort calls so reasoning cannot starve visible text output.
@y
> [!WARNING]
> **Hidden reasoning tokens**
>
> OpenAI reasoning models always produce hidden reasoning tokens that count against `max_tokens` — even with `thinking_budget: none` on older models. Docker Agent automatically raises the output-token floor for its internal low-effort calls so reasoning cannot starve visible text output.
@z

@x
See the [Thinking / Reasoning guide](../../guides/thinking/index.md) for a cross-provider overview.
@y
See the [Thinking / Reasoning guide](../../guides/thinking/index.md) for a cross-provider overview.
@z

@x
> [!TIP]
> **Custom endpoints**
>
> Use `base_url` for proxies and OpenAI-compatible services. See [Custom Providers](../custom/index.md) for full setup.
@y
> [!TIP]
> **Custom endpoints**
>
> Use `base_url` for proxies and OpenAI-compatible services. See [Custom Providers](../custom/index.md) for full setup.
@z

@x
## Custom Endpoint
@y
## Custom Endpoint
@z

@x
Use `base_url` to connect to OpenAI-compatible APIs:
@y
Use `base_url` to connect to OpenAI-compatible APIs:
@z

@x
```yaml
models:
  custom:
    provider: openai
    model: gpt-5-mini
    base_url: https://your-proxy.example.com/v1
```
@y
```yaml
models:
  custom:
    provider: openai
    model: gpt-5-mini
    base_url: https://your-proxy.example.com/v1
```
@z

@x
## WebSocket Transport
@y
## WebSocket Transport
@z

@x
For OpenAI Responses API models (gpt-4.1+, o-series, gpt-5), you can use WebSocket streaming instead of the default SSE (Server-Sent Events):
@y
For OpenAI Responses API models (gpt-4.1+, o-series, gpt-5), you can use WebSocket streaming instead of the default SSE (Server-Sent Events):
@z

@x
```yaml
models:
  fast-gpt:
    provider: openai
    model: gpt-4.1
    provider_opts:
      transport: websocket  # Use WebSocket instead of SSE
```
@y
```yaml
models:
  fast-gpt:
    provider: openai
    model: gpt-4.1
    provider_opts:
      transport: websocket  # Use WebSocket instead of SSE
```
@z

@x
### Benefits
@y
### Benefits
@z

@x
- **~40% faster** for workflows with 20+ tool calls
- **Persistent connection** reduces per-turn overhead
- **Server-side caching** of connection state
- **Automatic fallback** to SSE if WebSocket fails
@y
- **~40% faster** for workflows with 20+ tool calls
- **Persistent connection** reduces per-turn overhead
- **Server-side caching** of connection state
- **Automatic fallback** to SSE if WebSocket fails
@z

@x
### Requirements
@y
### Requirements
@z

@x
- Only works with Responses API models: `gpt-4.1+`, `o1`, `o3`, `o4`, `gpt-5`
- NOT compatible with the `--models-gateway` flag (automatically falls back to SSE when a gateway is configured)
- Requires `OPENAI_API_KEY` environment variable
@y
- Only works with Responses API models: `gpt-4.1+`, `o1`, `o3`, `o4`, `gpt-5`
- NOT compatible with the `--models-gateway` flag (automatically falls back to SSE when a gateway is configured)
- Requires `OPENAI_API_KEY` environment variable
@z

@x
### Example
@y
### Example
@z

@x
See [`examples/websocket_transport.yaml`](https://github.com/docker/docker-agent/blob/main/examples/websocket_transport.yaml) for a complete example.
@y
See [`examples/websocket_transport.yaml`](https://github.com/docker/docker-agent/blob/main/examples/websocket_transport.yaml) for a complete example.
@z
