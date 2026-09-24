%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
title: Share agent skills
linkTitle: Agent skills
@y
title: Share agent skills
linkTitle: Agent skills
@z

@x
description: Add skills from Git repositories or import them from supported host agents into a store shared with Docker Sandboxes.
keywords: docker sandboxes, sbx, agent skills, shared skills, git repository, claude code, codex, copilot, cursor, devin, droid
@y
description: Add skills from Git repositories or import them from supported host agents into a store shared with Docker Sandboxes.
keywords: docker sandboxes, sbx, agent skills, shared skills, git repository, claude code, codex, copilot, cursor, devin, droid
@z

@x
Shared agent skills let you install skills from Git repositories or import
skills from supported agents on your host. `sbx` keeps installed skills in a
persistent store that survives sandbox deletion and is shared by default with
new sandboxes that run a supported agent.
@y
Shared agent skills let you install skills from Git repositories or import
skills from supported agents on your host. `sbx` keeps installed skills in a
persistent store that survives sandbox deletion and is shared by default with
new sandboxes that run a supported agent.
@z

@x
> [!NOTE]
> Shared agent skills are experimental.
@y
> [!NOTE]
> Shared agent skills are experimental.
@z

@x
## Add skills from a repository
@y
## Add skills from a repository
@z

@x
Add every skill from a Git repository:
@y
Add every skill from a Git repository:
@z

@x
```console
$ sbx skills add anthropics/skills
```
@y
```console
$ sbx skills add anthropics/skills
```
@z

@x
The repository must contain one or more valid `SKILL.md` files. You can use
GitHub `owner/repository` shorthand or a Git URL, including HTTPS and SSH URLs.
@y
The repository must contain one or more valid `SKILL.md` files. You can use
GitHub `owner/repository` shorthand or a Git URL, including HTTPS and SSH URLs.
@z

@x
To add specific skills, use `--skill` with each name or pass a comma-separated
list:
@y
To add specific skills, use `--skill` with each name or pass a comma-separated
list:
@z

@x
```console
$ sbx skills add https://github.com/anthropics/skills --skill frontend-design --skill pdf
```
@y
```console
$ sbx skills add https://github.com/anthropics/skills --skill frontend-design --skill pdf
```
@z

@x
When a skill with the same name is already installed, `sbx` prompts before
replacing it. Use `--force` to replace existing skills without prompts.
@y
When a skill with the same name is already installed, `sbx` prompts before
replacing it. Use `--force` to replace existing skills without prompts.
@z

@x
## Manage installed skills
@y
## Manage installed skills
@z

@x
List the skills in the shared store:
@y
List the skills in the shared store:
@z

@x
```console
$ sbx skills ls
```
@y
```console
$ sbx skills ls
```
@z

@x
Update every skill installed from a repository:
@y
Update every skill installed from a repository:
@z

@x
```console
$ sbx skills update
```
@y
```console
$ sbx skills update
```
@z

@x
To update specific skills, pass one or more names:
@y
To update specific skills, pass one or more names:
@z

@x
```console
$ sbx skills update frontend-design pdf
```
@y
```console
$ sbx skills update frontend-design pdf
```
@z

@x
`sbx skills update` only refreshes skills installed with `sbx skills add`. To
refresh a skill imported from the host, run `sbx skills import` again. To manage
it with `sbx skills update`, install it from a repository instead.
@y
`sbx skills update` only refreshes skills installed with `sbx skills add`. To
refresh a skill imported from the host, run `sbx skills import` again. To manage
it with `sbx skills update`, install it from a repository instead.
@z

@x
Remove one or more installed skills:
@y
Remove one or more installed skills:
@z

@x
```console
$ sbx skills rm frontend-design pdf
```
@y
```console
$ sbx skills rm frontend-design pdf
```
@z

