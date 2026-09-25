%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

% .md リンクへの (no slash) 対応

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
{{% include "sandboxes-local-scope.md" %}}
@y
{{% include "sandboxes-local-scope.md" %}}
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
- **Filesystem isolation:** a host workspace is shared when you pass a
  workspace path or use `sbx run`, which defaults to the current directory.
  For supported agents that haven't opted out, the dedicated
  [shared skills store](../workflows/agent-skills.md) is also shared with the
  host. The rest of the VM filesystem persists across restarts but is removed
  when you delete the sandbox. Symlinks pointing outside the workspace scope
  are not followed.
- **Full cleanup:** when you remove a sandbox with `sbx rm`, the VM and
  everything inside it is deleted
@y
- **Process isolation:** separate kernel per sandbox; processes inside the VM
  are invisible to your host and to other sandboxes
- **Filesystem isolation:** a host workspace is shared when you pass a
  workspace path or use `sbx run`, which defaults to the current directory.
  For supported agents that haven't opted out, the dedicated
  [shared skills store](../workflows/agent-skills.md) is also shared with the
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
Processes in a local sandbox can write text to your host clipboard, but can't
read existing clipboard text. Host clipboard image reads are a separate,
opt-in feature. After running untrusted code, check clipboard contents before
pasting them on the host.
@y
Processes in a local sandbox can write text to your host clipboard, but can't
read existing clipboard text. Host clipboard image reads are a separate,
opt-in feature. After running untrusted code, check clipboard contents before
pasting them on the host.
@z

@x
## Network isolation
@y
## Network isolation
@z

