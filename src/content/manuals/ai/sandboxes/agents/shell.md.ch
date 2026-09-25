%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
title: Shell
@y
title: Shell
@z

@x
description: Run an agent-less sandbox with a Bash login shell for manual setup, testing custom agent implementations, or inspecting a running environment.
keywords: sandboxes, sbx, shell, agent, manual setup, testing
@y
description: Run an agent-less sandbox with a Bash login shell for manual setup, testing custom agent implementations, or inspecting a running environment.
keywords: sandboxes, sbx, shell, agent, manual setup, testing
@z

@x
{{% include "sandboxes-local-scope.md" %}}
@y
{{% include "sandboxes-local-scope.md" %}}
@z

@x
`sbx run shell` drops you into a Bash login shell inside a sandbox with no
pre-installed agent binary. It's useful for installing and configuring
agents manually, testing custom implementations, or inspecting a running
environment.
@y
`sbx run shell` drops you into a Bash login shell inside a sandbox with no
pre-installed agent binary. It's useful for installing and configuring
agents manually, testing custom implementations, or inspecting a running
environment.
@z

@x
```console
$ sbx run shell ~/my-project
```
@y
```console
$ sbx run shell ~/my-project
```
@z

@x
`sbx run` defaults the workspace to the current directory. To run a one-off
command instead of an interactive shell, pass it after `--`:
@y
`sbx run` defaults the workspace to the current directory. To run a one-off
command instead of an interactive shell, pass it after `--`:
@z

@x
```console
$ sbx run shell -- -c "echo 'Hello from sandbox'"
```
@y
```console
$ sbx run shell -- -c "echo 'Hello from sandbox'"
```
@z

@x
To create a [mountless sandbox](../usage.md#choose-a-workspace), use
`sbx create` without a workspace path, then attach by name:
@y
To create a [mountless sandbox](../usage.md#choose-a-workspace), use
`sbx create` without a workspace path, then attach by name:
@z

@x
```console
$ sbx create --name scratch shell
$ sbx run --name scratch
```
@y
```console
$ sbx create --name scratch shell
$ sbx run --name scratch
```
@z

@x
## Default startup command
@y
## Default startup command
@z

@x
Without extra args, the sandbox runs `bash -l`. When the first argument after
`--` is a flag (begins with `-`), it's added after `-l`, so login-shell
behavior is preserved:
@y
Without extra args, the sandbox runs `bash -l`. When the first argument after
`--` is a flag (begins with `-`), it's added after `-l`, so login-shell
behavior is preserved:
@z

@x
```console
$ sbx run shell -- -c "echo hi"   # runs bash -l -c "echo hi"
```
@y
```console
$ sbx run shell -- -c "echo hi"   # runs bash -l -c "echo hi"
```
@z

@x
When the first argument is a bare word, it replaces `-l` instead.
@y
When the first argument is a bare word, it replaces `-l` instead.
@z

@x
Store credentials using [stored secrets](../configuration/credentials.md#stored-secrets)
before running the sandbox. The proxy injects them into outbound API requests;
credentials are never stored inside the VM:
@y
Store credentials using [stored secrets](../configuration/credentials.md#stored-secrets)
before running the sandbox. The proxy injects them into outbound API requests;
credentials are never stored inside the VM:
@z

@x
```console
$ sbx secret set anthropic
$ sbx secret set openai
```
@y
```console
$ sbx secret set anthropic
$ sbx secret set openai
```
@z

@x
Once inside the shell, you can install agents using their standard methods,
for example `npm install -g @continuedev/cli`. For complex setups, build a
[workload kit](/manuals/ai/sandboxes/customize/_index.md) instead of installing
interactively each time.
@y
Once inside the shell, you can install agents using their standard methods,
for example `npm install -g @continuedev/cli`. For complex setups, build a
[workload kit](manuals/ai/sandboxes/customize/_index.md) instead of installing
interactively each time.
@z

@x
## Base image
@y
## Base image
@z

@x
The shell sandbox uses the `shell` base image — the common base environment
without a pre-installed agent.
@y
The shell sandbox uses the `shell` base image — the common base environment
without a pre-installed agent.
@z
