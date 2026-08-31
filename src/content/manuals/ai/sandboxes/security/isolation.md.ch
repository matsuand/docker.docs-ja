%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
title: Isolation layers
@y
title: Isolation layers
@z

@x
description: How Docker Sandboxes isolate AI agents using hypervisor, network, Docker Engine, workspace, and credential boundaries.
keywords: docker sandboxes, isolation, hypervisor, network, credentials, workspace, git
@y
description: How Docker Sandboxes isolate AI agents using hypervisor, network, Docker Engine, workspace, and credential boundaries.
keywords: docker sandboxes, isolation, hypervisor, network, credentials, workspace, git
@z

@x
AI coding agents need to execute code, install packages, and run tools on
your behalf. Docker Sandboxes run each agent in its own microVM. Five
isolation layers protect your host: hypervisor, network, Docker Engine,
workspace, and credential proxy.
@y
AI coding agents need to execute code, install packages, and run tools on
your behalf. Docker Sandboxes run each agent in its own microVM. Five
isolation layers protect your host: hypervisor, network, Docker Engine,
workspace, and credential proxy.
@z

@x
## Hypervisor isolation
@y
## Hypervisor isolation
@z

@x
Every sandbox runs inside a lightweight microVM with its own Linux kernel.
Unlike containers, which share the host kernel, a sandbox VM cannot access host
processes, files, or resources outside its defined boundaries.
@y
Every sandbox runs inside a lightweight microVM with its own Linux kernel.
Unlike containers, which share the host kernel, a sandbox VM cannot access host
processes, files, or resources outside its defined boundaries.
@z

@x
- **Process isolation:** separate kernel per sandbox; processes inside the VM
  are invisible to your host and to other sandboxes
- **Filesystem isolation:** only your workspace directory is shared with the
  host. The rest of the VM filesystem persists across restarts but is removed
  when you delete the sandbox. Symlinks pointing outside the workspace scope
  are not followed.
- **Full cleanup:** when you remove a sandbox with `sbx rm`, the VM and
  everything inside it is deleted
@y
- **Process isolation:** separate kernel per sandbox; processes inside the VM
  are invisible to your host and to other sandboxes
- **Filesystem isolation:** only your workspace directory is shared with the
  host. The rest of the VM filesystem persists across restarts but is removed
  when you delete the sandbox. Symlinks pointing outside the workspace scope
  are not followed.
- **Full cleanup:** when you remove a sandbox with `sbx rm`, the VM and
  everything inside it is deleted
@z

@x
The agent runs as a non-root user with sudo privileges inside the VM. The
hypervisor boundary is the isolation control, not in-VM privilege separation.
@y
The agent runs as a non-root user with sudo privileges inside the VM. The
hypervisor boundary is the isolation control, not in-VM privilege separation.
@z

@x
## Network isolation
@y
## Network isolation
@z

@x
Each sandbox has its own isolated network. Sandboxes cannot communicate with
each other and cannot reach your host's localhost. There is no shared network
between sandboxes or between a sandbox and your host.
@y
Each sandbox has its own isolated network. Sandboxes cannot communicate with
each other and cannot reach your host's localhost. There is no shared network
between sandboxes or between a sandbox and your host.
@z

@x
All HTTP and HTTPS traffic leaving a sandbox passes through a proxy on your
host that enforces the [network policy](policy.md). The sandbox routes
traffic through either a forward proxy or a transparent proxy depending on the
client's configuration. Both enforce the network policy; only the forward proxy
[injects credentials](credentials.md) for AI services.
@y
All HTTP and HTTPS traffic leaving a sandbox passes through a proxy on your
host that enforces the [network policy](policy.md). The sandbox routes
traffic through either a forward proxy or a transparent proxy depending on the
client's configuration. Both enforce the network policy; only the forward proxy
[injects credentials](credentials.md) for AI services.
@z

