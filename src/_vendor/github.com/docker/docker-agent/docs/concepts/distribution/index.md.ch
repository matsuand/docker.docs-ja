%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

% __SUBDIR__ 対応

@x
title: "Agent Distribution"
description: "Package, share, and run agents via OCI-compatible registries — just like container images."
keywords: docker agent, ai agents, concepts, agent distribution
@y
title: "Agent Distribution"
description: "Package, share, and run agents via OCI-compatible registries — just like container images."
keywords: docker agent, ai agents, concepts, agent distribution
@z

@x
canonical: https://docs.docker.com/ai/docker-agent/concepts/distribution/
@y
canonical: __SUBDIR__/ai/docker-agent/concepts/distribution/
@z

@x
_Package, share, and run agents via OCI-compatible registries — just like container images._
@y
_Package, share, and run agents via OCI-compatible registries — just like container images._
@z

@x
## Overview
@y
## Overview
@z

@x
Docker Agent agents can be pushed to any OCI-compatible registry (Docker Hub, GitHub Container Registry, etc.) and pulled/run anywhere. This makes sharing agents as easy as sharing Docker images.
@y
Docker Agent agents can be pushed to any OCI-compatible registry (Docker Hub, GitHub Container Registry, etc.) and pulled/run anywhere. This makes sharing agents as easy as sharing Docker images.
@z

@x
> [!TIP]
> For CLI commands related to distribution, see [CLI Reference](../../features/cli/index.md) (`docker agent share push`, `docker agent share pull`, `docker agent alias`).
@y
> [!TIP]
> For CLI commands related to distribution, see [CLI Reference](../../features/cli/index.md) (`docker agent share push`, `docker agent share pull`, `docker agent alias`).
@z

@x
## Pushing Agents
@y
## Pushing Agents
@z

@x
```bash
# Push to Docker Hub
$ docker agent share push ./agent.yaml docker.io/username/my-agent:latest
@y
```bash
# Push to Docker Hub
$ docker agent share push ./agent.yaml docker.io/username/my-agent:latest
@z

@x
# Push to GitHub Container Registry
$ docker agent share push ./agent.yaml ghcr.io/username/my-agent:v1.0
```
@y
# Push to GitHub Container Registry
$ docker agent share push ./agent.yaml ghcr.io/username/my-agent:v1.0
```
@z

@x
## Pulling Agents
@y
## Pulling Agents
@z

@x
```bash
# Pull an agent
$ docker agent share pull docker.io/username/my-agent:latest
@y
```bash
# Pull an agent
$ docker agent share pull docker.io/username/my-agent:latest
@z

@x
# Pull from Docker Hub shorthand
$ docker agent share pull myorg/agent:tag
```
@y
# Pull from Docker Hub shorthand
$ docker agent share pull myorg/agent:tag
```
@z

@x
## Running from a Registry
@y
## Running from a Registry
@z

@x
Run agents directly from a registry without pulling first:
@y
Run agents directly from a registry without pulling first:
@z

@x
```bash
# Run directly from Docker Hub
$ docker agent run docker.io/username/my-agent:latest
@y
```bash
# Run directly from Docker Hub
$ docker agent run docker.io/username/my-agent:latest
@z

@x
# Docker Hub shorthand (docker.io is implied)
$ docker agent run myorg/agent:tag
@y
# Docker Hub shorthand (docker.io is implied)
$ docker agent run myorg/agent:tag
@z

@x
# Run with a specific agent from a multi-agent config
$ docker agent run docker.io/username/dev-team:latest -a developer
```
@y
# Run with a specific agent from a multi-agent config
$ docker agent run docker.io/username/dev-team:latest -a developer
```
@z

@x
## Using as Sub-Agents
@y
## Using as Sub-Agents
@z

@x
Registry agents can be used directly as sub-agents in a multi-agent configuration — no need to define them locally:
@y
Registry agents can be used directly as sub-agents in a multi-agent configuration — no need to define them locally:
@z

@x
```yaml
agents:
  root:
    model: openai/gpt-5
    description: Coordinator
    instruction: Delegate tasks to the right sub-agent.
    sub_agents:
      - myorg/agent:tag             # auto-named "agent"
      - my_reviewer:myorg/reviewer  # explicitly named "my_reviewer"
```
@y
```yaml
agents:
  root:
    model: openai/gpt-5
    description: Coordinator
    instruction: Delegate tasks to the right sub-agent.
    sub_agents:
      - myorg/agent:tag             # auto-named "agent"
      - my_reviewer:myorg/reviewer  # explicitly named "my_reviewer"
```
@z

@x
External sub-agents are automatically named after their last path segment. Use the `name:reference` syntax to give them a custom name.
@y
External sub-agents are automatically named after their last path segment. Use the `name:reference` syntax to give them a custom name.
@z

@x
Tag references are checked against the registry on every `docker agent run`, which adds a network round-trip per sub-agent at startup. Pin them to a digest (`myorg/agent@sha256:…`) to serve them from cache instead.
@y
Tag references are checked against the registry on every `docker agent run`, which adds a network round-trip per sub-agent at startup. Pin them to a digest (`myorg/agent@sha256:…`) to serve them from cache instead.
@z

