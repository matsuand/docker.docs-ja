%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

% __SUBDIR__ 対応

@x
title: "Anthropic"
description: "Use Claude Sonnet 4, Claude Sonnet 4.5, and other Anthropic models with Docker Agent."
keywords: docker agent, ai agents, model providers, llm, anthropic
@y
title: "Anthropic"
description: "Use Claude Sonnet 4, Claude Sonnet 4.5, and other Anthropic models with Docker Agent."
keywords: docker agent, ai agents, model providers, llm, anthropic
@z

@x
canonical: https://docs.docker.com/ai/docker-agent/providers/anthropic/
@y
canonical: __SUBDIR__/ai/docker-agent/providers/anthropic/
@z

@x
_Use Claude Sonnet 4, Claude Sonnet 4.5, and other Anthropic models with Docker Agent._
@y
_Use Claude Sonnet 4, Claude Sonnet 4.5, and other Anthropic models with Docker Agent._
@z

@x
## Setup
@y
## Setup
@z

@x
```bash
# Set your API key
export ANTHROPIC_API_KEY="sk-ant-..."
```
@y
```bash
# Set your API key
export ANTHROPIC_API_KEY="sk-ant-..."
```
@z

@x
### Workload Identity Federation (no API key)
@y
### Workload Identity Federation (no API key)
@z

