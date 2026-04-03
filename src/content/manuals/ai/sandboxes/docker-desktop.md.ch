%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

% __SUBDIR__ 対応

@x
title: Docker Desktop sandboxes
linkTitle: Docker Desktop
description: Run sandboxed AI coding agents using Docker Desktop and the docker sandbox CLI.
@y
title: Docker Desktop sandboxes
linkTitle: Docker Desktop
description: Run sandboxed AI coding agents using Docker Desktop and the docker sandbox CLI.
@z

@x
{{< summary-bar feature_name="Docker Sandboxes" >}}
@y
{{< summary-bar feature_name="Docker Sandboxes" >}}
@z

@x
Docker Desktop includes a built-in sandbox feature for running AI coding
agents in isolated microVMs using the `docker sandbox` command. This is a
convenience integration. For full functionality, use the standalone `sbx`
CLI instead.
@y
Docker Desktop includes a built-in sandbox feature for running AI coding
agents in isolated microVMs using the `docker sandbox` command. This is a
convenience integration. For full functionality, use the standalone `sbx`
CLI instead.
@z

@x
> [!NOTE]
> The standalone `sbx` CLI provides more features, more flexibility, and doesn't
> require Docker Desktop. If you're setting up sandboxed agents for the first
> time, consider using the standalone CLI instead.
@y
> [!NOTE]
> The standalone `sbx` CLI provides more features, more flexibility, and doesn't
> require Docker Desktop. If you're setting up sandboxed agents for the first
> time, consider using the standalone CLI instead.
@z

@x
## Prerequisites
@y
## Prerequisites
@z

@x
- Docker Desktop 4.58 or later
- macOS or Windows
- API keys for your chosen agent
@y
- Docker Desktop 4.58 or later
- macOS or Windows
- API keys for your chosen agent
@z

@x
## Quick start
@y
## Quick start
@z

@x
1. Set your API key in your shell configuration file:
@y
1. Set your API key in your shell configuration file:
@z

@x
   ```plaintext {title="~/.bashrc or ~/.zshrc"}
   export ANTHROPIC_API_KEY=sk-ant-api03-xxxxx
   ```
@y
   ```plaintext {title="~/.bashrc or ~/.zshrc"}
   export ANTHROPIC_API_KEY=sk-ant-api03-xxxxx
   ```
@z

@x
   Source your shell configuration and restart Docker Desktop so the daemon
   picks up the variable.
@y
   Source your shell configuration and restart Docker Desktop so the daemon
   picks up the variable.
@z

@x
2. Create and run a sandbox:
@y
2. Create and run a sandbox:
@z

@x
   ```console
   $ cd ~/my-project
   $ docker sandbox run claude
   ```
@y
   ```console
   $ cd ~/my-project
   $ docker sandbox run claude
   ```
@z

@x
   The first run takes longer while Docker initializes the microVM.
@y
   The first run takes longer while Docker initializes the microVM.
@z

