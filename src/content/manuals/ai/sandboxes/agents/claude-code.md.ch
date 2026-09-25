%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
title: Claude Code
@y
title: Claude Code
@z

@x
description: |
  Use Claude Code in Docker Sandboxes with authentication, local models,
  configuration, and YOLO mode for AI-assisted development.
keywords: docker sandboxes, claude code, anthropic, ai agent, sbx, local models, llmman, ollama
@y
description: |
  Use Claude Code in Docker Sandboxes with authentication, local models,
  configuration, and YOLO mode for AI-assisted development.
keywords: docker sandboxes, claude code, anthropic, ai agent, sbx, local models, llmman, ollama
@z

@x
The following instructions apply to local sandboxes. For cloud authentication
and usage, see [Authenticate cloud agents](../cloud/credentials.md) and
[Use cloud sandboxes](../cloud/usage.md).
@y
The following instructions apply to local sandboxes. For cloud authentication
and usage, see [Authenticate cloud agents](../cloud/credentials.md) and
[Use cloud sandboxes](../cloud/usage.md).
@z

@x
Official documentation: [Claude Code](https://code.claude.com/docs)
@y
Official documentation: [Claude Code](https://code.claude.com/docs)
@z

@x
## Quick start
@y
## Quick start
@z

@x
Launch Claude Code in a sandbox by pointing it at a project directory:
@y
Launch Claude Code in a sandbox by pointing it at a project directory:
@z

@x
```console
$ sbx run claude ~/my-project
```
@y
```console
$ sbx run claude ~/my-project
```
@z

@x
To start Claude with a specific prompt in the current directory:
@y
To start Claude with a specific prompt in the current directory:
@z

@x
```console
$ sbx run --name my-sandbox claude -- "Add error handling to the login function"
```
@y
```console
$ sbx run --name my-sandbox claude -- "Add error handling to the login function"
```
@z

@x
Everything after `--` is passed directly to Claude Code. You can also pipe in a
prompt from a file with `-- "$(cat prompt.txt)"`.
@y
Everything after `--` is passed directly to Claude Code. You can also pipe in a
prompt from a file with `-- "$(cat prompt.txt)"`.
@z

@x
To create a [mountless sandbox](../usage.md#choose-a-workspace), use
`sbx create` without a workspace path, then attach by name.
@y
To create a [mountless sandbox](../usage.md#choose-a-workspace), use
`sbx create` without a workspace path, then attach by name.
@z

@x
## Authentication
@y
## Authentication
@z

@x
For the default Anthropic models, Claude Code requires either an Anthropic
API key or a Claude subscription. For other models, see
[Use a local model](#use-a-local-model).
@y
For the default Anthropic models, Claude Code requires either an Anthropic
API key or a Claude subscription. For other models, see
[Use a local model](#use-a-local-model).
@z

@x
**API key**: Store your key using
[stored secrets](../configuration/credentials.md#stored-secrets):
@y
**API key**: Store your key using
[stored secrets](../configuration/credentials.md#stored-secrets):
@z

@x
```console
$ sbx secret set anthropic
```
@y
```console
$ sbx secret set anthropic
```
@z

@x
**Claude subscription**: If no API key is set, use the `/login` command inside
Claude Code to authenticate via OAuth.
@y
**Claude subscription**: If no API key is set, use the `/login` command inside
Claude Code to authenticate via OAuth.
@z

@x
## Configuration
@y
## Configuration
@z

@x
Sandboxes don't pick up user-level configuration from your host, such as
`~/.claude`. Only project-level configuration in the working directory is
available inside the sandbox. See
[Why doesn't the sandbox use my user-level agent configuration?](../faq.md#why-doesnt-the-sandbox-use-my-user-level-agent-configuration)
for workarounds.
@y
Sandboxes don't pick up user-level configuration from your host, such as
`~/.claude`. Only project-level configuration in the working directory is
available inside the sandbox. See
[Why doesn't the sandbox use my user-level agent configuration?](../faq.md#why-doesnt-the-sandbox-use-my-user-level-agent-configuration)
for workarounds.
@z

@x
### Remote control
@y
### Remote control
@z

@x
To use Claude Code's `/remote-control` command inside a sandbox, turn on
[`claude.remoteControl`](../configuration/settings.md#clauderemotecontrol):
@y
To use Claude Code's `/remote-control` command inside a sandbox, turn on
[`claude.remoteControl`](../configuration/settings.md#clauderemotecontrol):
@z

@x
```console
$ sbx settings set claude.remoteControl true
```
@y
```console
$ sbx settings set claude.remoteControl true
```
@z

@x
### Default startup command
@y
### Default startup command
@z

@x
Without extra args, the sandbox runs:
@y
Without extra args, the sandbox runs:
@z

@x
```text
claude --dangerously-skip-permissions
```
@y
```text
claude --dangerously-skip-permissions
```
@z

@x
Arguments after `--` are added after the default flags when the first one is
itself a flag (begins with `-`), so `--dangerously-skip-permissions` is
preserved:
@y
Arguments after `--` are added after the default flags when the first one is
itself a flag (begins with `-`), so `--dangerously-skip-permissions` is
preserved:
@z

@x
```console
$ sbx run --name <sandbox-name> -- -c   # runs claude --dangerously-skip-permissions -c
```
@y
```console
$ sbx run --name <sandbox-name> -- -c   # runs claude --dangerously-skip-permissions -c
```
@z

@x
When the first argument is a bare word, such as the `agents` subcommand, it
replaces the defaults instead.
@y
When the first argument is a bare word, such as the `agents` subcommand, it
replaces the defaults instead.
@z

@x
See the [Claude Code CLI reference](https://code.claude.com/docs/en/cli-reference)
for available options.
@y
See the [Claude Code CLI reference](https://code.claude.com/docs/en/cli-reference)
for available options.
@z

@x
## Agents view
@y
## Agents view
@z

@x
Claude Code's [agents view](https://code.claude.com/docs/en/agent-view)
starts background sessions that run tasks in parallel. Pair it with
[clone mode](../workflows/git.md#clone-mode) to keep their changes inside the
sandbox:
@y
Claude Code's [agents view](https://code.claude.com/docs/en/agent-view)
starts background sessions that run tasks in parallel. Pair it with
[clone mode](../workflows/git.md#clone-mode) to keep their changes inside the
sandbox:
@z

@x
```console
$ sbx run --clone claude . -- agents
```
@y
```console
$ sbx run --clone claude . -- agents
```
@z

@x
This invocation replaces the
[default startup command](#default-startup-command), so it doesn't
include `--dangerously-skip-permissions` and you can't switch to
bypass-permissions mode inside the sandbox. To work around this, either
use Claude Code's auto mode or pass the flag explicitly:
@y
This invocation replaces the
[default startup command](#default-startup-command), so it doesn't
include `--dangerously-skip-permissions` and you can't switch to
bypass-permissions mode inside the sandbox. To work around this, either
use Claude Code's auto mode or pass the flag explicitly:
@z

@x
```console
$ sbx run --clone claude . -- --dangerously-skip-permissions agents
```
@y
```console
$ sbx run --clone claude . -- --dangerously-skip-permissions agents
```
@z

@x
Claude Code may use branches or worktrees to keep changes from its background
sessions separate. This depends on the task, Claude Code configuration, and
project instructions. The `--clone` flag doesn't control this behavior. Claude
Code creates any branches and worktrees inside the sandbox, not in your host
checkout.
@y
Claude Code may use branches or worktrees to keep changes from its background
sessions separate. This depends on the task, Claude Code configuration, and
project instructions. The `--clone` flag doesn't control this behavior. Claude
Code creates any branches and worktrees inside the sandbox, not in your host
checkout.
@z

@x
To review a branch created by a session, fetch the
`sandbox-<sandbox-name>` remote from the host:
@y
To review a branch created by a session, fetch the
`sandbox-<sandbox-name>` remote from the host:
@z

@x
```console
$ git fetch sandbox-<sandbox-name>
$ git diff main..sandbox-<sandbox-name>/<branch>
```
@y
```console
$ git fetch sandbox-<sandbox-name>
$ git diff main..sandbox-<sandbox-name>/<branch>
```
@z

@x
See [Git workflows](../workflows/git.md) for clone-mode details.
@y
See [Git workflows](../workflows/git.md) for clone-mode details.
@z

@x
## Base image
@y
## Base image
@z

@x
The sandbox uses `docker/sandbox-templates:claude-code`. See
[Base images](/manuals/ai/sandboxes/customize/author/base-images.md) to build your own image on top of
this base.
@y
The sandbox uses `docker/sandbox-templates:claude-code`. See
[Base images](manuals/ai/sandboxes/customize/author/base-images.md) to build your own image on top of
this base.
@z

@x
## Use a local model
@y
## Use a local model
@z

@x
For local models, hosted providers, and custom inference endpoints, see
[Use local and hosted models](../configuration/models.md).
@y
For local models, hosted providers, and custom inference endpoints, see
[Use local and hosted models](../configuration/models.md).
@z
