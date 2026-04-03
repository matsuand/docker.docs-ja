%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

% __SUBDIR__ 対応

@x
title: Usage
@y
title: Usage
@z

@x
description: Common patterns for working with sandboxes.
@y
description: Common patterns for working with sandboxes.
@z

@x
{{< summary-bar feature_name="Docker Sandboxes sbx" >}}
@y
{{< summary-bar feature_name="Docker Sandboxes sbx" >}}
@z

@x
## Working with sandboxes
@y
## Working with sandboxes
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
$ sbx run claude                    # start an agent
$ sbx ls                            # see what's running
$ sbx stop my-sandbox               # pause it
$ sbx rm my-sandbox                 # delete it entirely
```
@y
```console
$ sbx run claude                    # start an agent
$ sbx ls                            # see what's running
$ sbx stop my-sandbox               # pause it
$ sbx rm my-sandbox                 # delete it entirely
```
@z

@x
To get a shell inside a running sandbox — useful for inspecting the environment,
checking Docker containers, or manually installing something:
@y
To get a shell inside a running sandbox — useful for inspecting the environment,
checking Docker containers, or manually installing something:
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
If you need a clean slate, remove the sandbox and re-run:
@y
If you need a clean slate, remove the sandbox and re-run:
@z

@x
```console
$ sbx rm my-sandbox
$ sbx run claude
```
@y
```console
$ sbx rm my-sandbox
$ sbx run claude
```
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
## Git workflow
@y
## Git workflow
@z

@x
When your workspace is a Git repository, the agent edits your working tree
directly by default. Changes appear in your working tree immediately, the same
as working in a normal terminal.
@y
When your workspace is a Git repository, the agent edits your working tree
directly by default. Changes appear in your working tree immediately, the same
as working in a normal terminal.
@z

@x
If you run multiple agents on the same repository at once, use [branch
mode](#branch-mode) to give each agent its own branch and working directory.
@y
If you run multiple agents on the same repository at once, use [branch
mode](#branch-mode) to give each agent its own branch and working directory.
@z

@x
### Direct mode (default)
@y
### Direct mode (default)
@z

@x
The agent edits your working tree directly. Stage, commit, and push as you
normally would. If you run multiple agents on the same repository at the same
time, they may step on each other's changes. See
[branch mode](#branch-mode) for an alternative.
@y
The agent edits your working tree directly. Stage, commit, and push as you
normally would. If you run multiple agents on the same repository at the same
time, they may step on each other's changes. See
[branch mode](#branch-mode) for an alternative.
@z

@x
### Branch mode
@y
### Branch mode
@z

@x
Pass `--branch <name>` to give the agent its own
[Git worktree](https://git-scm.com/docs/git-worktree) and branch. This
prevents conflicts when multiple agents, or you and an agent, write to the
same files at the same time. You can set `--branch` on `create`, `run`, or
both.
@y
Pass `--branch <name>` to give the agent its own
[Git worktree](https://git-scm.com/docs/git-worktree) and branch. This
prevents conflicts when multiple agents, or you and an agent, write to the
same files at the same time. You can set `--branch` on `create`, `run`, or
both.
@z

@x
The CLI creates worktrees under `.sbx/` in your repository root. The
worktree is a separate working directory, so the agent doesn't touch your main
working tree. This means:
@y
The CLI creates worktrees under `.sbx/` in your repository root. The
worktree is a separate working directory, so the agent doesn't touch your main
working tree. This means:
@z

@x
- The worktree branches off your latest commit when you create it.
  Uncommitted changes in your working tree are not included (`sbx` warns you
  if it detects any).
- Files you add or change in your main working tree won't be visible to the
  agent, and vice versa. The two directories are independent.
@y
- The worktree branches off your latest commit when you create it.
  Uncommitted changes in your working tree are not included (`sbx` warns you
  if it detects any).
- Files you add or change in your main working tree won't be visible to the
  agent, and vice versa. The two directories are independent.
@z

@x
#### Starting a branch
@y
#### Starting a branch
@z

@x
```console
$ sbx run claude --branch my-feature   # agent works on the my-feature branch
```
@y
```console
$ sbx run claude --branch my-feature   # agent works on the my-feature branch
```
@z

@x
Use `--branch auto` to let the CLI generate a branch name for you:
@y
Use `--branch auto` to let the CLI generate a branch name for you:
@z

@x
```console
$ sbx run claude --branch auto
```
@y
```console
$ sbx run claude --branch auto
```
@z

@x
You can also create the sandbox first and add a branch at run time:
@y
You can also create the sandbox first and add a branch at run time:
@z

@x
```console
$ sbx create --name my-sandbox claude .
$ sbx run --branch my-feature my-sandbox
```
@y
```console
$ sbx create --name my-sandbox claude .
$ sbx run --branch my-feature my-sandbox
```
@z

@x
Or set the branch at create time and reuse it on subsequent runs:
@y
Or set the branch at create time and reuse it on subsequent runs:
@z

@x
```console
$ sbx create --name my-sandbox --branch my-feature claude .
$ sbx run my-sandbox                       # resumes in the my-feature worktree
$ sbx run --branch my-feature my-sandbox   # same — reuses the existing worktree
```
@y
```console
$ sbx create --name my-sandbox --branch my-feature claude .
$ sbx run my-sandbox                       # resumes in the my-feature worktree
$ sbx run --branch my-feature my-sandbox   # same — reuses the existing worktree
```
@z

@x
#### Multiple branches per sandbox
@y
#### Multiple branches per sandbox
@z

@x
You can run multiple worktrees in the same sandbox by passing different branch
names:
@y
You can run multiple worktrees in the same sandbox by passing different branch
names:
@z

@x
```console
$ sbx run --branch feature-a my-sandbox
$ sbx run --branch feature-b my-sandbox
```
@y
```console
$ sbx run --branch feature-a my-sandbox
$ sbx run --branch feature-b my-sandbox
```
@z

@x
#### Reviewing and pushing changes
@y
#### Reviewing and pushing changes
@z

@x
To review the agent's work, find the worktree with `git worktree list`, then
push or open a PR from there:
@y
To review the agent's work, find the worktree with `git worktree list`, then
push or open a PR from there:
@z

@x
```console
$ git worktree list                          # find the worktree path
$ cd .sbx/<sandbox-name>-worktrees/my-feature
$ git log                                    # see what the agent did
$ git push -u origin my-feature
$ gh pr create
```
@y
```console
$ git worktree list                          # find the worktree path
$ cd .sbx/<sandbox-name>-worktrees/my-feature
$ git log                                    # see what the agent did
$ git push -u origin my-feature
$ gh pr create
```
@z

@x
Some agents don't commit automatically and leave changes uncommitted in the
worktree. If that happens, commit from the worktree directory before pushing.
@y
Some agents don't commit automatically and leave changes uncommitted in the
worktree. If that happens, commit from the worktree directory before pushing.
@z

@x
See [Workspace trust](security/workspace.md) for security considerations when
reviewing agent changes.
@y
See [Workspace trust](security/workspace.md) for security considerations when
reviewing agent changes.
@z

@x
#### Cleanup
@y
#### Cleanup
@z

@x
`sbx rm` removes the sandbox and all of its worktrees and branches.
@y
`sbx rm` removes the sandbox and all of its worktrees and branches.
@z

@x
#### Ignoring the `.sbx/` directory
@y
#### Ignoring the `.sbx/` directory
@z

@x
Branch mode stores worktrees under `.sbx/` in your repository root. To keep
this directory out of `git status`, add it to your project's `.gitignore`:
@y
Branch mode stores worktrees under `.sbx/` in your repository root. To keep
this directory out of `git status`, add it to your project's `.gitignore`:
@z

@x
```console
$ echo '.sbx/' >> .gitignore
```
@y
```console
$ echo '.sbx/' >> .gitignore
```
@z

@x
Or, to ignore it across all repositories, add `.sbx/` to your global gitignore:
@y
Or, to ignore it across all repositories, add `.sbx/` to your global gitignore:
@z

@x
```console
$ echo '.sbx/' >> "$(git config --global core.excludesFile)"
```
@y
```console
$ echo '.sbx/' >> "$(git config --global core.excludesFile)"
```
@z

@x
> [!TIP]
> If `git config --global core.excludesFile` is empty, set one first:
> `git config --global core.excludesFile ~/.gitignore`.
@y
> [!TIP]
> If `git config --global core.excludesFile` is empty, set one first:
> `git config --global core.excludesFile ~/.gitignore`.
@z

@x
You can also create Git worktrees yourself and run an agent directly in one,
but the sandbox won't have access to the `.git` directory in the parent
repository. This means the agent can't commit, push, or use Git. `--branch`
solves this by setting up the worktree so that Git works inside the sandbox.
@y
You can also create Git worktrees yourself and run an agent directly in one,
but the sandbox won't have access to the `.git` directory in the parent
repository. This means the agent can't commit, push, or use Git. `--branch`
solves this by setting up the worktree so that Git works inside the sandbox.
@z

@x
## Reconnecting and naming
@y
## Reconnecting and naming
@z

@x
Sandboxes persist after the agent exits. Running the same workspace path again
reconnects to the existing sandbox rather than creating a new one:
@y
Sandboxes persist after the agent exits. Running the same workspace path again
reconnects to the existing sandbox rather than creating a new one:
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
Use `--name` to make this explicit and avoid ambiguity:
@y
Use `--name` to make this explicit and avoid ambiguity:
@z

@x
```console
$ sbx run claude --name my-project
```
@y
```console
$ sbx run claude --name my-project
```
@z

@x
## Creating without attaching
@y
## Creating without attaching
@z

@x
[`sbx run`](/reference/cli/sbx/run/) creates the sandbox and attaches you to
the agent. To create a sandbox in the background without attaching:
@y
[`sbx run`](__SUBDIR__/reference/cli/sbx/run/) creates the sandbox and attaches you to
the agent. To create a sandbox in the background without attaching:
@z

@x
```console
$ sbx create claude .
```
@y
```console
$ sbx create claude .
```
@z

@x
Unlike `run`, `create` requires an explicit workspace path. It uses direct
mode by default, or pass `--branch` for [branch mode](#branch-mode). Attach
later with `sbx run`:
@y
Unlike `run`, `create` requires an explicit workspace path. It uses direct
mode by default, or pass `--branch` for [branch mode](#branch-mode). Attach
later with `sbx run`:
@z

@x
```console
$ sbx run claude-my-project
```
@y
```console
$ sbx run claude-my-project
```
@z

@x
## Multiple workspaces
@y
## Multiple workspaces
@z

@x
You can mount extra directories into a sandbox alongside the main workspace.
The first path is the primary workspace — the agent starts here, and the
sandbox's Git worktree is created from this directory if you use `--branch`.
Extra workspaces are always mounted directly.
@y
You can mount extra directories into a sandbox alongside the main workspace.
The first path is the primary workspace — the agent starts here, and the
sandbox's Git worktree is created from this directory if you use `--branch`.
Extra workspaces are always mounted directly.
@z

@x
All workspaces appear inside the sandbox at their absolute host paths. Append
`:ro` to mount an extra workspace read-only — useful for reference material or
shared libraries the agent shouldn't modify:
@y
All workspaces appear inside the sandbox at their absolute host paths. Append
`:ro` to mount an extra workspace read-only — useful for reference material or
shared libraries the agent shouldn't modify:
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
Each sandbox is completely isolated, so you can also run separate projects
side-by-side. Remove unused sandboxes when you're done to reclaim disk space:
@y
Each sandbox is completely isolated, so you can also run separate projects
side-by-side. Remove unused sandboxes when you're done to reclaim disk space:
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
## Installing dependencies and using Docker
@y
## Installing dependencies and using Docker
@z

@x
Ask the agent to install what's needed — it has sudo access, and installed
packages persist for the sandbox's lifetime. For teams or repeated setups,
[custom templates](agents/custom-environments.md) let you pre-install tools
into a reusable image.
@y
Ask the agent to install what's needed — it has sudo access, and installed
packages persist for the sandbox's lifetime. For teams or repeated setups,
[custom templates](agents/custom-environments.md) let you pre-install tools
into a reusable image.
@z

@x
Agents can also build Docker images, run containers, and use
[Compose](https://docs.docker.com/compose/). Everything runs inside the sandbox's private Docker
daemon, so containers started by the agent never appear in your host's
`docker ps`. When you remove the sandbox, all images, containers, and volumes
inside it are deleted with it.
@y
Agents can also build Docker images, run containers, and use
[Compose](https://docs.docker.com/compose/). Everything runs inside the sandbox's private Docker
daemon, so containers started by the agent never appear in your host's
`docker ps`. When you remove the sandbox, all images, containers, and volumes
inside it are deleted with it.
@z

@x
## Accessing services in the sandbox
@y
## Accessing services in the sandbox
@z

@x
Sandboxes are [network-isolated](security/isolation.md) — your browser or local
tools can't reach a server running inside one by default. Use
[`sbx ports`](/reference/cli/sbx/ports/) to forward traffic from your host into
a running sandbox.
@y
Sandboxes are [network-isolated](security/isolation.md) — your browser or local
tools can't reach a server running inside one by default. Use
[`sbx ports`](__SUBDIR__/reference/cli/sbx/ports/) to forward traffic from your host into
a running sandbox.
@z

@x
The common case: an agent has started a dev server or API, and you want to open
it in your browser or run tests against it.
@y
The common case: an agent has started a dev server or API, and you want to open
it in your browser or run tests against it.
@z

@x
```console
$ sbx ports my-sandbox --publish 8080:3000   # host 8080 → sandbox port 3000
$ open http://localhost:8080
```
@y
```console
$ sbx ports my-sandbox --publish 8080:3000   # host 8080 → sandbox port 3000
$ open http://localhost:8080
```
@z

@x
To let the OS pick a free host port instead of choosing one yourself:
@y
To let the OS pick a free host port instead of choosing one yourself:
@z

@x
```console
$ sbx ports my-sandbox --publish 3000        # ephemeral host port
$ sbx ports my-sandbox                       # check which port was assigned
```
@y
```console
$ sbx ports my-sandbox --publish 3000        # ephemeral host port
$ sbx ports my-sandbox                       # check which port was assigned
```
@z

@x
`sbx ls` shows active port mappings alongside each sandbox, and `sbx ports`
lists them in detail:
@y
`sbx ls` shows active port mappings alongside each sandbox, and `sbx ports`
lists them in detail:
@z

@x
```console
$ sbx ls
SANDBOX         AGENT   STATUS   PORTS                    WORKSPACE
my-sandbox      claude  running  127.0.0.1:8080->3000/tcp /home/user/proj
```
@y
```console
$ sbx ls
SANDBOX         AGENT   STATUS   PORTS                    WORKSPACE
my-sandbox      claude  running  127.0.0.1:8080->3000/tcp /home/user/proj
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
A few things to keep in mind:
@y
A few things to keep in mind:
@z

