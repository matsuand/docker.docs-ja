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
description: Configure agent credentials and work through your first Docker Sandboxes session.
keywords: sandbox, sbx, get started, credentials, clone mode, network policy
@y
description: Configure agent credentials and work through your first Docker Sandboxes session.
keywords: sandbox, sbx, get started, credentials, clone mode, network policy
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
This page walks through your first session: run an agent in a sandbox, see how
the sandbox isolates it, control what it can reach on the network, and clean
up.
@y
This page walks through your first session: run an agent in a sandbox, see how
the sandbox isolates it, control what it can reach on the network, and clean
up.
@z

@x
## Prerequisites
@y
## Prerequisites
@z

@x
- [Install the `sbx` CLI](install.md) and sign in to Docker
- Configure an authentication method for the agent you want to use. Most agents
  require an API key for their model provider. See the [agent pages](agents/)
  for provider-specific instructions.
@y
- [Install the `sbx` CLI](install.md) and sign in to Docker
- Configure an authentication method for the agent you want to use. Most agents
  require an API key for their model provider. See the [agent pages](agents/)
  for provider-specific instructions.
@z

@x
## Authenticate your agent
@y
## Authenticate your agent
@z

@x
For Claude Code with a Claude subscription (Max, Team, or Enterprise), no
upfront setup is needed — use the `/login` command inside the sandbox to sign
in with OAuth. The session token stays on your host and is never stored inside
the sandbox.
@y
For Claude Code with a Claude subscription (Max, Team, or Enterprise), no
upfront setup is needed — use the `/login` command inside the sandbox to sign
in with OAuth. The session token stays on your host and is never stored inside
the sandbox.
@z

@x
If you prefer to authenticate with an API key, see
[Credentials](configuration/credentials.md) for how to store one with
`sbx secret set`.
@y
If you prefer to authenticate with an API key, see
[Credentials](configuration/credentials.md) for how to store one with
`sbx secret set`.
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
$ sbx secret set github --command 'gh auth token'
```
@y
```console
$ sbx secret set github --command 'gh auth token'
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
$ sbx run --name my-sandbox claude
```
@y
```console
$ cd ~/my-project
$ sbx run --name my-sandbox claude
```
@z

@x
The first time you run a sandbox, the CLI prompts you to choose a default
network preset:
@y
The first time you run a sandbox, the CLI prompts you to choose a default
network preset:
@z

@x
```plaintext
Initialize the global network policy for your sandboxes:
@y
```plaintext
Initialize the global network policy for your sandboxes:
@z

@x
  Applies to all sandboxes, current and future — change it later with
  "sbx policy allow/deny/rm". Kits, including built-in agent kits, may
  also add per-sandbox rules.
@y
  Applies to all sandboxes, current and future — change it later with
  "sbx policy allow/deny/rm". Kits, including built-in agent kits, may
  also add per-sandbox rules.
@z

@x
     1. Open         — All network traffic allowed, no restrictions.
  ❯  2. Balanced     — Default deny, with common dev sites allowed.
     3. Locked Down  — All network traffic blocked unless you allow it.
@y
     1. Open         — All network traffic allowed, no restrictions.
  ❯  2. Balanced     — Default deny, with common dev sites allowed.
     3. Locked Down  — All network traffic blocked unless you allow it.
@z

@x
  Use ↑/↓ or 1–3 to navigate, Enter to confirm, Esc to cancel.
```
@y
  Use ↑/↓ or 1–3 to navigate, Enter to confirm, Esc to cancel.
