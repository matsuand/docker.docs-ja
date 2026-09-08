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
description: Import skills from supported host agents into a persistent store shared with Docker Sandboxes.
keywords: docker sandboxes, sbx, agent skills, shared skills, claude code, codex, copilot, cursor, droid
@y
description: Import skills from supported host agents into a persistent store shared with Docker Sandboxes.
keywords: docker sandboxes, sbx, agent skills, shared skills, claude code, codex, copilot, cursor, droid
@z

@x
Shared agent skills make skills from supported agents on your host available
inside your sandboxes. Importing copies the skills into a persistent store that
survives sandbox deletion and is shared by default with new sandboxes that run
a supported agent.
@y
Shared agent skills make skills from supported agents on your host available
inside your sandboxes. Importing copies the skills into a persistent store that
survives sandbox deletion and is shared by default with new sandboxes that run
a supported agent.
@z

@x
> [!NOTE]
> Shared agent skills are experimental.
@y
> [!NOTE]
> Shared agent skills are experimental.
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
| Codex       | `~/.agents/skills`  | `/home/agent/.agents/skills`  |
| Copilot     | `~/.copilot/skills` | `/home/agent/.copilot/skills` |
| Cursor      | `~/.cursor/skills`  | `/home/agent/.cursor/skills`  |
| Droid       | `~/.factory/skills` | `/home/agent/.factory/skills` |
@y
| Agent       | Host source         | Sandbox mount target          |
| ----------- | ------------------- | ----------------------------- |
| Claude Code | `~/.claude/skills`  | `/home/agent/.claude/skills`  |
| Codex       | `~/.agents/skills`  | `/home/agent/.agents/skills`  |
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
again when you want to copy updates from the host. Running `sbx reset` clears
the shared store.
@y
When a skill already exists in the store, `sbx` prompts before replacing it.
Use `--force` to replace existing skills without prompts. Importing replaces
the complete skill directory rather than merging files. Run the import command
again when you want to copy updates from the host. Running `sbx reset` clears
the shared store.
@z

@x
Sandboxes created with `sbx` version 0.37.0 or later for a supported agent are
configured to mount the store read-write by default. These sandboxes mount the
current contents of the store each time they start, so you can import skills
before or after creating them. To create a sandbox without the shared store,
use `--no-share-skills`:
@y
Sandboxes created with `sbx` version 0.37.0 or later for a supported agent are
configured to mount the store read-write by default. These sandboxes mount the
current contents of the store each time they start, so you can import skills
before or after creating them. To create a sandbox without the shared store,
use `--no-share-skills`:
@z

@x
```console
$ sbx run --no-share-skills claude
```
@y
```console
$ sbx run --no-share-skills claude
```
@z

@x
Upgrading `sbx` does not enable shared skills for sandboxes created with an
earlier version. Remove and recreate those sandboxes after upgrading. The
`--no-share-skills` option also only applies when the sandbox is created. To
turn off shared skills for an existing sandbox, remove it and recreate it with
the option.
@y
Upgrading `sbx` does not enable shared skills for sandboxes created with an
earlier version. Remove and recreate those sandboxes after upgrading. The
`--no-share-skills` option also only applies when the sandbox is created. To
turn off shared skills for an existing sandbox, remove it and recreate it with
the option.
@z

@x
> [!WARNING]
> The shared skills store is mounted read-write. A sandbox can modify any skill
> in the store, and another sandbox can later load the modified instructions or
> run the modified scripts. The store is dedicated sandbox state, so this does
> not by itself execute the modified skill on your host. It does put every
> sandbox that shares the store in the same trust boundary. Use
> `--no-share-skills` to keep a sandbox outside that boundary.
@y
> [!WARNING]
> The shared skills store is mounted read-write. A sandbox can modify any skill
> in the store, and another sandbox can later load the modified instructions or
> run the modified scripts. The store is dedicated sandbox state, so this does
> not by itself execute the modified skill on your host. It does put every
> sandbox that shares the store in the same trust boundary. Use
> `--no-share-skills` to keep a sandbox outside that boundary.
@z

@x
Some agents scan for skills when a session starts. If imported skills don't
appear in an existing session, start another agent session.
@y
Some agents scan for skills when a session starts. If imported skills don't
appear in an existing session, start another agent session.
@z
