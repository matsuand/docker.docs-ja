%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
title: Architecture
description: Technical architecture of Docker Sandboxes including microVM isolation, private Docker daemon, and workspace syncing.
@y
title: Architecture
description: Technical architecture of Docker Sandboxes including microVM isolation, private Docker daemon, and workspace syncing.
@z

@x
{{< summary-bar feature_name="Docker Sandboxes" >}}
@y
{{< summary-bar feature_name="Docker Sandboxes" >}}
@z

@x
This page explains how Docker Sandboxes works and the design decisions behind
it.
@y
This page explains how Docker Sandboxes works and the design decisions behind
it.
@z

@x
## Why microVMs?
@y
## Why microVMs?
@z

@x
AI coding agents need to build images, run containers, and use Docker Compose.
Giving an agent access to your host Docker daemon means it can see your
containers, pull images, and run workloads directly on your system. That's too
much access for autonomous code execution.
@y
AI coding agents need to build images, run containers, and use Docker Compose.
Giving an agent access to your host Docker daemon means it can see your
containers, pull images, and run workloads directly on your system. That's too
much access for autonomous code execution.
@z

@x
Running the agent in a container doesn't solve this. Containers share the host
kernel (or in the case of Docker Desktop, share the same virtual machine) and
can't safely isolate something that needs its own Docker daemon.
Docker-in-Docker approaches either compromise isolation (privileged mode with
host socket mounting) or create nested daemon complexity.
@y
Running the agent in a container doesn't solve this. Containers share the host
kernel (or in the case of Docker Desktop, share the same virtual machine) and
can't safely isolate something that needs its own Docker daemon.
Docker-in-Docker approaches either compromise isolation (privileged mode with
host socket mounting) or create nested daemon complexity.
@z

@x
MicroVMs provide the isolation boundary needed. Each sandbox gets its own VM
with a private Docker daemon. The agent can build images, start containers, and
run tests without any access to your host Docker environment. When you remove
the sandbox, everything inside - images, containers, packages - is gone.
@y
MicroVMs provide the isolation boundary needed. Each sandbox gets its own VM
with a private Docker daemon. The agent can build images, start containers, and
run tests without any access to your host Docker environment. When you remove
the sandbox, everything inside - images, containers, packages - is gone.
@z

@x
## Isolation model
@y
## Isolation model
@z

@x
### Private Docker daemon per sandbox
@y
### Private Docker daemon per sandbox
@z

@x
Each sandbox runs a complete Docker daemon inside its VM. This daemon is
isolated from your host and from other sandboxes.
@y
Each sandbox runs a complete Docker daemon inside its VM. This daemon is
isolated from your host and from other sandboxes.
@z

@x
```plaintext
Host system (your Docker Desktop)
  ├── Your containers and images
  │
  ├── Sandbox VM 1
  │   ├── Docker daemon (isolated)
  │   ├── Agent container
  │   └── Other containers (created by agent)
  │
  └── Sandbox VM 2
      ├── Docker daemon (isolated)
      └── Agent container
```
@y
```plaintext
Host system (your Docker Desktop)
  ├── Your containers and images
  │
  ├── Sandbox VM 1
  │   ├── Docker daemon (isolated)
  │   ├── Agent container
  │   └── Other containers (created by agent)
  │
  └── Sandbox VM 2
      ├── Docker daemon (isolated)
      └── Agent container
```
@z

@x
When an agent runs `docker build` or `docker compose up`, those commands
execute inside the sandbox using the private daemon. The agent sees only
containers it creates. It cannot access your host containers, images, or
volumes.
@y
When an agent runs `docker build` or `docker compose up`, those commands
execute inside the sandbox using the private daemon. The agent sees only
containers it creates. It cannot access your host containers, images, or
volumes.
@z

@x
This architecture solves a fundamental constraint: autonomous agents need full
Docker capabilities but cannot safely share your Docker daemon.
@y
This architecture solves a fundamental constraint: autonomous agents need full
Docker capabilities but cannot safely share your Docker daemon.
@z

@x
### Hypervisor-level isolation
@y
### Hypervisor-level isolation
@z

@x
Sandboxes use your system's native virtualization:
@y
Sandboxes use your system's native virtualization:
@z

@x
- macOS: virtualization.framework
- Windows: Hyper-V {{< badge color=violet text=Experimental >}}
@y
- macOS: virtualization.framework
- Windows: Hyper-V {{< badge color=violet text=Experimental >}}
@z

@x
This provides hypervisor-level isolation between the sandbox and your host.
Unlike containers (which share the host kernel), VMs have separate kernels and
cannot access host resources outside their defined boundaries.
@y
This provides hypervisor-level isolation between the sandbox and your host.
Unlike containers (which share the host kernel), VMs have separate kernels and
cannot access host resources outside their defined boundaries.
@z

@x
### What this means for security
@y
### What this means for security
@z

@x
The VM boundary provides:
@y
The VM boundary provides:
@z

