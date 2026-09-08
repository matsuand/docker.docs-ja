%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
title: "Managing Secrets"
description: "How to securely provide API keys and credentials to Docker Agent using environment variables, env files, Docker Compose secrets, and 1Password references."
keywords: docker agent, ai agents, guides, managing secrets
@y
title: "Managing Secrets"
description: "How to securely provide API keys and credentials to Docker Agent using environment variables, env files, Docker Compose secrets, and 1Password references."
keywords: docker agent, ai agents, guides, managing secrets
@z

@x
canonical: https://docs.docker.com/ai/docker-agent/guides/secrets/
@y
canonical: __SUBDIR__/ai/docker-agent/guides/secrets/
@z

@x
_How to securely provide API keys and credentials to Docker Agent._
@y
_How to securely provide API keys and credentials to Docker Agent._
@z

@x
## Overview
@y
## Overview
@z

@x
Docker Agent needs API keys to talk to model providers (OpenAI, Anthropic, etc.) and MCP tool servers (GitHub, Slack, etc.). These keys are **never stored in config files**. Instead, Docker Agent resolves them at runtime through a chain of secret providers, checked in order (see `pkg/environment/default.go`):
@y
Docker Agent needs API keys to talk to model providers (OpenAI, Anthropic, etc.) and MCP tool servers (GitHub, Slack, etc.). These keys are **never stored in config files**. Instead, Docker Agent resolves them at runtime through a chain of secret providers, checked in order (see `pkg/environment/default.go`):
@z

