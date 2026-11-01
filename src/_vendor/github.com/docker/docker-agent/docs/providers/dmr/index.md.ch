%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

% __SUBDIR__ 対応

@x
title: "Docker Model Runner"
description: "Run AI models locally with Docker — no API keys, no costs, full data privacy."
keywords: docker agent, ai agents, model providers, llm, docker model runner
@y
title: "Docker Model Runner"
description: "Run AI models locally with Docker — no API keys, no costs, full data privacy."
keywords: docker agent, ai agents, model providers, llm, docker model runner
@z

@x
canonical: https://docs.docker.com/ai/docker-agent/providers/dmr/
@y
canonical: __SUBDIR__/ai/docker-agent/providers/dmr/
@z

@x
_Run AI models locally with Docker — no API keys, no costs, full data privacy._
@y
_Run AI models locally with Docker — no API keys, no costs, full data privacy._
@z

@x
## Overview
@y
## Overview
@z

@x
Docker Model Runner (DMR) lets you run open-source AI models directly on your machine. Models run in Docker, so there's no API key needed; with a local runner, prompts stay on your computer.
@y
Docker Model Runner (DMR) lets you run open-source AI models directly on your machine. Models run in Docker, so there's no API key needed; with a local runner, prompts stay on your computer.
@z

@x
Docker Agent automatically discovers models you have already pulled from DMR. When no model is explicitly configured, auto-selection prefers a locally-installed model (choosing the model specified via the `model:` key in the agent YAML if it is already pulled locally, or otherwise the first available non-embedding model) rather than always defaulting to `ai/qwen3:latest` and triggering a pull prompt.
@y
Docker Agent automatically discovers models you have already pulled from DMR. When no model is explicitly configured, auto-selection prefers a locally-installed model (choosing the model specified via the `model:` key in the agent YAML if it is already pulled locally, or otherwise the first available non-embedding model) rather than always defaulting to `ai/qwen3:latest` and triggering a pull prompt.
@z

@x
> [!TIP]
> **No API key needed**
>
> With a local DMR endpoint, your data stays on your machine. Great for development, sensitive data, or offline use.
@y
> [!TIP]
> **No API key needed**
>
> With a local DMR endpoint, your data stays on your machine. Great for development, sensitive data, or offline use.
@z

@x
## Prerequisites
@y
## Prerequisites
@z