@x
- Process isolation - Agent processes run in a separate kernel
- Filesystem isolation - Only your workspace is accessible
- Network isolation - Sandboxes cannot reach each other
- Docker isolation - No access to host daemon, containers, or images
@y
- Process isolation - Agent processes run in a separate kernel
- Filesystem isolation - Only your workspace is accessible
- Network isolation - Sandboxes cannot reach each other
- Docker isolation - No access to host daemon, containers, or images
@z

@x
Network filtering adds an additional control layer for HTTP/HTTPS traffic. See
[Network policies](network-policies.md) for details on that mechanism.
@y
Network filtering adds an additional control layer for HTTP/HTTPS traffic. See
[Network policies](network-policies.md) for details on that mechanism.
@z

@x
## Workspace syncing
@y
## Workspace syncing
@z

@x
### Bidirectional file sync
@y
### Bidirectional file sync
@z

@x
Your workspace syncs to the sandbox at the same absolute path:
@y
Your workspace syncs to the sandbox at the same absolute path:
@z

@x
- Host: `/Users/alice/projects/myapp`
- Sandbox: `/Users/alice/projects/myapp`
@y
- Host: `/Users/alice/projects/myapp`
- Sandbox: `/Users/alice/projects/myapp`
@z

@x
Changes sync both ways. Edit a file on your host, and the agent sees it. The
agent modifies a file, and you see the change on your host.
@y
Changes sync both ways. Edit a file on your host, and the agent sees it. The
agent modifies a file, and you see the change on your host.
@z

@x
This is file synchronization, not volume mounting. Files are copied between
host and VM. This approach works across different filesystems and maintains
consistent paths regardless of platform differences.
@y
This is file synchronization, not volume mounting. Files are copied between
host and VM. This approach works across different filesystems and maintains
consistent paths regardless of platform differences.
@z

@x
### Path preservation
@y
### Path preservation
@z

@x
Preserving absolute paths means:
@y
Preserving absolute paths means:
@z

@x
- File paths in error messages match between host and sandbox
- Hard-coded paths in configuration files work correctly
- Build outputs reference paths you can find on your host
@y
- File paths in error messages match between host and sandbox
- Hard-coded paths in configuration files work correctly
- Build outputs reference paths you can find on your host
@z

@x
The agent sees the same directory structure you see, reducing confusion when
debugging issues or reviewing changes.
@y
The agent sees the same directory structure you see, reducing confusion when
debugging issues or reviewing changes.
@z

@x
## Storage and persistence
@y
## Storage and persistence
@z

@x
### What persists
@y
### What persists
@z

@x
When you create a sandbox, these persist until you remove it:
@y
When you create a sandbox, these persist until you remove it:
@z

@x
- Docker images and containers - Built or pulled by the agent
- Installed packages - System packages added with apt, yum, etc.
- Agent state - Credentials, configuration, history
- Workspace changes - Files created or modified sync back to host
@y
- Docker images and containers - Built or pulled by the agent
- Installed packages - System packages added with apt, yum, etc.
- Agent state - Credentials, configuration, history
- Workspace changes - Files created or modified sync back to host
@z

@x
### What's ephemeral
@y
### What's ephemeral
@z

@x
Sandboxes are lightweight but not stateless. They persist between runs but are
isolated from each other. Each sandbox maintains its own:
@y
Sandboxes are lightweight but not stateless. They persist between runs but are
isolated from each other. Each sandbox maintains its own:
@z

@x
- Docker daemon state
- Image cache
- Package installations
@y
- Docker daemon state
- Image cache
- Package installations
@z

@x
When you remove a sandbox with `docker sandbox rm`, the entire VM and its
contents are deleted. Images built inside the sandbox, packages installed, and
any state not synced to your workspace are gone.
@y
When you remove a sandbox with `docker sandbox rm`, the entire VM and its
contents are deleted. Images built inside the sandbox, packages installed, and
any state not synced to your workspace are gone.
@z

@x
### Disk usage
@y
### Disk usage
@z

@x
Each sandbox consumes disk space for:
@y
Each sandbox consumes disk space for:
@z

@x
- VM disk image (grows as you build images and install packages)
- Docker images pulled or built inside the sandbox
- Container layers and volumes
@y
- VM disk image (grows as you build images and install packages)
- Docker images pulled or built inside the sandbox
- Container layers and volumes
@z

@x
Multiple sandboxes do not share images or layers. Each has its own isolated
Docker daemon and storage.
@y
Multiple sandboxes do not share images or layers. Each has its own isolated
Docker daemon and storage.
@z

@x
## Networking
@y
## Networking
@z

@x
### Internet access
@y
### Internet access
@z

@x
Sandboxes have outbound internet access through your host's network connection.
Agents can install packages, pull images, and access APIs.
@y
Sandboxes have outbound internet access through your host's network connection.
Agents can install packages, pull images, and access APIs.
@z

