%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

% __SUBDIR__ 対応

@x
title: Usage
@y
title: Usage
@z

@x
description: Basic sbx commands for creating, managing, and connecting to Docker Sandboxes.
keywords: docker sandboxes, sbx, usage, run, create, stop, remove, ports, workspaces
@y
description: Basic sbx commands for creating, managing, and connecting to Docker Sandboxes.
keywords: docker sandboxes, sbx, usage, run, create, stop, remove, ports, workspaces
@z

@x
Use this page as a command-oriented guide to day-to-day `sbx` operations. For
scenario-based recommendations, see [Workflow patterns](workflows/).
@y
Use this page as a command-oriented guide to day-to-day `sbx` operations. For
scenario-based recommendations, see [Workflow patterns](workflows/).
@z

@x
## Sign in
@y
## Sign in
@z

@x
Sign in from a terminal:
@y
Sign in from a terminal:
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
For scripts or CI runners where a browser isn't available, see
[CI and headless use](workflows/automation.md).
@y
For scripts or CI runners where a browser isn't available, see
[CI and headless use](workflows/automation.md).
@z

@x
## Start, stop, and remove
@y
## Start, stop, and remove
@z

@x
The basic workflow is [`run`](/reference/cli/sbx/run/) to start,
[`ls`](/reference/cli/sbx/ls/) to check status,
[`stop`](/reference/cli/sbx/stop/) to pause, and
[`rm`](/reference/cli/sbx/rm/) to clean up:
@y
The basic workflow is [`run`](__SUBDIR__/reference/cli/sbx/run/) to start,
[`ls`](__SUBDIR__/reference/cli/sbx/ls/) to check status,
[`stop`](__SUBDIR__/reference/cli/sbx/stop/) to pause, and
[`rm`](__SUBDIR__/reference/cli/sbx/rm/) to clean up:
@z

@x
```console
$ sbx run claude                    # start an agent in the current directory
$ sbx ls                            # see what's running
$ sbx stop my-sandbox               # pause it
$ sbx rm my-sandbox                 # delete it entirely
```
@y
```console
$ sbx run claude                    # start an agent in the current directory
$ sbx ls                            # see what's running
$ sbx stop my-sandbox               # pause it
$ sbx rm my-sandbox                 # delete it entirely
```
@z

@x
`sbx rm` asks for confirmation before deleting a sandbox. Use `--force` to
skip the prompt. This flag also permits removal when the sandbox has an active
session — an open attach, SSH connection, or in-flight SFTP transfer:
@y
`sbx rm` asks for confirmation before deleting a sandbox. Use `--force` to
skip the prompt. This flag also permits removal when the sandbox has an active
session — an open attach, SSH connection, or in-flight SFTP transfer:
@z

@x
```console
$ sbx rm --force my-sandbox
```
@y
```console
$ sbx rm --force my-sandbox
```
@z

@x
If you need a clean slate, remove the sandbox and run it again:
@y
If you need a clean slate, remove the sandbox and run it again:
@z

@x
```console
$ sbx stop my-sandbox
$ sbx rm my-sandbox
$ sbx run claude
```
@y
```console
$ sbx stop my-sandbox
$ sbx rm my-sandbox
$ sbx run claude
```
@z

@x
To remove all stopped local sandboxes, use `sbx prune`. Running sandboxes are
never removed. Preview the sandboxes that would be removed, or filter out
sandboxes stopped within the last week:
@y
To remove all stopped local sandboxes, use `sbx prune`. Running sandboxes are
never removed. Preview the sandboxes that would be removed, or filter out
sandboxes stopped within the last week:
@z

@x
```console
$ sbx prune --dry-run
$ sbx prune --filter until=168h
```
@y
```console
$ sbx prune --dry-run
$ sbx prune --filter until=168h
```
@z

@x
The `until` filter uses the time the sandbox stopped. It accepts a duration
such as `168h`, an RFC 3339 timestamp, or a Unix timestamp. The older
`since=<duration>` filter remains supported.
@y
The `until` filter uses the time the sandbox stopped. It accepts a duration
such as `168h`, an RFC 3339 timestamp, or a Unix timestamp. The older
`since=<duration>` filter remains supported.
@z

