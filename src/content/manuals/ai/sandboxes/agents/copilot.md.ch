%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
title: Copilot
@y
title: Copilot
@z

@x
description: |
  Use GitHub Copilot in Docker Sandboxes with GitHub token authentication and
  trusted folder configuration.
keywords: docker sandboxes, github copilot, ai agent, github token, sbx
@y
description: |
  Use GitHub Copilot in Docker Sandboxes with GitHub token authentication and
  trusted folder configuration.
keywords: docker sandboxes, github copilot, ai agent, github token, sbx
@z

@x
This guide covers authentication, configuration, and usage of GitHub Copilot
in a sandboxed environment.
@y
This guide covers authentication, configuration, and usage of GitHub Copilot
in a sandboxed environment.
@z

@x
Official documentation: [GitHub Copilot CLI](https://docs.github.com/en/copilot/how-tos/copilot-cli)
@y
Official documentation: [GitHub Copilot CLI](https://docs.github.com/en/copilot/how-tos/copilot-cli)
@z

@x
## Quick start
@y
## Quick start
@z

@x
Create a sandbox and run Copilot for a project directory:
@y
Create a sandbox and run Copilot for a project directory:
@z

@x
```console
$ sbx run copilot ~/my-project
```
@y
```console
$ sbx run copilot ~/my-project
```
@z

@x
The workspace parameter is optional and defaults to the current directory:
@y
The workspace parameter is optional and defaults to the current directory:
@z

@x
```console
$ cd ~/my-project
$ sbx run copilot
```
@y
```console
$ cd ~/my-project
$ sbx run copilot
```
@z

@x
## Authentication
@y
## Authentication
@z

@x
Copilot requires a GitHub token with Copilot access. Store your token using
[stored secrets](../configuration/credentials.md#stored-secrets):
@y
Copilot requires a GitHub token with Copilot access. Store your token using
[stored secrets](../configuration/credentials.md#stored-secrets):
@z

@x
```console
$ sbx secret set github --command 'gh auth token'
```
@y
```console
$ sbx secret set github --command 'gh auth token'
```
@z

@x
## Configuration
@y
## Configuration
@z

@x
Sandboxes don't pick up user-level configuration from your host. Only
project-level configuration in the working directory is available inside the
sandbox. See
[Why doesn't the sandbox use my user-level agent configuration?](../faq.md#why-doesnt-the-sandbox-use-my-user-level-agent-configuration)
for workarounds.
@y
Sandboxes don't pick up user-level configuration from your host. Only
project-level configuration in the working directory is available inside the
sandbox. See
[Why doesn't the sandbox use my user-level agent configuration?](../faq.md#why-doesnt-the-sandbox-use-my-user-level-agent-configuration)
for workarounds.
@z

@x
Copilot is configured to trust the workspace directory by default, so it
operates without repeated confirmations for workspace files.
@y
Copilot is configured to trust the workspace directory by default, so it
operates without repeated confirmations for workspace files.
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
copilot --yolo
```
@y
```text
copilot --yolo
```
@z

@x
Arguments after `--` are added after the default flags when the first one is
itself a flag (begins with `-`), so `--yolo` is preserved:
@y
Arguments after `--` are added after the default flags when the first one is
itself a flag (begins with `-`), so `--yolo` is preserved:
@z

@x
```console
$ sbx run copilot -- -p "review this PR"   # runs copilot --yolo -p "review this PR"
```
@y
```console
$ sbx run copilot -- -p "review this PR"   # runs copilot --yolo -p "review this PR"
```
@z

@x
When the first argument is a bare word — a subcommand or prompt — it replaces
the defaults instead.
@y
When the first argument is a bare word — a subcommand or prompt — it replaces
the defaults instead.
@z

@x
## Base image
@y
## Base image
@z

@x
Template: `docker/sandbox-templates:copilot`
@y
Template: `docker/sandbox-templates:copilot`
@z

@x
Preconfigured to trust the workspace directory.
@y
Preconfigured to trust the workspace directory.
@z

@x
See [Customize](../customize/) to pre-install tools or customize this
environment.
@y
See [Customize](../customize/) to pre-install tools or customize this
environment.
@z
