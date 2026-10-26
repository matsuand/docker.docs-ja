%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
title: Use Git with sandboxes
linkTitle: Git workflows
@y
title: Use Git with sandboxes
linkTitle: Git workflows
@z

@x
description: Choose where your Git checkout lives and manage branches, parallel tasks, and signed commits with Docker Sandboxes.
keywords: docker sandboxes, sbx, git, clone mode, direct mode, worktrees, branches, commit signing
@y
description: Choose where your Git checkout lives and manage branches, parallel tasks, and signed commits with Docker Sandboxes.
keywords: docker sandboxes, sbx, git, clone mode, direct mode, worktrees, branches, commit signing
@z

@x
These workspace modes apply to local sandboxes. In cloud sandboxes,
[transfer files or clone a remote repository](../cloud/usage.md#transfer-files).
To copy a sandbox filesystem between environments, see
[Move a sandbox](../cloud/move.md). Host mounts and clone-mode volumes are not
included in that snapshot.
@y
These workspace modes apply to local sandboxes. In cloud sandboxes,
[transfer files or clone a remote repository](../cloud/usage.md#transfer-files).
To copy a sandbox filesystem between environments, see
[Move a sandbox](../cloud/move.md). Host mounts and clone-mode volumes are not
included in that snapshot.
@z

@x
Choose where your checkout lives based on how you want to review and run the
agent's changes:
@y
Choose where your checkout lives based on how you want to review and run the
agent's changes:
@z

@x
- Share a host checkout with [direct mode](#direct-mode) to see edits in your
  local editor as they happen. A [host worktree](#host-worktree) gives a task
  its own branch and directory while keeping edits visible on the host.
- Use [clone mode](#clone-mode) to give the agent a separate checkout based on
  your local repository. Fetch or push committed work to bring it back.
- Use a [mountless sandbox](#mountless-sandbox) to clone repositories inside
  the sandbox without attaching a host workspace. Push branches to a Git
  remote to share the results.
@y
- Share a host checkout with [direct mode](#direct-mode) to see edits in your
  local editor as they happen. A [host worktree](#host-worktree) gives a task
  its own branch and directory while keeping edits visible on the host.
- Use [clone mode](#clone-mode) to give the agent a separate checkout based on
  your local repository. Fetch or push committed work to bring it back.
- Use a [mountless sandbox](#mountless-sandbox) to clone repositories inside
  the sandbox without attaching a host workspace. Push branches to a Git
  remote to share the results.
@z

@x
| Checkout | Changes visible in host checkout | Agent can use Git |
| --- | --- | --- |
| Direct mount | Immediately | Yes |
| Mounted host worktree | Immediately, in the worktree | No |
| Clone mode (`--clone`) | After checking out or merging a fetched branch | Yes |
| Mountless sandbox | After pulling committed work from a Git remote | Yes |
@y
| Checkout | Changes visible in host checkout | Agent can use Git |
| --- | --- | --- |
| Direct mount | Immediately | Yes |
| Mounted host worktree | Immediately, in the worktree | No |
| Clone mode (`--clone`) | After checking out or merging a fetched branch | Yes |
| Mountless sandbox | After pulling committed work from a Git remote | Yes |
@z

@x
As you give the agent more responsibility for managing work, consider a
mountless sandbox. The agent can manage branches, create worktrees, and push
results for review without coordinating changes in your host checkout. You
review and bring back committed work through Git, and run previews through
published sandbox ports.
@y
As you give the agent more responsibility for managing work, consider a
mountless sandbox. The agent can manage branches, create worktrees, and push
results for review without coordinating changes in your host checkout. You
review and bring back committed work through Git, and run previews through
published sandbox ports.
@z

@x
For simultaneous tasks, have the agent create a separate worktree or clone
for each task inside the sandbox. This works in both mountless sandboxes and
clone mode, and keeps Git available to the agent. Branches alone don't isolate
edits in a shared working directory. Worktrees inside one sandbox share its
tools and services. Use separate sandboxes when tasks also need independent
environments.
@y
For simultaneous tasks, have the agent create a separate worktree or clone
for each task inside the sandbox. This works in both mountless sandboxes and
clone mode, and keeps Git available to the agent. Branches alone don't isolate
edits in a shared working directory. Worktrees inside one sandbox share its
tools and services. Use separate sandboxes when tasks also need independent
environments.
@z

@x
## Direct mode
@y
## Direct mode
@z

@x
The sandbox mounts your host working tree directly. The agent edits files in
place, and changes appear immediately. Both you and the agent can use Git,
so agree on who manages branches and commits. Switching branches from either
side changes the files both sides see.
@y
The sandbox mounts your host working tree directly. The agent edits files in
place, and changes appear immediately. Both you and the agent can use Git,
so agree on who manages branches and commits. Switching branches from either
side changes the files both sides see.
@z

@x
To manage Git operations from the host:
@y
To manage Git operations from the host:
@z

@x
1. Check out the branch you want to work on:
@y
1. Check out the branch you want to work on:
@z

@x
   ```console
   $ git checkout -b feat/my-feature
   ```
@y
   ```console
   $ git checkout -b feat/my-feature
   ```
@z

@x
2. Start the sandbox. No special flags needed:
@y
2. Start the sandbox. No special flags needed:
@z

@x
   ```console
   $ sbx run claude
   ```
@y
   ```console
   $ sbx run claude
   ```
@z

@x
3. The agent edits files in your working tree. Review diffs, stage, and
   commit as you normally would:
@y
3. The agent edits files in your working tree. Review diffs, stage, and
   commit as you normally would:
@z

@x
   ```console
   $ git diff
   $ git add -p
   $ git commit
   $ git push -u origin feat/my-feature
   ```
@y
   ```console
   $ git diff
   $ git add -p
   $ git commit
   $ git push -u origin feat/my-feature
   ```
@z

@x
Direct mode suits focused, single-branch work where you collaborate with the
agent turn-by-turn.
@y
Direct mode suits focused, single-branch work where you collaborate with the
agent turn-by-turn.
@z

@x
## Clone mode
@y
## Clone mode
@z

@x
In clone mode, `sbx` creates a separate Git clone inside the sandbox. The agent
edits this clone instead of your host working tree. Its changes stay inside the
sandbox until you fetch a branch or the agent pushes one to a remote. Your host
repository is also available at `/run/sandbox/source`, but only with read
access. The sandbox clone is not a Git worktree linked to your host checkout.
@y
In clone mode, `sbx` creates a separate Git clone inside the sandbox. The agent
edits this clone instead of your host working tree. Its changes stay inside the
sandbox until you fetch a branch or the agent pushes one to a remote. Your host
repository is also available at `/run/sandbox/source`, but only with read
access. The sandbox clone is not a Git worktree linked to your host checkout.
@z

@x
A single clone-mode sandbox can hold multiple branches and worktrees for
parallel tasks. The `--clone` flag creates the clone, but it doesn't separate
one task from another. To keep parallel tasks isolated, instruct your agent tool
to create a separate worktree or clone for each task.
@y
A single clone-mode sandbox can hold multiple branches and worktrees for
parallel tasks. The `--clone` flag creates the clone, but it doesn't separate
one task from another. To keep parallel tasks isolated, instruct your agent tool
to create a separate worktree or clone for each task.
@z

@x
> [!NOTE]
> `--clone` is a create-time flag and cannot be changed on an existing
> sandbox. To change a sandbox from clone mode to direct mode, remove and
> recreate it. To run both modes against the same repository, create separate
> sandboxes with distinct names.
@y
> [!NOTE]
> `--clone` is a create-time flag and cannot be changed on an existing
> sandbox. To change a sandbox from clone mode to direct mode, remove and
> recreate it. To run both modes against the same repository, create separate
> sandboxes with distinct names.
@z

@x
### Sandbox remote behavior
@y
### Sandbox remote behavior
@z

@x
The CLI copies Git remotes from your host repository, such as `origin` and
`upstream`, into the in-sandbox clone. Local-path remotes, such as `file://`
URLs and filesystem paths, aren't copied because they aren't reachable from
inside the sandbox.
@y
The CLI copies Git remotes from your host repository, such as `origin` and
`upstream`, into the in-sandbox clone. Local-path remotes, such as `file://`
URLs and filesystem paths, aren't copied because they aren't reachable from
inside the sandbox.
@z

@x
The Git daemon that exposes the in-sandbox clone runs as part of the sandbox.
It's only reachable while the sandbox is running:
@y
The Git daemon that exposes the in-sandbox clone runs as part of the sandbox.
It's only reachable while the sandbox is running:
@z

@x
- `sbx stop` shuts down the daemon. `git fetch sandbox-<name>` fails until the
  sandbox starts again.
- Restarting the sandbox assigns another ephemeral port to the daemon. The CLI
  updates the `sandbox-<name>` remote URL in your host repository's Git config,
  so fetching continues without manual reconfiguration.
- `sbx rm` removes the sandbox, the daemon, the published port, and the
  `sandbox-<name>` remote entry from your host repository.
@y
- `sbx stop` shuts down the daemon. `git fetch sandbox-<name>` fails until the
  sandbox starts again.
- Restarting the sandbox assigns another ephemeral port to the daemon. The CLI
  updates the `sandbox-<name>` remote URL in your host repository's Git config,
  so fetching continues without manual reconfiguration.
- `sbx rm` removes the sandbox, the daemon, the published port, and the
  `sandbox-<name>` remote entry from your host repository.
@z

@x
### Single task
@y
### Single task
@z

@x
1. Start a clone-mode sandbox:
@y
1. Start a clone-mode sandbox:
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
2. Ask the agent to create a branch before it starts editing:
@y
2. Ask the agent to create a branch before it starts editing:
@z

@x
   > Create a branch `feat/my-feature` and make the changes.
@y
   > Create a branch `feat/my-feature` and make the changes.
@z

@x
3. Fetch the agent's branch when it's done:
@y
3. Fetch the agent's branch when it's done:
@z

@x
   ```console
   $ git fetch sandbox-<name>
   $ git log sandbox-<name>/feat/my-feature
   $ git diff main..sandbox-<name>/feat/my-feature
   ```
@y
   ```console
   $ git fetch sandbox-<name>
   $ git log sandbox-<name>/feat/my-feature
   $ git diff main..sandbox-<name>/feat/my-feature
   ```
@z

@x
4. Pull the branch to the host and push, or ask the agent to push directly:
@y
4. Pull the branch to the host and push, or ask the agent to push directly:
@z

@x
   ```console
   # Pull to host, then push
   $ git checkout -b feat/my-feature sandbox-<name>/feat/my-feature
   $ git push -u origin feat/my-feature
   $ gh pr create
@y
   ```console
   # Pull to host, then push
   $ git checkout -b feat/my-feature sandbox-<name>/feat/my-feature
   $ git push -u origin feat/my-feature
   $ gh pr create
@z

@x
   # Or ask the agent
   # "Push feat/my-feature to origin and open a PR."
   ```
@y
   # Or ask the agent
   # "Push feat/my-feature to origin and open a PR."
   ```
@z

@x
### Parallel tasks
@y
### Parallel tasks
@z

@x
1. Start a clone-mode sandbox and open the
   [agents view](../agents/claude-code.md#agents-view):
@y
1. Start a clone-mode sandbox and open the
   [agents view](../agents/claude-code.md#agents-view):
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
2. Dispatch each independent task to a separate background session. Your agent
   tool controls how it separates their working directories. To require a
   separate worktree for each task, add a project instruction such as:
@y
2. Dispatch each independent task to a separate background session. Your agent
   tool controls how it separates their working directories. To require a
   separate worktree for each task, add a project instruction such as:
@z

@x
   ```markdown
   For each simultaneous task, create a separate Git worktree with its own branch
   and make all changes for that task in that worktree.
   ```
@y
   ```markdown
   For each simultaneous task, create a separate Git worktree with its own branch
   and make all changes for that task in that worktree.
   ```
@z

@x
3. Fetch all branches when the agents are done:
@y
3. Fetch all branches when the agents are done:
@z

@x
   ```console
   $ git fetch sandbox-<name>
   $ git log sandbox-<name>/feat/task-a
   $ git log sandbox-<name>/feat/task-b
   ```
@y
   ```console
   $ git fetch sandbox-<name>
   $ git log sandbox-<name>/feat/task-a
   $ git log sandbox-<name>/feat/task-b
   ```
@z

@x
4. Check out the branches you want to keep and open PRs as normal.
@y
4. Check out the branches you want to keep and open PRs as normal.
@z

@x
## Host worktree
@y
## Host worktree
@z

@x
You can create a Git worktree on your host and point the sandbox at it. The
agent edits files directly in the worktree — but because the sandbox mounts
only the worktree directory (not the parent repository), it can't resolve the
`.git` pointer file and has no Git access. The agent can read and write files,
but can't commit, branch, or check status.
@y
You can create a Git worktree on your host and point the sandbox at it. The
agent edits files directly in the worktree — but because the sandbox mounts
only the worktree directory (not the parent repository), it can't resolve the
`.git` pointer file and has no Git access. The agent can read and write files,
but can't commit, branch, or check status.
@z

@x
Use this approach when you want edits visible in a separate host directory
and prefer to handle Git operations yourself. To give the agent Git access in
each working directory, use worktrees inside a mountless or clone-mode sandbox.
@y
Use this approach when you want edits visible in a separate host directory
and prefer to handle Git operations yourself. To give the agent Git access in
each working directory, use worktrees inside a mountless or clone-mode sandbox.
@z

@x
1. Create the worktree on the host:
@y
1. Create the worktree on the host:
@z

@x
   ```console
   $ git worktree add -b feat/my-feature ../my-feature-work
   ```
@y
   ```console
   $ git worktree add -b feat/my-feature ../my-feature-work
   ```
@z

@x
2. Start the sandbox with the worktree as the workspace:
@y
2. Start the sandbox with the worktree as the workspace:
@z

@x
   ```console
   $ sbx run claude ../my-feature-work
   ```
@y
   ```console
   $ sbx run claude ../my-feature-work
   ```
@z

@x
3. The agent edits files. When it's done, commit and push from the host:
@y
3. The agent edits files. When it's done, commit and push from the host:
@z

@x
   ```console
   $ cd ../my-feature-work
   $ git diff
   $ git add -p && git commit
   $ git push -u origin feat/my-feature
   $ gh pr create
   ```
@y
   ```console
   $ cd ../my-feature-work
   $ git diff
   $ git add -p && git commit
   $ git push -u origin feat/my-feature
   $ gh pr create
   ```
@z

@x
## Mountless sandbox
@y
## Mountless sandbox
@z

@x
A mountless sandbox has no host workspace attached. Clone repositories inside
it to keep the checkout, dependencies, and development tools in the sandbox.
Files persist across stops and restarts, but removing the sandbox deletes them.
@y
A mountless sandbox has no host workspace attached. Clone repositories inside
it to keep the checkout, dependencies, and development tools in the sandbox.
Files persist across stops and restarts, but removing the sandbox deletes them.
@z

@x
You can keep one sandbox per project and reuse it across tasks. The agent can
prepare its tools and create worktrees as needed, so starting another task
doesn't require another host checkout or sandbox.
@y
You can keep one sandbox per project and reuse it across tasks. The agent can
prepare its tools and create worktrees as needed, so starting another task
doesn't require another host checkout or sandbox.
@z

@x
1. Create a named sandbox without a workspace path, then attach:
@y
1. Create a named sandbox without a workspace path, then attach:
@z

@x
   ```console
   $ sbx create --name my-project claude
   $ sbx run --name my-project
   ```
@y
   ```console
   $ sbx create --name my-project claude
   $ sbx run --name my-project
   ```
@z

@x
   Omitting the path from `sbx create` creates a mountless sandbox. Omitting
   it from `sbx run claude` mounts your current host directory instead.
   See [Choose a workspace](../usage.md#choose-a-workspace).
@y
   Omitting the path from `sbx create` creates a mountless sandbox. Omitting
   it from `sbx run claude` mounts your current host directory instead.
   See [Choose a workspace](../usage.md#choose-a-workspace).
@z

@x
2. Ask the agent to clone your repository inside the sandbox and create a
   branch before editing. For simultaneous tasks, ask it to create a separate
   worktree for each task.
@y
2. Ask the agent to clone your repository inside the sandbox and create a
   branch before editing. For simultaneous tasks, ask it to create a separate
   worktree for each task.
@z

@x
3. Review and commit the changes inside the sandbox, then push the branch to
   your Git remote. You can fetch that branch in a host checkout or review it
   in a pull request. Push any work you want to keep before removing the sandbox.
@y
3. Review and commit the changes inside the sandbox, then push the branch to
   your Git remote. You can fetch that branch in a host checkout or review it
   in a pull request. Push any work you want to keep before removing the sandbox.
@z

@x
You can also create a mountless sandbox with an `sbxenv.yaml` environment file.
Omit `workspace` and any `additionalWorkspaces` mounts, then run `sbx env run`.
See [Sandbox environment files](../configuration/environment-files.md#workspace)
for configuration options.
@y
You can also create a mountless sandbox with an `sbxenv.yaml` environment file.
Omit `workspace` and any `additionalWorkspaces` mounts, then run `sbx env run`.
See [Sandbox environment files](../configuration/environment-files.md#workspace)
for configuration options.
@z

@x
For running the application and opening a preview from your host browser, see
[Develop and test locally](development.md#accessing-services-in-the-sandbox).
To work with several host repositories in one sandbox instead, see
[Multiple workspaces](../usage.md#multiple-workspaces).
@y
For running the application and opening a preview from your host browser, see
[Develop and test locally](development.md#accessing-services-in-the-sandbox).
To work with several host repositories in one sandbox instead, see
[Multiple workspaces](../usage.md#multiple-workspaces).
@z

@x
## Git ignore rules
@y
## Git ignore rules
@z

@x
Git inside a local sandbox preserves host-specific ignore decisions for paths
that exist when you create the sandbox. This applies when the primary workspace
is at a Git repository root.
@y
Git inside a local sandbox preserves host-specific ignore decisions for paths
that exist when you create the sandbox. This applies when the primary workspace
is at a Git repository root.
@z

@x
The sandbox receives a snapshot of ignored paths, not the host-specific patterns.
Those patterns don't apply to files created later, but ignored directories still
cover files added inside them. Additional repositories and primary workspaces
below a repository root don't receive this snapshot. Repository `.gitignore`
files continue to work as usual.
@y
The sandbox receives a snapshot of ignored paths, not the host-specific patterns.
Those patterns don't apply to files created later, but ignored directories still
cover files added inside them. Additional repositories and primary workspaces
below a repository root don't receive this snapshot. Repository `.gitignore`
files continue to work as usual.
@z

@x
Git ignore rules don't restrict the agent's access to files in the workspace.
@y
Git ignore rules don't restrict the agent's access to files in the workspace.
@z

@x
## Commit signing
@y
## Commit signing
@z

@x
SSH agent forwarding is enabled by default. When `SSH_AUTH_SOCK` is set,
sandboxes forward your host SSH agent into the sandbox, so the agent can sign
commits with your SSH key without the private key ever leaving your host. If
you turned off forwarding or use a fixed SSH agent socket, see
[SSH agent configuration](../configuration/credentials.md#ssh-agent).
@y
SSH agent forwarding is enabled by default. When `SSH_AUTH_SOCK` is set,
sandboxes forward your host SSH agent into the sandbox, so the agent can sign
commits with your SSH key without the private key ever leaving your host. If
you turned off forwarding or use a fixed SSH agent socket, see
[SSH agent configuration](../configuration/credentials.md#ssh-agent).
@z

@x
1. Make sure the signing key is loaded in your host SSH agent:
@y
1. Make sure the signing key is loaded in your host SSH agent:
@z

@x
   ```console
   $ ssh-add ~/.ssh/id_ed25519
   $ ssh-add -L  # confirm the key appears
   ```
@y
   ```console
   $ ssh-add ~/.ssh/id_ed25519
   $ ssh-add -L  # confirm the key appears
   ```
@z

@x
2. Inside the sandbox, configure Git to sign with SSH. Use the forwarded key
   directly rather than a file path, since host paths don't exist inside the
   sandbox:
@y
2. Inside the sandbox, configure Git to sign with SSH. Use the forwarded key
   directly rather than a file path, since host paths don't exist inside the
   sandbox:
@z

@x
   ```console
   $ git config --global gpg.format ssh
   $ git config --global user.signingkey "key::$(ssh-add -L | head -n 1)"
   ```
@y
   ```console
   $ git config --global gpg.format ssh
   $ git config --global user.signingkey "key::$(ssh-add -L | head -n 1)"
   ```
@z

@x
3. Sign commits as usual:
@y
3. Sign commits as usual:
@z

@x
   ```console
   $ git commit -S -m "feat: my change"
   ```
@y
   ```console
   $ git commit -S -m "feat: my change"
   ```
@z

@x
To apply this configuration automatically to every sandbox, use the
[`git-ssh-sign`](https://github.com/docker/sbx-kits-contrib/tree/main/git-ssh-sign)
community kit, which handles all of the above setup. For using it with the
built-in agents, see [Kits v2](../customize/kits-v2.md).
@y
To apply this configuration automatically to every sandbox, use the
[`git-ssh-sign`](https://github.com/docker/sbx-kits-contrib/tree/main/git-ssh-sign)
community kit, which handles all of the above setup. For using it with the
built-in agents, see [Kits v2](../customize/kits-v2.md).
@z

@x
For troubleshooting, see
[Sandbox commits aren't signed](../troubleshooting.md#sandbox-commits-arent-signed).
@y
For troubleshooting, see
[Sandbox commits aren't signed](../troubleshooting.md#sandbox-commits-arent-signed).
@z