@x
Run `sbx prune` without flags to confirm and remove all stopped sandboxes.
@y
Run `sbx prune` without flags to confirm and remove all stopped sandboxes.
@z

@x
## Choose a workspace
@y
## Choose a workspace
@z

@x
`sbx run` mounts the current directory when you don't pass a workspace path.
Pass a path to mount another directory instead:
@y
`sbx run` mounts the current directory when you don't pass a workspace path.
Pass a path to mount another directory instead:
@z

@x
```console
$ sbx run claude
$ sbx run claude ~/my-project
```
@y
```console
$ sbx run claude
$ sbx run claude ~/my-project
```
@z

@x
The first workspace path is the primary workspace. The agent starts there, and
`sbx exec` uses it as the default working directory. The host directory is
mounted at the same absolute path inside the sandbox. When you don't pass a
path to `sbx run`, the current directory is the primary workspace.
@y
The first workspace path is the primary workspace. The agent starts there, and
`sbx exec` uses it as the default working directory. The host directory is
mounted at the same absolute path inside the sandbox. When you don't pass a
path to `sbx run`, the current directory is the primary workspace.
@z

@x
Starting with `sbx` version 0.42.0, workspace paths are optional for
`sbx create`. Omit them to create a mountless sandbox without a host workspace
bind mount, then attach to the sandbox by name:
@y
Starting with `sbx` version 0.42.0, workspace paths are optional for
`sbx create`. Omit them to create a mountless sandbox without a host workspace
bind mount, then attach to the sandbox by name:
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
In a mountless sandbox, the agent starts in the template image's working
directory. Docker-provided templates use `/home/agent/workspace`. Files there
persist across stops and restarts but are deleted when you remove the sandbox.
Assign the sandbox a name so you can reconnect to it, and use
[`sbx cp`](#copy-files-between-host-and-sandbox) to transfer files between the
sandbox and the host.
@y
In a mountless sandbox, the agent starts in the template image's working
directory. Docker-provided templates use `/home/agent/workspace`. Files there
persist across stops and restarts but are deleted when you remove the sandbox.
Assign the sandbox a name so you can reconnect to it, and use
[`sbx cp`](#copy-files-between-host-and-sandbox) to transfer files between the
sandbox and the host.
@z

@x
## Reconnect and name sandboxes
@y
## Reconnect and name sandboxes
@z

@x
Sandboxes persist after the agent exits. Running the same workspace path again
reconnects to the existing sandbox rather than creating another sandbox:
@y
Sandboxes persist after the agent exits. Running the same workspace path again
reconnects to the existing sandbox rather than creating another sandbox:
@z

@x
```console
$ sbx run claude ~/my-project  # creates sandbox
$ sbx run claude ~/my-project  # reconnects to same sandbox
```
@y
```console
$ sbx run claude ~/my-project  # creates sandbox
$ sbx run claude ~/my-project  # reconnects to same sandbox
```
@z

@x
Use `--name` to give a sandbox an explicit identity:
@y
Use `--name` to give a sandbox an explicit identity:
@z

@x
```console
$ sbx run --name my-project claude
```
@y
```console
$ sbx run --name my-project claude
```
@z

@x
Once a named sandbox exists, reattach from any working directory with
`sbx run --name`. You can omit the agent name when reattaching:
@y
Once a named sandbox exists, reattach from any working directory with
`sbx run --name`. You can omit the agent name when reattaching:
@z

@x
```console
$ sbx run --name my-project        # re-attaches from anywhere
$ sbx run claude --name my-project # same, with agent confirmed
```
@y
```console
$ sbx run --name my-project        # re-attaches from anywhere
$ sbx run claude --name my-project # same, with agent confirmed
```
@z

@x
To run multiple sandboxes against the same workspace, give each a distinct
name:
@y
To run multiple sandboxes against the same workspace, give each a distinct
name:
@z

@x
```console
$ sbx run claude --name feature ~/my-project
$ sbx run claude --name spike ~/my-project
```
@y
```console
$ sbx run claude --name feature ~/my-project
$ sbx run claude --name spike ~/my-project
```
@z

@x
## Create without attaching
@y
## Create without attaching
@z

@x
[`sbx run`](/reference/cli/sbx/run/) creates the sandbox and attaches you to the
agent. To create a sandbox with the current directory mounted in the background
without attaching:
@y
[`sbx run`](__SUBDIR__/reference/cli/sbx/run/) creates the sandbox and attaches you to the
agent. To create a sandbox with the current directory mounted in the background
without attaching:
@z

@x
```console
$ sbx create --name my-project claude .
```
@y
```console
$ sbx create --name my-project claude .
```
@z

@x
Omit the path to create a mountless sandbox instead. Attach later with
`sbx run --name`:
@y
Omit the path to create a mountless sandbox instead. Attach later with
`sbx run --name`:
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
After `sbx create` finishes, the local sandbox stops automatically when no
sessions keep it running. Its files and configuration persist. Running
`sbx run --name <sandbox-name>` starts it again and attaches you to the agent.
@y
After `sbx create` finishes, the local sandbox stops automatically when no
sessions keep it running. Its files and configuration persist. Running
`sbx run --name <sandbox-name>` starts it again and attaches you to the agent.
@z

@x
## Set environment variables
@y
## Set environment variables
@z

@x
> [!NOTE]
> The `-e`/`--env` and `--env-file` flags require `sbx` version 0.39.0 or
> later.
@y
> [!NOTE]
> The `-e`/`--env` and `--env-file` flags require `sbx` version 0.39.0 or
> later.
@z

@x
Pass `-e` or `--env` to `sbx run` or `sbx create` to set an environment
variable in the sandbox:
@y
Pass `-e` or `--env` to `sbx run` or `sbx create` to set an environment
variable in the sandbox:
@z

@x
```console
$ sbx run -e LOG_LEVEL=debug claude
```
@y
```console
$ sbx run -e LOG_LEVEL=debug claude
```
@z

@x
Specify a variable name without a value to copy its value from the host
environment:
@y
Specify a variable name without a value to copy its value from the host
environment:
@z

@x
```console
$ export API_URL=https://api.example.com
$ sbx run -e API_URL claude
```
@y
```console
$ export API_URL=https://api.example.com
$ sbx run -e API_URL claude
```
@z

@x
To load multiple variables, pass one or more environment files:
@y
To load multiple variables, pass one or more environment files:
@z

@x
```console
$ sbx create --name my-project --env-file .env.sandbox claude .
```
@y
```console
$ sbx create --name my-project --env-file .env.sandbox claude .
```
@z

@x
The flags follow `docker run` precedence rules. Values passed with `-e`
override values from environment files. When you pass multiple environment
files, a value in a later file overrides the same variable in an earlier file.
@y
The flags follow `docker run` precedence rules. Values passed with `-e`
override values from environment files. When you pass multiple environment
files, a value in a later file overrides the same variable in an earlier file.
@z

@x
When either command creates a sandbox, the variables are stored with the
sandbox. They are also available to the agent session started by `sbx run`.
When `sbx run` re-attaches to an existing sandbox, the variables apply to that
agent session without changing the sandbox's stored environment. To set
variables for one command instead, use `sbx exec -e` or
`sbx exec --env-file`.
@y
When either command creates a sandbox, the variables are stored with the
sandbox. They are also available to the agent session started by `sbx run`.
When `sbx run` re-attaches to an existing sandbox, the variables apply to that
agent session without changing the sandbox's stored environment. To set
variables for one command instead, use `sbx exec -e` or
`sbx exec --env-file`.
@z

@x
To persist a variable across future sessions of an existing sandbox, append an
export to `/etc/sandbox-persistent.sh`:
@y
To persist a variable across future sessions of an existing sandbox, append an
export to `/etc/sandbox-persistent.sh`:
@z

@x
```console
$ sbx exec <sandbox-name> bash -c "echo 'export INTERNAL_API_URL=https://api.example.com' >> /etc/sandbox-persistent.sh"
```
@y
```console
$ sbx exec <sandbox-name> bash -c "echo 'export INTERNAL_API_URL=https://api.example.com' >> /etc/sandbox-persistent.sh"
```
@z

@x
The `bash -c` wrapper ensures the `>>` redirect runs inside the sandbox instead
of on your host. The file is sourced when Bash starts inside the sandbox,
including for interactive sessions and agents started with `sbx run`. A command
passed directly to `sbx exec` doesn't start a shell. Wrap that command in
`bash -c` if it needs variables from the persistent environment file.
@y
The `bash -c` wrapper ensures the `>>` redirect runs inside the sandbox instead
of on your host. The file is sourced when Bash starts inside the sandbox,
including for interactive sessions and agents started with `sbx run`. A command
passed directly to `sbx exec` doesn't start a shell. Wrap that command in
`bash -c` if it needs variables from the persistent environment file.
@z

@x
A variable added to the file only takes effect for sessions and agents started
afterward. Restart a running agent, or stop and start the sandbox, to pick up
the new value.
@y
A variable added to the file only takes effect for sessions and agents started
afterward. Restart a running agent, or stop and start the sandbox, to pick up
the new value.
@z

@x
Environment variables are readable by processes inside the sandbox. For API
keys and other credentials, use [`sbx secret set`](configuration/credentials.md#store-a-secret)
for a supported service or the experimental
[`sbx secret set-custom`](configuration/credentials.md#custom-secrets) for a
credential sent to known hosts. The host-side proxy can then inject the real
value without exposing it to the agent.
@y
Environment variables are readable by processes inside the sandbox. For API
keys and other credentials, use [`sbx secret set`](configuration/credentials.md#store-a-secret)
for a supported service or the experimental
[`sbx secret set-custom`](configuration/credentials.md#custom-secrets) for a
credential sent to known hosts. The host-side proxy can then inject the real
value without exposing it to the agent.
@z

@x
## Run commands inside a sandbox
@y
## Run commands inside a sandbox
@z

@x
To get a shell inside a running sandbox, use [`sbx exec`](/reference/cli/sbx/exec/):
@y
To get a shell inside a running sandbox, use [`sbx exec`](__SUBDIR__/reference/cli/sbx/exec/):
@z

@x
```console
$ sbx exec -it <sandbox-name> bash
```
@y
```console
$ sbx exec -it <sandbox-name> bash
```
@z

@x
Without `--workdir`, the command starts in the sandbox's primary workspace. In
a mountless sandbox, it starts in the container image's working directory.
@y
Without `--workdir`, the command starts in the sandbox's primary workspace. In
a mountless sandbox, it starts in the container image's working directory.
@z

@x
`sbx exec` runs commands in the foreground. Detached execution (`-d` or
`--detach`) isn't supported.
@y
`sbx exec` runs commands in the foreground. Detached execution (`-d` or
`--detach`) isn't supported.
@z

@x
## Interactive mode
@y
## Interactive mode
@z

@x
Running `sbx` with no subcommands opens an interactive terminal dashboard:
@y
Running `sbx` with no subcommands opens an interactive terminal dashboard:
@z

@x
```console
$ sbx
```
@y
```console
$ sbx
```
@z

@x
The dashboard shows all your sandboxes as cards with live status, CPU, and
memory usage. From here you can:
@y
The dashboard shows all your sandboxes as cards with live status, CPU, and
memory usage. From here you can:
@z

@x
- **Create** a sandbox (`c`).
- **Start or stop** a sandbox (`s`).
- **Attach** to an agent session (`Enter`), same as `sbx run`.
- **Open a shell** inside the sandbox (`x`), same as `sbx exec`.
- **Remove** a sandbox (`r`).
@y
- **Create** a sandbox (`c`).
- **Start or stop** a sandbox (`s`).
- **Attach** to an agent session (`Enter`), same as `sbx run`.
- **Open a shell** inside the sandbox (`x`), same as `sbx exec`.
- **Remove** a sandbox (`r`).
@z

@x
The dashboard also includes a network governance panel where you can monitor
outbound connections made by your sandboxes and manage network rules. Use `tab`
to switch between the sandboxes panel and the network panel.
@y
The dashboard also includes a network governance panel where you can monitor
outbound connections made by your sandboxes and manage network rules. Use `tab`
to switch between the sandboxes panel and the network panel.
@z

@x
From the network panel you can browse connection logs, allow or block specific
hosts, and add custom network rules. Press `?` to see all keyboard shortcuts.
@y
From the network panel you can browse connection logs, allow or block specific
hosts, and add custom network rules. Press `?` to see all keyboard shortcuts.
@z

@x
## Git workspace modes
@y
## Git workspace modes
@z

@x
When your primary workspace is a Git repository, choose how the sandbox receives
it when you create the sandbox:
@y
When your primary workspace is a Git repository, choose how the sandbox receives
it when you create the sandbox:
@z

@x
- Direct mode is the default for `sbx run`. It also applies when you pass a
  workspace path to `sbx create`. The agent has read-write access to your
  working tree, and changes appear on your host immediately.
- [Clone mode](#clone-mode) uses `--clone`. The agent edits a separate Git clone
  inside the sandbox. Its changes stay there until you fetch them or the agent
  pushes them. Your host repository is also available at
  `/run/sandbox/source`, but only with read access.
@y
- Direct mode is the default for `sbx run`. It also applies when you pass a
  workspace path to `sbx create`. The agent has read-write access to your
  working tree, and changes appear on your host immediately.
- [Clone mode](#clone-mode) uses `--clone`. The agent edits a separate Git clone
  inside the sandbox. Its changes stay there until you fetch them or the agent
  pushes them. Your host repository is also available at
  `/run/sandbox/source`, but only with read access.
@z

@x
For guidance on branch strategy, fetching work from a sandbox, and parallel
agent workflows, see [Git workflows](workflows/git.md). For the
security model behind each mode, see
[Workspace isolation](security/isolation.md#workspace-isolation).
@y
For guidance on branch strategy, fetching work from a sandbox, and parallel
agent workflows, see [Git workflows](workflows/git.md). For the
security model behind each mode, see
[Workspace isolation](security/isolation.md#workspace-isolation).
@z

@x
### Clone mode
@y
### Clone mode
@z

@x
To create a clone-mode sandbox, pass `--clone` when you run or create it:
@y
To create a clone-mode sandbox, pass `--clone` when you run or create it:
@z

@x
```console
$ sbx run --clone claude .
```
@y
```console
$ sbx run --clone claude .
```
@z

@x
You can also create the sandbox in the background and attach later:
@y
You can also create the sandbox in the background and attach later:
@z

@x
```console
$ sbx create --clone --name my-sandbox claude .
$ sbx run --name my-sandbox
```
@y
```console
$ sbx create --clone --name my-sandbox claude .
$ sbx run --name my-sandbox
```
@z

@x
Clone mode has a few create-time constraints:
@y
Clone mode has a few create-time constraints:
@z

@x
- Clone mode is fixed at create time. To switch an existing sandbox to clone
  mode, remove it and recreate it with `sbx create --clone`.
- The clone follows whichever ref your host repository has checked out at create
  time. No branch is created automatically.
- The primary workspace must be a Git repository. Omit `--clone` for non-Git
  workspaces.
- Clone mode is rejected from inside a Git worktree other than the main one. The
  read-only bind mount can't resolve the worktree's `.git` pointer file. Run
  `sbx create --clone <agent> .` from the main repository checkout instead.
- Removing a clone-mode sandbox drops the in-sandbox clone. Fetch or push any
  commits you want to keep before you remove it.
@y
- Clone mode is fixed at create time. To switch an existing sandbox to clone
  mode, remove it and recreate it with `sbx create --clone`.
- The clone follows whichever ref your host repository has checked out at create
  time. No branch is created automatically.
- The primary workspace must be a Git repository. Omit `--clone` for non-Git
  workspaces.
- Clone mode is rejected from inside a Git worktree other than the main one. The
  read-only bind mount can't resolve the worktree's `.git` pointer file. Run
  `sbx create --clone <agent> .` from the main repository checkout instead.
- Removing a clone-mode sandbox drops the in-sandbox clone. Fetch or push any
  commits you want to keep before you remove it.
@z

@x
## Multiple workspaces
@y
## Multiple workspaces
@z

@x
You can mount extra directories into a sandbox alongside the main workspace.
The first path is the primary workspace — the agent starts here, and the
sandbox's in-container Git clone is populated from this directory if you
use `--clone`. Extra workspaces are always mounted directly.
@y
You can mount extra directories into a sandbox alongside the main workspace.
The first path is the primary workspace — the agent starts here, and the
sandbox's in-container Git clone is populated from this directory if you
use `--clone`. Extra workspaces are always mounted directly.
@z

@x
Each workspace path appears inside the sandbox at the same absolute path as on
the host. Append `:ro` to mount an extra workspace read-only — useful for
reference material or shared libraries the agent shouldn't modify:
@y
Each workspace path appears inside the sandbox at the same absolute path as on
the host. Append `:ro` to mount an extra workspace read-only — useful for
reference material or shared libraries the agent shouldn't modify:
@z

@x
```console
$ sbx run claude ~/project-a ~/shared-libs:ro ~/docs:ro
```
@y
```console
$ sbx run claude ~/project-a ~/shared-libs:ro ~/docs:ro
```
@z

@x
You can also run separate projects side-by-side. Remove unused sandboxes when
you're done to reclaim disk space:
@y
You can also run separate projects side-by-side. Remove unused sandboxes when
you're done to reclaim disk space:
@z

@x
```console
$ sbx run claude ~/project-a
$ sbx run claude ~/project-b
$ sbx rm <sandbox-name>       # when finished
```
@y
```console
$ sbx run claude ~/project-a
$ sbx run claude ~/project-b
$ sbx rm <sandbox-name>       # when finished
```
@z

@x
## Copy files between host and sandbox
@y
## Copy files between host and sandbox
@z

@x
Use [`sbx cp`](/reference/cli/sbx/cp/) to copy files or directories between
your host and a sandbox. This is useful for one-off files that aren't part of a
mounted workspace, such as generated output, logs, or setup files. The sandbox
path must be absolute. `sbx cp` doesn't resolve relative paths such as `.`
against the sandbox's default working directory.
@y
Use [`sbx cp`](__SUBDIR__/reference/cli/sbx/cp/) to copy files or directories between
your host and a sandbox. This is useful for one-off files that aren't part of a
mounted workspace, such as generated output, logs, or setup files. The sandbox
path must be absolute. `sbx cp` doesn't resolve relative paths such as `.`
against the sandbox's default working directory.
@z

@x
For example, copy files to or from the default working directory used by a
Docker-provided agent template:
@y
For example, copy files to or from the default working directory used by a
Docker-provided agent template:
@z

@x
```console
$ sbx cp ./config.json my-sandbox:/home/agent/workspace/
$ sbx cp my-sandbox:/home/agent/workspace/output.log ./
$ sbx cp ./src/ my-sandbox:/home/agent/workspace/src
```
@y
```console
$ sbx cp ./config.json my-sandbox:/home/agent/workspace/
$ sbx cp my-sandbox:/home/agent/workspace/output.log ./
$ sbx cp ./src/ my-sandbox:/home/agent/workspace/src
```
@z

@x
One side of the copy must use `SANDBOX:PATH`. Copying directly between two
sandboxes isn't supported.
@y
One side of the copy must use `SANDBOX:PATH`. Copying directly between two
sandboxes isn't supported.
@z

@x
## Publish ports
@y
## Publish ports
@z

@x
Sandboxes are [network-isolated](security/isolation.md) — your browser or local
tools can't reach a server running inside one by default. A port mapping of
`8080:3000` publishes sandbox port 3000 on host port 8080.
@y
Sandboxes are [network-isolated](security/isolation.md) — your browser or local
tools can't reach a server running inside one by default. A port mapping of
`8080:3000` publishes sandbox port 3000 on host port 8080.
@z

@x
If you know which ports you need, publish them when you create the sandbox:
@y
If you know which ports you need, publish them when you create the sandbox:
@z

@x
```console
$ sbx run --publish 8080:3000 --name my-sandbox claude
```
@y
```console
$ sbx run --publish 8080:3000 --name my-sandbox claude
```
@z

@x
For an existing sandbox, use [`sbx ports`](/reference/cli/sbx/ports/) to
forward traffic from your host. Publishing a port on a stopped local sandbox
starts it first:
@y
For an existing sandbox, use [`sbx ports`](__SUBDIR__/reference/cli/sbx/ports/) to
forward traffic from your host. Publishing a port on a stopped local sandbox
starts it first:
@z

@x
```console
$ sbx ports my-sandbox --publish 8080:3000
$ open http://localhost:8080
```
@y
```console
$ sbx ports my-sandbox --publish 8080:3000
$ open http://localhost:8080
```
@z

@x
To let the OS pick a free host port instead of choosing one yourself, specify
only the sandbox port. Then use `sbx ports` to check which host port was
assigned:
@y
To let the OS pick a free host port instead of choosing one yourself, specify
only the sandbox port. Then use `sbx ports` to check which host port was
assigned:
@z

@x
```console
$ sbx ports my-sandbox --publish 3000
$ sbx ports my-sandbox
```
@y
```console
$ sbx ports my-sandbox --publish 3000
$ sbx ports my-sandbox
```
@z

@x
`sbx ls` shows active port mappings alongside each sandbox. `sbx ports` lists
them in detail.
@y
`sbx ls` shows active port mappings alongside each sandbox. `sbx ports` lists
them in detail.
@z

@x
```console
$ sbx ls
SANDBOX         AGENT   STATUS   PORTS                    WORKSPACE
my-sandbox      claude  running  127.0.0.1:8080->3000/tcp4 /home/user/proj
```
@y
```console
$ sbx ls
SANDBOX         AGENT   STATUS   PORTS                    WORKSPACE
my-sandbox      claude  running  127.0.0.1:8080->3000/tcp4 /home/user/proj
```
@z

@x
To stop forwarding a port:
@y
To stop forwarding a port:
@z

@x
```console
$ sbx ports my-sandbox --unpublish 8080:3000
```
@y
```console
$ sbx ports my-sandbox --unpublish 8080:3000
```
@z

@x
When `sbx run` re-attaches to an existing sandbox, it ignores `--publish`. Use
`sbx ports` to publish ports on that sandbox. For dev server and host-service
recipes, see
[Local services](workflows/development.md#local-services).
@y
When `sbx run` re-attaches to an existing sandbox, it ignores `--publish`. Use
`sbx ports` to publish ports on that sandbox. For dev server and host-service
recipes, see
[Local services](workflows/development.md#local-services).
@z

@x
## What persists
@y
## What persists
@z

@x
While a sandbox exists, installed packages, Docker images, configuration
changes, command history, and mountless workspace files all persist across
stops and restarts. When you remove a sandbox, everything inside is deleted.
Host workspace files, including repositories used as clone sources, and the
[shared agent skills store](workflows/agent-skills.md) remain on your host. To
preserve a configured environment, create a [custom
template](customize/templates.md) or use a [kit](customize/kits.md).
@y
While a sandbox exists, installed packages, Docker images, configuration
changes, command history, and mountless workspace files all persist across
stops and restarts. When you remove a sandbox, everything inside is deleted.
Host workspace files, including repositories used as clone sources, and the
[shared agent skills store](workflows/agent-skills.md) remain on your host. To
preserve a configured environment, create a [custom
template](customize/templates.md) or use a [kit](customize/kits.md).
@z
