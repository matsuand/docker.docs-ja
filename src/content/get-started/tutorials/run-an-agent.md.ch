%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

% .md リンクへの (no slash) 対応

@x
title: Run your coding agent in a sandbox
linkTitle: Sandbox a coding agent
description: Move your existing AI coding agent workflow into a disposable Docker Sandbox.
keywords: Docker, get started, AI agents, coding agents, Docker Sandboxes, sbx, sandbox, YOLO mode
@y
title: Run your coding agent in a sandbox
linkTitle: Sandbox a coding agent
description: Move your existing AI coding agent workflow into a disposable Docker Sandbox.
keywords: Docker, get started, AI agents, coding agents, Docker Sandboxes, sbx, sandbox, YOLO mode
@z

@x
Coding agents can work faster in full-autonomy modes that let them run commands,
install tools, and use Docker without stopping for approval. Giving an agent
that access directly on your machine also gives mistakes a wider reach.
@y
Coding agents can work faster in full-autonomy modes that let them run commands,
install tools, and use Docker without stopping for approval. Giving an agent
that access directly on your machine also gives mistakes a wider reach.
@z

@x
Docker Sandboxes change where the agent runs, not how you work with it. The
agent gets a private environment with its own operating system and Docker
daemon. Your project remains available on your host, while tools the agent
installs and system changes it makes stay inside an environment you can
discard.
@y
Docker Sandboxes change where the agent runs, not how you work with it. The
agent gets a private environment with its own operating system and Docker
daemon. Your project remains available on your host, while tools the agent
installs and system changes it makes stay inside an environment you can
discard.
@z

@x
In this tutorial, you'll move an existing coding-agent workflow into a sandbox.
@y
In this tutorial, you'll move an existing coding-agent workflow into a sandbox.
@z

@x
## Before you start
@y
## Before you start
@z

@x
- Have a project directory for the agent to work with
- Have access to a [supported coding agent](/manuals/ai/sandboxes/agents/_index.md)
@y
- Have a project directory for the agent to work with
- Have access to a [supported coding agent](manuals/ai/sandboxes/agents/_index.md)
@z

@x
You don't need Docker Desktop or Docker Engine on your host.
@y
You don't need Docker Desktop or Docker Engine on your host.
@z

@x
## Install and sign in
@y
## Install and sign in
@z

@x
[Install Docker Sandboxes](/manuals/ai/sandboxes/install.md) for your operating
system, then sign in to Docker:
@y
[Install Docker Sandboxes](manuals/ai/sandboxes/install.md) for your operating
system, then sign in to Docker:
@z

@x
```console
$ sbx login
```
@y
```console
$ sbx login
```
@z

@x
## Bring your agent setup
@y
## Bring your agent setup
@z

@x
This step is optional. Skip it if you want to start with a clean agent setup.
@y
This step is optional. Skip it if you want to start with a clean agent setup.
@z

@x
If you use agent skills on your host, preview and import them:
@y
If you use agent skills on your host, preview and import them:
@z

@x
```console
$ sbx skills import --dry-run
$ sbx skills import
```
@y
```console
$ sbx skills import --dry-run
$ sbx skills import
```
@z

@x
Imported skills become available to supported agents across your sandboxes.
This feature is experimental. See
[Share agent skills](/manuals/ai/sandboxes/workflows/agent-skills.md) for
supported agents and security considerations.
@y
Imported skills become available to supported agents across your sandboxes.
This feature is experimental. See
[Share agent skills](manuals/ai/sandboxes/workflows/agent-skills.md) for
supported agents and security considerations.
@z

@x
## Choose how to authenticate
@y
## Choose how to authenticate
@z

@x
Your agent needs access to a model provider. Subscription sign-in uses OAuth,
while API keys are stored on your host and supplied to the agent through the
sandbox proxy. Choose your agent and authentication method for the preparation
steps:
@y
Your agent needs access to a model provider. Subscription sign-in uses OAuth,
while API keys are stored on your host and supplied to the agent through the
sandbox proxy. Choose your agent and authentication method for the preparation
steps:
@z

@x
{{< sandbox-auth >}}
@y
{{< sandbox-auth >}}
@z

@x
If you already exported a supported API key in your shell, you can import it
instead of setting it separately:
@y
If you already exported a supported API key in your shell, you can import it
instead of setting it separately:
@z

@x
```console
$ sbx secret import --dry-run
$ sbx secret import
```
@y
```console
$ sbx secret import --dry-run
$ sbx secret import
```
@z

@x
The dry run shows which exported keys `sbx` found. The import command prompts
you to confirm each key before storing it. If the dry run finds nothing, use
the `sbx secret set` command from the picker. See
[Credentials](/manuals/ai/sandboxes/configuration/credentials.md) for other
secret sources and [supported coding agents](/manuals/ai/sandboxes/agents/_index.md)
for agent-specific authentication.
@y
The dry run shows which exported keys `sbx` found. The import command prompts
you to confirm each key before storing it. If the dry run finds nothing, use
the `sbx secret set` command from the picker. See
[Credentials](manuals/ai/sandboxes/configuration/credentials.md) for other
secret sources and [supported coding agents](manuals/ai/sandboxes/agents/_index.md)
for agent-specific authentication.
@z

