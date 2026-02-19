%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
title: Using sandboxes effectively
linkTitle: Workflows
description: Best practices and common workflows for Docker Sandboxes including dependency management, testing, and multi-project setups.
@y
title: Using sandboxes effectively
linkTitle: Workflows
description: Best practices and common workflows for Docker Sandboxes including dependency management, testing, and multi-project setups.
@z

@x
{{< summary-bar feature_name="Docker Sandboxes" >}}
@y
{{< summary-bar feature_name="Docker Sandboxes" >}}
@z

@x
This guide covers practical patterns for working with sandboxed agents.
@y
This guide covers practical patterns for working with sandboxed agents.
@z

@x
## Basic workflow
@y
## Basic workflow
@z

@x
Create a sandbox for your project:
@y
Create a sandbox for your project:
@z

@x
```console
$ cd ~/my-project
$ docker sandbox run AGENT
```
@y
```console
$ cd ~/my-project
$ docker sandbox run AGENT
```
@z

@x
Replace `AGENT` with your preferred agent (`claude`, `codex`, `copilot`, etc.).
The workspace defaults to your current directory when omitted. You can also
specify an explicit path:
@y
Replace `AGENT` with your preferred agent (`claude`, `codex`, `copilot`, etc.).
The workspace defaults to your current directory when omitted. You can also
specify an explicit path:
@z

@x
```console
$ docker sandbox run AGENT ~/my-project
```
@y
```console
$ docker sandbox run AGENT ~/my-project
```
@z

@x
The `docker sandbox run` command is idempotent. Running the same command
multiple times reuses the existing sandbox instead of creating a new one:
@y
The `docker sandbox run` command is idempotent. Running the same command
multiple times reuses the existing sandbox instead of creating a new one:
@z

@x
```console
$ docker sandbox run AGENT ~/my-project  # Creates sandbox
$ docker sandbox run AGENT ~/my-project  # Reuses same sandbox
```
@y
```console
$ docker sandbox run AGENT ~/my-project  # Creates sandbox
$ docker sandbox run AGENT ~/my-project  # Reuses same sandbox
```
@z

@x
This works with workspace path (absolute or relative) or omitted workspace. The
sandbox persists. Stop and restart it without losing installed packages or
configuration:
@y
This works with workspace path (absolute or relative) or omitted workspace. The
sandbox persists. Stop and restart it without losing installed packages or
configuration:
@z

@x
```console
$ docker sandbox run <sandbox-name>  # Reconnect by name
```
@y
```console
$ docker sandbox run <sandbox-name>  # Reconnect by name
```
@z

@x
When using the `--name` flag, the behavior is also idempotent based on the
name:
@y
When using the `--name` flag, the behavior is also idempotent based on the
name:
@z

@x
```console
$ docker sandbox run --name dev AGENT  # Creates sandbox named "dev"
$ docker sandbox run --name dev AGENT  # Reuses sandbox "dev"
```
@y
```console
$ docker sandbox run --name dev AGENT  # Creates sandbox named "dev"
$ docker sandbox run --name dev AGENT  # Reuses sandbox "dev"
```
@z

@x
## Installing dependencies
@y
## Installing dependencies
@z

@x
Ask the agent to install what's needed:
@y
Ask the agent to install what's needed:
@z

@x
```plaintext
You: "Install pytest and black"
Agent: [Installs packages via pip]
@y
```plaintext
You: "Install pytest and black"
Agent: [Installs packages via pip]
@z

@x
You: "Install build-essential"
Agent: [Installs via apt]
```
@y
You: "Install build-essential"
Agent: [Installs via apt]
```
@z

@x
The agent has sudo access. Installed packages persist for the sandbox lifetime.
This works for system packages, language packages, and development tools.
@y
The agent has sudo access. Installed packages persist for the sandbox lifetime.
This works for system packages, language packages, and development tools.
@z

@x
For teams or repeated setups, use [Custom templates](templates.md) to
pre-install tools.
@y
For teams or repeated setups, use [Custom templates](templates.md) to
pre-install tools.
@z

