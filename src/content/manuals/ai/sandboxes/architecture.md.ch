%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
title: Architecture
@y
title: Architecture
@z

@x
description: Technical architecture of Docker Sandboxes; workspace mounting, storage, networking, and sandbox lifecycle.
@y
description: Technical architecture of Docker Sandboxes; workspace mounting, storage, networking, and sandbox lifecycle.
@z

@x
{{< summary-bar feature_name="Docker Sandboxes sbx" >}}
@y
{{< summary-bar feature_name="Docker Sandboxes sbx" >}}
@z

@x
This page explains how Docker Sandboxes work under the hood. For the security
properties of the architecture, see [Sandbox isolation](security/isolation.md).
@y
This page explains how Docker Sandboxes work under the hood. For the security
properties of the architecture, see [Sandbox isolation](security/isolation.md).
@z

@x
## Workspace mounting
@y
## Workspace mounting
@z

@x
Your workspace is mounted directly into the sandbox through a filesystem
passthrough. The sandbox sees your actual host files, so changes in either
direction are instant with no sync process involved.
@y
Your workspace is mounted directly into the sandbox through a filesystem
passthrough. The sandbox sees your actual host files, so changes in either
direction are instant with no sync process involved.
@z

@x
Your workspace is mounted at the same absolute path as on your host. Preserving
absolute paths means error messages, configuration files, and build outputs all
reference paths you can find on your host. The agent sees exactly the directory
structure you see, which reduces confusion when debugging or reviewing changes.
@y
Your workspace is mounted at the same absolute path as on your host. Preserving
absolute paths means error messages, configuration files, and build outputs all
reference paths you can find on your host. The agent sees exactly the directory
structure you see, which reduces confusion when debugging or reviewing changes.
@z

@x
## Storage and persistence
@y
## Storage and persistence
@z

@x
When you create a sandbox, everything inside it persists until you remove it:
Docker images and containers built or pulled by the agent, installed packages,
agent state and history, and workspace changes.
@y
When you create a sandbox, everything inside it persists until you remove it:
Docker images and containers built or pulled by the agent, installed packages,
agent state and history, and workspace changes.
@z

@x
Sandboxes are isolated from each other. Each one maintains its own Docker
daemon state, image cache, and package installations. Multiple sandboxes don't
share images or layers.
@y
Sandboxes are isolated from each other. Each one maintains its own Docker
daemon state, image cache, and package installations. Multiple sandboxes don't
share images or layers.
@z

@x
Each sandbox consumes disk space for its VM image, Docker images, container
layers, and volumes, and this grows as you build images and install packages.
@y
Each sandbox consumes disk space for its VM image, Docker images, container
layers, and volumes, and this grows as you build images and install packages.
@z

@x
## Networking
@y
## Networking
@z

@x
All outbound traffic from the sandbox routes through an HTTP/HTTPS proxy on
your host. Agents are configured to use the proxy automatically. The proxy
enforces [network access policies](security/policy.md) and handles
[credential injection](security/credentials.md). See
[Network isolation](security/isolation.md#network-isolation) for how this
works and [Default security posture](security/defaults.md) for what is
allowed out of the box.
@y
All outbound traffic from the sandbox routes through an HTTP/HTTPS proxy on
your host. Agents are configured to use the proxy automatically. The proxy
enforces [network access policies](security/policy.md) and handles
[credential injection](security/credentials.md). See
[Network isolation](security/isolation.md#network-isolation) for how this
works and [Default security posture](security/defaults.md) for what is
allowed out of the box.
@z

@x
## Lifecycle
@y
## Lifecycle
@z

@x
`sbx run` initializes a VM with a workspace for a specified agent and starts
the agent. You can stop and restart without recreating the VM, preserving
installed packages and Docker images.
@y
`sbx run` initializes a VM with a workspace for a specified agent and starts
the agent. You can stop and restart without recreating the VM, preserving
installed packages and Docker images.
@z

@x
Sandboxes persist until explicitly removed. Stopping an agent doesn't delete
the VM; environment setup carries over between runs. Use `sbx rm` to delete
the sandbox, its VM, and all of its contents. If the sandbox used
`--branch`, the worktree directories and their branches are also removed.
@y
Sandboxes persist until explicitly removed. Stopping an agent doesn't delete
the VM; environment setup carries over between runs. Use `sbx rm` to delete
the sandbox, its VM, and all of its contents. If the sandbox used
`--branch`, the worktree directories and their branches are also removed.
@z

@x
## Comparison to alternatives
@y
## Comparison to alternatives
@z

@x
| Approach                                            | Isolation            | Docker access      | Use case           |
| --------------------------------------------------- | -------------------- | ------------------ | ------------------ |
| Sandboxes (microVMs)                                | Full (hypervisor)    | Isolated daemon    | Autonomous agents  |
| Container with socket mount                         | Partial (namespaces) | Shared host daemon | Trusted tools      |
| [Docker-in-Docker](https://hub.docker.com/_/docker) | Partial (privileged) | Nested daemon      | CI/CD pipelines    |
| Host execution                                      | None                 | Host daemon        | Manual development |
@y
| Approach                                            | Isolation            | Docker access      | Use case           |
| --------------------------------------------------- | -------------------- | ------------------ | ------------------ |
| Sandboxes (microVMs)                                | Full (hypervisor)    | Isolated daemon    | Autonomous agents  |
| Container with socket mount                         | Partial (namespaces) | Shared host daemon | Trusted tools      |
| [Docker-in-Docker](https://hub.docker.com/_/docker) | Partial (privileged) | Nested daemon      | CI/CD pipelines    |
| Host execution                                      | None                 | Host daemon        | Manual development |
@z

@x
Sandboxes trade higher resource overhead (a VM plus its own daemon) for
complete isolation. Use containers when you need lightweight packaging without
Docker access. Use sandboxes when you need to give something autonomous full
Docker capabilities without trusting it with your host environment.
@y
Sandboxes trade higher resource overhead (a VM plus its own daemon) for
complete isolation. Use containers when you need lightweight packaging without
Docker access. Use sandboxes when you need to give something autonomous full
Docker capabilities without trusting it with your host environment.
@z
