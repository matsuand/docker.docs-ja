%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

% __SUBDIR__ 対応
% snip 対応

@x
title: Docker Sandboxes
description: Run AI agents in isolated environments
@y
title: Docker Sandboxes
description: Run AI agents in isolated environments
@z

@x
      text: Experimental
@y
      text: 試験的
@z

@x
{{< summary-bar feature_name="Docker Sandboxes" >}}
@y
{{< summary-bar feature_name="Docker Sandboxes" >}}
@z

@x
Docker Sandboxes lets you run AI coding agents in isolated environments on your
machine. If you're building with agents like Claude Code, Sandboxes provides a
secure way to give agents autonomy without compromising your system.
@y
Docker Sandboxes lets you run AI coding agents in isolated environments on your
machine. If you're building with agents like Claude Code, Sandboxes provides a
secure way to give agents autonomy without compromising your system.
@z

@x
## Why use Docker Sandboxes
@y
## Why use Docker Sandboxes
@z

@x
AI agents need to execute commands, install packages, and test code. Running
them directly on your host machine means they have full access to your files,
processes, and network. Docker Sandboxes isolates agents in microVMs, each with
its own Docker daemon. Agents can spin up test containers and modify their
environment without affecting your host.
@y
AI agents need to execute commands, install packages, and test code. Running
them directly on your host machine means they have full access to your files,
processes, and network. Docker Sandboxes isolates agents in microVMs, each with
its own Docker daemon. Agents can spin up test containers and modify their
environment without affecting your host.
@z

@x
You get:
@y
You get:
@z

@x
- Agent autonomy without host system risk
- YOLO mode by default - agents work without asking permission
- Private Docker daemon for running test containers
- File sharing between host and sandbox
- Network access control
@y
- Agent autonomy without host system risk
- YOLO mode by default - agents work without asking permission
- Private Docker daemon for running test containers
- File sharing between host and sandbox
- Network access control
@z

@x
For a comparison between Docker Sandboxes and other approaches to isolating
coding agents, see [Comparison to alternatives](./architecture.md#comparison-to-alternatives).
@y
For a comparison between Docker Sandboxes and other approaches to isolating
coding agents, see [Comparison to alternatives](./architecture.md#comparison-to-alternatives).
@z

@x
> [!NOTE]
> MicroVM-based sandboxes require macOS or Windows (experimental). Linux users
> can use legacy container-based sandboxes with
> [Docker Desktop 4.57](/desktop/release-notes/#4570).
@y
> [!NOTE]
> MicroVM-based sandboxes require macOS or Windows (experimental). Linux users
> can use legacy container-based sandboxes with
> [Docker Desktop 4.57](__SUBDIR__/desktop/release-notes/#4570).
@z

@x
## How to use sandboxes
@y
## How to use sandboxes
@z

@x
To create and run a sandbox:
@y
To create and run a sandbox:
@z

% snip command...

@x
This command creates a sandbox for your workspace (`~/my-project`) and starts
the Claude Code agent inside it. The agent can now work with your code, install
tools, and run containers inside the isolated sandbox.
@y
This command creates a sandbox for your workspace (`~/my-project`) and starts
the Claude Code agent inside it. The agent can now work with your code, install
tools, and run containers inside the isolated sandbox.
@z

@x
## How it works
@y
## How it works
@z

@x
Sandboxes run in lightweight microVMs with private Docker daemons. Each sandbox
is completely isolated - the agent runs inside the VM and can't access your
host Docker daemon, containers, or files outside the workspace.
@y
Sandboxes run in lightweight microVMs with private Docker daemons. Each sandbox
is completely isolated - the agent runs inside the VM and can't access your
host Docker daemon, containers, or files outside the workspace.
@z

@x
Your workspace directory syncs between host and sandbox at the same absolute
path, so file paths in error messages match between environments.
@y
Your workspace directory syncs between host and sandbox at the same absolute
path, so file paths in error messages match between environments.
@z

@x
Sandboxes don't appear in `docker ps` on your host because they're VMs, not
containers. Use `docker sandbox ls` to see them.
@y
Sandboxes don't appear in `docker ps` on your host because they're VMs, not
containers. Use `docker sandbox ls` to see them.
@z

@x
For technical details on the architecture, isolation model, and networking, see
[Architecture](architecture.md).
@y
For technical details on the architecture, isolation model, and networking, see
[Architecture](architecture.md).
@z

@x
### Multiple sandboxes
@y
### Multiple sandboxes
@z

@x
Create separate sandboxes for different projects:
@y
Create separate sandboxes for different projects:
@z

% snip command...

@x
Each sandbox is completely isolated from the others. Sandboxes persist until
you remove them, so installed packages and configuration stay available for
that workspace.
@y
Each sandbox is completely isolated from the others. Sandboxes persist until
you remove them, so installed packages and configuration stay available for
that workspace.
@z

@x
## Supported agents
@y
## Supported agents
@z

@x
Docker Sandboxes works with multiple AI coding agents:
@y
Docker Sandboxes works with multiple AI coding agents:
@z

@x
- **Claude Code** - Anthropic's coding agent
- **Codex** - OpenAI's Codex agent (partial support; in development)
- **Copilot** - GitHub Copilot agent (partial support; in development)
- **Gemini** - Google's Gemini agent (partial support; in development)
- **cagent** - Docker's [cagent](/ai/cagent/) (partial support; in development)
- **Kiro** - by AWS (partial support; in development)
@y
- **Claude Code** - Anthropic's coding agent
- **Codex** - OpenAI's Codex agent (partial support; in development)
- **Copilot** - GitHub Copilot agent (partial support; in development)
- **Gemini** - Google's Gemini agent (partial support; in development)
- **cagent** - Docker's [cagent](__SUBDIR__/ai/cagent/) (partial support; in development)
- **Kiro** - by AWS (partial support; in development)
@z

@x
## Get started
@y
## Get started
@z

@x
Head to the [Get started guide](get-started.md) to run your first sandboxed agent.
@y
Head to the [Get started guide](get-started.md) to run your first sandboxed agent.
@z

@x
## Troubleshooting
@y
## Troubleshooting
@z

@x
See [Troubleshooting](./troubleshooting) for common configuration errors, or
report issues on the [Docker Desktop issue tracker](https://github.com/docker/desktop-feedback).
@y
See [Troubleshooting](./troubleshooting) for common configuration errors, or
report issues on the [Docker Desktop issue tracker](https://github.com/docker/desktop-feedback).
@z