@x
Authenticate with short-lived tokens minted from your own OIDC identity
provider instead of a long-lived API key. See Anthropic's
[Workload Identity Federation guide](https://platform.claude.com/docs/en/build-with-claude/workload-identity-federation)
to provision a Federation Rule, then configure Docker Agent with a typed
`auth:` block:
@y
Authenticate with short-lived tokens minted from your own OIDC identity
provider instead of a long-lived API key. See Anthropic's
[Workload Identity Federation guide](https://platform.claude.com/docs/en/build-with-claude/workload-identity-federation)
to provision a Federation Rule, then configure Docker Agent with a typed
`auth:` block:
@z

@x
```yaml
providers:
  anthropic-wif:
    provider: anthropic
    auth:
      type: workload_identity_federation
      workload_identity_federation:
        federation_rule_id: fdrl_REPLACE_ME
        organization_id: 00000000-0000-0000-0000-000000000000
        # Optional: only required for target_type=SERVICE_ACCOUNT rules.
        service_account_id: svac_REPLACE_ME
        identity_token:
          # Pick exactly one of: file, env, command, url
          file: /var/run/secrets/anthropic.com/token
@y
```yaml
providers:
  anthropic-wif:
    provider: anthropic
    auth:
      type: workload_identity_federation
      workload_identity_federation:
        federation_rule_id: fdrl_REPLACE_ME
        organization_id: 00000000-0000-0000-0000-000000000000
        # Optional: only required for target_type=SERVICE_ACCOUNT rules.
        service_account_id: svac_REPLACE_ME
        identity_token:
          # Pick exactly one of: file, env, command, url
          file: /var/run/secrets/anthropic.com/token
@z

@x
models:
  claude:
    provider: anthropic-wif
    model: claude-sonnet-4-5
```
@y
models:
  claude:
    provider: anthropic-wif
    model: claude-sonnet-4-5
```
@z

@x
`identity_token` accepts four mutually exclusive sources:
@y
`identity_token` accepts four mutually exclusive sources:
@z

@x
| Source    | When to use                                                                                                              |
| --------- | ------------------------------------------------------------------------------------------------------------------------ |
| `file`    | Kubernetes projected service-account tokens, SPIFFE/SPIRE helpers, Vault sidecars — anything that rotates a file on disk |
| `env`     | The token is already exported in an environment variable                                                                 |
| `command` | Shell out to a CLI on every refresh (`gcloud auth print-identity-token`, `az account get-access-token`, ...)              |
| `url`     | Fetch from an HTTP(S) endpoint (cloud metadata servers, GitHub Actions OIDC token URL, ...)                              |
@y
| Source    | When to use                                                                                                              |
| --------- | ------------------------------------------------------------------------------------------------------------------------ |
| `file`    | Kubernetes projected service-account tokens, SPIFFE/SPIRE helpers, Vault sidecars — anything that rotates a file on disk |
| `env`     | The token is already exported in an environment variable                                                                 |
| `command` | Shell out to a CLI on every refresh (`gcloud auth print-identity-token`, `az account get-access-token`, ...)              |
| `url`     | Fetch from an HTTP(S) endpoint (cloud metadata servers, GitHub Actions OIDC token URL, ...)                              |
@z

@x
For `url`, both the URL and any header values support `${env.VAR}` expansion
against the runtime environment (the legacy `${VAR}` form is also accepted),
which lets you wire the GitHub Actions OIDC
token endpoint without putting secrets in YAML:
@y
For `url`, both the URL and any header values support `${env.VAR}` expansion
against the runtime environment (the legacy `${VAR}` form is also accepted),
which lets you wire the GitHub Actions OIDC
token endpoint without putting secrets in YAML:
@z

@x
```yaml
identity_token:
  url: ${env.ACTIONS_ID_TOKEN_REQUEST_URL}&audience=https://api.anthropic.com
  headers:
    Authorization: bearer ${env.ACTIONS_ID_TOKEN_REQUEST_TOKEN}
  response_field: value
```
@y
```yaml
identity_token:
  url: ${env.ACTIONS_ID_TOKEN_REQUEST_URL}&audience=https://api.anthropic.com
  headers:
    Authorization: bearer ${env.ACTIONS_ID_TOKEN_REQUEST_TOKEN}
  response_field: value
```
@z

@x
`auth:` is mutually exclusive with `--gateway`. Token-refresh failures are
surfaced through the normal error path with a clear `anthropic workload
identity federation: failed to refresh identity token from <kind> source
(federation_rule=fdrl_…): ...` message in the TUI.
@y
`auth:` is mutually exclusive with `--gateway`. Token-refresh failures are
surfaced through the normal error path with a clear `anthropic workload
identity federation: failed to refresh identity token from <kind> source
(federation_rule=fdrl_…): ...` message in the TUI.
@z

@x
A complete walkthrough of all four sources lives in
[`examples/anthropic_wif.yaml`](https://github.com/docker/docker-agent/blob/main/examples/anthropic_wif.yaml).
@y
A complete walkthrough of all four sources lives in
[`examples/anthropic_wif.yaml`](https://github.com/docker/docker-agent/blob/main/examples/anthropic_wif.yaml).
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
    model: anthropic/claude-sonnet-4-5
```
@y
```yaml
agents:
  root:
    model: anthropic/claude-sonnet-4-5
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
  claude:
    provider: anthropic
    model: claude-sonnet-4-5
    max_tokens: 64000
```
@y
```yaml
models:
  claude:
    provider: anthropic
    model: claude-sonnet-4-5
    max_tokens: 64000
```
@z

@x
## Available Models
@y
## Available Models
@z

@x
| Model ID            | Description                                         |
| ------------------- | --------------------------------------------------- |
| `claude-opus-5`     | Highest-capability Opus model; full effort ladder (low–max) |
| `claude-opus-4-7`   | Previous Opus flagship; supports task budget        |
| `claude-sonnet-4-5` | Most capable Sonnet; supports extended thinking     |
| `claude-sonnet-4-0` | Previous Sonnet generation, still supported         |
| `claude-haiku-4-5`  | Fast and inexpensive, good for tight loops          |
@y
| Model ID            | Description                                         |
| ------------------- | --------------------------------------------------- |
| `claude-opus-5`     | Highest-capability Opus model; full effort ladder (low–max) |
| `claude-opus-4-7`   | Previous Opus flagship; supports task budget        |
| `claude-sonnet-4-5` | Most capable Sonnet; supports extended thinking     |
| `claude-sonnet-4-0` | Previous Sonnet generation, still supported         |
| `claude-haiku-4-5`  | Fast and inexpensive, good for tight loops          |
@z

@x
## Thinking Budget
@y
## Thinking Budget
@z

@x
Anthropic accepts either an integer token budget or a string effort value. Thinking is off unless you set `thinking_budget`; when set, interleaved thinking is auto-enabled.
@y
Anthropic accepts either an integer token budget or a string effort value. Thinking is off unless you set `thinking_budget`; when set, interleaved thinking is auto-enabled.
@z

@x
**Token budget** (1024–32768; works on all extended-thinking Claude models):
@y
**Token budget** (1024–32768; works on all extended-thinking Claude models):
@z

@x
```yaml
models:
  claude-deep:
    provider: anthropic
    model: claude-sonnet-4-5
    thinking_budget: 16384 # must be < max_tokens
```
@y
```yaml
models:
  claude-deep:
    provider: anthropic
    model: claude-sonnet-4-5
    thinking_budget: 16384 # must be < max_tokens
```
@z

@x
**Adaptive / effort-based** (Claude Opus 4.6+, Sonnet 4.6 — every string value is sent as adaptive thinking via `output_config.effort`):
@y
**Adaptive / effort-based** (Claude Opus 4.6+, Sonnet 4.6 — every string value is sent as adaptive thinking via `output_config.effort`):
@z

@x
```yaml
models:
  opus-adaptive:
    provider: anthropic
    model: claude-opus-4-6
    thinking_budget: adaptive # model decides effort (defaults to high)
@y
```yaml
models:
  opus-adaptive:
    provider: anthropic
    model: claude-opus-4-6
    thinking_budget: adaptive # model decides effort (defaults to high)
@z

@x
  opus-effort:
    provider: anthropic
    model: claude-opus-4-6
    thinking_budget: high # low | medium | high | xhigh | max (same as adaptive/<effort>)
```
@y
  opus-effort:
    provider: anthropic
    model: claude-opus-4-6
    thinking_budget: high # low | medium | high | xhigh | max (same as adaptive/<effort>)
```
@z

@x
On models that reject token-based thinking (Opus 4.6, 4.7, 4.8, Sonnet 4.6), an integer budget is automatically coerced to `adaptive` with a logged warning. See the [Thinking / Reasoning guide](../../guides/thinking/index.md) for the full cross-provider reference.
@y
On models that reject token-based thinking (Opus 4.6, 4.7, 4.8, Sonnet 4.6), an integer budget is automatically coerced to `adaptive` with a logged warning. See the [Thinking / Reasoning guide](../../guides/thinking/index.md) for the full cross-provider reference.
@z

@x
## Interleaved Thinking
@y
## Interleaved Thinking
@z

@x
Auto-enabled whenever a thinking budget is configured on a Claude model. Allows tool calls during model reasoning for more integrated problem-solving:
@y
Auto-enabled whenever a thinking budget is configured on a Claude model. Allows tool calls during model reasoning for more integrated problem-solving:
@z

@x
```yaml
models:
  claude:
    provider: anthropic
    model: claude-sonnet-4-5
    provider_opts:
      interleaved_thinking: false # disable if needed
```
@y
```yaml
models:
  claude:
    provider: anthropic
    model: claude-sonnet-4-5
    provider_opts:
      interleaved_thinking: false # disable if needed
```
@z

@x
## Task Budget
@y
## Task Budget
@z

@x
`task_budget` caps the **total** number of tokens the model may spend across a
multi-step agentic task — combined thinking, tool calls, and final output. It
is forwarded as
[`output_config.task_budget`](https://platform.claude.com/docs/en/about-claude/models/whats-new-claude-4-7)
and is ideal for letting long-running agents self-regulate effort without
tightening `max_tokens` on every call.
@y
`task_budget` caps the **total** number of tokens the model may spend across a
multi-step agentic task — combined thinking, tool calls, and final output. It
is forwarded as
[`output_config.task_budget`](https://platform.claude.com/docs/en/about-claude/models/whats-new-claude-4-7)
and is ideal for letting long-running agents self-regulate effort without
tightening `max_tokens` on every call.
@z

@x
Docker Agent automatically attaches the required `task-budgets-2026-03-13`
beta header whenever this field is set. You can configure `task_budget` on
**any** Claude model — Docker Agent never gates it by model name. At the time
of writing, only **Claude Opus 4.7** actually honors the field; other Claude
models (Sonnet 4.5, Opus 4.5 / 4.6, etc.) are expected to reject requests
that include it. Check the Anthropic release notes linked above for the
current list of supported models.
@y
Docker Agent automatically attaches the required `task-budgets-2026-03-13`
beta header whenever this field is set. You can configure `task_budget` on
**any** Claude model — Docker Agent never gates it by model name. At the time
of writing, only **Claude Opus 4.7** actually honors the field; other Claude
models (Sonnet 4.5, Opus 4.5 / 4.6, etc.) are expected to reject requests
that include it. Check the Anthropic release notes linked above for the
current list of supported models.
@z

@x
```yaml
models:
  opus:
    provider: anthropic
    model: claude-opus-4-7
    task_budget: 128000 # integer shorthand → { type: tokens, total: 128000 }
    thinking_budget: adaptive
```
@y
```yaml
models:
  opus:
    provider: anthropic
    model: claude-opus-4-7
    task_budget: 128000 # integer shorthand → { type: tokens, total: 128000 }
    thinking_budget: adaptive
```
@z

@x
Object form (forward-compatible with future budget types):
@y
Object form (forward-compatible with future budget types):
@z

@x
```yaml
  opus:
    provider: anthropic
    model: claude-opus-4-7
    task_budget:
      type: tokens
      total: 128000
```
@y
```yaml
  opus:
    provider: anthropic
    model: claude-opus-4-7
    task_budget:
      type: tokens
      total: 128000
```
@z

@x
See the full schema on the [Model Configuration](../../configuration/models/index.md#task-budget) page.
@y
See the full schema on the [Model Configuration](../../configuration/models/index.md#task-budget) page.
@z

@x
## Server-Side Fallbacks
@y
## Server-Side Fallbacks
@z

@x
When the primary model refuses a request (e.g. Claude Fable 5's safety
classifiers ending the turn with stop reason `refusal`), Anthropic can retry
the request with backup models in a single round trip. Set `fallbacks` in
`provider_opts` to a list of model IDs, in priority order:
@y
When the primary model refuses a request (e.g. Claude Fable 5's safety
classifiers ending the turn with stop reason `refusal`), Anthropic can retry
the request with backup models in a single round trip. Set `fallbacks` in
`provider_opts` to a list of model IDs, in priority order:
@z

@x
```yaml
models:
  fable:
    provider: anthropic
    model: claude-fable-5
    provider_opts:
      fallbacks:
        - claude-opus-4-8
        - claude-sonnet-4-6
```
@y
```yaml
models:
  fable:
    provider: anthropic
    model: claude-fable-5
    provider_opts:
      fallbacks:
        - claude-opus-4-8
        - claude-sonnet-4-6
```
@z

@x
Docker Agent automatically attaches the required
`server-side-fallback-2026-06-01` beta header and forwards the option as
`fallbacks: [{"model": "..."}]`. The response's `model` field reports which
model actually served the request.
@y
Docker Agent automatically attaches the required
`server-side-fallback-2026-06-01` beta header and forwards the option as
`fallbacks: [{"model": "..."}]`. The response's `model` field reports which
model actually served the request.
@z

@x
Fallback models receive the exact same request as the primary model
(thinking configuration, task budget, beta features, ...), so list only
models that accept the same request shape. Not available on Bedrock, Vertex
AI, or the Message Batches API.
@y
Fallback models receive the exact same request as the primary model
(thinking configuration, task budget, beta features, ...), so list only
models that accept the same request shape. Not available on Bedrock, Vertex
AI, or the Message Batches API.
@z

@x
## Thinking Display
@y
## Thinking Display
@z

@x
Controls whether thinking blocks are returned in responses when thinking is enabled. Newer Claude models (Opus 4.7+, Fable 5) hide thinking content by default (`omitted`); Docker Agent counters this by requesting `summarized` thinking whenever an adaptive/effort-based budget is used without an explicit `thinking_display`, so reasoning stays visible in the UI. Set `thinking_display` in `provider_opts` to override:
@y
Controls whether thinking blocks are returned in responses when thinking is enabled. Newer Claude models (Opus 4.7+, Fable 5) hide thinking content by default (`omitted`); Docker Agent counters this by requesting `summarized` thinking whenever an adaptive/effort-based budget is used without an explicit `thinking_display`, so reasoning stays visible in the UI. Set `thinking_display` in `provider_opts` to override:
@z

@x
```yaml
models:
  claude-opus-4-7:
    provider: anthropic
    model: claude-opus-4-7
    thinking_budget: adaptive
    provider_opts:
      thinking_display: omitted # "summarized" or "omitted" ("display" on pre-4.6 models only)
```
@y
```yaml
models:
  claude-opus-4-7:
    provider: anthropic
    model: claude-opus-4-7
    thinking_budget: adaptive
    provider_opts:
      thinking_display: omitted # "summarized" or "omitted" ("display" on pre-4.6 models only)
```
@z

@x
Valid values:
@y
Valid values:
@z

@x
- `summarized`: thinking blocks are returned with summarized thinking text (Docker Agent's default for adaptive/effort-based budgets).
- `display`: thinking blocks are returned for display. Only accepted by pre-4.6 token-thinking models (e.g. Sonnet 4.5, Haiku 4.5); models from the adaptive-thinking generation onward (Opus/Sonnet 4.6+, Sonnet 5, Fable 5) reject it, and Docker Agent fails fast with a configuration error instead of sending a request the API would refuse.
- `omitted`: thinking blocks are returned with an empty thinking field; the signature is still returned for multi-turn continuity. Useful to reduce time-to-first-text-token when streaming.
@y
- `summarized`: thinking blocks are returned with summarized thinking text (Docker Agent's default for adaptive/effort-based budgets).
- `display`: thinking blocks are returned for display. Only accepted by pre-4.6 token-thinking models (e.g. Sonnet 4.5, Haiku 4.5); models from the adaptive-thinking generation onward (Opus/Sonnet 4.6+, Sonnet 5, Fable 5) reject it, and Docker Agent fails fast with a configuration error instead of sending a request the API would refuse.
- `omitted`: thinking blocks are returned with an empty thinking field; the signature is still returned for multi-turn continuity. Useful to reduce time-to-first-text-token when streaming.
@z

@x
Note: `thinking_display` applies to both `thinking_budget` with token counts and adaptive/effort-based budgets. For token-count budgets no default is applied (the API already defaults to `summarized`). Full thinking tokens are billed regardless of the `thinking_display` value.
@y
Note: `thinking_display` applies to both `thinking_budget` with token counts and adaptive/effort-based budgets. For token-count budgets no default is applied (the API already defaults to `summarized`). Full thinking tokens are billed regardless of the `thinking_display` value.
@z

@x
> [!NOTE]
> Anthropic thinking budget values below 1024 or greater than or equal to `max_tokens` are ignored (a warning is logged).
@y
> [!NOTE]
> Anthropic thinking budget values below 1024 or greater than or equal to `max_tokens` are ignored (a warning is logged).
@z