@x
Replace `claude` with a different [agent](#supported-agents) if needed.
@y
Replace `claude` with a different [agent](#supported-agents) if needed.
@z

@x
## Supported agents
@y
## Supported agents
@z

@x
| Agent                             | Command        | Notes                                |
| --------------------------------- | -------------- | ------------------------------------ |
| Claude Code                       | `claude`       | Most tested implementation           |
| Codex                             | `codex`        |                                      |
| Copilot                           | `copilot`      |                                      |
| Gemini                            | `gemini`       |                                      |
| [Docker Agent](/ai/docker-agent/) | `docker-agent` | Also available as a standalone tool  |
| Kiro                              | `kiro`         |                                      |
| OpenCode                          | `opencode`     |                                      |
| Custom shell                      | `shell`        | Minimal environment for manual setup |
@y
| Agent                             | Command        | Notes                                |
| --------------------------------- | -------------- | ------------------------------------ |
| Claude Code                       | `claude`       | Most tested implementation           |
| Codex                             | `codex`        |                                      |
| Copilot                           | `copilot`      |                                      |
| Gemini                            | `gemini`       |                                      |
| [Docker Agent](__SUBDIR__/ai/docker-agent/) | `docker-agent` | Also available as a standalone tool  |
| Kiro                              | `kiro`         |                                      |
| OpenCode                          | `opencode`     |                                      |
| Custom shell                      | `shell`        | Minimal environment for manual setup |
@z

@x
All agents are experimental. The agent type is specified when creating a
sandbox and can't be changed later.
@y
All agents are experimental. The agent type is specified when creating a
sandbox and can't be changed later.
@z

@x
## Authentication
@y
## Authentication
@z

@x
Each agent requires its own API key or credentials. Docker Sandboxes uses a
daemon that doesn't inherit environment variables from your shell session, so
you must set keys in your shell configuration file (not just export them in
your terminal).
@y
Each agent requires its own API key or credentials. Docker Sandboxes uses a
daemon that doesn't inherit environment variables from your shell session, so
you must set keys in your shell configuration file (not just export them in
your terminal).
@z

@x
Common environment variables by agent:
@y
Common environment variables by agent:
@z

@x
| Agent        | Environment variable(s)                           |
| ------------ | ------------------------------------------------- |
| Claude Code  | `ANTHROPIC_API_KEY`                               |
| Codex        | `OPENAI_API_KEY`                                  |
| Copilot      | `GH_TOKEN` or `GITHUB_TOKEN`                      |
| Gemini       | `GEMINI_API_KEY` or `GOOGLE_API_KEY`              |
| Docker Agent | `OPENAI_API_KEY`, `ANTHROPIC_API_KEY`, and others |
| OpenCode     | `OPENAI_API_KEY`, `ANTHROPIC_API_KEY`, and others |
| Kiro         | Device flow (interactive browser login)           |
| Shell        | Any provider keys needed                          |
@y
| Agent        | Environment variable(s)                           |
| ------------ | ------------------------------------------------- |
| Claude Code  | `ANTHROPIC_API_KEY`                               |
| Codex        | `OPENAI_API_KEY`                                  |
| Copilot      | `GH_TOKEN` or `GITHUB_TOKEN`                      |
| Gemini       | `GEMINI_API_KEY` or `GOOGLE_API_KEY`              |
| Docker Agent | `OPENAI_API_KEY`, `ANTHROPIC_API_KEY`, and others |
| OpenCode     | `OPENAI_API_KEY`, `ANTHROPIC_API_KEY`, and others |
| Kiro         | Device flow (interactive browser login)           |
| Shell        | Any provider keys needed                          |
@z

@x
After setting variables, source your shell configuration and restart Docker
Desktop. The sandbox proxy injects credentials into API requests so keys stay
on your host and are never stored inside the sandbox.
@y
After setting variables, source your shell configuration and restart Docker
Desktop. The sandbox proxy injects credentials into API requests so keys stay
on your host and are never stored inside the sandbox.
@z

@x
## Commands
@y
## Commands
@z

@x
```console
$ docker sandbox run AGENT [PATH]                  # Create and run
$ docker sandbox ls                                # List sandboxes
$ docker sandbox exec -it <name> bash              # Shell into a sandbox
$ docker sandbox rm <name>                         # Remove a sandbox
$ docker sandbox reset                             # Remove all sandboxes
$ docker sandbox network proxy <name> --policy … # Set network policy
$ docker sandbox network log                       # View network log
```
@y
```console
$ docker sandbox run AGENT [PATH]                  # Create and run
$ docker sandbox ls                                # List sandboxes
$ docker sandbox exec -it <name> bash              # Shell into a sandbox
$ docker sandbox rm <name>                         # Remove a sandbox
$ docker sandbox reset                             # Remove all sandboxes
$ docker sandbox network proxy <name> --policy … # Set network policy
$ docker sandbox network log                       # View network log
```
@z

@x
Sandboxes don't appear in `docker ps` because they're microVMs, not
containers. For the full command reference, see the
[CLI reference](/reference/cli/docker/sandbox/).
@y
Sandboxes don't appear in `docker ps` because they're microVMs, not
containers. For the full command reference, see the
[CLI reference](__SUBDIR__/reference/cli/docker/sandbox/).
@z

@x
Pass agent-specific CLI options after the sandbox name with a `--` separator:
@y
Pass agent-specific CLI options after the sandbox name with a `--` separator:
@z

@x
```console
$ docker sandbox run <name> -- --continue
```
@y
```console
$ docker sandbox run <name> -- --continue
```
@z

@x
## Architecture
@y
## Architecture
@z

@x
Each sandbox is a lightweight microVM with its own kernel, using your system's
native virtualization (macOS virtualization.framework, Windows Hyper-V). The
default agent templates include a private Docker daemon, so `docker build` and
`docker compose up` run inside the sandbox without affecting your host.
@y
Each sandbox is a lightweight microVM with its own kernel, using your system's
native virtualization (macOS virtualization.framework, Windows Hyper-V). The
default agent templates include a private Docker daemon, so `docker build` and
`docker compose up` run inside the sandbox without affecting your host.
@z

@x
```plaintext
Host system
  ├── Your containers and images
  ├── Sandbox VM 1
  │   ├── Docker daemon (isolated)
  │   ├── Agent container
  │   └── Containers created by agent
  └── Sandbox VM 2
      ├── Docker daemon (isolated)
      └── Agent container
```
@y
```plaintext
Host system
  ├── Your containers and images
  ├── Sandbox VM 1
  │   ├── Docker daemon (isolated)
  │   ├── Agent container
  │   └── Containers created by agent
  └── Sandbox VM 2
      ├── Docker daemon (isolated)
      └── Agent container
```
@z

@x
Your workspace syncs bidirectionally between host and sandbox at the same
absolute path. Outbound internet goes through an HTTP/HTTPS filtering proxy on
the host. See [Network policies](#network-policies) for configuration.
@y
Your workspace syncs bidirectionally between host and sandbox at the same
absolute path. Outbound internet goes through an HTTP/HTTPS filtering proxy on
the host. See [Network policies](#network-policies) for configuration.
@z

@x
## Network policies
@y
## Network policies
@z

@x
The filtering proxy controls what a sandbox can access. By default, all
traffic is allowed except private networks and localhost.
@y
The filtering proxy controls what a sandbox can access. By default, all
traffic is allowed except private networks and localhost.
@z

@x
Allow mode (block specific destinations):
@y
Allow mode (block specific destinations):
@z

@x
```console
$ docker sandbox network proxy my-sandbox \
  --policy allow \
  --block-cidr 10.0.0.0/8
```
@y
```console
$ docker sandbox network proxy my-sandbox \
  --policy allow \
  --block-cidr 10.0.0.0/8
```
@z

@x
Deny mode (allow specific destinations):
@y
Deny mode (allow specific destinations):
@z

@x
```console
$ docker sandbox network proxy my-sandbox \
  --policy deny \
  --allow-host api.anthropic.com \
  --allow-host "*.npmjs.org"
```
@y
```console
$ docker sandbox network proxy my-sandbox \
  --policy deny \
  --allow-host api.anthropic.com \
  --allow-host "*.npmjs.org"
```
@z

@x
View what an agent is accessing:
@y
View what an agent is accessing:
@z

@x
```console
$ docker sandbox network log
```
@y
```console
$ docker sandbox network log
```
@z

@x
## Custom templates
@y
## Custom templates
@z

@x
Build custom templates to pre-install tools:
@y
Build custom templates to pre-install tools:
@z

@x
```dockerfile
FROM docker/sandbox-templates:claude-code
@y
```dockerfile
FROM docker/sandbox-templates:claude-code
@z

@x
USER root
RUN apt-get update && apt-get install -y build-essential \
    && rm -rf /var/lib/apt/lists/*
USER agent
```
@y
USER root
RUN apt-get update && apt-get install -y build-essential \
    && rm -rf /var/lib/apt/lists/*
USER agent
```
@z

@x
```console
$ docker build -t my-template:v1 .
$ docker sandbox run -t my-template:v1 claude ~/project
```
@y
```console
$ docker build -t my-template:v1 .
$ docker sandbox run -t my-template:v1 claude ~/project
```
@z

@x
## Base environment
@y
## Base environment
@z

@x
All agent templates share a common environment:
@y
All agent templates share a common environment:
@z

@x
- Ubuntu 25.10
- Docker CLI (with Buildx and Compose), Git, GitHub CLI, Node.js, Go, Python 3, uv, make, jq, ripgrep
- Non-root `agent` user with sudo access
- Package managers: apt, pip, npm
@y
- Ubuntu 25.10
- Docker CLI (with Buildx and Compose), Git, GitHub CLI, Node.js, Go, Python 3, uv, make, jq, ripgrep
- Non-root `agent` user with sudo access
- Package managers: apt, pip, npm
@z

@x
## Troubleshooting
@y
## Troubleshooting
@z

@x
<!-- vale off -->
@y
<!-- vale off -->
@z

@x
### 'sandbox' is not a docker command
@y
### 'sandbox' is not a docker command
@z

@x
<!-- vale on -->
@y
<!-- vale on -->
@z

@x
The CLI plugin isn't installed or isn't in the correct location. Verify the
plugin exists at `~/.docker/cli-plugins/docker-sandbox` and restart Docker
Desktop.
@y
The CLI plugin isn't installed or isn't in the correct location. Verify the
plugin exists at `~/.docker/cli-plugins/docker-sandbox` and restart Docker
Desktop.
@z

@x
### Beta features need to be enabled
@y
### Beta features need to be enabled
@z

@x
If your Docker Desktop is managed by an administrator with
[Settings Management](/enterprise/security/hardened-desktop/settings-management/),
ask them to
[allow beta features](/enterprise/security/hardened-desktop/settings-management/configure-json-file/#beta-features).
@y
If your Docker Desktop is managed by an administrator with
[Settings Management](__SUBDIR__/enterprise/security/hardened-desktop/settings-management/),
ask them to
[allow beta features](__SUBDIR__/enterprise/security/hardened-desktop/settings-management/configure-json-file/#beta-features).
@z

@x
### Authentication failure
@y
### Authentication failure
@z

@x
Verify your API key is valid and set in your shell configuration file (not
just exported in the current session). Source the file and restart Docker
Desktop.
@y
Verify your API key is valid and set in your shell configuration file (not
just exported in the current session). Source the file and restart Docker
Desktop.
@z

@x
### Permission denied on workspace files
@y
### Permission denied on workspace files
@z

@x
Check **Docker Desktop** > **Settings** > **Resources** > **File Sharing** and
ensure your workspace path is listed. Verify file permissions with `ls -la`.
@y
Check **Docker Desktop** > **Settings** > **Resources** > **File Sharing** and
ensure your workspace path is listed. Verify file permissions with `ls -la`.
@z

@x
### Sandbox crashes on Windows
@y
### Sandbox crashes on Windows
@z

@x
If launching multiple sandboxes causes crashes, end all `docker.openvmm.exe`
processes in Task Manager and restart Docker Desktop. Launch sandboxes one at a
time.
@y
If launching multiple sandboxes causes crashes, end all `docker.openvmm.exe`
processes in Task Manager and restart Docker Desktop. Launch sandboxes one at a
time.
@z

@x
### Persistent issues
@y
### Persistent issues
@z

@x
Reset all sandbox state:
@y
Reset all sandbox state:
@z

@x
```console
$ docker sandbox reset
```
@y
```console
$ docker sandbox reset
```
@z

@x
This stops all VMs and deletes all sandbox data. Create fresh sandboxes
afterward.
@y
This stops all VMs and deletes all sandbox data. Create fresh sandboxes
afterward.
@z