@x
## Docker inside sandboxes
@y
## Docker inside sandboxes
@z

@x
Agents can build images, run containers, and use Docker Compose. Everything
runs inside the sandbox's private Docker daemon.
@y
Agents can build images, run containers, and use Docker Compose. Everything
runs inside the sandbox's private Docker daemon.
@z

@x
### Testing containerized apps
@y
### Testing containerized apps
@z

@x
```plaintext
You: "Build the Docker image and run the tests"
@y
```plaintext
You: "Build the Docker image and run the tests"
@z

@x
Agent: *runs*
  docker build -t myapp:test .
  docker run myapp:test npm test
```
@y
Agent: *runs*
  docker build -t myapp:test .
  docker run myapp:test npm test
```
@z

@x
Containers started by the agent run inside the sandbox, not on your host. They
don't appear in your host's `docker ps`.
@y
Containers started by the agent run inside the sandbox, not on your host. They
don't appear in your host's `docker ps`.
@z

@x
### Multi-container stacks
@y
### Multi-container stacks
@z

@x
```plaintext
You: "Start the application with docker-compose and run integration tests"
@y
```plaintext
You: "Start the application with docker-compose and run integration tests"
@z

@x
Agent: *runs*
  docker-compose up -d
  docker-compose exec api pytest tests/integration
  docker-compose down
```
@y
Agent: *runs*
  docker-compose up -d
  docker-compose exec api pytest tests/integration
  docker-compose down
```
@z

@x
Remove the sandbox, and all images, containers, and volumes are deleted.
@y
Remove the sandbox, and all images, containers, and volumes are deleted.
@z

@x
## What persists
@y
## What persists
@z

@x
While a sandbox exists:
@y
While a sandbox exists:
@z

@x
- Installed packages (apt, pip, npm, etc.)
- Docker images and containers inside the sandbox
- Configuration changes
- Command history
@y
- Installed packages (apt, pip, npm, etc.)
- Docker images and containers inside the sandbox
- Configuration changes
- Command history
@z

@x
When you remove a sandbox:
@y
When you remove a sandbox:
@z

@x
- Everything inside is deleted
- Your workspace files remain on your host (synced back)
@y
- Everything inside is deleted
- Your workspace files remain on your host (synced back)
@z

@x
To preserve a configured environment, create a [Custom template](templates.md).
@y
To preserve a configured environment, create a [Custom template](templates.md).
@z

@x
## Security considerations
@y
## Security considerations
@z

@x
Agents running in sandboxes automatically trust the workspace directory without
prompting. This enables agents to work freely within the isolated environment.
@y
Agents running in sandboxes automatically trust the workspace directory without
prompting. This enables agents to work freely within the isolated environment.
@z

@x
Agents can create and modify any files in your mounted workspace, including
scripts, configuration files, and hidden files.
@y
Agents can create and modify any files in your mounted workspace, including
scripts, configuration files, and hidden files.
@z

@x
After an agent works in a workspace, review changes before performing actions
on your host that might execute code:
@y
After an agent works in a workspace, review changes before performing actions
on your host that might execute code:
@z

@x
- Committing changes (executes Git hooks)
- Opening the workspace in an IDE (may auto-run scripts or extensions)
- Running scripts or executables the agent created or modified
@y
- Committing changes (executes Git hooks)
- Opening the workspace in an IDE (may auto-run scripts or extensions)
- Running scripts or executables the agent created or modified
@z

@x
Review what changed:
@y
Review what changed:
@z

@x
```console
$ git status                        # See modified and new files
$ git diff                          # Review changes to tracked files
```
@y
```console
$ git status                        # See modified and new files
$ git diff                          # Review changes to tracked files
```
@z

@x
Check for untracked files and be aware that some changes, like Git hooks in
`.git/hooks/`, won't appear in standard diffs.
@y
Check for untracked files and be aware that some changes, like Git hooks in
`.git/hooks/`, won't appear in standard diffs.
@z

