%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
title: Codex sandbox
description: |
  Use OpenAI Codex in Docker Sandboxes with API key authentication and YOLO
  mode configuration.
keywords: docker, sandboxes, codex, openai, ai agent, authentication, yolo mode
@y
title: Codex sandbox
description: |
  Use OpenAI Codex in Docker Sandboxes with API key authentication and YOLO
  mode configuration.
keywords: docker, sandboxes, codex, openai, ai agent, authentication, yolo mode
@z

@x
{{< summary-bar feature_name="Docker Sandboxes" >}}
@y
{{< summary-bar feature_name="Docker Sandboxes" >}}
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
$ docker sandbox run codex ~/my-project
```
@y
```console
$ docker sandbox run codex ~/my-project
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
$ docker sandbox run codex
```
@y
```console
$ cd ~/my-project
$ docker sandbox run codex
```
@z

@x
## Authentication
@y
## Authentication
@z

@x
Codex requires an OpenAI API key. Credentials are scoped per sandbox.
@y
Codex requires an OpenAI API key. Credentials are scoped per sandbox.
@z

@x
Set the `OPENAI_API_KEY` environment variable in your shell configuration file.
@y
Set the `OPENAI_API_KEY` environment variable in your shell configuration file.
@z

@x
Docker Sandboxes use a daemon process that doesn't inherit environment
variables from your current shell session. To make your API key available to
sandboxes, set it globally in your shell configuration file.
@y
Docker Sandboxes use a daemon process that doesn't inherit environment
variables from your current shell session. To make your API key available to
sandboxes, set it globally in your shell configuration file.
@z

@x
Add the API key to your shell configuration file:
@y
Add the API key to your shell configuration file:
@z

@x
```plaintext {title="~/.bashrc or ~/.zshrc"}
export OPENAI_API_KEY=sk-xxxxx
```
@y
```plaintext {title="~/.bashrc or ~/.zshrc"}
export OPENAI_API_KEY=sk-xxxxx
```
@z

@x
Apply the changes:
@y
Apply the changes:
@z

@x
1. Source your shell configuration: `source ~/.bashrc` (or `~/.zshrc`)
2. Restart Docker Desktop so the daemon picks up the new environment variable
3. Create and run your sandbox:
@y
1. Source your shell configuration: `source ~/.bashrc` (or `~/.zshrc`)
2. Restart Docker Desktop so the daemon picks up the new environment variable
3. Create and run your sandbox:
@z

@x
```console
$ docker sandbox create codex ~/project
$ docker sandbox run <sandbox-name>
```
@y
```console
$ docker sandbox create codex ~/project
$ docker sandbox run <sandbox-name>
```
@z

@x
The sandbox detects the environment variable and uses it automatically.
@y
The sandbox detects the environment variable and uses it automatically.
@z

@x
## Configuration
@y
## Configuration
@z

@x
Codex supports a YOLO mode that disables safety checks and approval prompts.
This mode grants the agent full access to your sandbox environment without
interactive confirmation.
@y
Codex supports a YOLO mode that disables safety checks and approval prompts.
This mode grants the agent full access to your sandbox environment without
interactive confirmation.
@z

@x
Configure YOLO mode in `~/.codex/config.toml`:
@y
Configure YOLO mode in `~/.codex/config.toml`:
@z

@x
```toml
approval_policy = "never"
sandbox_mode = "danger-full-access"
```
@y
```toml
approval_policy = "never"
sandbox_mode = "danger-full-access"
```
@z

@x
With these settings, Codex runs without approval prompts.
@y
With these settings, Codex runs without approval prompts.
@z

@x
### Pass options at runtime
@y
### Pass options at runtime
@z

@x
Pass Codex CLI options after the sandbox name and a `--` separator:
@y
Pass Codex CLI options after the sandbox name and a `--` separator:
@z

@x
```console
$ docker sandbox run <sandbox-name> -- --dangerously-bypass-approvals-and-sandbox
```
@y
```console
$ docker sandbox run <sandbox-name> -- --dangerously-bypass-approvals-and-sandbox
```
@z

@x
This flag enables YOLO mode for a single session without modifying the
configuration file.
@y
This flag enables YOLO mode for a single session without modifying the
configuration file.
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
Codex launches with `--dangerously-bypass-approvals-and-sandbox` by default when YOLO mode is configured.
@y
Codex launches with `--dangerously-bypass-approvals-and-sandbox` by default when YOLO mode is configured.
@z

@x
See [Custom templates](../templates.md) to build your own agent images.
@y
See [Custom templates](../templates.md) to build your own agent images.
@z
