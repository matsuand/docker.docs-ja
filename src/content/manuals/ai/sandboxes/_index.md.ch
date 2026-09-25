%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

% __SUBDIR__ 対応 / .md リンクへの (no slash) 対応

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
Docker Sandboxes run AI coding agents in isolated environments on your machine
or on Docker-managed cloud infrastructure. Use the `sbx` CLI to create and
manage either kind of sandbox.
@y
Docker Sandboxes run AI coding agents in isolated environments on your machine
or on Docker-managed cloud infrastructure. Use the `sbx` CLI to create and
manage either kind of sandbox.
@z

@x
The `sbx` CLI and local sandbox compute are free to use, including for commercial
work. Cloud compute uses a
[pay-as-you-go subscription](/manuals/agentic-platform/signup.md#billing).
Model-provider charges are separate.
@y
The `sbx` CLI and local sandbox compute are free to use, including for commercial
work. Cloud compute uses a
[pay-as-you-go subscription](manuals/agentic-platform/signup.md#billing).
Model-provider charges are separate.
@z

@x
Organization admins can
[centrally manage sandbox network, filesystem, and MCP policies](governance/access-controls/organization.md),
for local sandboxes across developer machines.
Available on a separate paid subscription.
@y
Organization admins can
[centrally manage sandbox network, filesystem, and MCP policies](governance/access-controls/organization.md),
for local sandboxes across developer machines.
Available on a separate paid subscription.
@z

@x
## Get started
@y
## Get started
@z

@x
[Install the `sbx` CLI](install.md) and sign in, then choose where to run your
agent:
@y
[Install the `sbx` CLI](install.md) and sign in, then choose where to run your
agent:
@z

@x
| Environment | Use it for | Start here |
| --- | --- | --- |
| Local sandboxes | Work with files and supported hardware on your machine | [Get started locally](get-started.md) |
| Cloud sandboxes | Run on Docker-managed compute without local virtualization | [Get started in the cloud](cloud/_index.md#get-started) |
@y
| Environment | Use it for | Start here |
| --- | --- | --- |
| Local sandboxes | Work with files and supported hardware on your machine | [Get started locally](get-started.md) |
| Cloud sandboxes | Run on Docker-managed compute without local virtualization | [Get started in the cloud](cloud/_index.md#get-started) |
@z

@x
The two environments have separate credentials, network policies, and lifecycle
controls. See [Compare local and cloud sandboxes](cloud/local-vs-cloud.md)
before adapting a workflow.
@y
The two environments have separate credentials, network policies, and lifecycle
controls. See [Compare local and cloud sandboxes](cloud/local-vs-cloud.md)
before adapting a workflow.
@z

@x
To create and manage cloud sandboxes from your application, see
[Sandboxes API and SDK](../sandboxes-api/_index.md).
@y
To create and manage cloud sandboxes from your application, see
[Sandboxes API and SDK](../sandboxes-api/_index.md).
@z

@x
## Learn more
@y
## Learn more
@z

@x
The following guides describe local sandbox workflows. For cloud workflows,
see [Cloud sandboxes](cloud/).
@y
The following guides describe local sandbox workflows. For cloud workflows,
see [Cloud sandboxes](cloud/).
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
- [Kits](customize/) — package tools and configuration into reusable
  sandbox environments
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
- [Kits](customize/) — package tools and configuration into reusable
  sandbox environments
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