```
@z

@x
**Balanced** is a good starting point — it permits traffic to common
development services while blocking everything else. You can adjust individual
rules later. See [Local policy](governance/access-controls/local.md) for a full
description of each option.
@y
**Balanced** is a good starting point — it permits traffic to common
development services while blocking everything else. You can adjust individual
rules later. See [Local policy](governance/access-controls/local.md) for a full
description of each option.
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
This attaches you to the agent running inside the sandbox. Give it a real
task — ask it to add a feature, install a dependency, or build and run your
project. The agent has a full Linux environment with its own Docker daemon, so
it can install packages, build images, and start containers on its own while it
works.
@y
This attaches you to the agent running inside the sandbox. Give it a real
task — ask it to add a feature, install a dependency, or build and run your
project. The agent has a full Linux environment with its own Docker daemon, so
it can install packages, build images, and start containers on its own while it
works.
@z

@x
## See what the agent can touch
@y
## See what the agent can touch
@z

@x
From another terminal, list your sandboxes:
@y
From another terminal, list your sandboxes:
@z

@x
```console
$ sbx ls
SANDBOX       AGENT    STATUS    PORTS   WORKSPACE
my-sandbox    claude   running           ~/my-project
```
@y
```console
$ sbx ls
SANDBOX       AGENT    STATUS    PORTS   WORKSPACE
my-sandbox    claude   running           ~/my-project
```
@z

@x
Each row shows a sandbox's name, the agent running in it, its status, any
[published ports](usage.md#publish-ports), and its
workspace — the host directory shared into the sandbox. That workspace is the
one part of your machine the agent can see.
@y
Each row shows a sandbox's name, the agent running in it, its status, any
[published ports](usage.md#publish-ports), and its
workspace — the host directory shared into the sandbox. That workspace is the
one part of your machine the agent can see.
@z

@x
By default, the workspace is shared read-write, so the agent and your host see
the same files. Edits the agent makes to your project appear in your working
tree as it writes them, and you review them as an ordinary Git diff before
committing.
@y
By default, the workspace is shared read-write, so the agent and your host see
the same files. Edits the agent makes to your project appear in your working
tree as it writes them, and you review them as an ordinary Git diff before
committing.
@z

@x
Everything else runs inside the microVM, isolated from your host:
@y
Everything else runs inside the microVM, isolated from your host:
@z

@x
- The agent has its own filesystem, Docker daemon, and network.
- Packages it installs, images it pulls, and containers it starts stay inside
  the sandbox. Your host system is untouched, and removing the sandbox discards
  them.
@y
- The agent has its own filesystem, Docker daemon, and network.
- Packages it installs, images it pulls, and containers it starts stay inside
  the sandbox. Your host system is untouched, and removing the sandbox discards
  them.
@z

@x
If you'd rather the agent not touch your working tree at all — for example,
when running several agents on one repository — use
[clone mode](usage.md#clone-mode), which gives it a private clone instead.
@y
If you'd rather the agent not touch your working tree at all — for example,
when running several agents on one repository — use
[clone mode](usage.md#clone-mode), which gives it a private clone instead.
@z

@x
## Control what the agent can reach
@y
## Control what the agent can reach
@z

@x
Isolation isn't only about the filesystem. You also control what the sandbox
can reach on the network. You chose a default policy before the sandbox
started, and you can inspect or adjust it at any time.
@y
Isolation isn't only about the filesystem. You also control what the sandbox
can reach on the network. You chose a default policy before the sandbox
started, and you can inspect or adjust it at any time.
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
permitted by default. See
[local policy](governance/access-controls/local.md) for the full rule set
and how to customize it.
@y
With **Locked Down**, even your model provider API is blocked unless you
explicitly allow it. With **Balanced**, common development services are
permitted by default. See
[local policy](governance/access-controls/local.md) for the full rule set
and how to customize it.
@z

@x
## Clean up
@y
## Clean up
@z

@x
Sandboxes persist after the agent exits, so you can stop one and pick up where
you left off later:
@y
Sandboxes persist after the agent exits, so you can stop one and pick up where
you left off later:
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
images, and the in-sandbox Git clone if you used clone mode. Files in your
host working tree are unaffected.
@y
Removing a sandbox deletes everything inside it — installed packages, Docker
images, and the in-sandbox Git clone if you used clone mode. Files in your
host working tree are unaffected.
@z

@x
## What's next
@y
## What's next
@z

@x
You've run an agent, seen how the sandbox isolates it, and controlled its
network access. A few directions from here.
@y
You've run an agent, seen how the sandbox isolates it, and controlled its
network access. A few directions from here.
@z

@x
Run `sbx` with no arguments to open the interactive dashboard: a live view of
every sandbox where you can attach to agents, open shells, and manage network
rules from one place.
@y
Run `sbx` with no arguments to open the interactive dashboard: a live view of
every sandbox where you can attach to agents, open shells, and manage network
rules from one place.
@z

@x
![The interactive dashboard showing sandbox status, resource usage, and network governance controls.](images/sbx-dashboard.png)
@y
![The interactive dashboard showing sandbox status, resource usage, and network governance controls.](images/sbx-dashboard.png)
@z

@x
Then explore:
@y
Then explore:
@z

@x
- [Usage guide](usage.md) — basic commands, reconnecting, workspaces, and port
  publishing.
- [Workflow patterns](workflows/) — Git strategies, local services, CI, and
  authenticated tools.
- [Sandbox environment files](configuration/environment-files.md) — declare and share
  repeatable local sandbox configurations with `.sbxenv.yaml`. Requires `sbx`
  0.39.0 or later.
- [Customize with kits](customize/) — package an agent, its tools, and its
  network rules into a reusable definition you launch with a single flag.
- [Agents](agents/) — the full list of supported agents and how to configure
  each one.
- [Governance](governance/) — centrally manage network, filesystem, and MCP
  policies across a team.
@y
- [Usage guide](usage.md) — basic commands, reconnecting, workspaces, and port
  publishing.
- [Workflow patterns](workflows/) — Git strategies, local services, CI, and
  authenticated tools.
- [Sandbox environment files](configuration/environment-files.md) — declare and share
  repeatable local sandbox configurations with `.sbxenv.yaml`. Requires `sbx`
  0.39.0 or later.
- [Customize with kits](customize/) — package an agent, its tools, and its
  network rules into a reusable definition you launch with a single flag.
- [Agents](agents/) — the full list of supported agents and how to configure
  each one.
- [Governance](governance/) — centrally manage network, filesystem, and MCP
  policies across a team.
@z