@x
| Priority | Provider | Description |
| --- | --- | --- |
| 1 | [Environment variables](#environment-variables) | `export OPENAI_API_KEY=sk-...` |
| 2 | [Docker Compose secrets](#docker-compose-secrets) | Files in `/run/secrets/` |
| 3 | [Docker Agent env file](#docker-agent-env-file) | `~/.config/cagent/.env`, written by `docker agent setup` |
| 4 | [Credential helper](#credential-helper) | Custom command declared in `~/.config/cagent/config.yaml` under `credential_helper:` |
| 5 | [Docker Desktop](#docker-desktop) | Secrets stored by the Docker Desktop backend (no setup on a Desktop install) |
@y
| Priority | Provider | Description |
| --- | --- | --- |
| 1 | [Environment variables](#environment-variables) | `export OPENAI_API_KEY=sk-...` |
| 2 | [Docker Compose secrets](#docker-compose-secrets) | Files in `/run/secrets/` |
| 3 | [Docker Agent env file](#docker-agent-env-file) | `~/.config/cagent/.env`, written by `docker agent setup` |
| 4 | [Credential helper](#credential-helper) | Custom command declared in `~/.config/cagent/config.yaml` under `credential_helper:` |
| 5 | [Docker Desktop](#docker-desktop) | Secrets stored by the Docker Desktop backend (no setup on a Desktop install) |
@z

@x
The first provider that has a value wins. You can mix and match — for example, use environment variables for one key and the Docker Agent env file for another.
@y
The first provider that has a value wins. You can mix and match — for example, use environment variables for one key and the Docker Agent env file for another.
@z

@x
> [!NOTE]
> Older Docker Agent versions could also read secrets from the macOS Keychain and the `pass` password manager. These sources are no longer consulted: migrate any keys stored there to one of the sources above, e.g. by re-running `docker agent setup`.
@y
> [!NOTE]
> Older Docker Agent versions could also read secrets from the macOS Keychain and the `pass` password manager. These sources are no longer consulted: migrate any keys stored there to one of the sources above, e.g. by re-running `docker agent setup`.
@z

@x
Whatever provider returns the value, if that value looks like a [1Password secret reference](#1password-references) (it starts with `op://`), Docker Agent resolves it through the `op` CLI before handing it to a model provider or tool.
@y
Whatever provider returns the value, if that value looks like a [1Password secret reference](#1password-references) (it starts with `op://`), Docker Agent resolves it through the `op` CLI before handing it to a model provider or tool.
@z

@x
When Docker Agent runs an agent with `--sandbox` and a Docker AI gateway is configured, the sandbox proxy authenticates gateway requests itself: it injects your Docker login token into HTTPS requests to the gateway host (docker.com domains only). The token never enters the sandbox — inside it, `DOCKER_TOKEN` is a proxy-managed placeholder.
@y
When Docker Agent runs an agent with `--sandbox` and a Docker AI gateway is configured, the sandbox proxy authenticates gateway requests itself: it injects your Docker login token into HTTPS requests to the gateway host (docker.com domains only). The token never enters the sandbox — inside it, `DOCKER_TOKEN` is a proxy-managed placeholder.
@z

@x
## Environment Variables
@y
## Environment Variables
@z

@x
The simplest approach. Set variables in your shell before running Docker Agent:
@y
The simplest approach. Set variables in your shell before running Docker Agent:
@z

@x
```bash
export OPENAI_API_KEY=sk-...
export ANTHROPIC_API_KEY=sk-ant-...
docker agent run agent.yaml
```
@y
```bash
export OPENAI_API_KEY=sk-...
export ANTHROPIC_API_KEY=sk-ant-...
docker agent run agent.yaml
```
@z

@x
Common variables:
@y
Common variables:
@z

@x
| Variable | Provider |
| --- | --- |
| `OPENAI_API_KEY` | OpenAI |
| `ANTHROPIC_API_KEY` | Anthropic |
| `GOOGLE_API_KEY` | Google Gemini |
| `MISTRAL_API_KEY` | Mistral |
| `OPENROUTER_API_KEY` | OpenRouter |
| `XAI_API_KEY` | xAI |
| `NEBIUS_API_KEY` | Nebius |
@y
| Variable | Provider |
| --- | --- |
| `OPENAI_API_KEY` | OpenAI |
| `ANTHROPIC_API_KEY` | Anthropic |
| `GOOGLE_API_KEY` | Google Gemini |
| `MISTRAL_API_KEY` | Mistral |
| `OPENROUTER_API_KEY` | OpenRouter |
| `XAI_API_KEY` | xAI |
| `NEBIUS_API_KEY` | Nebius |
@z

@x
MCP tools may require additional variables. For example, the GitHub MCP server needs `GITHUB_PERSONAL_ACCESS_TOKEN`. These are passed to tools via the `env` field in your config:
@y
MCP tools may require additional variables. For example, the GitHub MCP server needs `GITHUB_PERSONAL_ACCESS_TOKEN`. These are passed to tools via the `env` field in your config:
@z

@x
```yaml
toolsets:
  - type: mcp
    ref: docker:github-official
    env:
      GITHUB_PERSONAL_ACCESS_TOKEN: $GITHUB_PERSONAL_ACCESS_TOKEN
```
@y
```yaml
toolsets:
  - type: mcp
    ref: docker:github-official
    env:
      GITHUB_PERSONAL_ACCESS_TOKEN: $GITHUB_PERSONAL_ACCESS_TOKEN
```
@z

@x
## Env Files
@y
## Env Files
@z

@x
For convenience, you can store secrets in a `.env` file and pass it to Docker Agent with `--env-from-file`:
@y
For convenience, you can store secrets in a `.env` file and pass it to Docker Agent with `--env-from-file`:
@z

@x
```bash
# .env
OPENAI_API_KEY=sk-...
ANTHROPIC_API_KEY=sk-ant-...
GITHUB_PERSONAL_ACCESS_TOKEN=ghp_...
```
@y
```bash
# .env
OPENAI_API_KEY=sk-...
ANTHROPIC_API_KEY=sk-ant-...
GITHUB_PERSONAL_ACCESS_TOKEN=ghp_...
```
@z

@x
```bash
docker agent run agent.yaml --env-from-file .env
```
@y
```bash
docker agent run agent.yaml --env-from-file .env
```
@z

@x
The file format supports:
@y
The file format supports:
@z

@x
- `KEY=VALUE` pairs, one per line
- Comments starting with `#`
- Quoted values: `KEY="value with spaces"`
- Blank lines are ignored
@y
- `KEY=VALUE` pairs, one per line
- Comments starting with `#`
- Quoted values: `KEY="value with spaces"`
- Blank lines are ignored
@z

@x
> [!IMPORTANT]
> Add `.env` to your `.gitignore` to avoid committing secrets to version control.
@y
> [!IMPORTANT]
> Add `.env` to your `.gitignore` to avoid committing secrets to version control.
@z

@x
## Docker Agent env file
@y
## Docker Agent env file
@z

@x
A `.env` file (same format as above) at `~/.config/cagent/.env` is read automatically on every run — no `--env-from-file` flag needed. It is where [`docker agent setup`](../../features/cli/index.md#docker-agent-setup) stores API keys when you choose the env-file location, and you can edit it by hand:
@y
A `.env` file (same format as above) at `~/.config/cagent/.env` is read automatically on every run — no `--env-from-file` flag needed. It is where [`docker agent setup`](../../features/cli/index.md#docker-agent-setup) stores API keys when you choose the env-file location, and you can edit it by hand:
@z

@x
```bash
# ~/.config/cagent/.env
OPENAI_API_KEY=sk-...
```
@y
```bash
# ~/.config/cagent/.env
OPENAI_API_KEY=sk-...
```
@z

@x
The file is created with owner-only permissions (`0600`), but the values are stored in plain text.
@y
The file is created with owner-only permissions (`0600`), but the values are stored in plain text.
@z

@x
## Docker Compose Secrets
@y
## Docker Compose Secrets
@z

@x
When running Docker Agent in a container with Docker Compose, you can use [Compose secrets](https://docs.docker.com/compose/how-tos/use-secrets/) to inject credentials securely. Compose mounts secrets as files under `/run/secrets/`, and Docker Agent reads from this location automatically.
@y
When running Docker Agent in a container with Docker Compose, you can use [Compose secrets](https://docs.docker.com/compose/how-tos/use-secrets/) to inject credentials securely. Compose mounts secrets as files under `/run/secrets/`, and Docker Agent reads from this location automatically.
@z

@x
### From a file
@y
### From a file
@z

@x
Store each secret in its own file, then reference it in `compose.yaml`:
@y
Store each secret in its own file, then reference it in `compose.yaml`:
@z

@x
```bash
echo -n "sk-ant-your-key-here" > .anthropic_api_key
```
@y
```bash
echo -n "sk-ant-your-key-here" > .anthropic_api_key
```
@z

@x
```yaml
# compose.yaml
services:
  agent:
    image: docker/docker-agent
    command: run --exec /app/agent.yaml "Hello!"
    secrets:
      - ANTHROPIC_API_KEY
    volumes:
      - ./agent.yaml:/app/agent.yaml:ro
@y
```yaml
# compose.yaml
services:
  agent:
    image: docker/docker-agent
    command: run --exec /app/agent.yaml "Hello!"
    secrets:
      - ANTHROPIC_API_KEY
    volumes:
      - ./agent.yaml:/app/agent.yaml:ro
@z

@x
secrets:
  ANTHROPIC_API_KEY:
    file: ./.anthropic_api_key
```
@y
secrets:
  ANTHROPIC_API_KEY:
    file: ./.anthropic_api_key
```
@z

@x
Docker Compose mounts the file as `/run/secrets/ANTHROPIC_API_KEY`. Docker Agent picks it up with no extra configuration.
@y
Docker Compose mounts the file as `/run/secrets/ANTHROPIC_API_KEY`. Docker Agent picks it up with no extra configuration.
@z

@x
### From a host environment variable
@y
### From a host environment variable
@z

@x
In CI/CD pipelines, secrets are often injected as environment variables. Compose can forward these to `/run/secrets/`:
@y
In CI/CD pipelines, secrets are often injected as environment variables. Compose can forward these to `/run/secrets/`:
@z

@x
```yaml
secrets:
  ANTHROPIC_API_KEY:
    environment: "ANTHROPIC_API_KEY"
```
@y
```yaml
secrets:
  ANTHROPIC_API_KEY:
    environment: "ANTHROPIC_API_KEY"
```
@z

@x
### Multiple secrets
@y
### Multiple secrets
@z

@x
```yaml
services:
  agent:
    image: docker/docker-agent
    command: run --exec /app/agent.yaml "Summarize my GitHub issues"
    secrets:
      - ANTHROPIC_API_KEY
      - GITHUB_PERSONAL_ACCESS_TOKEN
    volumes:
      - ./agent.yaml:/app/agent.yaml:ro
@y
```yaml
services:
  agent:
    image: docker/docker-agent
    command: run --exec /app/agent.yaml "Summarize my GitHub issues"
    secrets:
      - ANTHROPIC_API_KEY
      - GITHUB_PERSONAL_ACCESS_TOKEN
    volumes:
      - ./agent.yaml:/app/agent.yaml:ro
@z

@x
secrets:
  ANTHROPIC_API_KEY:
    file: ./.anthropic_api_key
  GITHUB_PERSONAL_ACCESS_TOKEN:
    file: ./.github_token
```
@y
secrets:
  ANTHROPIC_API_KEY:
    file: ./.anthropic_api_key
  GITHUB_PERSONAL_ACCESS_TOKEN:
    file: ./.github_token
```
@z

@x
### Why use Compose secrets over environment variables?
@y
### Why use Compose secrets over environment variables?
@z

@x
| Aspect | Environment Variables | Compose Secrets |
| --- | --- | --- |
| Storage | In memory, visible via `docker inspect` | Mounted as tmpfs files under `/run/secrets/` |
| Visibility | Shown in process list and inspect output | Not exposed in `docker inspect` |
| Best for | Development | Production and CI/CD |
@y
| Aspect | Environment Variables | Compose Secrets |
| --- | --- | --- |
| Storage | In memory, visible via `docker inspect` | Mounted as tmpfs files under `/run/secrets/` |
| Visibility | Shown in process list and inspect output | Not exposed in `docker inspect` |
| Best for | Development | Production and CI/CD |
@z

@x
## Credential Helper
@y
## Credential Helper
@z

@x
Docker Agent can shell out to an external credential helper you define in your user config. This is useful when your organisation already has a secrets daemon you want to reuse (HashiCorp Vault, 1Password CLI, `bitwarden-cli`, etc.).
@y
Docker Agent can shell out to an external credential helper you define in your user config. This is useful when your organisation already has a secrets daemon you want to reuse (HashiCorp Vault, 1Password CLI, `bitwarden-cli`, etc.).
@z

@x
Declare the helper in `~/.config/cagent/config.yaml`:
@y
Declare the helper in `~/.config/cagent/config.yaml`:
@z

@x
```yaml
# ~/.config/cagent/config.yaml
credential_helper:
  command: op
  args: ["read", "op://Personal/docker-agent"]
```
@y
```yaml
# ~/.config/cagent/config.yaml
credential_helper:
  command: op
  args: ["read", "op://Personal/docker-agent"]
```
@z

@x
The command is invoked with the variable name appended as the final argument, and must print the secret value to stdout.
@y
The command is invoked with the variable name appended as the final argument, and must print the secret value to stdout.
@z

@x
## Docker Desktop
@y
## Docker Desktop
@z

@x
On machines where Docker Desktop is installed, Docker Agent queries Docker Desktop's backend for secrets stored against your signed-in Docker account. This is transparent — no extra configuration — and it is how signed-in Docker users get provider API keys without setting any environment variables.
@y
On machines where Docker Desktop is installed, Docker Agent queries Docker Desktop's backend for secrets stored against your signed-in Docker account. This is transparent — no extra configuration — and it is how signed-in Docker users get provider API keys without setting any environment variables.
@z

@x
## Docker Authentication
@y
## Docker Authentication
@z

@x
Routing model traffic through the [Docker models gateway](../../configuration/models/index.md) needs a Docker token. Docker Desktop hands out one that is valid for 15 minutes and cannot be renewed by Docker Agent, so when Desktop has nothing usable to offer — it is signed out, not running, or its own refresh is stuck — Docker Agent exchanges the long-lived access token that `docker login` left in your credential store for a fresh Docker token, the same exchange `docker login` itself performs. Signing in with `docker login` is therefore enough; Docker Desktop is not required.
@y
Routing model traffic through the [Docker models gateway](../../configuration/models/index.md) needs a Docker token. Docker Desktop hands out one that is valid for 15 minutes and cannot be renewed by Docker Agent, so when Desktop has nothing usable to offer — it is signed out, not running, or its own refresh is stuck — Docker Agent exchanges the long-lived access token that `docker login` left in your credential store for a fresh Docker token, the same exchange `docker login` itself performs. Signing in with `docker login` is therefore enough; Docker Desktop is not required.
@z

@x
Only Docker access tokens are exchanged — the `dckr_…` secrets `docker login` stores — never an account password, and the exchange goes to Docker Hub over HTTPS. The resulting bearer token is cached in a private file under Docker Agent's cache directory so sibling processes reuse it instead of minting their own, and it stops being used within seconds of a `docker logout` or an account switch. Run `docker agent debug auth` to see which token is in use and where it came from.
@y
Only Docker access tokens are exchanged — the `dckr_…` secrets `docker login` stores — never an account password, and the exchange goes to Docker Hub over HTTPS. The resulting bearer token is cached in a private file under Docker Agent's cache directory so sibling processes reuse it instead of minting their own, and it stops being used within seconds of a `docker logout` or an account switch. Run `docker agent debug auth` to see which token is in use and where it came from.
@z

@x
Set `DOCKER_AGENT_NO_TOKEN_EXCHANGE=1` to opt out: Docker Agent then relies on Docker Desktop alone.
@y
Set `DOCKER_AGENT_NO_TOKEN_EXCHANGE=1` to opt out: Docker Agent then relies on Docker Desktop alone.
@z

@x
## 1Password References
@y
## 1Password References
@z

@x
Any secret value resolved through the chain above can be a **1Password secret reference** instead of the literal secret. If the value starts with `op://`, Docker Agent resolves it by invoking the [1Password CLI](https://developer.1password.com/docs/cli/) (`op read <reference>`) and uses the result.
@y
Any secret value resolved through the chain above can be a **1Password secret reference** instead of the literal secret. If the value starts with `op://`, Docker Agent resolves it by invoking the [1Password CLI](https://developer.1password.com/docs/cli/) (`op read <reference>`) and uses the result.
@z

@x
This works with every provider — most commonly an environment variable or env file:
@y
This works with every provider — most commonly an environment variable or env file:
@z

@x
```bash
export OPENAI_API_KEY="op://Personal/OpenAI/api-key"
docker agent run agent.yaml
```
@y
```bash
export OPENAI_API_KEY="op://Personal/OpenAI/api-key"
docker agent run agent.yaml
```
@z

@x
References follow the `op://<vault>/<item>/<field>` format. Make sure the `op` CLI is installed and you are signed in (`op signin`) so that non-interactive reads succeed.
@y
References follow the `op://<vault>/<item>/<field>` format. Make sure the `op` CLI is installed and you are signed in (`op signin`) so that non-interactive reads succeed.
@z

@x
> [!WARNING]
> **Behaviour when resolution fails**
>
> If the value starts with `op://` but the `op` CLI is not installed, or the reference cannot be read (not signed in, wrong path, locked vault), Docker Agent logs a warning and uses an **empty value** — it never forwards the raw `op://` reference to a model provider or tool. Resolved references (and deterministic failures) are cached for the lifetime of the run; transient failures such as a cancelled lookup are not cached, so a later attempt can retry.
@y
> [!WARNING]
> **Behaviour when resolution fails**
>
> If the value starts with `op://` but the `op` CLI is not installed, or the reference cannot be read (not signed in, wrong path, locked vault), Docker Agent logs a warning and uses an **empty value** — it never forwards the raw `op://` reference to a model provider or tool. Resolved references (and deterministic failures) are cached for the lifetime of the run; transient failures such as a cancelled lookup are not cached, so a later attempt can retry.
@z

@x
## Choosing a Method
@y
## Choosing a Method
@z

@x
| Method | Best for | Setup effort |
| --- | --- | --- |
| Environment variables | Quick local development, scripts | Low |
| Env files | Team projects, multiple keys | Low |
| Docker Agent env file | Keys used across all projects, written by `docker agent setup` | Low |
| Docker Compose secrets | Containerized deployments, CI/CD | Medium |
| Credential helper | Reusing an existing secrets daemon (Vault, 1Password CLI, ...) | Medium |
| 1Password references (`op://`) | Teams already using 1Password | Low |
@y
| Method | Best for | Setup effort |
| --- | --- | --- |
| Environment variables | Quick local development, scripts | Low |
| Env files | Team projects, multiple keys | Low |
| Docker Agent env file | Keys used across all projects, written by `docker agent setup` | Low |
| Docker Compose secrets | Containerized deployments, CI/CD | Medium |
| Credential helper | Reusing an existing secrets daemon (Vault, 1Password CLI, ...) | Medium |
| 1Password references (`op://`) | Teams already using 1Password | Low |
@z

@x
You can combine methods. For example, store long-lived provider keys in the Docker Agent env file and pass project-specific MCP tokens via env files.
@y
You can combine methods. For example, store long-lived provider keys in the Docker Agent env file and pass project-specific MCP tokens via env files.
@z

@x
## Preventing Secret Leaks
@y
## Preventing Secret Leaks
@z

@x
Provider keys live in the secret store and are passed to Docker Agent through the chain above — the agent itself never receives them as input. But the **content of a conversation** can still leak credentials: a user pasting a token, a tool returning a config file with embedded keys, a transcript dumped into a prompt.
@y
Provider keys live in the secret store and are passed to Docker Agent through the chain above — the agent itself never receives them as input. But the **content of a conversation** can still leak credentials: a user pasting a token, a tool returning a config file with embedded keys, a transcript dumped into a prompt.
@z

@x
For that defense-in-depth case, set `redact_secrets: true` on an agent. It scrubs detected secrets out of:
@y
For that defense-in-depth case, set `redact_secrets: true` on an agent. It scrubs detected secrets out of:
@z

@x
- the arguments of every outgoing tool call (before the tool sees them),
- every outgoing chat message (before the model provider sees them), and
- every tool's output (before it reaches event consumers, the persisted session file, the `post_tool_use` hook input, or the next LLM call).
@y
- the arguments of every outgoing tool call (before the tool sees them),
- every outgoing chat message (before the model provider sees them), and
- every tool's output (before it reaches event consumers, the persisted session file, the `post_tool_use` hook input, or the next LLM call).
@z

@x
```yaml
agents:
  root:
    model: openai/gpt-5
    description: A helpful assistant
    instruction: You are a helpful assistant.
    redact_secrets: true
    toolsets:
      - type: shell
```
@y
```yaml
agents:
  root:
    model: openai/gpt-5
    description: A helpful assistant
    instruction: You are a helpful assistant.
    redact_secrets: true
    toolsets:
      - type: shell
```
@z

@x
The ruleset covers GitHub PATs, AWS / GCP / Azure credentials, Stripe / Slack / GitLab / Hugging Face tokens, JWTs, PEM-encoded private keys, Docker Hub PATs, and many others. Each detected span is replaced with the literal `[REDACTED]`. See the [Redacting Secrets](../../configuration/agents/index.md#redacting-secrets) section in the agent configuration reference for the full picture and important caveats about false negatives.
@y
The ruleset covers GitHub PATs, AWS / GCP / Azure credentials, Stripe / Slack / GitLab / Hugging Face tokens, JWTs, PEM-encoded private keys, Docker Hub PATs, and many others. Each detected span is replaced with the literal `[REDACTED]`. See the [Redacting Secrets](../../configuration/agents/index.md#redacting-secrets) section in the agent configuration reference for the full picture and important caveats about false negatives.
@z