@x
- [Docker Desktop](https://www.docker.com/products/docker-desktop/) with the Model Runner feature enabled
- Verify with: `docker model status --json`
@y
- [Docker Desktop](https://www.docker.com/products/docker-desktop/) with the Model Runner feature enabled
- Verify with: `docker model status --json`
@z

@x
## Connection selection
@y
## Connection selection
@z

@x
For Docker Desktop, `docker agent doctor` and DMR-backed agents use the Docker
connection selected by the CLI, including `--context`, `--host`,
`DOCKER_CONTEXT`, and `DOCKER_HOST`. Requests go through that engine's socket;
enabling the
legacy `/var/run/docker.sock` symlink is not required.
@y
For Docker Desktop, `docker agent doctor` and DMR-backed agents use the Docker
connection selected by the CLI, including `--context`, `--host`,
`DOCKER_CONTEXT`, and `DOCKER_HOST`. Requests go through that engine's socket;
enabling the
legacy `/var/run/docker.sock` symlink is not required.
@z

@x
```console
docker --context desktop-linux agent doctor
```
@y
```console
docker --context desktop-linux agent doctor
```
@z

@x
The standalone `docker-agent` binary uses Docker's environment variables and
current context. Status, model inspection, and pulls use the same selection.
A failed selected Desktop connection is not replaced with a local runner.
@y
The standalone `docker-agent` binary uses Docker's environment variables and
current context. Status, model inspection, and pulls use the same selection.
A failed selected Desktop connection is not replaced with a local runner.
@z

@x
An explicit model `base_url` or `MODEL_RUNNER_HOST` bypasses local discovery;
a models gateway also bypasses it for inference. If you select a remote engine,
URL, or gateway, prompts are sent there rather than staying on your machine.
@y
An explicit model `base_url` or `MODEL_RUNNER_HOST` bypasses local discovery;
a models gateway also bypasses it for inference. If you select a remote engine,
URL, or gateway, prompts are sent there rather than staying on your machine.
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
    model: dmr/ai/qwen3
```
@y
```yaml
agents:
  root:
    model: dmr/ai/qwen3
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
  local:
    provider: dmr
    model: ai/qwen3
    max_tokens: 8192
```
@y
```yaml
models:
  local:
    provider: dmr
    model: ai/qwen3
    max_tokens: 8192
```
@z

@x
## Available Models
@y
## Available Models
@z

@x
Any model available through Docker Model Runner can be used. Common options:
@y
Any model available through Docker Model Runner can be used. Common options:
@z

@x
| Model         | Description                                           |
| ------------- | ----------------------------------------------------- |
| `ai/qwen3`    | Qwen 3 — versatile, good for coding and general tasks |
| `ai/llama3.2` | Llama 3.2 — Meta's open-source model                  |
@y
| Model         | Description                                           |
| ------------- | ----------------------------------------------------- |
| `ai/qwen3`    | Qwen 3 — versatile, good for coding and general tasks |
| `ai/llama3.2` | Llama 3.2 — Meta's open-source model                  |
@z

@x
## Extra Request Body
@y
## Extra Request Body
@z

@x
Use [`provider_opts.extra_body`](../../configuration/models/index.md#extra-request-body)
to send backend-specific fields on each Chat Completions request. For example,
`extra_body: {chat_template_kwargs: {enable_thinking: false}}` disables thinking
when the engine and model template support it. These fields are not sent to the
model-wide `_configure` endpoint.
@y
Use [`provider_opts.extra_body`](../../configuration/models/index.md#extra-request-body)
to send backend-specific fields on each Chat Completions request. For example,
`extra_body: {chat_template_kwargs: {enable_thinking: false}}` disables thinking
when the engine and model template support it. These fields are not sent to the
model-wide `_configure` endpoint.
@z

@x
## Runtime Flags
@y
## Runtime Flags
@z

@x
Pass flags to the underlying inference runtime (e.g., llama.cpp) using `provider_opts.runtime_flags`:
@y
Pass flags to the underlying inference runtime (e.g., llama.cpp) using `provider_opts.runtime_flags`:
@z

@x
```yaml
models:
  local:
    provider: dmr
    model: ai/qwen3
    max_tokens: 8192
    provider_opts:
      runtime_flags: ["--threads", "8"]
```
@y
```yaml
models:
  local:
    provider: dmr
    model: ai/qwen3
    max_tokens: 8192
    provider_opts:
      runtime_flags: ["--threads", "8"]
```
@z

@x
Runtime flags also accept a single string:
@y
Runtime flags also accept a single string:
@z

@x
```yaml
provider_opts:
  runtime_flags: "--threads 8"
```
@y
```yaml
provider_opts:
  runtime_flags: "--threads 8"
```
@z

@x
Use only flags your Model Runner backend allows (see `docker model configure --help` and backend docs). **Do not** put sampling parameters (`temperature`, `top_p`, penalties) in `runtime_flags` — set them on the model (`temperature`, `top_p`, etc.); they are sent **per request** via the OpenAI-compatible chat API.
@y
Use only flags your Model Runner backend allows (see `docker model configure --help` and backend docs). **Do not** put sampling parameters (`temperature`, `top_p`, penalties) in `runtime_flags` — set them on the model (`temperature`, `top_p`, etc.); they are sent **per request** via the OpenAI-compatible chat API.
@z

@x
## Context size
@y
## Context size
@z

@x
`max_tokens` controls the **maximum output tokens** per chat completion request. To set the engine's **total context window**, use `provider_opts.context_size`:
@y
`max_tokens` controls the **maximum output tokens** per chat completion request. To set the engine's **total context window**, use `provider_opts.context_size`:
@z

@x
```yaml
models:
  local:
    provider: dmr
    model: ai/qwen3
    max_tokens: 4096            # max output tokens (per-request)
    provider_opts:
      context_size: 32768       # total context window (sent via _configure)
```
@y
```yaml
models:
  local:
    provider: dmr
    model: ai/qwen3
    max_tokens: 4096            # max output tokens (per-request)
    provider_opts:
      context_size: 32768       # total context window (sent via _configure)
```
@z

@x
If `context_size` is omitted, Docker Agent queries the runner's completion
configuration, then falls back to the packaged model's context window. This
read-only discovery is cached briefly and drives context usage and automatic
compaction. An explicit `context_size` always takes precedence; `max_tokens` is
**not** used as the context window.
@y
If `context_size` is omitted, Docker Agent queries the runner's completion
configuration, then falls back to the packaged model's context window. This
read-only discovery is cached briefly and drives context usage and automatic
compaction. An explicit `context_size` always takes precedence; `max_tokens` is
**not** used as the context window.
@z

@x
Discovery is best-effort. Older or unreachable runners, gateways, and runtime
flags that override context allocation may leave the window unknown. In those
cases, set `context_size` explicitly. Arbitrary `raw_runtime_flags` also disable
automatic context discovery.
@y
Discovery is best-effort. Older or unreachable runners, gateways, and runtime
flags that override context allocation may leave the window unknown. In those
cases, set `context_size` explicitly. Arbitrary `raw_runtime_flags` also disable
automatic context discovery.
@z

@x
The model picker displays DMR's reported architecture, parameter count,
quantization, size, and packaged context window when available. The packaged
window can differ from a running model's configured context size.
@y
The model picker displays DMR's reported architecture, parameter count,
quantization, size, and packaged context window when available. The packaged
window can differ from a running model's configured context size.
@z

@x
Docker Agent's auto-compaction scales its summary and keep-tail token budgets proportionally to `context_size`. This ensures compaction works correctly even for small context windows — for example, an 8k-token local model will not have its session history wiped during compaction.
@y
Docker Agent's auto-compaction scales its summary and keep-tail token budgets proportionally to `context_size`. This ensures compaction works correctly even for small context windows — for example, an 8k-token local model will not have its session history wiped during compaction.
@z

@x
## Thinking / reasoning budget
@y
## Thinking / reasoning budget
@z

@x
When using the **llama.cpp** backend, `thinking_budget` is sent as structured `llamacpp.reasoning-budget` on `_configure` (maps to `--reasoning-budget`). String efforts use the same token mapping as other providers; `adaptive` maps to unlimited (`-1`).
@y
When using the **llama.cpp** backend, `thinking_budget` is sent as structured `llamacpp.reasoning-budget` on `_configure` (maps to `--reasoning-budget`). String efforts use the same token mapping as other providers; `adaptive` maps to unlimited (`-1`).
@z

@x
When using the **vLLM** backend, `thinking_budget` is sent as `thinking_token_budget` in each chat completion request. Effort levels map to token counts using the same scale as other providers; `adaptive` maps to unlimited (`-1`).
@y
When using the **vLLM** backend, `thinking_budget` is sent as `thinking_token_budget` in each chat completion request. Effort levels map to token counts using the same scale as other providers; `adaptive` maps to unlimited (`-1`).
@z

@x
```yaml
models:
  local:
    provider: dmr
    model: ai/qwen3
    thinking_budget: medium   # llama.cpp: reasoning-budget=8192; vLLM: thinking_token_budget=8192
```
@y
```yaml
models:
  local:
    provider: dmr
    model: ai/qwen3
    thinking_budget: medium   # llama.cpp: reasoning-budget=8192; vLLM: thinking_token_budget=8192
```
@z

@x
On **MLX** and **SGLang** backends, `thinking_budget` is silently ignored — those engines do not currently expose a per-request reasoning token budget knob.
@y
On **MLX** and **SGLang** backends, `thinking_budget` is silently ignored — those engines do not currently expose a per-request reasoning token budget knob.
@z

@x
## vLLM-specific configuration
@y
## vLLM-specific configuration
@z

@x
When running a model on the **vLLM** backend, additional engine-level settings can be passed via `provider_opts` and are forwarded to model-runner's `_configure` endpoint:
@y
When running a model on the **vLLM** backend, additional engine-level settings can be passed via `provider_opts` and are forwarded to model-runner's `_configure` endpoint:
@z

@x
- `gpu_memory_utilization` — fraction of GPU memory (0.0–1.0) vLLM may use. Values outside this range are rejected.
- `hf_overrides` — map of Hugging Face config overrides applied when vLLM loads the model.
@y
- `gpu_memory_utilization` — fraction of GPU memory (0.0–1.0) vLLM may use. Values outside this range are rejected.
- `hf_overrides` — map of Hugging Face config overrides applied when vLLM loads the model.
@z

@x
```yaml
models:
  vllm-local:
    provider: dmr
    model: ai/some-model-safetensors
    provider_opts:
      gpu_memory_utilization: 0.9
      hf_overrides:
        max_model_len: 8192
        dtype: bfloat16
```
@y
```yaml
models:
  vllm-local:
    provider: dmr
    model: ai/some-model-safetensors
    provider_opts:
      gpu_memory_utilization: 0.9
      hf_overrides:
        max_model_len: 8192
        dtype: bfloat16
```
@z

@x
`hf_overrides` keys (including nested ones) must match `^[a-zA-Z_][a-zA-Z0-9_]*$` — the same rule model-runner enforces server-side to block injection via flags. Invalid keys are rejected at client creation time so you fail fast instead of after a round-trip.
@y
`hf_overrides` keys (including nested ones) must match `^[a-zA-Z_][a-zA-Z0-9_]*$` — the same rule model-runner enforces server-side to block injection via flags. Invalid keys are rejected at client creation time so you fail fast instead of after a round-trip.
@z

@x
These options are ignored on non-vLLM backends.
@y
These options are ignored on non-vLLM backends.
@z

@x
## Keeping models resident in memory (`keep_alive`)
@y
## Keeping models resident in memory (`keep_alive`)
@z

@x
By default model-runner unloads idle models after a few minutes. Override the idle timeout via `provider_opts.keep_alive`:
@y
By default model-runner unloads idle models after a few minutes. Override the idle timeout via `provider_opts.keep_alive`:
@z

@x
```yaml
models:
  sticky:
    provider: dmr
    model: ai/qwen3
    provider_opts:
      keep_alive: "30m"   # duration string
      # keep_alive: "0"   # unload immediately after each request
      # keep_alive: "-1"  # keep loaded forever
```
@y
```yaml
models:
  sticky:
    provider: dmr
    model: ai/qwen3
    provider_opts:
      keep_alive: "30m"   # duration string
      # keep_alive: "0"   # unload immediately after each request
      # keep_alive: "-1"  # keep loaded forever
```
@z

@x
Accepted values: any Go duration string (`"30s"`, `"5m"`, `"1h"`, `"2h30m"`), `"0"` (immediate unload), or `"-1"` (never unload). Invalid values are rejected before the configure request is sent.
@y
Accepted values: any Go duration string (`"30s"`, `"5m"`, `"1h"`, `"2h30m"`), `"0"` (immediate unload), or `"-1"` (never unload). Invalid values are rejected before the configure request is sent.
@z

@x
## Unloading models on agent switch
@y
## Unloading models on agent switch
@z

@x
In multi-agent setups where two DMR models can't fit in GPU memory simultaneously, wire the [`unload`](../../configuration/hooks/index.md#available-built-ins) built-in hook into each agent's `on_agent_switch` chain. Every time the active agent transfers control, the runtime POSTs to the engine's `_unload` endpoint to free the previous model's resources before the next one is loaded:
@y
In multi-agent setups where two DMR models can't fit in GPU memory simultaneously, wire the [`unload`](../../configuration/hooks/index.md#available-built-ins) built-in hook into each agent's `on_agent_switch` chain. Every time the active agent transfers control, the runtime POSTs to the engine's `_unload` endpoint to free the previous model's resources before the next one is loaded:
@z

@x
```yaml
agents:
  coder:
    model: qwen3-large
    handoffs: [reviewer]
    hooks:
      on_agent_switch:
        - type: builtin
          command: unload
  reviewer:
    model: qwen3-coder
    handoffs: [coder]
    hooks:
      on_agent_switch:
        - type: builtin
          command: unload
```
@y
```yaml
agents:
  coder:
    model: qwen3-large
    handoffs: [reviewer]
    hooks:
      on_agent_switch:
        - type: builtin
          command: unload
  reviewer:
    model: qwen3-coder
    handoffs: [coder]
    hooks:
      on_agent_switch:
        - type: builtin
          command: unload
```
@z

@x
The unload URL is derived from `base_url` by replacing the trailing `/v1` segment (e.g. `http://127.0.0.1:12434/engines/llama.cpp/v1/` → `http://127.0.0.1:12434/engines/llama.cpp/_unload`). Override it explicitly via the provider-level `unload_api` field when running against a non-standard model-runner deployment:
@y
The unload URL is derived from `base_url` by replacing the trailing `/v1` segment (e.g. `http://127.0.0.1:12434/engines/llama.cpp/v1/` → `http://127.0.0.1:12434/engines/llama.cpp/_unload`). Override it explicitly via the provider-level `unload_api` field when running against a non-standard model-runner deployment:
@z

@x
```yaml
providers:
  my_dmr:
    provider: dmr
    base_url: http://model-runner.docker.internal/engines/v1
    unload_api: /engines/_unload   # default; absolute URLs also work
@y
```yaml
providers:
  my_dmr:
    provider: dmr
    base_url: http://model-runner.docker.internal/engines/v1
    unload_api: /engines/_unload   # default; absolute URLs also work
@z

@x
models:
  big:
    provider: my_dmr
    model: ai/qwen3
```
@y
models:
  big:
    provider: my_dmr
    model: ai/qwen3
```
@z

@x
Unload errors are logged and swallowed — a stuck or unreachable engine never blocks an agent transfer (each call is bounded to 10 s). Pair this with [`keep_alive`](#keeping-models-resident-in-memory-keep_alive) only when you want the model to *also* survive idle periods within a single agent's run; the hook controls **between-agent** unloads independently.
@y
Unload errors are logged and swallowed — a stuck or unreachable engine never blocks an agent transfer (each call is bounded to 10 s). Pair this with [`keep_alive`](#keeping-models-resident-in-memory-keep_alive) only when you want the model to *also* survive idle periods within a single agent's run; the hook controls **between-agent** unloads independently.
@z

@x
> [!WARNING]
> **Single-tenant assumption**
>
> The `_unload` endpoint is engine-level: it evicts the model from DMR's memory regardless of who is using it. If two concurrent sessions on the same runtime (e.g. an API server serving multiple users) hit the same agent, switching away in session A will yank the model out from under session B's in-flight request, which then has to wait for a reload. Wire `unload` only when the agents using these models are not run concurrently — typically a single TUI/CLI session.
@y
> [!WARNING]
> **Single-tenant assumption**
>
> The `_unload` endpoint is engine-level: it evicts the model from DMR's memory regardless of who is using it. If two concurrent sessions on the same runtime (e.g. an API server serving multiple users) hit the same agent, switching away in session A will yank the model out from under session B's in-flight request, which then has to wait for a reload. Wire `unload` only when the agents using these models are not run concurrently — typically a single TUI/CLI session.
@z

@x
See [`examples/unload_on_switch.yaml`](https://github.com/docker/docker-agent/blob/main/examples/unload_on_switch.yaml) for the full example.
@y
See [`examples/unload_on_switch.yaml`](https://github.com/docker/docker-agent/blob/main/examples/unload_on_switch.yaml) for the full example.
@z

@x
## Operating mode (`mode`)
@y
## Operating mode (`mode`)
@z

@x
Model-runner normally infers the backend mode from the request path. You can pin it explicitly via `provider_opts.mode`:
@y
Model-runner normally infers the backend mode from the request path. You can pin it explicitly via `provider_opts.mode`:
@z

@x
```yaml
provider_opts:
  mode: embedding   # one of: completion, embedding, reranking, image-generation
```
@y
```yaml
provider_opts:
  mode: embedding   # one of: completion, embedding, reranking, image-generation
```
@z

@x
Most agents don't need this — leave it unset unless you know you need it.
@y
Most agents don't need this — leave it unset unless you know you need it.
@z

@x
## Raw runtime flags (`raw_runtime_flags`)
@y
## Raw runtime flags (`raw_runtime_flags`)
@z

@x
`runtime_flags` (a list) is the preferred way to pass flags. If you have a pre-built command-line string you'd rather ship verbatim, use `raw_runtime_flags` instead:
@y
`runtime_flags` (a list) is the preferred way to pass flags. If you have a pre-built command-line string you'd rather ship verbatim, use `raw_runtime_flags` instead:
@z

@x
```yaml
provider_opts:
  raw_runtime_flags: "--threads 8 --batch-size 512"
```
@y
```yaml
provider_opts:
  raw_runtime_flags: "--threads 8 --batch-size 512"
```
@z

@x
Model-runner parses the string with shell-style word splitting. `runtime_flags` and `raw_runtime_flags` are mutually exclusive — setting both is an error.
@y
Model-runner parses the string with shell-style word splitting. `runtime_flags` and `raw_runtime_flags` are mutually exclusive — setting both is an error.
@z

@x
## Speculative Decoding
@y
## Speculative Decoding
@z

@x
Use a smaller draft model to predict tokens ahead for faster inference:
@y
Use a smaller draft model to predict tokens ahead for faster inference:
@z

@x
```yaml
models:
  fast-local:
    provider: dmr
    model: ai/qwen3:14B
    max_tokens: 8192
    provider_opts:
      speculative_draft_model: ai/qwen3:0.6B-F16
      speculative_num_tokens: 16
      speculative_acceptance_rate: 0.8
```
@y
```yaml
models:
  fast-local:
    provider: dmr
    model: ai/qwen3:14B
    max_tokens: 8192
    provider_opts:
      speculative_draft_model: ai/qwen3:0.6B-F16
      speculative_num_tokens: 16
      speculative_acceptance_rate: 0.8
```
@z

@x
## Custom Endpoint
@y
## Custom Endpoint
@z

@x
If `base_url` is omitted, Docker Agent auto-discovers the DMR endpoint. To set manually:
@y
If `base_url` is omitted, Docker Agent auto-discovers the DMR endpoint. To set manually:
@z

@x
```yaml
models:
  local:
    provider: dmr
    model: ai/qwen3
    base_url: http://127.0.0.1:12434/engines/llama.cpp/v1
```
@y
```yaml
models:
  local:
    provider: dmr
    model: ai/qwen3
    base_url: http://127.0.0.1:12434/engines/llama.cpp/v1
```
@z

@x
## Troubleshooting
@y
## Troubleshooting
@z

@x
- **Plugin not found:** Ensure Docker Model Runner is enabled in Docker Desktop and `docker model status --json` works with the same Docker context. CLI discovery failures are reported rather than falling back to a different local runner.
- **Endpoint empty:** Verify the Model Runner is running with `docker model status --json`.
- **Performance:** Use `runtime_flags` to tune GPU layers (`--ngl`) and thread count (`--threads`).
@y
- **Plugin not found:** Ensure Docker Model Runner is enabled in Docker Desktop and `docker model status --json` works with the same Docker context. CLI discovery failures are reported rather than falling back to a different local runner.
- **Endpoint empty:** Verify the Model Runner is running with `docker model status --json`.
- **Performance:** Use `runtime_flags` to tune GPU layers (`--ngl`) and thread count (`--threads`).
@z

@x
For interrupted or corrupt downloads, retry using the same Docker connection
and config directory as the agent, for example:
@y
For interrupted or corrupt downloads, retry using the same Docker connection
and config directory as the agent, for example:
@z

@x
```console
docker --context desktop-linux --config /path/to/docker-config model pull ai/qwen3
```
@y
```console
docker --context desktop-linux --config /path/to/docker-config model pull ai/qwen3
```
@z

@x
Docker Agent does not offer to delete local partial-download files when using a
CLI-selected connection: the runner's content store may be remote or belong to a
different Docker configuration. If a pull repeatedly fails with HTTP 416, inspect
the selected runner's logs and content store rather than deleting files from an
unrelated local `~/.docker/models` directory.
@y
Docker Agent does not offer to delete local partial-download files when using a
CLI-selected connection: the runner's content store may be remote or belong to a
different Docker configuration. If a pull repeatedly fails with HTTP 416, inspect
the selected runner's logs and content store rather than deleting files from an
unrelated local `~/.docker/models` directory.
@z
