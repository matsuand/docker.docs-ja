%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

% __SUBDIR__ 対応

@x
title: Get started with Docker Sandboxes
linkTitle: Get started
@y
title: Get started with Docker Sandboxes
linkTitle: Get started
@z

@x
description: Install the sbx CLI, configure credentials, and work through your first sandbox session.
keywords: sandbox, sbx, get started, install, credentials, branch mode, network policy
@y
description: Install the sbx CLI, configure credentials, and work through your first sandbox session.
keywords: sandbox, sbx, get started, install, credentials, branch mode, network policy
@z

@x
{{< summary-bar feature_name="Docker Sandboxes sbx" >}}
@y
{{< summary-bar feature_name="Docker Sandboxes sbx" >}}
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
This page walks through a typical first session: installing the CLI,
authenticating your agent, running a sandbox, working with branches, and
cleaning up.
@y
This page walks through a typical first session: installing the CLI,
authenticating your agent, running a sandbox, working with branches, and
cleaning up.
@z

@x
## Prerequisites
@y
## Prerequisites
@z

@x
{{< tabs group="os" >}}
{{< tab name="macOS" >}}
@y
{{< tabs group="os" >}}
{{< tab name="macOS" >}}
@z

@x
- macOS Tahoe (26) or later
- Apple silicon
@y
- macOS Tahoe (26) or later
- Apple silicon
@z

@x
{{< /tab >}}
{{< tab name="Windows" >}}
@y
{{< /tab >}}
{{< tab name="Windows" >}}
@z

@x
- 64-bit Intel or AMD (x86_64)
- Windows 11
- Windows Hypervisor Platform enabled. Open an elevated PowerShell prompt (Run
  as Administrator) and run:
  ```powershell
  Enable-WindowsOptionalFeature -Online -FeatureName HypervisorPlatform -All
  ```
@y
- 64-bit Intel or AMD (x86_64)
- Windows 11
- Windows Hypervisor Platform enabled. Open an elevated PowerShell prompt (Run
  as Administrator) and run:
  ```powershell
  Enable-WindowsOptionalFeature -Online -FeatureName HypervisorPlatform -All
  ```
@z

@x
{{< /tab >}}
{{< tab name="Linux (Ubuntu)" >}}
@y
{{< /tab >}}
{{< tab name="Linux (Ubuntu)" >}}
@z

@x
- Ubuntu 24.04 or later
- 64-bit Intel or AMD (x86_64)
- KVM hardware virtualization supported and enabled by the CPU. If you're
  running inside a VM, nested virtualization must be turned on. Verify that KVM
  is available:
  ```console
  $ lsmod | grep kvm
  ```
  A working setup shows `kvm_intel` or `kvm_amd` in the output. If the output
  is empty, run `kvm-ok` for diagnostics. If KVM is unavailable, `sbx` will
  not start.
- Your user in the `kvm` group:
  ```console
  $ sudo usermod -aG kvm $USER
  ```
  Log out and back in (or run `newgrp kvm`) for the group change to take effect.
@y
- Ubuntu 24.04 or later
- 64-bit Intel or AMD (x86_64)
- KVM hardware virtualization supported and enabled by the CPU. If you're
  running inside a VM, nested virtualization must be turned on. Verify that KVM
  is available:
  ```console
  $ lsmod | grep kvm
  ```
  A working setup shows `kvm_intel` or `kvm_amd` in the output. If the output
  is empty, run `kvm-ok` for diagnostics. If KVM is unavailable, `sbx` will
  not start.
- Your user in the `kvm` group:
  ```console
  $ sudo usermod -aG kvm $USER
  ```
  Log out and back in (or run `newgrp kvm`) for the group change to take effect.
@z

@x
{{< /tab >}}
{{< /tabs >}}
@y
{{< /tab >}}
{{< /tabs >}}
@z

@x
An API key or authentication method for the agent you want to use. Most agents
require an API key for their model provider (Anthropic, OpenAI, Google, and
others). See the [agent pages](agents/) for provider-specific instructions.
@y
An API key or authentication method for the agent you want to use. Most agents
require an API key for their model provider (Anthropic, OpenAI, Google, and
others). See the [agent pages](agents/) for provider-specific instructions.
@z