@x
- **Services must bind to `0.0.0.0`** — a service listening on `127.0.0.1`
  inside the sandbox won't be reachable through a published port. Most dev
  servers default to `127.0.0.1`, so you'll usually need to pass a flag like
  `--host 0.0.0.0` when starting them.
- **Not persistent** — published ports are lost when the sandbox stops or the
  daemon restarts. Re-publish after restarting.
- **No create-time flag** — unlike `docker run -p`, there's no `--publish`
  option on `sbx run` or `sbx create`. Ports can only be published after the
  sandbox is running.
- **Unpublish requires the host port** — `--unpublish 3000` is rejected; you
  must use `--unpublish 8080:3000`. Run `sbx ports my-sandbox` first if you
  used an ephemeral port and need to find the assigned host port.
@y
- **Services must bind to `0.0.0.0`** — a service listening on `127.0.0.1`
  inside the sandbox won't be reachable through a published port. Most dev
  servers default to `127.0.0.1`, so you'll usually need to pass a flag like
  `--host 0.0.0.0` when starting them.
- **Not persistent** — published ports are lost when the sandbox stops or the
  daemon restarts. Re-publish after restarting.
- **No create-time flag** — unlike `docker run -p`, there's no `--publish`
  option on `sbx run` or `sbx create`. Ports can only be published after the
  sandbox is running.
- **Unpublish requires the host port** — `--unpublish 3000` is rejected; you
  must use `--unpublish 8080:3000`. Run `sbx ports my-sandbox` first if you
  used an ephemeral port and need to find the assigned host port.
@z

@x
## What persists
@y
## What persists
@z

@x
While a sandbox exists, installed packages, Docker images, configuration
changes, and command history all persist across stops and restarts. When you
remove a sandbox, everything inside is deleted — only your workspace files
remain on your host. To preserve a configured environment, create a
[custom template](agents/custom-environments.md).
@y
While a sandbox exists, installed packages, Docker images, configuration
changes, and command history all persist across stops and restarts. When you
remove a sandbox, everything inside is deleted — only your workspace files
remain on your host. To preserve a configured environment, create a
[custom template](agents/custom-environments.md).
@z