@x
## Run your agent
@y
## Run your agent
@z

@x
Open your project and start your preferred agent. This example uses Codex:
@y
Open your project and start your preferred agent. This example uses Codex:
@z

@x
```console
$ cd ~/my-project
$ sbx run --name my-project codex
```
@y
```console
$ cd ~/my-project
$ sbx run --name my-project codex
```
@z

@x
Replace `codex` with another supported agent identifier, such as `claude`,
`copilot`, `cursor`, or `gemini`.
@y
Replace `codex` with another supported agent identifier, such as `claude`,
`copilot`, `cursor`, or `gemini`.
@z

@x
The first time you run a sandbox, `sbx` asks you to choose a default network
policy. This policy controls which external services your sandboxes can reach.
Select **Balanced** to permit common development services and block other
destinations by default. You can change these rules later with
[`sbx policy`](/manuals/ai/sandboxes/governance/access-controls/local.md).
@y
The first time you run a sandbox, `sbx` asks you to choose a default network
policy. This policy controls which external services your sandboxes can reach.
Select **Balanced** to permit common development services and block other
destinations by default. You can change these rules later with
[`sbx policy`](manuals/ai/sandboxes/governance/access-controls/local.md).
@z

@x
The built-in integrations start coding agents in their full-autonomy mode. For
example, Codex bypasses approvals, Claude Code skips permission prompts, and
Cursor, Copilot, and Gemini use YOLO mode. You don't need to add those flags.
@y
The built-in integrations start coding agents in their full-autonomy mode. For
example, Codex bypasses approvals, Claude Code skips permission prompts, and
Cursor, Copilot, and Gemini use YOLO mode. You don't need to add those flags.
@z

@x
Give the agent the same task you would give it on your host. Source changes
appear in your working tree, so you can inspect them with your usual tools:
@y
Give the agent the same task you would give it on your host. Source changes
appear in your working tree, so you can inspect them with your usual tools:
@z

@x
```console
$ git diff
```
@y
```console
$ git diff
```
@z

@x
Your project directory is the exception to the sandbox boundary. It is shared
read-write, so the agent can modify or delete its files and you can see those
changes immediately. Keep your work under version control. Tools the agent
installs and changes to the sandbox's operating system stay inside the sandbox.
@y
Your project directory is the exception to the sandbox boundary. It is shared
read-write, so the agent can modify or delete its files and you can see those
changes immediately. Keep your work under version control. Tools the agent
installs and changes to the sandbox's operating system stay inside the sandbox.
@z

@x
## Return or start over
@y
## Return or start over
@z

@x
Exit the agent when you're finished. Reconnect to the same environment later:
@y
Exit the agent when you're finished. Reconnect to the same environment later:
@z

@x
```console
$ sbx run --name my-project
```
@y
```console
$ sbx run --name my-project
```
@z

@x
When you want a clean environment, remove the sandbox:
@y
When you want a clean environment, remove the sandbox:
@z

@x
```console
$ sbx rm my-project
```
@y
```console
$ sbx rm my-project
```
@z

@x
Removing the sandbox deletes the environment and everything installed inside
it. It doesn't delete your project directory.
@y
Removing the sandbox deletes the environment and everything installed inside
it. It doesn't delete your project directory.
@z

@x
## What changed
@y
## What changed
@z

@x
You kept your project, agent, skills, credentials, and prompting workflow. The
only essential change was launching the agent with `sbx run`. That moved its
full-autonomy execution into an environment you control and can throw away.
@y
You kept your project, agent, skills, credentials, and prompting workflow. The
only essential change was launching the agent with `sbx run`. That moved its
full-autonomy execution into an environment you control and can throw away.
@z

@x
## What's next
@y
## What's next
@z

@x
Continue with the Docker Sandboxes manuals:
@y
Continue with the Docker Sandboxes manuals:
@z

@x
- [Manage your sandboxes](/manuals/ai/sandboxes/usage.md) with day-to-day
  commands
- [Configure your coding agent](/manuals/ai/sandboxes/agents/_index.md) for its
  authentication and settings
- [Review the security defaults](/manuals/ai/sandboxes/security/defaults.md) for
  workspace, network, and credential access
@y
- [Manage your sandboxes](manuals/ai/sandboxes/usage.md) with day-to-day
  commands
- [Configure your coding agent](manuals/ai/sandboxes/agents/_index.md) for its
  authentication and settings
- [Review the security defaults](manuals/ai/sandboxes/security/defaults.md) for
  workspace, network, and credential access
@z