@x
Docker Desktop is not required to use `sbx`.
@y
Docker Desktop is not required to use `sbx`.
@z

@x
## Install and sign in
@y
## Install and sign in
@z

@x
{{< tabs group="os" >}}
{{< tab name="macOS" >}}
@y
{{< tabs group="os" >}}
{{< tab name="macOS" >}}
@z

@x
```console
$ brew install docker/tap/sbx
$ sbx login
```
@y
```console
$ brew install docker/tap/sbx
$ sbx login
```
@z

@x
{{< /tab >}}
{{< tab name="Windows" >}}
@y
{{< /tab >}}
{{< tab name="Windows" >}}
@z

@x
```powershell
> winget install -h Docker.sbx
> sbx login
```
@y
```powershell
> winget install -h Docker.sbx
> sbx login
```
@z

@x
{{< /tab >}}
{{< tab name="Linux (Ubuntu)" >}}
@y
{{< /tab >}}
{{< tab name="Linux (Ubuntu)" >}}
@z

@x
```console
$ curl -fsSL https://get.docker.com | sudo REPO_ONLY=1 sh
$ sudo apt-get install docker-sbx
$ sbx login
```
@y
```console
$ curl -fsSL https://get.docker.com | sudo REPO_ONLY=1 sh
$ sudo apt-get install docker-sbx
$ sbx login
```
@z

@x
The first command adds Docker's `apt` repository to your system.
@y
The first command adds Docker's `apt` repository to your system.
@z

@x
{{< /tab >}}
{{< /tabs >}}
@y
{{< /tab >}}
{{< /tabs >}}
@z