@x
An HTTP/HTTPS filtering proxy runs on your host and is available at
`host.docker.internal:3128`. Agents automatically use this proxy for outbound
web requests. You can configure network policies to control which destinations
are allowed. See [Network policies](network-policies.md).
@y
An HTTP/HTTPS filtering proxy runs on your host and is available at
`host.docker.internal:3128`. Agents automatically use this proxy for outbound
web requests. You can configure network policies to control which destinations
are allowed. See [Network policies](network-policies.md).
@z

@x
### Sandbox isolation
@y
### Sandbox isolation
@z

@x
Sandboxes cannot communicate with each other. Each VM has its own private
network namespace. An agent in one sandbox cannot reach services or containers
in another sandbox.
@y
Sandboxes cannot communicate with each other. Each VM has its own private
network namespace. An agent in one sandbox cannot reach services or containers
in another sandbox.
@z

@x
Sandboxes also cannot access your host's `localhost` services. The VM boundary
prevents direct access to services running on your host machine.
@y
Sandboxes also cannot access your host's `localhost` services. The VM boundary
prevents direct access to services running on your host machine.
@z

@x
## Lifecycle
@y
## Lifecycle
@z

@x
### Creating and running
@y
### Creating and running
@z

@x
`docker sandbox run` initializes a VM with a workspace for a specified agent,
and starts the agent inside an existing sandbox. You can stop and restart the
agent without recreating the VM, preserving installed packages and Docker
images.
@y
`docker sandbox run` initializes a VM with a workspace for a specified agent,
and starts the agent inside an existing sandbox. You can stop and restart the
agent without recreating the VM, preserving installed packages and Docker
images.
@z

@x
`docker sandbox create` initializes the VM with a workspace but doesn't start
the agent automatically. This separates environment setup from agent execution.
@y
`docker sandbox create` initializes the VM with a workspace but doesn't start
the agent automatically. This separates environment setup from agent execution.
@z

@x
### State management
@y
### State management
@z

@x
Sandboxes persist until explicitly removed. Stopping an agent doesn't delete
the VM. This means:
@y
Sandboxes persist until explicitly removed. Stopping an agent doesn't delete
the VM. This means:
@z

@x
- Installed packages remain available
- Built images stay cached
- Environment setup persists between runs
@y
- Installed packages remain available
- Built images stay cached
- Environment setup persists between runs
@z

@x
Use `docker sandbox rm` to delete a sandbox and reclaim disk space.
@y
Use `docker sandbox rm` to delete a sandbox and reclaim disk space.
@z

@x
## Comparison to alternatives
@y
## Comparison to alternatives
@z

@x
Understanding when to use sandboxes versus other approaches:
@y
Understanding when to use sandboxes versus other approaches:
@z

@x
| Approach                    | Isolation         | Agent Docker access      | Host impact                         | Use case                                      |
| --------------------------- | ----------------- | ------------------------ | ----------------------------------- | --------------------------------------------- |
| Sandboxes (microVMs)        | Hypervisor-level  | Private daemon           | None - fully isolated               | Autonomous agents building/running containers |
| Container with socket mount | Kernel namespaces | Host daemon (shared)     | Agent sees all host containers      | Trusted tools that need Docker CLI            |
| Docker-in-Docker            | Nested containers | Private daemon (complex) | Moderate - privileged mode required | CI/CD environments                            |
| Host execution              | None              | Host daemon              | Full - direct system access         | Manual development by trusted humans          |
@y
| Approach                    | Isolation         | Agent Docker access      | Host impact                         | Use case                                      |
| --------------------------- | ----------------- | ------------------------ | ----------------------------------- | --------------------------------------------- |
| Sandboxes (microVMs)        | Hypervisor-level  | Private daemon           | None - fully isolated               | Autonomous agents building/running containers |
| Container with socket mount | Kernel namespaces | Host daemon (shared)     | Agent sees all host containers      | Trusted tools that need Docker CLI            |
| Docker-in-Docker            | Nested containers | Private daemon (complex) | Moderate - privileged mode required | CI/CD environments                            |
| Host execution              | None              | Host daemon              | Full - direct system access         | Manual development by trusted humans          |
@z

@x
Sandboxes trade higher resource overhead (VM + daemon) for complete isolation.
Use containers when you need lightweight packaging without Docker access. Use
sandboxes when you need to give something autonomous full Docker capabilities
without trusting it with your host environment.
@y
Sandboxes trade higher resource overhead (VM + daemon) for complete isolation.
Use containers when you need lightweight packaging without Docker access. Use
sandboxes when you need to give something autonomous full Docker capabilities
without trusting it with your host environment.
@z

@x
## Next steps
@y
## Next steps
@z

@x
- [Network policies](network-policies.md)
- [Custom templates](templates.md)
- [Using sandboxes effectively](workflows.md)
@y
- [Network policies](network-policies.md)
- [Custom templates](templates.md)
- [Using sandboxes effectively](workflows.md)
@z
