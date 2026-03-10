%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

% snip 対応

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

% snip command...

@x
Replace `AGENT` with your preferred agent (`claude`, `codex`, `copilot`, etc.).
The workspace defaults to your current directory when omitted. You can also
specify an explicit path:
@y
Replace `AGENT` with your preferred agent (`claude`, `codex`, `copilot`, etc.).
The workspace defaults to your current directory when omitted. You can also
specify an explicit path:
@z

% snip command...

@x
The `docker sandbox run` command is idempotent. Running the same command
multiple times reuses the existing sandbox instead of creating a new one:
@y
The `docker sandbox run` command is idempotent. Running the same command
multiple times reuses the existing sandbox instead of creating a new one:
@z

% snip command...

@x
This works with workspace path (absolute or relative) or omitted workspace. The
sandbox persists. Stop and restart it without losing installed packages or
configuration:
@y
This works with workspace path (absolute or relative) or omitted workspace. The
sandbox persists. Stop and restart it without losing installed packages or
configuration:
@z

% snip command...

@x
When using the `--name` flag, the behavior is also idempotent based on the
name:
@y
When using the `--name` flag, the behavior is also idempotent based on the
name:
@z

% snip command...

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

% snip text...

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

% snip text...

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

% snip text...

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

@x within code
$ git status                        # See modified and new files
$ git diff                          # Review changes to tracked files
@y
$ git status                        # See modified and new files
$ git diff                          # Review changes to tracked files
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

% snip command...

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

% snip command...

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

% snip command...

@x
Create multiple sandboxes for the same workspace:
@y
Create multiple sandboxes for the same workspace:
@z

% snip command...

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

% snip command...

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

% snip command...

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

% snip command...

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

% snip command...

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

% snip command...

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

% snip command...

@x
Inside the shell, you can inspect the environment, manually install packages,
or check Docker containers:
@y
Inside the shell, you can inspect the environment, manually install packages,
or check Docker containers:
@z

% snip command...

@x
List all sandboxes:
@y
List all sandboxes:
@z

% snip command...
