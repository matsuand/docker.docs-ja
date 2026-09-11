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
description: Choose a Git workspace mode and manage branches, parallel tasks, and signed commits with Docker Sandboxes.
keywords: docker sandboxes, sbx, git, clone mode, direct mode, worktrees, branches, commit signing
@y
description: Choose a Git workspace mode and manage branches, parallel tasks, and signed commits with Docker Sandboxes.
keywords: docker sandboxes, sbx, git, clone mode, direct mode, worktrees, branches, commit signing
@z

@x
Sandboxes support three approaches for working with Git repositories. The
right choice depends on whether you want branch isolation and whether you
plan to run tasks in parallel:
@y
Sandboxes support three approaches for working with Git repositories. The
right choice depends on whether you want branch isolation and whether you
plan to run tasks in parallel:
@z

@x
|                           | Direct mode      | Clone mode (`--clone`)       | Host worktree                 |
| ------------------------- | ---------------- | ---------------------------- | ----------------------------- |
| Branch management         | You, on the host | Agent, inside the clone      | You, on the host              |
| Changes visible on host   | Immediately      | After fetch or agent push    | Immediately                   |
| Agent can use Git         | Yes              | Yes                          | No                            |
| Parallelism               | No               | Multiple agents, one sandbox | One sandbox per parallel task |
| Mode fixed at create time | No               | Yes                          | —                             |
@y
|                           | Direct mode      | Clone mode (`--clone`)       | Host worktree                 |
| ------------------------- | ---------------- | ---------------------------- | ----------------------------- |
| Branch management         | You, on the host | Agent, inside the clone      | You, on the host              |
| Changes visible on host   | Immediately      | After fetch or agent push    | Immediately                   |
| Agent can use Git         | Yes              | Yes                          | No                            |
| Parallelism               | No               | Multiple agents, one sandbox | One sandbox per parallel task |
| Mode fixed at create time | No               | Yes                          | —                             |
@z

@x
## Direct mode
@y
## Direct mode
@z

@x
The simplest approach. The sandbox mounts your host working tree directly —
the agent edits files in place and changes appear immediately. You manage
branches yourself.
@y
The simplest approach. The sandbox mounts your host working tree directly —
the agent edits files in place and changes appear immediately. You manage
branches yourself.
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
Because the sandbox mounts your working tree, switching branches on the host
also changes what the agent sees. This makes direct mode well-suited for
focused, single-branch work where you're collaborating with the agent
turn-by-turn.
@y
Because the sandbox mounts your working tree, switching branches on the host
also changes what the agent sees. This makes direct mode well-suited for
focused, single-branch work where you're collaborating with the agent
turn-by-turn.
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
to create a separate branch or worktree for each task.
@y
A single clone-mode sandbox can hold multiple branches and worktrees for
parallel tasks. The `--clone` flag creates the clone, but it doesn't separate
one task from another. To keep parallel tasks isolated, instruct your agent tool
to create a separate branch or worktree for each task.
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
   tool may use branches or worktrees to keep their changes separate. If it
   doesn't, add a project instruction such as:
@y
2. Dispatch each independent task to a separate background session. Your agent
   tool may use branches or worktrees to keep their changes separate. If it
   doesn't, add a project instruction such as:
@z

@x
   ```markdown
   Always start each task on its own git branch before making changes.
   ```
@y
   ```markdown
   Always start each task on its own git branch before making changes.
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
This is useful when you want branch isolation without the create-time
commitment of clone mode, and you're comfortable committing from the host
yourself after reviewing the changes.
@y
This is useful when you want branch isolation without the create-time
commitment of clone mode, and you're comfortable committing from the host
yourself after reviewing the changes.
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
community kit, which handles all of the above setup. See [Kits](../customize/kits.md)
if you want to package it alongside other sandbox customizations.
@y
To apply this configuration automatically to every sandbox, use the
[`git-ssh-sign`](https://github.com/docker/sbx-kits-contrib/tree/main/git-ssh-sign)
community kit, which handles all of the above setup. See [Kits](../customize/kits.md)
if you want to package it alongside other sandbox customizations.
@z

@x
For troubleshooting, see
[Sandbox commits aren't signed](../troubleshooting.md#sandbox-commits-arent-signed).
@y
For troubleshooting, see
[Sandbox commits aren't signed](../troubleshooting.md#sandbox-commits-arent-signed).
@z
