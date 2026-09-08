%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

% __SUBDIR__ 対応

@x
title: "GitHub Copilot"
description: "Use GitHub Copilot's hosted models (GPT-4o, Claude, Gemini, and more) with Docker Agent through your GitHub subscription."
keywords: docker agent, ai agents, model providers, llm, github copilot
@y
title: "GitHub Copilot"
description: "Use GitHub Copilot's hosted models (GPT-4o, Claude, Gemini, and more) with Docker Agent through your GitHub subscription."
keywords: docker agent, ai agents, model providers, llm, github copilot
@z

@x
canonical: https://docs.docker.com/ai/docker-agent/providers/github-copilot/
@y
canonical: __SUBDIR__/ai/docker-agent/providers/github-copilot/
@z

@x
_Use GitHub Copilot's hosted models with Docker Agent through your existing GitHub subscription._
@y
_Use GitHub Copilot's hosted models with Docker Agent through your existing GitHub subscription._
@z

@x
## Overview
@y
## Overview
@z

@x
GitHub Copilot exposes an OpenAI-compatible Chat Completions API at
`https://api.githubcopilot.com`. Docker Agent ships with built-in support for
it as the `github-copilot` provider, so any user with a paid GitHub Copilot
subscription can reuse their entitlement from Docker Agent.
@y
GitHub Copilot exposes an OpenAI-compatible Chat Completions API at
`https://api.githubcopilot.com`. Docker Agent ships with built-in support for
it as the `github-copilot` provider, so any user with a paid GitHub Copilot
subscription can reuse their entitlement from Docker Agent.
@z

@x
## Prerequisites
@y
## Prerequisites
@z

@x
- An active **GitHub Copilot** subscription (Individual, Business, or Enterprise).
- A **personal access token** with the `copilot` scope, exported as `GITHUB_TOKEN`.
@y
- An active **GitHub Copilot** subscription (Individual, Business, or Enterprise).
- A **personal access token** with the `copilot` scope, exported as `GITHUB_TOKEN`.
@z

@x
```bash
export GITHUB_TOKEN="ghp_..."
```
@y
```bash
export GITHUB_TOKEN="ghp_..."
```
@z

@x
## Running Evals
@y
## Running Evals
@z

@x
Eval cases (`docker agent eval`) run in isolated containers. Unlike dedicated
provider API keys, `GITHUB_TOKEN` and `GH_TOKEN` are **not** forwarded into
eval containers automatically, because a GitHub token grants far broader
access than a model API key. Pass the token explicitly:
@y
Eval cases (`docker agent eval`) run in isolated containers. Unlike dedicated
provider API keys, `GITHUB_TOKEN` and `GH_TOKEN` are **not** forwarded into
eval containers automatically, because a GitHub token grants far broader
access than a model API key. Pass the token explicitly:
@z

@x
```bash
docker agent eval agent.yaml ./evals -e GITHUB_TOKEN
```
@y
```bash
docker agent eval agent.yaml ./evals -e GITHUB_TOKEN
```
@z