@x
This is the same trust model used by editors like Visual Studio Code, which
warn when opening new workspaces for similar reasons.
@y
This is the same trust model used by editors like Visual Studio Code, which
warn when opening new workspaces for similar reasons.
@z

@x
## Managing multiple projects
@y
## Managing multiple projects
@z

@x
Create sandboxes for different projects:
@y
Create sandboxes for different projects:
@z

@x
```console
$ docker sandbox create claude ~/project-a
$ docker sandbox create codex ~/project-b
$ docker sandbox create copilot ~/work/client-project
```
@y
```console
$ docker sandbox create claude ~/project-a
$ docker sandbox create codex ~/project-b
$ docker sandbox create copilot ~/work/client-project
```
@z

@x
Each sandbox is completely isolated. Switch between them by running the
appropriate sandbox name.
@y
Each sandbox is completely isolated. Switch between them by running the
appropriate sandbox name.
@z

@x
Remove unused sandboxes to reclaim disk space:
@y
Remove unused sandboxes to reclaim disk space:
@z

@x
```console
$ docker sandbox rm <sandbox-name>
```
@y
```console
$ docker sandbox rm <sandbox-name>
```
@z

@x
## Named sandboxes
@y
## Named sandboxes
@z

@x
Docker automatically generates sandbox names based on the agent and workspace
directory (for example, `claude-my-project`). You can also specify custom names
using the `--name` flag:
@y
Docker automatically generates sandbox names based on the agent and workspace
directory (for example, `claude-my-project`). You can also specify custom names
using the `--name` flag:
@z

@x
```console
$ docker sandbox run --name myproject AGENT ~/project
```
@y
```console
$ docker sandbox run --name myproject AGENT ~/project
```
@z

@x
Create multiple sandboxes for the same workspace:
@y
Create multiple sandboxes for the same workspace:
@z

@x
```console
$ docker sandbox create --name dev claude ~/project
$ docker sandbox create --name staging codex ~/project
$ docker sandbox run dev
```
@y
```console
$ docker sandbox create --name dev claude ~/project
$ docker sandbox create --name staging codex ~/project
$ docker sandbox run dev
```
@z

@x
Each maintains separate packages, Docker images, and state, but share the
workspace files.
@y
Each maintains separate packages, Docker images, and state, but share the
workspace files.
@z

@x
## Multiple workspaces
@y
## Multiple workspaces
@z

@x
Mount multiple directories into a single sandbox for working with related
projects or when the agent needs access to documentation and shared libraries.
@y
Mount multiple directories into a single sandbox for working with related
projects or when the agent needs access to documentation and shared libraries.
@z

@x
```console
$ docker sandbox run AGENT ~/my-project ~/shared-docs
```
@y
```console
$ docker sandbox run AGENT ~/my-project ~/shared-docs
```
@z

@x
The primary workspace (first argument) is always mounted read-write. Additional
workspaces are mounted read-write by default.
@y
The primary workspace (first argument) is always mounted read-write. Additional
workspaces are mounted read-write by default.
@z

@x
### Read-only mounts
@y
### Read-only mounts
@z

@x
Mount additional workspaces as read-only by appending `:ro` or `:readonly`:
@y
Mount additional workspaces as read-only by appending `:ro` or `:readonly`:
@z

@x
```console
$ docker sandbox run AGENT . /path/to/docs:ro /path/to/lib:readonly
```
@y
```console
$ docker sandbox run AGENT . /path/to/docs:ro /path/to/lib:readonly
```
@z

@x
The primary workspace remains fully writable while read-only workspaces are
protected from changes.
@y
The primary workspace remains fully writable while read-only workspaces are
protected from changes.
@z

@x
### Path resolution
@y
### Path resolution
@z

@x
Workspaces are mounted at their absolute paths inside the sandbox. Relative
paths are resolved to absolute paths before mounting.
@y
Workspaces are mounted at their absolute paths inside the sandbox. Relative
paths are resolved to absolute paths before mounting.
@z

@x
Example:
@y
Example:
@z

