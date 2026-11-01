%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

% __SUBDIR__ 対応

@x
title: "A2A Tool"
description: "Connect to remote agents via the Agent-to-Agent protocol."
keywords: docker agent, ai agents, tools, toolsets, a2a tool
linkTitle: "A2A"
@y
title: "A2A Tool"
description: "Connect to remote agents via the Agent-to-Agent protocol."
keywords: docker agent, ai agents, tools, toolsets, a2a tool
linkTitle: "A2A"
@z

@x
canonical: https://docs.docker.com/ai/docker-agent/tools/a2a/
@y
canonical: __SUBDIR__/ai/docker-agent/tools/a2a/
@z

@x
_Connect to remote agents via the Agent-to-Agent protocol._
@y
_Connect to remote agents via the Agent-to-Agent protocol._
@z

@x
## Overview
@y
## Overview
@z

@x
The A2A tool connects to a remote agent exposed over the A2A (Agent-to-Agent) protocol. Unlike [`handoff`](../handoff/index.md), which only targets local agents declared in the same config, `a2a` reaches out to an agent running on the network.
@y
The A2A tool connects to a remote agent exposed over the A2A (Agent-to-Agent) protocol. Unlike [`handoff`](../handoff/index.md), which only targets local agents declared in the same config, `a2a` reaches out to an agent running on the network.
@z

@x
## Configuration
@y
## Configuration
@z

@x
```yaml
toolsets:
  - type: a2a
    url: "http://localhost:8082"
    allow_private_ips: true # Only for trusted local or internal agents
    # Optional: prefix for each remote skill's tool name
    name: research_agent
    # Optional: custom HTTP headers (typically for auth)
    headers:
      Authorization: "Bearer ${env.A2A_TOKEN}"
      X-Tenant: "acme"
```
@y
```yaml
toolsets:
  - type: a2a
    url: "http://localhost:8082"
    allow_private_ips: true # Only for trusted local or internal agents
    # Optional: prefix for each remote skill's tool name
    name: research_agent
    # Optional: custom HTTP headers (typically for auth)
    headers:
      Authorization: "Bearer ${env.A2A_TOKEN}"
      X-Tenant: "acme"
```
@z

@x
Configured headers authenticate invocation requests, but are not sent while fetching the agent card. The current tool therefore cannot discover a server protected by `docker agent serve a2a --auth-token`, which also protects the agent-card endpoint.
@y
Configured headers authenticate invocation requests, but are not sent while fetching the agent card. The current tool therefore cannot discover a server protected by `docker agent serve a2a --auth-token`, which also protects the agent-card endpoint.
@z

@x
The `url` is the server base URL used to discover `/.well-known/agent-card.json`. Local and private-IP servers require `allow_private_ips: true`.
@y
The `url` is the server base URL used to discover `/.well-known/agent-card.json`. Local and private-IP servers require `allow_private_ips: true`.
@z

@x
The toolset reads both A2A 1.0 agent cards and legacy 0.3 cards. For 0.3 cards, the primary `url` and complete `additionalInterfaces` entries are treated as the card's interfaces; additional entries missing `url` or `transport` are skipped. A 1.0 card with a `supportedInterfaces` entry that has no URL or no protocol binding is rejected as malformed. Invocation headers are scoped to the origin of the interface selected for the call.
@y
The toolset reads both A2A 1.0 agent cards and legacy 0.3 cards. For 0.3 cards, the primary `url` and complete `additionalInterfaces` entries are treated as the card's interfaces; additional entries missing `url` or `transport` are skipped. A 1.0 card with a `supportedInterfaces` entry that has no URL or no protocol binding is rejected as malformed. Invocation headers are scoped to the origin of the interface selected for the call.
@z

@x
## Properties
@y
## Properties
@z

@x
| Property   | Type             | Required | Description                                                                                              |
| ---------- | ---------------- | -------- | -------------------------------------------------------------------------------------------------------- |
| `url`      | string           | ✓        | A2A server endpoint URL (must include scheme).                                                           |
| `name`     | string           | ✗        | Prefix for each remote skill's tool name. Without it, names use the skill ID or name; cards without skills use the agent name.     |
| `headers`  | map\[string\]string | ✗     | Extra HTTP headers sent with invocation requests, not agent-card discovery (useful for authentication, tenant selection, and tracing). |
@y
| Property   | Type             | Required | Description                                                                                              |
| ---------- | ---------------- | -------- | -------------------------------------------------------------------------------------------------------- |
| `url`      | string           | ✓        | A2A server endpoint URL (must include scheme).                                                           |
| `name`     | string           | ✗        | Prefix for each remote skill's tool name. Without it, names use the skill ID or name; cards without skills use the agent name.     |
| `headers`  | map\[string\]string | ✗     | Extra HTTP headers sent with invocation requests, not agent-card discovery (useful for authentication, tenant selection, and tracing). |
@z

