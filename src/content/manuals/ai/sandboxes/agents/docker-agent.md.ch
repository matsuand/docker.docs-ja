%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

% .md リンクへの (no slash) 対応
% snip 対応 (一部)

@x
title: Docker Agent
@y
title: Docker Agent
@z

@x
description: |
  Use Docker Agent in Docker Sandboxes with multi-provider authentication
  supporting OpenAI, Anthropic, and more.
keywords: docker sandboxes, docker agent, openai, anthropic, sbx
@y
description: |
  Use Docker Agent in Docker Sandboxes with multi-provider authentication
  supporting OpenAI, Anthropic, and more.
keywords: docker sandboxes, docker agent, openai, anthropic, sbx
@z

@x
{{% include "sandboxes-local-scope.md" %}}
@y
{{% include "sandboxes-local-scope.md" %}}
@z

@x
Official documentation: [Docker Agent](/manuals/ai/docker-agent/_index.md)
@y
Official documentation: [Docker Agent](manuals/ai/docker-agent/_index.md)
@z

@x
## Quick start
@y
## Quick start
@z

@x
Create a sandbox and run Docker Agent for a project directory:
@y
Create a sandbox and run Docker Agent for a project directory:
@z

@x
```console
$ sbx run docker-agent ~/my-project
```
@y
```console
$ sbx run docker-agent ~/my-project
```
@z

@x
`sbx run docker-agent` defaults the workspace to the current directory, so you
can run it from inside your project.
@y
`sbx run docker-agent` defaults the workspace to the current directory, so you
can run it from inside your project.
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
Docker Agent supports multiple providers. Store keys for the providers you want
to use with [stored secrets](../configuration/credentials.md#stored-secrets):
@y
Docker Agent supports multiple providers. Store keys for the providers you want
to use with [stored secrets](../configuration/credentials.md#stored-secrets):
@z

@x
```console
$ sbx secret set openai
$ sbx secret set anthropic
$ sbx secret set google
$ sbx secret set xai
$ sbx secret set nebius
$ sbx secret set mistral
$ sbx secret set openrouter
```
@y
```console
$ sbx secret set openai
$ sbx secret set anthropic
$ sbx secret set google
$ sbx secret set xai
$ sbx secret set nebius
$ sbx secret set mistral
$ sbx secret set openrouter
```
@z

@x
You only need to configure the providers you want to use. Docker Agent detects
available credentials and routes requests to the appropriate provider.
@y
You only need to configure the providers you want to use. Docker Agent detects
available credentials and routes requests to the appropriate provider.
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
docker-agent run --yolo
```
@y
```text
docker-agent run --yolo
```
@z

@x
Arguments after `--` are added after the default flags when the first one is
itself a flag (begins with `-`). When the first argument is a bare word — such
as the `run` subcommand or a config file — it replaces the defaults, so include
`run --yolo` yourself:
@y
Arguments after `--` are added after the default flags when the first one is
itself a flag (begins with `-`). When the first argument is a bare word — such
as the `run` subcommand or a config file — it replaces the defaults, so include
`run --yolo` yourself:
@z

% snip command...

@x
## Base image
@y
## Base image
@z

@x
The sandbox uses `docker/sandbox-templates:docker-agent`. See
[Base images](/manuals/ai/sandboxes/customize/author/base-images.md) to build your own image on top of
this base.
@y
The sandbox uses `docker/sandbox-templates:docker-agent`. See
[Base images](manuals/ai/sandboxes/customize/author/base-images.md) to build your own image on top of
this base.
@z
