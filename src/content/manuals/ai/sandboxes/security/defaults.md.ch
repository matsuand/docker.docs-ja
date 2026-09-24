%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
title: Default security posture
linkTitle: Defaults
@y
title: Default security posture
linkTitle: Defaults
@z

@x
description: What a sandbox permits and blocks before you change any settings.
keywords: docker sandboxes, security defaults, network policy, credentials, shared skills, sbx
@y
description: What a sandbox permits and blocks before you change any settings.
keywords: docker sandboxes, security defaults, network policy, credentials, shared skills, sbx
@z

@x
A sandbox created with `sbx run claude` and no additional flags has the
following security posture.
@y
A sandbox created with `sbx run claude` and no additional flags has the
following security posture.
@z

@x
## Network defaults
@y
## Network defaults
@z

@x
All outbound TCP traffic, including HTTP, HTTPS, and SSH, is blocked unless an
explicit rule allows the destination. Direct external UDP and ICMP traffic is
blocked at the network layer. DNS queries use the sandbox's internal resolver,
which enforces network policy.
@y
All outbound TCP traffic, including HTTP, HTTPS, and SSH, is blocked unless an
explicit rule allows the destination. Direct external UDP and ICMP traffic is
blocked at the network layer. DNS queries use the sandbox's internal resolver,
which enforces network policy.
@z

@x
Run `sbx policy ls` to see the active network rules for your installation.
Rules can be customized per machine with the `sbx policy` CLI, or managed
centrally across your organization. Org-level rules take precedence over local
rules. See
[Network access policies](../governance/access-controls/network.md).
@y
Run `sbx policy ls` to see the active network rules for your installation.
Rules can be customized per machine with the `sbx policy` CLI, or managed
centrally across your organization. Org-level rules take precedence over local
rules. See
[Network access policies](../governance/access-controls/network.md).
@z

@x
## Workspace defaults
@y
## Workspace defaults
@z

@x
`sbx run` mounts the current directory when you don't pass a workspace path.
The agent can read, write, and delete any file within that directory, including
hidden files, configuration files, build scripts, and Git hooks.
@y
`sbx run` mounts the current directory when you don't pass a workspace path.
The agent can read, write, and delete any file within that directory, including
hidden files, configuration files, build scripts, and Git hooks.
@z

@x
When you omit the workspace path from `sbx create`, the sandbox doesn't mount a
host workspace. The agent uses the sandbox template's default working
directory. Docker-provided agent templates use `/home/agent/workspace`. If the
template doesn't define a usable absolute working directory, the daemon uses
that path. Files in this directory persist across stops and restarts and are
deleted when you remove the sandbox. See
[Workspace isolation](isolation.md#workspace-isolation) for the available
workspace modes and what to review after a direct-mount session.
@y
When you omit the workspace path from `sbx create`, the sandbox doesn't mount a
host workspace. The agent uses the sandbox template's default working
directory. Docker-provided agent templates use `/home/agent/workspace`. If the
template doesn't define a usable absolute working directory, the daemon uses
that path. Files in this directory persist across stops and restarts and are
deleted when you remove the sandbox. See
[Workspace isolation](isolation.md#workspace-isolation) for the available
workspace modes and what to review after a direct-mount session.
@z

@x
## Shared skills defaults
@y
## Shared skills defaults
@z

@x
Sandboxes created for supported agents mount a persistent shared skills store
read-only by default. The
[`skills.defaultMode`](../configuration/settings.md#skillsdefaultmode) setting
can change this default,
and `--skills` overrides it for a sandbox at creation. A sandbox with `readwrite` access can change skills that other
participating sandboxes load, including those with `readonly` access. Use
`--skills=off` when creating a sandbox to omit the shared store. Existing
sandboxes retain their mounts until recreated. See
[Share agent skills](../workflows/agent-skills.md).
@y
Sandboxes created for supported agents mount a persistent shared skills store
read-only by default. The
[`skills.defaultMode`](../configuration/settings.md#skillsdefaultmode) setting
can change this default,
and `--skills` overrides it for a sandbox at creation. A sandbox with `readwrite` access can change skills that other
participating sandboxes load, including those with `readonly` access. Use
`--skills=off` when creating a sandbox to omit the shared store. Existing
sandboxes retain their mounts until recreated. See
[Share agent skills](../workflows/agent-skills.md).
@z

@x
## Credential defaults
@y
## Credential defaults
@z

@x
No credentials are available to the sandbox unless you provide them using
`sbx secret` or environment variables. When credentials are provided, the
host-side proxy injects them into outbound HTTP headers. The agent cannot
read the raw credential values.
@y
No credentials are available to the sandbox unless you provide them using
`sbx secret` or environment variables. When credentials are provided, the
host-side proxy injects them into outbound HTTP headers. The agent cannot
read the raw credential values.
@z

@x
See [Credentials](../configuration/credentials.md) for setup instructions.
@y
See [Credentials](../configuration/credentials.md) for setup instructions.
@z

@x
## Agent capabilities inside the sandbox
@y
## Agent capabilities inside the sandbox
@z

@x
The agent runs with full control inside the sandbox VM:
@y
The agent runs with full control inside the sandbox VM:
@z

@x
- `sudo` access (the agent runs as a non-root user with sudo privileges)
- A private Docker Engine for building images and running containers
- Package installation through `apt`, `pip`, `npm`, and other package managers
- Full read and write access to the VM filesystem
@y
- `sudo` access (the agent runs as a non-root user with sudo privileges)
- A private Docker Engine for building images and running containers
- Package installation through `apt`, `pip`, `npm`, and other package managers
- Full read and write access to the VM filesystem
@z

@x
Everything the agent installs or creates inside the VM, including packages,
Docker images, mountless workspace files, and configuration changes, persists
across stop and restart cycles. When you remove the sandbox with `sbx rm`, the
VM and its contents are deleted. Direct-mounted workspace files and the shared
skills store remain on the host, as do repositories used as clone sources.
@y
Everything the agent installs or creates inside the VM, including packages,
Docker images, mountless workspace files, and configuration changes, persists
across stop and restart cycles. When you remove the sandbox with `sbx rm`, the
VM and its contents are deleted. Direct-mounted workspace files and the shared
skills store remain on the host, as do repositories used as clone sources.
@z

@x
## What is blocked by default
@y
## What is blocked by default
@z

@x
The following are blocked for all sandboxes and cannot be changed through
policy configuration:
@y
The following are blocked for all sandboxes and cannot be changed through
policy configuration:
@z

@x
- Host filesystem access outside explicitly mounted workspaces and the shared
  skills store
- Host Docker daemon
- Direct network communication between sandboxes
- Direct external UDP and ICMP connections
@y
- Host filesystem access outside explicitly mounted workspaces and the shared
  skills store
- Host Docker daemon
- Direct network communication between sandboxes
- Direct external UDP and ICMP connections
@z

@x
Outbound TCP to destinations not in the allow list is also blocked by default,
but you can add allow rules with `sbx policy allow`.
@y
Outbound TCP to destinations not in the allow list is also blocked by default,
but you can add allow rules with `sbx policy allow`.
@z
