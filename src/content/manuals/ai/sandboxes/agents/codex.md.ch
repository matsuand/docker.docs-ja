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
@y
description: |
  Use OpenAI Codex in Docker Sandboxes with API key authentication and YOLO
  mode configuration.
@z

@x
{{< summary-bar feature_name="Docker Sandboxes sbx" >}}
@y
{{< summary-bar feature_name="Docker Sandboxes sbx" >}}
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
The workspace parameter is optional and defaults to the current directory:
@y
The workspace parameter is optional and defaults to the current directory:
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
## Authentication
@y
## Authentication
@z

@x
Codex supports two authentication methods: an API key or OAuth.
@y
Codex supports two authentication methods: an API key or OAuth.
@z

@x
**API key**: Store your OpenAI API key using
[stored secrets](../security/credentials.md#stored-secrets):
@y
**API key**: Store your OpenAI API key using
[stored secrets](../security/credentials.md#stored-secrets):
@z

@x
```console
$ sbx secret set -g openai
```
@y
```console
$ sbx secret set -g openai
```
@z

@x
Alternatively, export the `OPENAI_API_KEY` environment variable in your shell
before running the sandbox.
@y
Alternatively, export the `OPENAI_API_KEY` environment variable in your shell
before running the sandbox.
@z

@x
**OAuth**: If you prefer not to use an API key, start the OAuth flow on your
host with:
@y
**OAuth**: If you prefer not to use an API key, start the OAuth flow on your
host with:
@z

@x
```console
$ sbx secret set -g openai --oauth
```
@y
```console
$ sbx secret set -g openai --oauth
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
See [Credentials](../security/credentials.md) for more details.
@y
See [Credentials](../security/credentials.md) for more details.
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
The sandbox runs Codex without approval prompts by default. Pass additional
Codex CLI options after `--`:
@y
The sandbox runs Codex without approval prompts by default. Pass additional
Codex CLI options after `--`:
@z

@x
```console
$ sbx run codex --name <sandbox-name> -- <codex-options>
```
@y
```console
$ sbx run codex --name <sandbox-name> -- <codex-options>
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
Preconfigured to run without approval prompts.
@y
Preconfigured to run without approval prompts.
@z

@x
See [Custom environments](custom-environments.md) to pre-install tools or
customize this environment.
@y
See [Custom environments](custom-environments.md) to pre-install tools or
customize this environment.
@z