@x
Each sandbox has its own isolated network. Sandboxes cannot communicate
directly with each other or share a network with your host. To reach a service
running on the host through a policy-controlled connection, see
[Accessing host services from a sandbox](../workflows/development.md#accessing-host-services-from-a-sandbox).
@y
Each sandbox has its own isolated network. Sandboxes cannot communicate
directly with each other or share a network with your host. To reach a service
running on the host through a policy-controlled connection, see
[Accessing host services from a sandbox](../workflows/development.md#accessing-host-services-from-a-sandbox).
@z

@x
All outbound TCP traffic passes through a proxy on your host that enforces the
[network access policy](../governance/access-controls/network.md). The sandbox
routes traffic through either a forward proxy or a transparent proxy depending
on the client's configuration. Both enforce the network policy. Only the
forward proxy [injects credentials](../configuration/credentials.md) for AI services.
@y
All outbound TCP traffic passes through a proxy on your host that enforces the
[network access policy](../governance/access-controls/network.md). The sandbox
routes traffic through either a forward proxy or a transparent proxy depending
on the client's configuration. Both enforce the network policy. Only the
forward proxy [injects credentials](../configuration/credentials.md) for AI services.
@z

@x
Outbound UDP is disabled by default. When you turn on
[experimental UDP egress](../governance/access-controls/local.md#allow-outbound-udp),
network policy controls its destinations. ICMP is blocked. DNS queries use the
sandbox's internal resolver, which enforces network policy. TCP connections
are allowed only when a policy rule matches the destination.
@y
Outbound UDP is disabled by default. When you turn on
[experimental UDP egress](../governance/access-controls/local.md#allow-outbound-udp),
network policy controls its destinations. ICMP is blocked. DNS queries use the
sandbox's internal resolver, which enforces network policy. TCP connections
are allowed only when a policy rule matches the destination.
@z

@x
For the default set of allowed domains, see
[Default security posture](defaults.md). To forward allowed traffic through a
corporate or upstream proxy, see
[Configure an upstream proxy](../configuration/upstream-proxy.md).
@y
For the default set of allowed domains, see
[Default security posture](defaults.md). To forward allowed traffic through a
corporate or upstream proxy, see
[Configure an upstream proxy](../configuration/upstream-proxy.md).
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
Engine](/manuals/engine/_index.md) inside the sandbox environment, isolated from
your host. When the agent runs `docker build` or `docker compose up`, those
commands execute against that engine. The agent has no path to your host Docker
daemon.
@y
Docker Sandboxes avoid this by running a separate [Docker
Engine](manuals/engine/_index.md) inside the sandbox environment, isolated from
your host. When the agent runs `docker build` or `docker compose up`, those
commands execute against that engine. The agent has no path to your host Docker
daemon.
@z

@x
This Docker Engine boundary applies to processes running inside the sandbox VM.
It doesn't apply to local stdio MCP servers registered through the
[MCP gateway](../mcp-gateway.md). Those servers run on the host, outside the
sandbox VM. If a local MCP server starts a Docker container, it uses Docker on
the host.
@y
This Docker Engine boundary applies to processes running inside the sandbox VM.
It doesn't apply to local stdio MCP servers registered through the
[MCP gateway](../mcp-gateway.md). Those servers run on the host, outside the
sandbox VM. If a local MCP server starts a Docker container, it uses Docker on
the host.
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
When you create a sandbox, choose how the agent receives a workspace:
@y
When you create a sandbox, choose how the agent receives a workspace:
@z

@x
- **Mountless** (no path to `sbx create`): the sandbox doesn't receive a host
  workspace. The agent works in the sandbox's own filesystem.
- **Direct mount** (a path such as `.`): the agent has read-write access to
  your working tree. There is no boundary between the agent's edits and your
  host filesystem.
- **Clone mode** (`--clone` and a Git path): your repository is mounted
  read-only into the VM and the agent works on a private clone inside the VM.
  The agent's edits never reach your host until you fetch them.
@y
- **Mountless** (no path to `sbx create`): the sandbox doesn't receive a host
  workspace. The agent works in the sandbox's own filesystem.
- **Direct mount** (a path such as `.`): the agent has read-write access to
  your working tree. There is no boundary between the agent's edits and your
  host filesystem.
- **Clone mode** (`--clone` and a Git path): your repository is mounted
  read-only into the VM and the agent works on a private clone inside the VM.
  The agent's edits never reach your host until you fetch them.
@z

@x
See [Git workflows](../workflows/git.md) for direct-mount and clone-mode
workflows.
@y
See [Git workflows](../workflows/git.md) for direct-mount and clone-mode
workflows.
@z

@x
### Mountless
@y
### Mountless
@z

@x
Omit the workspace path from `sbx create` to create a mountless sandbox, then
attach by name:
@y
Omit the workspace path from `sbx create` to create a mountless sandbox, then
attach by name:
@z

@x
```console
$ sbx create --name scratch claude
$ sbx run --name scratch
```
@y
```console
$ sbx create --name scratch claude
$ sbx run --name scratch
```
@z

@x
The agent uses the sandbox template's default working directory.
Docker-provided agent templates use `/home/agent/workspace`. If the template
doesn't define a usable absolute working directory, the daemon uses that path.
Files there stay within the sandbox, persist across stops and restarts, and are
deleted when you remove the sandbox. A mountless sandbox doesn't expose a host
project directory, but separately configured host resources such as the shared
skills store can still be mounted.
@y
The agent uses the sandbox template's default working directory.
Docker-provided agent templates use `/home/agent/workspace`. If the template
doesn't define a usable absolute working directory, the daemon uses that path.
Files there stay within the sandbox, persist across stops and restarts, and are
deleted when you remove the sandbox. A mountless sandbox doesn't expose a host
project directory, but separately configured host resources such as the shared
skills store can still be mounted.
@z

@x
### Direct mount
@y
### Direct mount
@z

@x
Pass a workspace path to share it into the VM as a read-write mount. The agent
and the host see the same files, and changes the agent makes appear on your
host as soon as they're written. `sbx run` mounts the current directory when
you don't pass a path:
@y
Pass a workspace path to share it into the VM as a read-write mount. The agent
and the host see the same files, and changes the agent makes appear on your
host as soon as they're written. `sbx run` mounts the current directory when
you don't pass a path:
@z

@x
```console
$ sbx run claude
```
@y
```console
$ sbx run claude
```
@z

@x
Direct mounts enforce access by path. If a workspace file is a hard link to a
file outside the workspace, the agent can read and modify the underlying file
through the workspace path. Changes affect every hard link to that file,
including links outside the authorized workspace. Filesystem access policies
do not block this access because they evaluate the workspace path rather than
other paths to the same file. [Clone mode](#clone-mode) prevents writes through
the primary workspace by mounting the host repository read-only.
@y
Direct mounts enforce access by path. If a workspace file is a hard link to a
file outside the workspace, the agent can read and modify the underlying file
through the workspace path. Changes affect every hard link to that file,
including links outside the authorized workspace. Filesystem access policies
do not block this access because they evaluate the workspace path rather than
other paths to the same file. [Clone mode](#clone-mode) prevents writes through
the primary workspace by mounting the host repository read-only.
@z

@x
Direct mount gives the agent broad write access to your workspace. The agent
can create, modify, or delete workspace files, including:
@y
Direct mount gives the agent broad write access to your workspace. The agent
can create, modify, or delete workspace files, including:
@z

@x
- Source code and configuration files
- Build files (`Makefile`, `package.json`, `Cargo.toml`)
- Git hooks (`.git/hooks/`)
- CI configuration (`.github/workflows/`, `.gitlab-ci.yml`)
- IDE configuration (`.vscode/tasks.json`, `.idea/` run configurations)
- AI project configuration and settings (`.claude/`, `.codex/`, `.gemini/`)
- Hidden files, shell scripts, and executables
@y
- Source code and configuration files
- Build files (`Makefile`, `package.json`, `Cargo.toml`)
- Git hooks (`.git/hooks/`)
- CI configuration (`.github/workflows/`, `.gitlab-ci.yml`)
- IDE configuration (`.vscode/tasks.json`, `.idea/` run configurations)
- AI project configuration and settings (`.claude/`, `.codex/`, `.gemini/`)
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
- AI project configuration and settings (`.claude/settings.json`, `.codex/config.toml`,
  `.gemini/settings.json`) can define hooks and startup commands that
  execute automatically.
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
- AI project configuration and settings (`.claude/settings.json`, `.codex/config.toml`,
  `.gemini/settings.json`) can define hooks and startup commands that
  execute automatically.
@z

@x
#### Sandbox environment files
@y
#### Sandbox environment files
@z

@x
Sandbox environment files can declare lifecycle and credential commands that
run on the host with your privileges. Before running these commands, `sbx`
shows them in an environment plan and asks for approval. Review the plan before
you approve host commands.
@y
Sandbox environment files can declare lifecycle and credential commands that
run on the host with your privileges. Before running these commands, `sbx`
shows them in an environment plan and asks for approval. Review the plan before
you approve host commands.
@z

@x
For file placement and read-only protection, see
[Sandbox environment files](../configuration/environment-files.md#workspace).
@y
For file placement and read-only protection, see
[Sandbox environment files](../configuration/environment-files.md#workspace).
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
> [!IMPORTANT]
> Clone mode protects your host repository from modification, **not from
> inspection**. Your repository is still mounted read-only into the sandbox,
> including untracked files and files excluded by `.gitignore`. Files such as
> `.env` remain readable by the agent. Store secrets outside your working
> directory or use [credential isolation](#credential-isolation) instead.
@y
> [!IMPORTANT]
> Clone mode protects your host repository from modification, **not from
> inspection**. Your repository is still mounted read-only into the sandbox,
> including untracked files and files excluded by `.gitignore`. Files such as
> `.env` remain readable by the agent. Store secrets outside your working
> directory or use [credential isolation](#credential-isolation) instead.
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
  read-only. The mount covers your entire working directory, including
  untracked files and files excluded by `.gitignore`. Nothing the agent
  does inside the VM can write back through that mount, but all files
  under the Git root are readable inside the sandbox. This includes
  credential files not tracked by Git, such as `.env`.
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
  read-only. The mount covers your entire working directory, including
  untracked files and files excluded by `.gitignore`. Nothing the agent
  does inside the VM can write back through that mount, but all files
  under the Git root are readable inside the sandbox. This includes
  credential files not tracked by Git, such as `.env`.
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
  writable Git state.
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
  writable Git state.
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
SSH agent forwarding is enabled by default. Private keys stay on the host, but
any process inside the sandbox can ask the forwarded agent to authenticate or
sign data. Docker Sandboxes forwards only sockets it recognizes as SSH agents.
A sandbox receives no SSH agent when forwarding is disabled, the configuration
is unavailable, or the selected socket can't be used.
@y
SSH agent forwarding is enabled by default. Private keys stay on the host, but
any process inside the sandbox can ask the forwarded agent to authenticate or
sign data. Docker Sandboxes forwards only sockets it recognizes as SSH agents.
A sandbox receives no SSH agent when forwarding is disabled, the configuration
is unavailable, or the selected socket can't be used.
@z

@x
For how to store and manage credentials, see [Credentials](../configuration/credentials.md).
@y
For how to store and manage credentials, see [Credentials](../configuration/credentials.md).
@z