@x
See [Pin external sub-agents to a digest](../multi-agent/index.md#pin-external-sub-agents-to-a-digest) and [External Sub-Agents](../multi-agent/index.md#external-sub-agents-from-registries) for details.
@y
See [Pin external sub-agents to a digest](../multi-agent/index.md#pin-external-sub-agents-to-a-digest) and [External Sub-Agents](../multi-agent/index.md#external-sub-agents-from-registries) for details.
@z

@x
## Using with Aliases
@y
## Using with Aliases
@z

@x
Combine OCI references with aliases for convenient access:
@y
Combine OCI references with aliases for convenient access:
@z

@x
```bash
# Create an alias for a registry agent
$ docker agent alias add coder myorg/coder --yolo
@y
```bash
# Create an alias for a registry agent
$ docker agent alias add coder myorg/coder --yolo
@z

@x
# Now just run
$ docker agent run coder
```
@y
# Now just run
$ docker agent run coder
```
@z

@x
## Using with API Server
@y
## Using with API Server
@z

@x
The API server supports OCI references with auto-refresh:
@y
The API server supports OCI references with auto-refresh:
@z

@x
```bash
# Start API from registry, auto-pull every 10 minutes
$ docker agent serve api docker.io/username/agent:latest --pull-interval 10
```
@y
```bash
# Start API from registry, auto-pull every 10 minutes
$ docker agent serve api docker.io/username/agent:latest --pull-interval 10
```
@z

@x
## Private Repositories
@y
## Private Repositories
@z

@x
Docker Agent supports pulling from private GitHub repositories and registries that require authentication. Use standard Docker login or GitHub authentication:
@y
Docker Agent supports pulling from private GitHub repositories and registries that require authentication. Use standard Docker login or GitHub authentication:
@z

@x
```bash
# Login to a registry
$ docker login docker.io
@y
```bash
# Login to a registry
$ docker login docker.io
@z

@x
# Now push/pull works with private repos
$ docker agent share push ./agent.yaml docker.io/myorg/private-agent:latest
$ docker agent run docker.io/myorg/private-agent:latest
```
@y
# Now push/pull works with private repos
$ docker agent share push ./agent.yaml docker.io/myorg/private-agent:latest
$ docker agent run docker.io/myorg/private-agent:latest
```
@z

@x
> [!NOTE]
> **Docker authentication**
>
> When pulling or running an agent from a `docker.com` or `*.docker.com` HTTPS URL (e.g. `desktop.docker.com`), Docker Agent automatically forwards a Docker token for authentication. If Docker Desktop is running and signed in, its token is used; otherwise, Docker Agent exchanges the access token stored by `docker login` for a fresh Docker token. Either way, no explicit login step is required beyond `docker login` (or being signed into Docker Desktop).
>
> Note: `docker.io` (the standard Docker Hub registry domain) is a separate domain and is **not** covered by automatic token forwarding. Agents pulled from `docker.io` or `registry-1.docker.io` still require `docker login docker.io` for private repositories.
@y
> [!NOTE]
> **Docker authentication**
>
> When pulling or running an agent from a `docker.com` or `*.docker.com` HTTPS URL (e.g. `desktop.docker.com`), Docker Agent automatically forwards a Docker token for authentication. If Docker Desktop is running and signed in, its token is used; otherwise, Docker Agent exchanges the access token stored by `docker login` for a fresh Docker token. Either way, no explicit login step is required beyond `docker login` (or being signed into Docker Desktop).
>
> Note: `docker.io` (the standard Docker Hub registry domain) is a separate domain and is **not** covered by automatic token forwarding. Agents pulled from `docker.io` or `registry-1.docker.io` still require `docker login docker.io` for private repositories.
@z

@x
> [!NOTE]
> **Troubleshooting**
>
> Having issues with push/pull? See [Troubleshooting](../../community/troubleshooting/index.md) for common registry issues.
@y
> [!NOTE]
> **Troubleshooting**
>
> Having issues with push/pull? See [Troubleshooting](../../community/troubleshooting/index.md) for common registry issues.
@z

@x
## Local Development
@y
## Local Development
@z

@x
For local development and testing, you can run an agent directly from a local HTTP server without a registry:
@y
For local development and testing, you can run an agent directly from a local HTTP server without a registry:
@z

@x
```bash
# Serve an agent config locally
$ python3 -m http.server 8080
@y
```bash
# Serve an agent config locally
$ python3 -m http.server 8080
@z

@x
# Run it directly via HTTP
$ docker agent run http://localhost:8080/agent.yaml
$ docker agent run http://127.0.0.1:8080/agent.yaml
```
@y
# Run it directly via HTTP
$ docker agent run http://localhost:8080/agent.yaml
$ docker agent run http://127.0.0.1:8080/agent.yaml
```
@z

@x
This is useful for iterating on agent configs served from a local dev server before pushing to a registry. Both `localhost` and `127.0.0.1` addresses are supported with plain `http://` URLs.
@y
This is useful for iterating on agent configs served from a local dev server before pushing to a registry. Both `localhost` and `127.0.0.1` addresses are supported with plain `http://` URLs.
@z
