%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

% __SUBDIR__ 対応

@x
title: Docker Sandboxes
description: Run AI coding agents in isolated environments
keywords: docker sandboxes, sbx, ai agents, sandboxed agents, microVM
@y
title: Docker Sandboxes
description: Run AI coding agents in isolated environments
keywords: docker sandboxes, sbx, ai agents, sandboxed agents, microVM
@z

@x
Docker Sandboxes run AI coding agents in isolated microVM sandboxes. Each
sandbox gets its own Docker daemon, filesystem, and network — the agent can
build containers, install packages, and modify files without touching your host
system.
@y
Docker Sandboxes run AI coding agents in isolated microVM sandboxes. Each
sandbox gets its own Docker daemon, filesystem, and network — the agent can
build containers, install packages, and modify files without touching your host
system.
@z

@x
> [!NOTE]
> The `sbx` CLI is free to use, including for commercial work. Only
> [organization governance](governance/) requires a separate paid subscription.
@y
> [!NOTE]
> The `sbx` CLI is free to use, including for commercial work. Only
> [organization governance](governance/) requires a separate paid subscription.
@z

@x
Organization admins can
[centrally manage sandbox network, filesystem, and MCP policies](governance/access-controls/organization.md),
so the same controls apply uniformly across every developer's machine.
Available on a separate paid subscription.
@y
Organization admins can
[centrally manage sandbox network, filesystem, and MCP policies](governance/access-controls/organization.md),
so the same controls apply uniformly across every developer's machine.
Available on a separate paid subscription.
@z

@x
## Get started
@y
## Get started
@z

@x
Follow the [installation guide](install.md) to check the system requirements,
install the `sbx` CLI, and sign in.
@y
Follow the [installation guide](install.md) to check the system requirements,
install the `sbx` CLI, and sign in.
@z

@x
Then launch an agent in a sandbox:
@y
Then launch an agent in a sandbox:
@z

@x
```console
$ cd ~/my-project
$ sbx run claude
```
@y
```console
$ cd ~/my-project
$ sbx run claude
```
@z

@x
See the [get started guide](get-started.md) for a first-session walkthrough, or
jump to the [usage guide](usage.md) for basic commands.
@y
See the [get started guide](get-started.md) for a first-session walkthrough, or
jump to the [usage guide](usage.md) for basic commands.
@z

@x
## Learn more
@y
## Learn more
@z

@x
- [Agents](agents/) — supported agents and per-agent configuration
- [Workflows](workflows/) — patterns for Git, local development,
  authentication, agent skills, and automation
- [Configuration](configuration/) — manage credentials, declare project
  environments, turn on GPU passthrough, and configure an upstream proxy
- [Integrations](integrations/) — connect editors and apps like VS Code and
  Cursor to a sandbox over SSH
- [MCP gateway](mcp-gateway.md) — register MCP servers and connect them to
  sandboxed agents
- [Customize](customize/) — reusable templates and declarative kits for
  extending or tailoring sandboxes
- [Architecture](architecture.md) — microVM isolation, workspace mounting,
  networking
- [Security](security/) — isolation model, credential handling, and
  network policies
- [CLI reference](/reference/cli/sbx/) — full list of `sbx` commands and options
- [Troubleshooting](troubleshooting.md) — common issues and fixes
- [FAQ](faq.md) — login requirements, telemetry, etc
@y
- [Agents](agents/) — supported agents and per-agent configuration
- [Workflows](workflows/) — patterns for Git, local development,
  authentication, agent skills, and automation
- [Configuration](configuration/) — manage credentials, declare project
  environments, turn on GPU passthrough, and configure an upstream proxy
- [Integrations](integrations/) — connect editors and apps like VS Code and
  Cursor to a sandbox over SSH
- [MCP gateway](mcp-gateway.md) — register MCP servers and connect them to
  sandboxed agents
- [Customize](customize/) — reusable templates and declarative kits for
  extending or tailoring sandboxes
- [Architecture](architecture.md) — microVM isolation, workspace mounting,
  networking
- [Security](security/) — isolation model, credential handling, and
  network policies
- [CLI reference](__SUBDIR__/reference/cli/sbx/) — full list of `sbx` commands and options
- [Troubleshooting](troubleshooting.md) — common issues and fixes
- [FAQ](faq.md) — login requirements, telemetry, etc
@z

@x
## Feedback
@y
## Feedback
@z

@x
Your feedback shapes what gets built next. If you run into a bug, hit a
missing feature, or have a suggestion, open an issue at
[github.com/docker/sbx-releases/issues](https://github.com/docker/sbx-releases/issues).
@y
Your feedback shapes what gets built next. If you run into a bug, hit a
missing feature, or have a suggestion, open an issue at
[github.com/docker/sbx-releases/issues](https://github.com/docker/sbx-releases/issues).
@z