@x
```console
$ cd /Users/bob/projects
$ docker sandbox run AGENT ./app ~/docs:ro
```
@y
```console
$ cd /Users/bob/projects
$ docker sandbox run AGENT ./app ~/docs:ro
```
@z

@x
Inside the sandbox:
@y
Inside the sandbox:
@z

@x
- `/Users/bob/projects/app` - Primary workspace (read-write)
- `/Users/bob/docs` - Additional workspace (read-only)
@y
- `/Users/bob/projects/app` - Primary workspace (read-write)
- `/Users/bob/docs` - Additional workspace (read-only)
@z

@x
Changes to `/Users/bob/projects/app` sync back to your host, while
`/Users/bob/docs` remains read-only.
@y
Changes to `/Users/bob/projects/app` sync back to your host, while
`/Users/bob/docs` remains read-only.
@z

@x
### Sharing workspaces across sandboxes
@y
### Sharing workspaces across sandboxes
@z

@x
A single path can be included in multiple sandboxes simultaneously:
@y
A single path can be included in multiple sandboxes simultaneously:
@z

@x
```console
$ docker sandbox create --name sb1 claude ./project-a
$ docker sandbox create --name sb2 claude ./project-a ./project-b
$ docker sandbox create --name sb3 cagent ./project-a
$ docker sandbox ls
SANDBOX   AGENT    STATUS    WORKSPACE
sb1       claude   running   /Users/bob/src/project-a
sb2       claude   running   /Users/bob/src/project-a, /Users/bob/src/project-b
sb3       cagent   running   /Users/bob/src/project-a
```
@y
```console
$ docker sandbox create --name sb1 claude ./project-a
$ docker sandbox create --name sb2 claude ./project-a ./project-b
$ docker sandbox create --name sb3 cagent ./project-a
$ docker sandbox ls
SANDBOX   AGENT    STATUS    WORKSPACE
sb1       claude   running   /Users/bob/src/project-a
sb2       claude   running   /Users/bob/src/project-a, /Users/bob/src/project-b
sb3       cagent   running   /Users/bob/src/project-a
```
@z

@x
Each sandbox runs in isolation with separate configurations while sharing the
same workspace files.
@y
Each sandbox runs in isolation with separate configurations while sharing the
same workspace files.
@z

@x
## Resetting state
@y
## Resetting state
@z

@x
If you encounter issues with sandbox state, use the reset command to clean up
all VMs and registries:
@y
If you encounter issues with sandbox state, use the reset command to clean up
all VMs and registries:
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
This command:
@y
This command:
@z

@x
- Stops all running sandbox VMs
- Deletes all VM state and registries
- Continues running the sandbox daemon (does not shut it down)
- Warns about directories it cannot remove
@y
- Stops all running sandbox VMs
- Deletes all VM state and registries
- Continues running the sandbox daemon (does not shut it down)
- Warns about directories it cannot remove
@z

@x
After reset, you can create fresh sandboxes. Use this when troubleshooting
persistent issues or reclaiming disk space from all sandboxes at once.
@y
After reset, you can create fresh sandboxes. Use this when troubleshooting
persistent issues or reclaiming disk space from all sandboxes at once.
@z

@x
## Debugging
@y
## Debugging
@z

@x
Access the sandbox directly with an interactive shell:
@y
Access the sandbox directly with an interactive shell:
@z

@x
```console
$ docker sandbox exec -it <sandbox-name> bash
```
@y
```console
$ docker sandbox exec -it <sandbox-name> bash
```
@z

@x
Inside the shell, you can inspect the environment, manually install packages,
or check Docker containers:
@y
Inside the shell, you can inspect the environment, manually install packages,
or check Docker containers:
@z

@x
```console
agent@sandbox:~$ docker ps
agent@sandbox:~$ docker images
```
@y
```console
agent@sandbox:~$ docker ps
agent@sandbox:~$ docker images
```
@z

@x
List all sandboxes:
@y
List all sandboxes:
@z

@x
```console
$ docker sandbox ls
```
@y
```console
$ docker sandbox ls
```
@z
