%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
title: Cursor
@y
title: Cursor
@z

@x
description: |
  Use Cursor in Docker Sandboxes with API key or proxy-managed OAuth
  authentication.
keywords: docker sandboxes, cursor, cursor agent, ai agent, sbx
@y
description: |
  Use Cursor in Docker Sandboxes with API key or proxy-managed OAuth
  authentication.
keywords: docker sandboxes, cursor, cursor agent, ai agent, sbx
@z

@x
This guide covers authentication, configuration, and usage of Cursor in a
sandboxed environment.
@y
This guide covers authentication, configuration, and usage of Cursor in a
sandboxed environment.
@z

@x
Official documentation: [Cursor CLI](https://cursor.com/cli)
@y
Official documentation: [Cursor CLI](https://cursor.com/cli)
@z

@x
## Quick start
@y
## Quick start
@z

@x
Create a sandbox and run Cursor for a project directory:
@y
Create a sandbox and run Cursor for a project directory:
@z

@x
```console
$ sbx run cursor ~/my-project
```
@y
```console
$ sbx run cursor ~/my-project
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
$ sbx run cursor
```
@y
```console
$ cd ~/my-project
$ sbx run cursor
```
@z

@x
## Authentication
@y
## Authentication
@z

@x
Cursor supports two authentication methods: an API key or OAuth.
@y
Cursor supports two authentication methods: an API key or OAuth.
@z

@x
**API key**: Store your Cursor API key using
[stored secrets](../configuration/credentials.md#stored-secrets):
@y
**API key**: Store your Cursor API key using
[stored secrets](../configuration/credentials.md#stored-secrets):
@z

@x
```console
$ sbx secret set cursor
```
@y
```console
$ sbx secret set cursor
```
@z

@x
**OAuth**: If no API key is set, Cursor prompts you to sign in interactively
on first run. The proxy intercepts the token exchange with
`api2.cursor.sh/auth/poll`, so credentials are managed by the host and aren't
stored inside the sandbox.
@y
**OAuth**: If no API key is set, Cursor prompts you to sign in interactively
on first run. The proxy intercepts the token exchange with
`api2.cursor.sh/auth/poll`, so credentials are managed by the host and aren't
stored inside the sandbox.
@z

@x
## Configuration
@y
## Configuration
@z

@x
Sandboxes don't pick up user-level configuration from your host, such as
`~/.cursor`. Only project-level configuration in the working directory is
available inside the sandbox. See
[Why doesn't the sandbox use my user-level agent configuration?](../faq.md#why-doesnt-the-sandbox-use-my-user-level-agent-configuration)
for workarounds.
@y
Sandboxes don't pick up user-level configuration from your host, such as
`~/.cursor`. Only project-level configuration in the working directory is
available inside the sandbox. See
[Why doesn't the sandbox use my user-level agent configuration?](../faq.md#why-doesnt-the-sandbox-use-my-user-level-agent-configuration)
for workarounds.
@z

@x
Cursor reads `AGENTS.md` from the workspace for agent-specific instructions.
@y
Cursor reads `AGENTS.md` from the workspace for agent-specific instructions.
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
cursor-agent --yolo
```
@y
```text
cursor-agent --yolo
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
$ sbx run cursor -- -p "refactor this"   # runs cursor-agent --yolo -p "refactor this"
```
@y
```console
$ sbx run cursor -- -p "refactor this"   # runs cursor-agent --yolo -p "refactor this"
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
Template: `docker/sandbox-templates:cursor-agent-docker`
@y
Template: `docker/sandbox-templates:cursor-agent-docker`
@z

@x
Preconfigured with HTTP/1.1 and server-sent events for agent traffic so
requests flow through the host proxy. Authentication state is persisted across
sandbox restarts.
@y
Preconfigured with HTTP/1.1 and server-sent events for agent traffic so
requests flow through the host proxy. Authentication state is persisted across
sandbox restarts.
@z

@x
See [Customize](../customize/) to pre-install tools or customize this
environment.
@y
See [Customize](../customize/) to pre-install tools or customize this
environment.
@z
