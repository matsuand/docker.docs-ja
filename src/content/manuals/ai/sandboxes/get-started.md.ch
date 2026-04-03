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
description: Install the sbx CLI and run an AI coding agent in an isolated sandbox.
@y
description: Install the sbx CLI and run an AI coding agent in an isolated sandbox.
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
## Prerequisites
@y
## Prerequisites
@z

@x
- macOS (Apple silicon) or Windows (x86_64, Windows 11 required)
- If you're on Windows, enable Windows Hypervisor Platform. Open an elevated
  PowerShell prompt (Run as Administrator) and run:
  ```powershell
  Enable-WindowsOptionalFeature -Online -FeatureName HypervisorPlatform -All
  ```
- An API key or authentication method for the agent you want to use. Most
  agents require an API key for their model provider (Anthropic, OpenAI,
  Google, and others). See the [agent pages](agents/) for provider-specific
  instructions, and [Credentials](security/credentials.md) for how to store
  and manage keys.
@y
- macOS (Apple silicon) or Windows (x86_64, Windows 11 required)
- If you're on Windows, enable Windows Hypervisor Platform. Open an elevated
  PowerShell prompt (Run as Administrator) and run:
  ```powershell
  Enable-WindowsOptionalFeature -Online -FeatureName HypervisorPlatform -All
  ```
- An API key or authentication method for the agent you want to use. Most
  agents require an API key for their model provider (Anthropic, OpenAI,
  Google, and others). See the [agent pages](agents/) for provider-specific
  instructions, and [Credentials](security/credentials.md) for how to store
  and manage keys.
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
{{< tabs >}}
{{< tab name="macOS" >}}
@y
{{< tabs >}}
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
{{< /tabs >}}
@y
{{< /tab >}}
{{< /tabs >}}
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
See [Policies](security/policy.md) for a full description of each option.
@y
See [Policies](security/policy.md) for a full description of each option.
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
## Run your first sandbox
@y
## Run your first sandbox
@z

@x
Pick a project directory and launch an agent with [`sbx run`](/reference/cli/sbx/run/):
@y
Pick a project directory and launch an agent with [`sbx run`](__SUBDIR__/reference/cli/sbx/run/):
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
The first run takes a little longer while the agent image is pulled.
Subsequent runs reuse the cached image and start in seconds.
@y
The first run takes a little longer while the agent image is pulled.
Subsequent runs reuse the cached image and start in seconds.
@z

@x
You can check what's running at any time:
@y
You can check what's running at any time:
@z

@x
```console
$ sbx ls
NAME                 STATUS   UPTIME
claude-my-project    running  12s
```
@y
```console
$ sbx ls
NAME                 STATUS   UPTIME
claude-my-project    running  12s
```
@z

@x
The agent can modify files in your project directory, so review changes before
merging. See [Workspace trust](security/workspace.md) for details.
@y
The agent can modify files in your project directory, so review changes before
merging. See [Workspace trust](security/workspace.md) for details.
@z

@x
> [!CAUTION]
> Your network policy controls what the sandbox can reach. With **Locked
> Down**, even your model provider API is blocked. With **Balanced**, a broad
> set of common development services is allowed by default — add other hosts
> with `sbx policy allow`. See [Policies](security/policy.md) for details.
@y
> [!CAUTION]
> Your network policy controls what the sandbox can reach. With **Locked
> Down**, even your model provider API is blocked. With **Balanced**, a broad
> set of common development services is allowed by default — add other hosts
> with `sbx policy allow`. See [Policies](security/policy.md) for details.
@z

@x
## Next steps
@y
## Next steps
@z

@x
- [Usage guide](usage.md) — common patterns and workflows
- [Agents](agents/) — supported agents and configuration
- [Custom environments](agents/custom-environments.md) — build your own sandbox
  images
- [Policies](security/policy.md) — control outbound access
@y
- [Usage guide](usage.md) — common patterns and workflows
- [Agents](agents/) — supported agents and configuration
- [Custom environments](agents/custom-environments.md) — build your own sandbox
  images
- [Policies](security/policy.md) — control outbound access
@z
