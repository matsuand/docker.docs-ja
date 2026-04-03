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
@y
description: What a sandbox permits and blocks before you change any settings.
@z

@x
{{< summary-bar feature_name="Docker Sandboxes sbx" >}}
@y
{{< summary-bar feature_name="Docker Sandboxes sbx" >}}
@z

@x
A sandbox created with `sbx run` and no additional flags or blueprints has
the following security posture.
@y
A sandbox created with `sbx run` and no additional flags or blueprints has
the following security posture.
@z

@x
## Network defaults
@y
## Network defaults
@z

@x
All outbound HTTP and HTTPS traffic is blocked unless an explicit rule allows
it (deny-by-default). All non-HTTP protocols (raw TCP, UDP including DNS, and
ICMP) are blocked at the network layer. Traffic to private IP ranges, loopback
addresses, and link-local addresses is also blocked.
@y
All outbound HTTP and HTTPS traffic is blocked unless an explicit rule allows
it (deny-by-default). All non-HTTP protocols (raw TCP, UDP including DNS, and
ICMP) are blocked at the network layer. Traffic to private IP ranges, loopback
addresses, and link-local addresses is also blocked.
@z

@x
Run `sbx policy ls` to see the active allow rules for your installation. To
customize network access, see [Policies](policy.md).
@y
Run `sbx policy ls` to see the active allow rules for your installation. To
customize network access, see [Policies](policy.md).
@z

@x
## Workspace defaults
@y
## Workspace defaults
@z

@x
Sandboxes use a direct mount by default. The agent sees and modifies your
working tree directly, and changes appear on your host immediately.
@y
Sandboxes use a direct mount by default. The agent sees and modifies your
working tree directly, and changes appear on your host immediately.
@z

@x
The agent can read, write, and delete any file within the workspace directory,
including hidden files, configuration files, build scripts, and Git hooks.
See [Workspace trust](workspace.md) for what to review after an agent session.
@y
The agent can read, write, and delete any file within the workspace directory,
including hidden files, configuration files, build scripts, and Git hooks.
See [Workspace trust](workspace.md) for what to review after an agent session.
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
See [Credentials](credentials.md) for setup instructions.
@y
See [Credentials](credentials.md) for setup instructions.
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
Docker images, and configuration changes, persists across stop and restart
cycles. When you remove the sandbox with `sbx rm`, the VM and its contents
are deleted. Only workspace files remain on the host.
@y
Everything the agent installs or creates inside the VM, including packages,
Docker images, and configuration changes, persists across stop and restart
cycles. When you remove the sandbox with `sbx rm`, the VM and its contents
are deleted. Only workspace files remain on the host.
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
- Host filesystem access outside the workspace directory
- Host Docker daemon
- Host network and localhost
- Communication between sandboxes
- Raw TCP, UDP, and ICMP connections
- Traffic to private IP ranges and link-local addresses
@y
- Host filesystem access outside the workspace directory
- Host Docker daemon
- Host network and localhost
- Communication between sandboxes
- Raw TCP, UDP, and ICMP connections
- Traffic to private IP ranges and link-local addresses
@z

@x
Outbound HTTP/HTTPS to domains not in the allow list is also blocked by
default, but you can add allow rules with `sbx policy allow`.
@y
Outbound HTTP/HTTPS to domains not in the allow list is also blocked by
default, but you can add allow rules with `sbx policy allow`.
@z