@x
`sbx` asks for confirmation before removing skills that running agents may be
using. Use `--force` to skip confirmation in scripts.
@y
`sbx` asks for confirmation before removing skills that running agents may be
using. Use `--force` to skip confirmation in scripts.
@z

@x
## Import skills from the host
@y
## Import skills from the host
@z

@x
Preview the skills that `sbx` finds without copying them:
@y
Preview the skills that `sbx` finds without copying them:
@z

@x
```console
$ sbx skills import --dry-run
```
@y
```console
$ sbx skills import --dry-run
```
@z

@x
The command scans the following directories in order and copies each skill
subdirectory into the shared store. When the sandbox starts, `sbx` mounts the
store at the path the agent reads inside the sandbox.
@y
The command scans the following directories in order and copies each skill
subdirectory into the shared store. When the sandbox starts, `sbx` mounts the
store at the path the agent reads inside the sandbox.
@z

@x
| Agent       | Host source         | Sandbox mount target          |
| ----------- | ------------------- | ----------------------------- |
| Claude Code | `~/.claude/skills`  | `/home/agent/.claude/skills`  |
| Codex and Devin | `~/.agents/skills` | `/home/agent/.agents/skills` |
| Copilot     | `~/.copilot/skills` | `/home/agent/.copilot/skills` |
| Cursor      | `~/.cursor/skills`  | `/home/agent/.cursor/skills`  |
| Droid       | `~/.factory/skills` | `/home/agent/.factory/skills` |
@y
| Agent       | Host source         | Sandbox mount target          |
| ----------- | ------------------- | ----------------------------- |
| Claude Code | `~/.claude/skills`  | `/home/agent/.claude/skills`  |
| Codex and Devin | `~/.agents/skills` | `/home/agent/.agents/skills` |
| Copilot     | `~/.copilot/skills` | `/home/agent/.copilot/skills` |
| Cursor      | `~/.cursor/skills`  | `/home/agent/.cursor/skills`  |
| Droid       | `~/.factory/skills` | `/home/agent/.factory/skills` |
@z

@x
All imported skills go into the same store, regardless of their source. If
more than one source contains a skill with the same directory name, the skill
from the first source in the table wins and `sbx` warns about the others.
@y
All imported skills go into the same store, regardless of their source. If
more than one source contains a skill with the same directory name, the skill
from the first source in the table wins and `sbx` warns about the others.
@z

@x
Import the skills:
@y
Import the skills:
@z

@x
```console
$ sbx skills import
```
@y
```console
$ sbx skills import
```
@z

@x
The final output reports the shared store path. The default locations are:
@y
The final output reports the shared store path. The default locations are:
@z

@x
| Platform | Shared store path                                                           |
| -------- | --------------------------------------------------------------------------- |
| macOS    | `~/Library/Application Support/com.docker.sandboxes/sandboxes/agent-skills` |
| Linux    | `~/.local/state/sandboxes/sandboxes/agent-skills`                           |
| Windows  | `%LOCALAPPDATA%\DockerSandboxes\sandboxes\state\agent-skills`               |
@y
| Platform | Shared store path                                                           |
| -------- | --------------------------------------------------------------------------- |
| macOS    | `~/Library/Application Support/com.docker.sandboxes/sandboxes/agent-skills` |
| Linux    | `~/.local/state/sandboxes/sandboxes/agent-skills`                           |
| Windows  | `%LOCALAPPDATA%\DockerSandboxes\sandboxes\state\agent-skills`               |
@z

@x
On Linux, `sbx` uses `$XDG_STATE_HOME/sandboxes/sandboxes/agent-skills` when
`XDG_STATE_HOME` is set.
@y
On Linux, `sbx` uses `$XDG_STATE_HOME/sandboxes/sandboxes/agent-skills` when
`XDG_STATE_HOME` is set.
@z

