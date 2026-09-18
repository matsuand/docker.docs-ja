%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

% __SUBDIR__ 対応 / .md リンクへの (no slash) 対応

@x
title: Sandboxes
description: Create and manage hosted environments in Docker Agentic Platform.
keywords: docker agentic platform, sandboxes, agents, cloud runtime, terminal, compute
@y
title: Sandboxes
description: Create and manage hosted environments in Docker Agentic Platform.
keywords: docker agentic platform, sandboxes, agents, cloud runtime, terminal, compute
@z

@x
A sandbox is an isolated runtime on Docker-managed cloud infrastructure.
Docker hosts and meters the sandbox and provides a live terminal for
interacting with it.
@y
A sandbox is an isolated runtime on Docker-managed cloud infrastructure.
Docker hosts and meters the sandbox and provides a live terminal for
interacting with it.
@z

@x
Docker Agentic Platform provides predefined sandbox types for Claude Code,
Codex, OpenCode, Copilot, Gemini CLI, and Shell. All sandbox types run Ubuntu on
x86-64 compute with Docker pre-installed. Each sandbox has its own compute,
filesystem, network access, and terminal. The compute size that you select
determines its CPU and memory resources.
@y
Docker Agentic Platform provides predefined sandbox types for Claude Code,
Codex, OpenCode, Copilot, Gemini CLI, and Shell. All sandbox types run Ubuntu on
x86-64 compute with Docker pre-installed. Each sandbox has its own compute,
filesystem, network access, and terminal. The compute size that you select
determines its CPU and memory resources.
@z

@x
The Shell type opens a Bash shell without a pre-installed agent. It uses the
same agent-less environment as [`sbx run shell`](/manuals/ai/sandboxes/agents/shell.md)
and is useful for working manually or installing your own agent.
@y
The Shell type opens a Bash shell without a pre-installed agent. It uses the
same agent-less environment as [`sbx run shell`](manuals/ai/sandboxes/agents/shell.md)
and is useful for working manually or installing your own agent.
@z

@x
A sandbox continues running independently of your connection to the Console
until it is paused, stopped by its lifecycle timer, or deleted.
@y
A sandbox continues running independently of your connection to the Console
until it is paused, stopped by its lifecycle timer, or deleted.
@z

@x
## Source code and files
@y
## Source code and files
@z

@x
A sandbox starts with a fresh filesystem. Docker Agentic Platform does not
mount a repository, local directory, or workspace from your computer into the
sandbox by default.
@y
A sandbox starts with a fresh filesystem. Docker Agentic Platform does not
mount a repository, local directory, or workspace from your computer into the
sandbox by default.
@z

@x
A sandbox does not synchronize its filesystem with your computer or a remote
repository. Work remains only in the sandbox unless you commit and push it to a
remote repository. Push work that you want to keep before deleting the
sandbox; files that exist only in a deleted sandbox are not available from a
later sandbox.
@y
A sandbox does not synchronize its filesystem with your computer or a remote
repository. Work remains only in the sandbox unless you commit and push it to a
remote repository. Push work that you want to keep before deleting the
sandbox; files that exist only in a deleted sandbox are not available from a
later sandbox.
@z

@x
Docker Agentic Platform supports GitHub repositories for bringing source into
a sandbox and preserving changes. `GITHUB_TOKEN` authenticates both Copilot and
GitHub repository operations. Copilot uses the same token for both. To clone a
private repository or push changes from another sandbox type, select or add
`GITHUB_TOKEN` in the launcher. The token must have the required repository
permissions. Public repositories can be cloned without a GitHub credential,
but writing to them still requires authentication.
@y
Docker Agentic Platform supports GitHub repositories for bringing source into
a sandbox and preserving changes. `GITHUB_TOKEN` authenticates both Copilot and
GitHub repository operations. Copilot uses the same token for both. To clone a
private repository or push changes from another sandbox type, select or add
`GITHUB_TOKEN` in the launcher. The token must have the required repository
permissions. Public repositories can be cloned without a GitHub credential,
but writing to them still requires authentication.
@z

@x
## Open a sandbox
@y
## Open a sandbox
@z

@x
After you select **Run**, Docker creates the sandbox and opens its detail page.
Use the terminal to interact with the sandbox.
@y
After you select **Run**, Docker creates the sandbox and opens its detail page.
Use the terminal to interact with the sandbox.
@z

@x
Open **Sandboxes** to review each sandbox's name, type, status, hourly rate,
expiration, and age. Select a sandbox to reopen its detail page and terminal.
@y
Open **Sandboxes** to review each sandbox's name, type, status, hourly rate,
expiration, and age. Select a sandbox to reopen its detail page and terminal.
@z

@x
## Manage the lifecycle
@y
## Manage the lifecycle
@z

@x
A sandbox can be running or paused:
@y
A sandbox can be running or paused:
@z

@x
- Pause a running sandbox to stop its compute without deleting it.
- Resume a paused sandbox to continue working with it.
- Delete a sandbox when you no longer need it.
@y
- Pause a running sandbox to stop its compute without deleting it.
- Resume a paused sandbox to continue working with it.
- Delete a sandbox when you no longer need it.
@z

@x
When you create a sandbox, set a lifecycle timer from 1 to 24 hours and choose
what happens when it expires. **Stop** stops the sandbox, while **Delete**
deletes the sandbox and its files. When a sandbox stops, all processes running
inside it stop too, including background processes.
@y
When you create a sandbox, set a lifecycle timer from 1 to 24 hours and choose
what happens when it expires. **Stop** stops the sandbox, while **Delete**
deletes the sandbox and its files. When a sandbox stops, all processes running
inside it stop too, including background processes.
@z

@x
The sandbox's authentication, tools, access policy, and compute size are fixed
when the sandbox is created and cannot be changed while it runs.
@y
The sandbox's authentication, tools, access policy, and compute size are fixed
when the sandbox is created and cannot be changed while it runs.
@z

@x
Docker bills sandbox compute per second while the sandbox runs. Model inference
uses your external provider credential and is metered by that provider. For
account, usage, and payment information, see [Docker Billing](/subscription-billing/).
@y
Docker bills sandbox compute per second while the sandbox runs. Model inference
uses your external provider credential and is metered by that provider. For
account, usage, and payment information, see [Docker Billing](__SUBDIR__/subscription-billing/).
@z

@x
## Check sandbox configuration
@y
## Check sandbox configuration
@z

@x
If the sandbox cannot reach a service or use a tool, check the configuration
that applies to the request:
@y
If the sandbox cannot reach a service or use a tool, check the configuration
that applies to the request:
@z

@x
- Confirm that the network policies permit the destination.
- If the sandbox needs an MCP tool, confirm that its server is connected and
  authorized.
- If the destination requires authentication, confirm that the sandbox was
  created with the service credential.
@y
- Confirm that the network policies permit the destination.
- If the sandbox needs an MCP tool, confirm that its server is connected and
  authorized.
- If the destination requires authentication, confirm that the sandbox was
  created with the service credential.
@z
