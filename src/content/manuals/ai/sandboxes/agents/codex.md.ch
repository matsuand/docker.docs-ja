%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
title: Codex
@y
title: Codex
@z

@x
description: |
  Use OpenAI Codex in Docker Sandboxes with API key authentication and YOLO
  mode configuration.
keywords: docker sandboxes, codex, openai, ai agent, sbx
@y
description: |
  Use OpenAI Codex in Docker Sandboxes with API key authentication and YOLO
  mode configuration.
keywords: docker sandboxes, codex, openai, ai agent, sbx
@z

@x
This guide covers authentication, configuration, and usage of Codex in a
sandboxed environment.
@y
This guide covers authentication, configuration, and usage of Codex in a
sandboxed environment.
@z

@x
Official documentation: [Codex CLI](https://developers.openai.com/codex/cli)
@y
Official documentation: [Codex CLI](https://developers.openai.com/codex/cli)
@z

@x
## Quick start
@y
## Quick start
@z

@x
Create a sandbox and run Codex for a project directory:
@y
Create a sandbox and run Codex for a project directory:
@z

@x
```console
$ sbx run codex ~/my-project
```
@y
```console
$ sbx run codex ~/my-project
```
@z

@x
`sbx run` defaults the workspace to the current directory:
@y
`sbx run` defaults the workspace to the current directory:
@z

@x
```console
$ cd ~/my-project
$ sbx run codex
```
@y
```console
$ cd ~/my-project
$ sbx run codex
```
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
If you haven't stored an OpenAI credential, `sbx run codex` prompts you to
authenticate on your host before launching the sandbox. The flow runs on the
host, so credentials are never exposed inside the sandbox.
@y
If you haven't stored an OpenAI credential, `sbx run codex` prompts you to
authenticate on your host before launching the sandbox. The flow runs on the
host, so credentials are never exposed inside the sandbox.
@z

@x
To set up authentication ahead of time, choose one of the following methods.
@y
To set up authentication ahead of time, choose one of the following methods.
@z

@x
**OAuth**: Start the OAuth flow on your host with:
@y
**OAuth**: Start the OAuth flow on your host with:
@z

@x
```console
$ sbx secret set openai --oauth
```
@y
```console
$ sbx secret set openai --oauth
```
@z

@x
This opens a browser window for authentication and stores the resulting tokens
in your OS keychain. The OAuth flow runs on the host, not inside the sandbox,
so browser-based authentication works without any extra setup.
@y
This opens a browser window for authentication and stores the resulting tokens
in your OS keychain. The OAuth flow runs on the host, not inside the sandbox,
so browser-based authentication works without any extra setup.
@z

@x
**API key**: Store your OpenAI API key using
[stored secrets](../configuration/credentials.md#stored-secrets):
@y
**API key**: Store your OpenAI API key using
[stored secrets](../configuration/credentials.md#stored-secrets):
@z

@x
```console
$ sbx secret set openai
```
@y
```console
$ sbx secret set openai
```
@z

@x
See [Credentials](../configuration/credentials.md) for more details.
@y
See [Credentials](../configuration/credentials.md) for more details.
@z

@x
## Configuration
@y
## Configuration
@z

@x
Sandboxes don't pick up user-level configuration from your host, such as
`~/.codex`. Only project-level configuration in the working directory is
available inside the sandbox. See
[Why doesn't the sandbox use my user-level agent configuration?](../faq.md#why-doesnt-the-sandbox-use-my-user-level-agent-configuration)
for workarounds.
@y
Sandboxes don't pick up user-level configuration from your host, such as
`~/.codex`. Only project-level configuration in the working directory is
available inside the sandbox. See
[Why doesn't the sandbox use my user-level agent configuration?](../faq.md#why-doesnt-the-sandbox-use-my-user-level-agent-configuration)
for workarounds.
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
codex --dangerously-bypass-approvals-and-sandbox
```
@y
```text
codex --dangerously-bypass-approvals-and-sandbox
```
@z

@x
Arguments after `--` are added after the default flags when the first one is
itself a flag (begins with `-`). A bare word — such as a prompt — replaces the
defaults instead, so lead with the flag to keep bypass mode:
@y
Arguments after `--` are added after the default flags when the first one is
itself a flag (begins with `-`). A bare word — such as a prompt — replaces the
defaults instead, so lead with the flag to keep bypass mode:
@z

@x
```console
$ sbx run --name <sandbox-name> -- --dangerously-bypass-approvals-and-sandbox "fix the build"
```
@y
```console
$ sbx run --name <sandbox-name> -- --dangerously-bypass-approvals-and-sandbox "fix the build"
```
@z

@x
## Base image
@y
## Base image
@z

@x
Template: `docker/sandbox-templates:codex`
@y
Template: `docker/sandbox-templates:codex`
@z

@x
See [Customize](../customize/) to pre-install tools or customize this
environment.
@y
See [Customize](../customize/) to pre-install tools or customize this
environment.
@z