@x
Raw TCP connections, UDP, and ICMP are blocked at the network layer. DNS
resolution is handled by the proxy; the sandbox cannot make raw DNS queries.
Traffic to private IP ranges, loopback, and link-local addresses is also
blocked. Only domains explicitly listed in the policy are reachable.
@y
Raw TCP connections, UDP, and ICMP are blocked at the network layer. DNS
resolution is handled by the proxy; the sandbox cannot make raw DNS queries.
Traffic to private IP ranges, loopback, and link-local addresses is also
blocked. Only domains explicitly listed in the policy are reachable.
@z

@x
For the default set of allowed domains, see
[Default security posture](defaults.md).
@y
For the default set of allowed domains, see
[Default security posture](defaults.md).
@z

@x
## Docker Engine isolation
@y
## Docker Engine isolation
@z

@x
Agents often need to build images, run containers, and use Docker Compose.
Mounting your host Docker socket into a container would give the agent full
access to your environment.
@y
Agents often need to build images, run containers, and use Docker Compose.
Mounting your host Docker socket into a container would give the agent full
access to your environment.
@z

@x
Docker Sandboxes avoid this by running a separate [Docker
Engine](https://docs.docker.com/engine/) inside the sandbox environment, isolated from
your host. When the agent runs `docker build` or `docker compose up`, those
commands execute against that engine. The agent has no path to your host Docker
daemon.
@y
Docker Sandboxes avoid this by running a separate [Docker
Engine](https://docs.docker.com/engine/) inside the sandbox environment, isolated from
your host. When the agent runs `docker build` or `docker compose up`, those
commands execute against that engine. The agent has no path to your host Docker
daemon.
@z

@x
Each sandbox VM runs its own Docker Engine. The agent runs inside the VM,
alongside that engine, and drives it to create containers, all within the
VM:
@y
Each sandbox VM runs its own Docker Engine. The agent runs inside the VM,
alongside that engine, and drives it to create containers, all within the
VM:
@z

@x
```mermaid
flowchart TB
  subgraph host["Host system"]
    subgraph hostd["Host Docker daemon"]
      hc["Your containers and images"]
    end
    subgraph vm["Sandbox (microVM)"]
      a["Agent"]
      subgraph e["Sandbox Docker engine"]
        c["Containers created by agent"]
      end
      a -->|"docker build / compose up"| e
    end
  end
  style host fill:#3b82f622,stroke:#3b82f6
```
@y
```mermaid
flowchart TB
  subgraph host["Host system"]
    subgraph hostd["Host Docker daemon"]
      hc["Your containers and images"]
    end
    subgraph vm["Sandbox (microVM)"]
      a["Agent"]
      subgraph e["Sandbox Docker engine"]
        c["Containers created by agent"]
      end
      a -->|"docker build / compose up"| e
    end
  end
  style host fill:#3b82f622,stroke:#3b82f6
```
@z

@x
## Workspace isolation
@y
## Workspace isolation
@z

@x
When you create a sandbox, you choose one of two ways to share your
workspace with it:
@y
When you create a sandbox, you choose one of two ways to share your
workspace with it:
@z

@x
- **Direct mount** (the default): the agent has read-write access to
  your working tree. There is no boundary between the agent's edits and
  your host filesystem.
- **Clone mode** (`--clone`): your repository is mounted read-only into
  the VM and the agent works on a private clone inside the VM. The
  agent's edits never reach your host until you fetch them.
@y
- **Direct mount** (the default): the agent has read-write access to
  your working tree. There is no boundary between the agent's edits and
  your host filesystem.
- **Clone mode** (`--clone`): your repository is mounted read-only into
  the VM and the agent works on a private clone inside the VM. The
  agent's edits never reach your host until you fetch them.
@z

@x
See [Git workflow](../usage.md#git-workflow) for the workflow side of
each.
@y
See [Git workflow](../usage.md#git-workflow) for the workflow side of
each.
@z

@x
### Direct mount (default)
@y
### Direct mount (default)
@z

@x
By default, your workspace is shared into the VM as a read-write mount.
The agent and the host see the same files, and changes the agent makes
appear on your host as soon as they're written.
@y
By default, your workspace is shared into the VM as a read-write mount.
The agent and the host see the same files, and changes the agent makes
appear on your host as soon as they're written.
@z

@x
There is no isolation between the agent and your workspace in this mode.
The agent can create, modify, or delete any file in the workspace,
including:
@y
There is no isolation between the agent and your workspace in this mode.
The agent can create, modify, or delete any file in the workspace,
including:
@z

@x
- Source code and configuration files
- Build files (`Makefile`, `package.json`, `Cargo.toml`)
- Git hooks (`.git/hooks/`)
- CI configuration (`.github/workflows/`, `.gitlab-ci.yml`)
- IDE configuration (`.vscode/tasks.json`, `.idea/` run configurations)
- Hidden files, shell scripts, and executables
@y
- Source code and configuration files
- Build files (`Makefile`, `package.json`, `Cargo.toml`)
- Git hooks (`.git/hooks/`)
- CI configuration (`.github/workflows/`, `.gitlab-ci.yml`)
- IDE configuration (`.vscode/tasks.json`, `.idea/` run configurations)
- Hidden files, shell scripts, and executables
@z

@x
Some of these files execute code when you trigger normal development
actions — committing, pushing, building, or opening the project in an IDE.
Review them after any agent session before performing those actions:
@y
Some of these files execute code when you trigger normal development
actions — committing, pushing, building, or opening the project in an IDE.
Review them after any agent session before performing those actions:
@z

@x
- Git hooks (`.git/hooks/`) run on commit, push, and other Git actions.
  These are inside `.git/` and don't appear in `git diff` output —
  check them separately with `ls -la .git/hooks/`.
- CI configuration (`.github/workflows/`, `.gitlab-ci.yml`) runs on
  push.
- Build files (`Makefile`, `package.json` scripts, `Cargo.toml`) run
  during build or install steps.
- IDE configuration (`.vscode/tasks.json`, `.idea/`) can run tasks
  when you open the project.
@y
- Git hooks (`.git/hooks/`) run on commit, push, and other Git actions.
  These are inside `.git/` and don't appear in `git diff` output —
  check them separately with `ls -la .git/hooks/`.
- CI configuration (`.github/workflows/`, `.gitlab-ci.yml`) runs on
  push.
- Build files (`Makefile`, `package.json` scripts, `Cargo.toml`) run
  during build or install steps.
- IDE configuration (`.vscode/tasks.json`, `.idea/`) can run tasks
  when you open the project.
@z

@x
> [!WARNING]
> Treat sandbox-modified workspace files the same way you would treat a pull
> request from an untrusted contributor: review before you trust them on
> your host.
@y
> [!WARNING]
> Treat sandbox-modified workspace files the same way you would treat a pull
> request from an untrusted contributor: review before you trust them on
> your host.
@z

@x
### Clone mode
@y
### Clone mode
@z

@x
When you start a sandbox with [`--clone`](../usage.md#clone-mode), the agent
never works directly against your host repository. Even with full root
inside the VM, it cannot modify your `.git` directory, your working tree,
or any tracked file on your host.
@y
When you start a sandbox with [`--clone`](../usage.md#clone-mode), the agent
never works directly against your host repository. Even with full root
inside the VM, it cannot modify your `.git` directory, your working tree,
or any tracked file on your host.
@z

@x
```mermaid
flowchart LR
  subgraph host["Host repository (untouched)"]
    direction TB
    repo[".git/ + working tree"]
    remote["remote sandbox-&lt;name&gt;"]
  end
  subgraph vm["Sandbox VM"]
    direction TB
    mount["/run/sandbox/source<br/>(read-only bind mount)"]
    clone["private clone (RW)<br/>agent edits here"]
    daemon["git-daemon"]
  end
  repo -->|"read-only bind mount"| mount
  mount -->|"git clone"| clone
  clone --> daemon
  daemon -->|"git fetch"| remote
```
@y
```mermaid
flowchart LR
  subgraph host["Host repository (untouched)"]
    direction TB
    repo[".git/ + working tree"]
    remote["remote sandbox-&lt;name&gt;"]
  end
  subgraph vm["Sandbox VM"]
    direction TB
    mount["/run/sandbox/source<br/>(read-only bind mount)"]
    clone["private clone (RW)<br/>agent edits here"]
    daemon["git-daemon"]
  end
  repo -->|"read-only bind mount"| mount
  mount -->|"git clone"| clone
  clone --> daemon
  daemon -->|"git fetch"| remote
```
@z

@x
How the boundary is enforced:
@y
How the boundary is enforced:
@z

@x
- Your repository's Git root is mounted at `/run/sandbox/source` as
  read-only. Nothing the agent does inside the VM can write back through
  that mount.
- The agent works on a private clone that lives inside the sandbox. The
  clone has its own index, its own refs, and its own working tree. Writes
  to the clone never reach your host.
- The sandbox publishes the clone over a Git daemon bound to localhost on
  the host. The CLI wires it up as a `sandbox-<sandbox-name>` Git remote on
  your host repository. Fetching from that remote uses the same trust
  model as fetching from any third-party remote — nothing is integrated
  until you explicitly merge or check out the fetched refs.
@y
- Your repository's Git root is mounted at `/run/sandbox/source` as
  read-only. Nothing the agent does inside the VM can write back through
  that mount.
- The agent works on a private clone that lives inside the sandbox. The
  clone has its own index, its own refs, and its own working tree. Writes
  to the clone never reach your host.
- The sandbox publishes the clone over a Git daemon bound to localhost on
  the host. The CLI wires it up as a `sandbox-<sandbox-name>` Git remote on
  your host repository. Fetching from that remote uses the same trust
  model as fetching from any third-party remote — nothing is integrated
  until you explicitly merge or check out the fetched refs.
@z

@x
The practical guarantees:
@y
The practical guarantees:
@z

@x
- The agent cannot modify any tracked file or any byte under `.git/` on
  your host. A compromised or buggy agent cannot drop a
  `.git/hooks/pre-commit`, alter `.github/workflows/`, or sneak changes
  into your working tree.
- Concurrent `git` commands on the host and inside the sandbox cannot
  race on a shared `.git/index` or shared refs — there is no shared
  writable state.
- Credentials, signing keys, and any settings in your repository's
  `.git/config` stay on the host. The agent's clone has its own
  independent configuration.
@y
- The agent cannot modify any tracked file or any byte under `.git/` on
  your host. A compromised or buggy agent cannot drop a
  `.git/hooks/pre-commit`, alter `.github/workflows/`, or sneak changes
  into your working tree.
- Concurrent `git` commands on the host and inside the sandbox cannot
  race on a shared `.git/index` or shared refs — there is no shared
  writable state.
- Credentials, signing keys, and any settings in your repository's
  `.git/config` stay on the host. The agent's clone has its own
  independent configuration.
@z

@x
Use clone mode whenever you want a strong boundary between the agent's
Git activity and your host repository — for example when running an
unfamiliar agent, running multiple agents on the same repository at once,
or keeping your working tree clean while the agent works.
@y
Use clone mode whenever you want a strong boundary between the agent's
Git activity and your host repository — for example when running an
unfamiliar agent, running multiple agents on the same repository at once,
or keeping your working tree clean while the agent works.
@z

@x
## Credential isolation
@y
## Credential isolation
@z

@x
Most agents need API keys for their model provider. Rather than passing keys
into the sandbox, the host-side proxy intercepts outbound API requests and
injects authentication headers before forwarding each request.
@y
Most agents need API keys for their model provider. Rather than passing keys
into the sandbox, the host-side proxy intercepts outbound API requests and
injects authentication headers before forwarding each request.
@z

@x
Credential values are never stored inside the VM. They are not available as
environment variables or files inside the sandbox unless you explicitly set
them. This means a compromised sandbox cannot read API keys from the local
environment.
@y
Credential values are never stored inside the VM. They are not available as
environment variables or files inside the sandbox unless you explicitly set
them. This means a compromised sandbox cannot read API keys from the local
environment.
@z

@x
For how to store and manage credentials, see [Credentials](credentials.md).
@y
For how to store and manage credentials, see [Credentials](credentials.md).
@z