@x
See [Evaluation](../../features/evaluation/index.md#provider-credentials)
for details, including behavior with `--env-from-file`.
@y
See [Evaluation](../../features/evaluation/index.md#provider-credentials)
for details, including behavior with `--env-from-file`.
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
    model: github-copilot/gpt-4o
    instruction: You are a helpful assistant.
```
@y
```yaml
agents:
  root:
    model: github-copilot/gpt-4o
    instruction: You are a helpful assistant.
```
@z

@x
### Named model
@y
### Named model
@z

@x
```yaml
models:
  copilot:
    provider: github-copilot
    model: gpt-4o
    temperature: 0.7
    max_tokens: 4000
@y
```yaml
models:
  copilot:
    provider: github-copilot
    model: gpt-4o
    temperature: 0.7
    max_tokens: 4000
@z

@x
agents:
  root:
    model: copilot
```
@y
agents:
  root:
    model: copilot
```
@z

@x
## Available Models
@y
## Available Models
@z

@x
The exact set of models you can call depends on your Copilot plan. The most
commonly available ones today are:
@y
The exact set of models you can call depends on your Copilot plan. The most
commonly available ones today are:
@z

@x
| Model                    | Best For                            |
| ------------------------ | ----------------------------------- |
| `gpt-4o`                 | Multimodal, balanced performance    |
| `gpt-4o-mini`            | Fast and cheap                      |
| `claude-sonnet-4`        | Strong coding and analysis          |
| `gemini-2.5-pro`         | Google's flagship, large context    |
| `o3-mini`                | Reasoning-focused                   |
@y
| Model                    | Best For                            |
| ------------------------ | ----------------------------------- |
| `gpt-4o`                 | Multimodal, balanced performance    |
| `gpt-4o-mini`            | Fast and cheap                      |
| `claude-sonnet-4`        | Strong coding and analysis          |
| `gemini-2.5-pro`         | Google's flagship, large context    |
| `o3-mini`                | Reasoning-focused                   |
@z

@x
Check the
[GitHub Copilot documentation](https://docs.github.com/en/copilot)
for the current model list.
@y
Check the
[GitHub Copilot documentation](https://docs.github.com/en/copilot)
for the current model list.
@z

@x
## `Copilot-Integration-Id` Header
@y
## `Copilot-Integration-Id` Header
@z

@x
GitHub's Copilot API rejects requests that don't carry a
`Copilot-Integration-Id` header with a `Bad Request` error. Docker Agent
automatically sends `copilot-developer-cli` for the `github-copilot`
provider, so PAT-based usage works out of the box.
@y
GitHub's Copilot API rejects requests that don't carry a
`Copilot-Integration-Id` header with a `Bad Request` error. Docker Agent
automatically sends `copilot-developer-cli` for the `github-copilot`
provider, so PAT-based usage works out of the box.
@z

@x
We specifically chose `copilot-developer-cli` (instead of, say,
`vscode-chat`) because it is the integration id accepted by the Copilot
API for **both** OAuth tokens and Personal Access Tokens. Most
Docker Agent users authenticate with a PAT exported as `GITHUB_TOKEN`,
and `vscode-chat` is rejected for those tokens.
@y
We specifically chose `copilot-developer-cli` (instead of, say,
`vscode-chat`) because it is the integration id accepted by the Copilot
API for **both** OAuth tokens and Personal Access Tokens. Most
Docker Agent users authenticate with a PAT exported as `GITHUB_TOKEN`,
and `vscode-chat` is rejected for those tokens.
@z

@x
If you need to send a different integration id — for example if your
organization allows-lists a specific value — you can override it via
`provider_opts.http_headers`:
@y
If you need to send a different integration id — for example if your
organization allows-lists a specific value — you can override it via
`provider_opts.http_headers`:
@z

@x
```yaml
models:
  copilot:
    provider: github-copilot
    model: gpt-4o
    provider_opts:
      http_headers:
        Copilot-Integration-Id: my-custom-integration
```
@y
```yaml
models:
  copilot:
    provider: github-copilot
    model: gpt-4o
    provider_opts:
      http_headers:
        Copilot-Integration-Id: my-custom-integration
```
@z

@x
Header names are matched case-insensitively, so `copilot-integration-id`
works too.
@y
Header names are matched case-insensitively, so `copilot-integration-id`
works too.
@z

@x
## Chat Completions vs. Responses API
@y
## Chat Completions vs. Responses API
@z

@x
GitHub Copilot proxies OpenAI models behind two endpoints: the legacy
`/chat/completions` and the newer `/responses`. Newer models (the `gpt-5`
family, Codex variants, etc.) are only served via `/responses` and reject
`/chat/completions` with a `400 Bad Request`. Docker Agent auto-selects the
right endpoint per model, so no configuration is needed in the common case.
@y
GitHub Copilot proxies OpenAI models behind two endpoints: the legacy
`/chat/completions` and the newer `/responses`. Newer models (the `gpt-5`
family, Codex variants, etc.) are only served via `/responses` and reject
`/chat/completions` with a `400 Bad Request`. Docker Agent auto-selects the
right endpoint per model, so no configuration is needed in the common case.
@z

@x
If you ever need to force one or the other, set `api_type` explicitly:
@y
If you ever need to force one or the other, set `api_type` explicitly:
@z

@x
```yaml
models:
  copilot:
    provider: github-copilot
    model: gpt-5
    provider_opts:
      api_type: openai_responses # or openai_chatcompletions
```
@y
```yaml
models:
  copilot:
    provider: github-copilot
    model: gpt-5
    provider_opts:
      api_type: openai_responses # or openai_chatcompletions
```
@z

@x
## Custom HTTP Headers
@y
## Custom HTTP Headers
@z

@x
`provider_opts.http_headers` is a generic escape hatch that works for any
OpenAI-compatible provider, not just GitHub Copilot. Every key/value pair
is added to every outgoing request:
@y
`provider_opts.http_headers` is a generic escape hatch that works for any
OpenAI-compatible provider, not just GitHub Copilot. Every key/value pair
is added to every outgoing request:
@z

@x
```yaml
models:
  my_model:
    provider: openai
    model: gpt-4o
    provider_opts:
      http_headers:
        X-Request-Source: docker-agent
        X-Tenant-Id: my-team
```
@y
```yaml
models:
  my_model:
    provider: openai
    model: gpt-4o
    provider_opts:
      http_headers:
        X-Request-Source: docker-agent
        X-Tenant-Id: my-team
```
@z

@x
## How It Works
@y
## How It Works
@z

@x
GitHub Copilot is implemented as a built-in alias in Docker Agent:
@y
GitHub Copilot is implemented as a built-in alias in Docker Agent:
@z

@x
- **API type:** OpenAI-compatible (Chat Completions)
- **Base URL:** `https://api.githubcopilot.com`
- **Token variable:** `GITHUB_TOKEN`
- **Default headers:** `Copilot-Integration-Id: copilot-developer-cli`
@y
- **API type:** OpenAI-compatible (Chat Completions)
- **Base URL:** `https://api.githubcopilot.com`
- **Token variable:** `GITHUB_TOKEN`
- **Default headers:** `Copilot-Integration-Id: copilot-developer-cli`
@z

@x
This means the same client as OpenAI is used, so every OpenAI feature
supported by Docker Agent (tool calling, structured output, multimodal
inputs, etc.) is available when the underlying model supports it.
@y
This means the same client as OpenAI is used, so every OpenAI feature
supported by Docker Agent (tool calling, structured output, multimodal
inputs, etc.) is available when the underlying model supports it.
@z