@x
If you need to install `sbx` manually, download a binary directly from the
[sbx-releases](https://github.com/docker/sbx-releases/releases) repository.
@y
If you need to install `sbx` manually, download a binary directly from the
[sbx-releases](https://github.com/docker/sbx-releases/releases) repository.
@z

@x
`sbx login` opens a browser for Docker OAuth. On first login (and after `sbx
policy reset`), the CLI prompts you to choose a default network policy for your
sandboxes:
@y
`sbx login` opens a browser for Docker OAuth. On first login (and after `sbx
policy reset`), the CLI prompts you to choose a default network policy for your
sandboxes:
@z

@x
```plaintext
Choose a default network policy:
@y
```plaintext
Choose a default network policy:
@z

@x
     1. Open         — All network traffic allowed, no restrictions.
     2. Balanced     — Default deny, with common dev sites allowed.
     3. Locked Down  — All network traffic blocked unless you allow it.
@y
     1. Open         — All network traffic allowed, no restrictions.
     2. Balanced     — Default deny, with common dev sites allowed.
     3. Locked Down  — All network traffic blocked unless you allow it.
@z

@x
Use ↑/↓ to navigate, Enter to select, or press 1–3.
```
@y
Use ↑/↓ to navigate, Enter to select, or press 1–3.
```
@z

@x
**Balanced** is a good starting point — it permits traffic to common
development services while blocking everything else. You can adjust individual
rules later. See [Policies](security/policy.md) for a full description of each
option.
@y
**Balanced** is a good starting point — it permits traffic to common
development services while blocking everything else. You can adjust individual
rules later. See [Policies](security/policy.md) for a full description of each
option.
@z

@x
> [!NOTE]
> See the [FAQ](faq.md) for details on why sign-in is required and what
> happens with your data.
@y
> [!NOTE]
> See the [FAQ](faq.md) for details on why sign-in is required and what
> happens with your data.
@z

@x
## Authenticate your agent
@y
## Authenticate your agent
@z

@x
Agents need credentials for their model provider. How you provide them depends
on the agent.
@y
Agents need credentials for their model provider. How you provide them depends
on the agent.
@z

@x
For Claude Code with a Claude subscription (Max, Team, or Enterprise), no
upfront setup is needed — use the `/login` command inside the sandbox to sign
in with OAuth. The session token stays on your host and is injected by a
proxy, not stored inside the sandbox.
@y
For Claude Code with a Claude subscription (Max, Team, or Enterprise), no
upfront setup is needed — use the `/login` command inside the sandbox to sign
in with OAuth. The session token stays on your host and is injected by a
proxy, not stored inside the sandbox.
@z

@x
For agents that use API keys (or if you prefer API key authentication for
Claude Code), store the key before starting a sandbox:
@y
For agents that use API keys (or if you prefer API key authentication for
Claude Code), store the key before starting a sandbox:
@z

@x
```console
$ sbx secret set -g anthropic
```
@y
```console
$ sbx secret set -g anthropic
```
@z

@x
This prompts for the secret value and stores it in your OS keychain. A proxy on
your host injects the key into outbound API requests so it's never exposed
inside the sandbox. See [Credentials](security/credentials.md) for details on
scoping, supported services, and alternative methods.
@y
This prompts for the secret value and stores it in your OS keychain. A proxy on
your host injects the key into outbound API requests so it's never exposed
inside the sandbox. See [Credentials](security/credentials.md) for details on
scoping, supported services, and alternative methods.
@z

@x
To give the agent access to GitHub for creating pull requests or interacting
with repositories:
@y
To give the agent access to GitHub for creating pull requests or interacting
with repositories:
@z

@x
```console
$ sbx secret set -g github -t "$(gh auth token)"
```
@y
```console
$ sbx secret set -g github -t "$(gh auth token)"
```
@z

@x
## Run your first sandbox
@y
## Run your first sandbox
@z

@x
Pick a project directory and launch an agent with
[`sbx run`](/reference/cli/sbx/run/):
@y
Pick a project directory and launch an agent with
[`sbx run`](__SUBDIR__/reference/cli/sbx/run/):
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
Replace `claude` with the agent you want to use — see [Agents](agents/) for the
full list.
@y
Replace `claude` with the agent you want to use — see [Agents](agents/) for the
full list.
@z

@x
The first run takes a little longer while the agent image is pulled. Subsequent
runs reuse the cached image and start in seconds.
@y
The first run takes a little longer while the agent image is pulled. Subsequent
runs reuse the cached image and start in seconds.
@z

@x
You can check what's running at any time:
@y
You can check what's running at any time:
@z

@x
```console
$ sbx ls
SANDBOX              AGENT    STATUS    PORTS   WORKSPACE
claude-my-project    claude   running           ~/my-project
```
@y
```console
$ sbx ls
SANDBOX              AGENT    STATUS    PORTS   WORKSPACE
claude-my-project    claude   running           ~/my-project
```
@z

@x
You can also run `sbx` with no arguments to open an interactive dashboard.
The dashboard shows your sandboxes with live status, lets you attach to
agents, open shells, and manage network rules from one place. See
[Interactive mode](usage.md#interactive-mode) for details.
@y
You can also run `sbx` with no arguments to open an interactive dashboard.
The dashboard shows your sandboxes with live status, lets you attach to
agents, open shells, and manage network rules from one place. See
[Interactive mode](usage.md#interactive-mode) for details.
@z

@x
![The interactive dashboard showing sandbox status, resource usage, and network governance controls.](images/sbx-dashboard.png)
@y
![The interactive dashboard showing sandbox status, resource usage, and network governance controls.](images/sbx-dashboard.png)
@z

@x
## Use branch mode
@y
## Use branch mode
@z

@x
By default, the agent edits your working tree directly. To give it its own
Git branch, use `--branch`:
@y
By default, the agent edits your working tree directly. To give it its own
Git branch, use `--branch`:
@z

@x
```console
$ sbx run claude --branch my-feature
```
@y
```console
$ sbx run claude --branch my-feature
```
@z

@x
This creates a [Git worktree](https://git-scm.com/docs/git-worktree) under
`.sbx/` in your repository root. The agent works on its own branch and
directory without touching your main working tree.
@y
This creates a [Git worktree](https://git-scm.com/docs/git-worktree) under
`.sbx/` in your repository root. The agent works on its own branch and
directory without touching your main working tree.
@z

@x
When the session ends, review what the agent did from the worktree:
@y
When the session ends, review what the agent did from the worktree:
@z

@x
```console
$ cd .sbx/<sandbox-name>-worktrees/my-feature
$ git log
$ git diff main
```
@y
```console
$ cd .sbx/<sandbox-name>-worktrees/my-feature
$ git log
$ git diff main
```
@z

@x
If you're satisfied, push the branch and open a pull request:
@y
If you're satisfied, push the branch and open a pull request:
@z

@x
```console
$ git push -u origin my-feature
$ gh pr create
```
@y
```console
$ git push -u origin my-feature
$ gh pr create
```
@z

@x
Branch mode is especially useful when running multiple agents on the same
repository — each gets its own branch and can't overwrite the other's changes.
See [Branch mode](usage.md#branch-mode) for more options, including
`--branch auto` and multiple branches per sandbox.
@y
Branch mode is especially useful when running multiple agents on the same
repository — each gets its own branch and can't overwrite the other's changes.
See [Branch mode](usage.md#branch-mode) for more options, including
`--branch auto` and multiple branches per sandbox.
@z

@x
## Manage network access
@y
## Manage network access
@z

@x
Your network policy controls what the sandbox can reach. If the agent fails to
connect to an API or service, it's likely blocked by the policy.
@y
Your network policy controls what the sandbox can reach. If the agent fails to
connect to an API or service, it's likely blocked by the policy.
@z

@x
Check which rules are in effect:
@y
Check which rules are in effect:
@z

@x
```console
$ sbx policy ls
```
@y
```console
$ sbx policy ls
```
@z

@x
To allow a specific host:
@y
To allow a specific host:
@z

@x
```console
$ sbx policy allow network registry.npmjs.org
```
@y
```console
$ sbx policy allow network registry.npmjs.org
```
@z

@x
With **Locked Down**, even your model provider API is blocked unless you
explicitly allow it. With **Balanced**, common development services are
permitted by default. See [Policies](security/policy.md) for the full rule
set and how to customize it.
@y
With **Locked Down**, even your model provider API is blocked unless you
explicitly allow it. With **Balanced**, common development services are
permitted by default. See [Policies](security/policy.md) for the full rule
set and how to customize it.
@z

@x
## Clean up
@y
## Clean up
@z

@x
Sandboxes persist after the agent exits. To stop a sandbox without deleting it:
@y
Sandboxes persist after the agent exits. To stop a sandbox without deleting it:
@z

@x
```console
$ sbx stop my-sandbox
```
@y
```console
$ sbx stop my-sandbox
```
@z

@x
Installed packages, Docker images, and configuration changes are preserved
across restarts. When you're done with a sandbox, remove it to reclaim disk
space:
@y
Installed packages, Docker images, and configuration changes are preserved
across restarts. When you're done with a sandbox, remove it to reclaim disk
space:
@z

@x
```console
$ sbx rm my-sandbox
```
@y
```console
$ sbx rm my-sandbox
```
@z

@x
Removing a sandbox deletes everything inside it — installed packages, Docker
images, and any branch mode worktrees under `.sbx/`. Files in your main
working tree are unaffected.
@y
Removing a sandbox deletes everything inside it — installed packages, Docker
images, and any branch mode worktrees under `.sbx/`. Files in your main
working tree are unaffected.
@z

@x
## Next steps
@y
## Next steps
@z

@x
- [Usage guide](usage.md) — sandbox management, reconnecting, multiple
  workspaces, port forwarding, and more
- [Agents](agents/) — supported agents and configuration
- [Customize](customize/) — build reusable templates or declare capabilities
  with kits
- [Credentials](security/credentials.md) — credential storage and management
- [Workspace trust](security/workspace.md) — review agent changes safely
- [Policies](security/policy.md) — control outbound access
@y
- [Usage guide](usage.md) — sandbox management, reconnecting, multiple
  workspaces, port forwarding, and more
- [Agents](agents/) — supported agents and configuration
- [Customize](customize/) — build reusable templates or declare capabilities
  with kits
- [Credentials](security/credentials.md) — credential storage and management
- [Workspace trust](security/workspace.md) — review agent changes safely
- [Policies](security/policy.md) — control outbound access
@z