@x
`allow_private_ips` is an optional boolean, defaulting to `false`. It permits agent-card and invocation requests to non-public IP addresses; enable it only for trusted internal agents.
@y
`allow_private_ips` is an optional boolean, defaulting to `false`. It permits agent-card and invocation requests to non-public IP addresses; enable it only for trusted internal agents.
@z

@x
When Docker Desktop is running, eligible requests use its PAC adapter before environment proxy settings. Set `DOCKER_AGENT_DISABLE_DESKTOP_PROXY=1` (or `true`, `yes`, or `on`) to restore standard `HTTP_PROXY`, `HTTPS_PROXY`, `ALL_PROXY`, and `NO_PROXY` routing; `NO_PROXY` does not bypass Docker Desktop PAC selection. Docker Agent does not evaluate PAC files or URLs directly—see [Docker Desktop proxy](../fetch/index.md#docker-desktop-proxy).
@y
When Docker Desktop is running, eligible requests use its PAC adapter before environment proxy settings. Set `DOCKER_AGENT_DISABLE_DESKTOP_PROXY=1` (or `true`, `yes`, or `on`) to restore standard `HTTP_PROXY`, `HTTPS_PROXY`, `ALL_PROXY`, and `NO_PROXY` routing; `NO_PROXY` does not bypass Docker Desktop PAC selection. Docker Agent does not evaluate PAC files or URLs directly—see [Docker Desktop proxy](../fetch/index.md#docker-desktop-proxy).
@z

@x
## Startup failure behaviour
@y
## Startup failure behaviour
@z

@x
Starting the toolset fetches the remote agent's card (`/.well-known/agent-card.json`). When that request fails with one of a fixed set of retryable HTTP statuses — 429 Too Many Requests, 408 Request Timeout, 500/502/503/504, or 529 (Anthropic-style "overloaded") — Docker Agent paces the next start attempt with the same [bounded exponential backoff gate](../rag/index.md#indexing-failures-retries-and-backoff) that remote MCP and RAG embedding calls use, instead of re-fetching the card on every agent turn. This is a fixed enumeration, not a full 5xx range: less-common codes such as 501, 505, or the Cloudflare 520–527 family do not arm the gate. A server-supplied `Retry-After` header, when present, is honored.
@y
Starting the toolset fetches the remote agent's card (`/.well-known/agent-card.json`). When that request fails with one of a fixed set of retryable HTTP statuses — 429 Too Many Requests, 408 Request Timeout, 500/502/503/504, or 529 (Anthropic-style "overloaded") — Docker Agent paces the next start attempt with the same [bounded exponential backoff gate](../rag/index.md#indexing-failures-retries-and-backoff) that remote MCP and RAG embedding calls use, instead of re-fetching the card on every agent turn. This is a fixed enumeration, not a full 5xx range: less-common codes such as 501, 505, or the Cloudflare 520–527 family do not arm the gate. A server-supplied `Retry-After` header, when present, is honored.
@z

@x
Everything else fails fast, retried every turn with no artificial delay: DNS failures, connection refused, SSRF-blocked private-IP targets (unless `allow_private_ips: true` is set), a malformed or unparsable agent card, and non-retryable HTTP statuses such as 400/401/403/404/501. Only the agent-card fetch during startup is paced; failures from an already-started toolset's per-call `SendStreamingMessage` requests are not.
@y
Everything else fails fast, retried every turn with no artificial delay: DNS failures, connection refused, SSRF-blocked private-IP targets (unless `allow_private_ips: true` is set), a malformed or unparsable agent card, and non-retryable HTTP statuses such as 400/401/403/404/501. Only the agent-card fetch during startup is paced; failures from an already-started toolset's per-call `SendStreamingMessage` requests are not.
@z

@x
> [!TIP]
> **See also**
>
> For full details on the A2A protocol and serving agents as A2A endpoints, see [A2A Protocol](../../features/a2a/index.md).
@y
> [!TIP]
> **See also**
>
> For full details on the A2A protocol and serving agents as A2A endpoints, see [A2A Protocol](../../features/a2a/index.md).
@z