@x
When a skill already exists in the store, `sbx` prompts before replacing it.
Use `--force` to replace existing skills without prompts. Importing replaces
the complete skill directory rather than merging files. Run the import command
again when you want to copy updates from the host. If an import replaces a
repository-installed skill, `sbx` no longer associates that skill with its
repository, so `sbx skills update` won't refresh it.
@y
When a skill already exists in the store, `sbx` prompts before replacing it.
Use `--force` to replace existing skills without prompts. Importing replaces
the complete skill directory rather than merging files. Run the import command
again when you want to copy updates from the host. If an import replaces a
repository-installed skill, `sbx` no longer associates that skill with its
repository, so `sbx skills update` won't refresh it.
@z

@x
## Shared store behavior
@y
## Shared store behavior
@z

@x
Running `sbx reset` clears the shared store.
@y
Running `sbx reset` clears the shared store.
@z

@x
Sandboxes created for a supported agent mount the shared store read-only by
default. These sandboxes mount the contents of the store each time they start,
so you can install skills before or after creating them.
@y
Sandboxes created for a supported agent mount the shared store read-only by
default. These sandboxes mount the contents of the store each time they start,
so you can install skills before or after creating them.
@z

@x
Use `--skills` with `sbx run` or `sbx create` to choose the access mode when
creating a sandbox:
@y
Use `--skills` with `sbx run` or `sbx create` to choose the access mode when
creating a sandbox:
@z

@x
- `readonly`: Mount the store so the agent can read skills but cannot modify them.
- `readwrite`: Mount the store so the agent can read and modify shared skills.
- `off`: Omit the shared store mount.
@y
- `readonly`: Mount the store so the agent can read skills but cannot modify them.
- `readwrite`: Mount the store so the agent can read and modify shared skills.
- `off`: Omit the shared store mount.
@z

@x
For example, create a sandbox without the shared store:
@y
For example, create a sandbox without the shared store:
@z

@x
```console
$ sbx run --skills=off claude
```
@y
```console
$ sbx run --skills=off claude
```
@z

@x
To change the default for future sandboxes, set
[`skills.defaultMode`](../configuration/settings.md#skillsdefaultmode) to `off`,
`readonly`, or `readwrite`:
@y
To change the default for future sandboxes, set
[`skills.defaultMode`](../configuration/settings.md#skillsdefaultmode) to `off`,
`readonly`, or `readwrite`:
@z

@x
```console
$ sbx settings set skills.defaultMode readonly
```
@y
```console
$ sbx settings set skills.defaultMode readonly
```
@z

@x
The mode is applied only when a sandbox is created. Upgrading `sbx` or changing
`skills.defaultMode` leaves existing sandbox mounts unchanged. Remove and
recreate a sandbox to change its mode. Sandboxes created without shared skills
also need to be recreated to mount the store.
@y
The mode is applied only when a sandbox is created. Upgrading `sbx` or changing
`skills.defaultMode` leaves existing sandbox mounts unchanged. Remove and
recreate a sandbox to change its mode. Sandboxes created without shared skills
also need to be recreated to mount the store.
@z

@x
> [!WARNING]
> A sandbox with `readwrite` access can modify skills that other sandboxes load,
> including sandboxes with `readonly` access. Read-only access prevents writes
> from that sandbox but does not isolate it from changes to the store. The store
> is dedicated sandbox state, so this does not by itself execute modified skills
> on your host. Use `--skills=off` when creating a sandbox to keep it outside
> this shared trust boundary.
@y
> [!WARNING]
> A sandbox with `readwrite` access can modify skills that other sandboxes load,
> including sandboxes with `readonly` access. Read-only access prevents writes
> from that sandbox but does not isolate it from changes to the store. The store
> is dedicated sandbox state, so this does not by itself execute modified skills
> on your host. Use `--skills=off` when creating a sandbox to keep it outside
> this shared trust boundary.
@z

@x
Some agents scan for skills when a session starts. If installed skills don't
appear in an existing session, start another agent session.
@y
Some agents scan for skills when a session starts. If installed skills don't
appear in an existing session, start another agent session.
@z
