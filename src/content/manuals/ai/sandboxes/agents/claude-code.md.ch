%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

% __SUBDIR__ 対応

@x
title: Claude Code sandbox
description: |
  Use Claude Code in Docker Sandboxes with authentication, configuration, and
  YOLO mode for AI-assisted development.
keywords: docker, sandboxes, claude code, anthropic, ai agent, authentication, configuration
@y
title: Claude Code sandbox
description: |
  Use Claude Code in Docker Sandboxes with authentication, configuration, and
  YOLO mode for AI-assisted development.
keywords: docker, sandboxes, claude code, anthropic, ai agent, authentication, configuration
@z

@x
{{< summary-bar feature_name="Docker Sandboxes" >}}
@y
{{< summary-bar feature_name="Docker Sandboxes" >}}
@z

@x
This guide covers authentication, configuration files, and common options for
running Claude Code in a sandboxed environment.
@y
This guide covers authentication, configuration files, and common options for
running Claude Code in a sandboxed environment.
@z

@x
## Quick start
@y
## Quick start
@z

@x
To create a sandbox and run Claude Code for a project directory:
@y
To create a sandbox and run Claude Code for a project directory:
@z

@x
```console
$ docker sandbox run claude ~/my-project
```
@y
```console
$ docker sandbox run claude ~/my-project
```
@z

@x
### Pass a prompt directly
@y
### Pass a prompt directly
@z

@x
Start Claude with a specific prompt:
@y
Start Claude with a specific prompt:
@z

@x
```console
$ docker sandbox run <sandbox-name> -- "Add error handling to the login function"
```
@y
```console
$ docker sandbox run <sandbox-name> -- "Add error handling to the login function"
```
@z

@x
Or:
@y
Or:
@z

@x
```console
$ docker sandbox run <sandbox-name> -- "$(cat prompt.txt)"
```
@y
```console
$ docker sandbox run <sandbox-name> -- "$(cat prompt.txt)"
```
@z

@x
This starts Claude and immediately processes the prompt.
@y
This starts Claude and immediately processes the prompt.
@z

@x
## Authentication
@y
## Authentication
@z

@x
Claude Code requires an Anthropic API key. Credentials are scoped per sandbox.
@y
Claude Code requires an Anthropic API key. Credentials are scoped per sandbox.
@z

@x
### Environment variable (recommended)
@y
### Environment variable (recommended)
@z

@x
The recommended approach is to set the `ANTHROPIC_API_KEY` environment variable in your shell configuration file.
@y
The recommended approach is to set the `ANTHROPIC_API_KEY` environment variable in your shell configuration file.
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
export ANTHROPIC_API_KEY=sk-ant-api03-xxxxx
```
@y
```plaintext {title="~/.bashrc or ~/.zshrc"}
export ANTHROPIC_API_KEY=sk-ant-api03-xxxxx
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
$ docker sandbox create claude ~/project
$ docker sandbox run <sandbox-name>
```
@y
```console
$ docker sandbox create claude ~/project
$ docker sandbox run <sandbox-name>
```
@z

@x
The sandbox detects the environment variable and uses it automatically.
@y
The sandbox detects the environment variable and uses it automatically.
@z

@x
### Interactive authentication
@y
### Interactive authentication
@z

@x
If the `ANTHROPIC_API_KEY` environment variable is not set, Claude Code prompts
you to authenticate interactively when it starts. You can also trigger the login
flow manually using the `/login` command within Claude Code.
@y
If the `ANTHROPIC_API_KEY` environment variable is not set, Claude Code prompts
you to authenticate interactively when it starts. You can also trigger the login
flow manually using the `/login` command within Claude Code.
@z

@x
When using interactive authentication:
@y
When using interactive authentication:
@z

@x
- You must authenticate each sandbox separately
- If the sandbox is removed or destroyed, you'll need to authenticate again when you recreate it
- Authentication sessions aren't persisted outside the sandbox
- No fallback authentication methods are used
@y
- You must authenticate each sandbox separately
- If the sandbox is removed or destroyed, you'll need to authenticate again when you recreate it
- Authentication sessions aren't persisted outside the sandbox
- No fallback authentication methods are used
@z

@x
To avoid repeated authentication, set the `ANTHROPIC_API_KEY` environment variable.
@y
To avoid repeated authentication, set the `ANTHROPIC_API_KEY` environment variable.
@z

@x
## Configuration
@y
## Configuration
@z

@x
Claude Code can be configured through CLI options. Any arguments you pass after
the sandbox name and a `--` separator are passed directly to Claude Code.
@y
Claude Code can be configured through CLI options. Any arguments you pass after
the sandbox name and a `--` separator are passed directly to Claude Code.
@z

@x
Pass options after the sandbox name:
@y
Pass options after the sandbox name:
@z

@x
```console
$ docker sandbox run <sandbox-name> -- [claude-options]
```
@y
```console
$ docker sandbox run <sandbox-name> -- [claude-options]
```
@z

@x
For example:
@y
For example:
@z

@x
```console
$ docker sandbox run <sandbox-name> -- --continue
```
@y
```console
$ docker sandbox run <sandbox-name> -- --continue
```
@z

@x
See the [Claude Code CLI reference](https://code.claude.com/docs/en/cli-reference)
for available options.
@y
See the [Claude Code CLI reference](https://code.claude.com/docs/en/cli-reference)
for available options.
@z

@x
## Base image
@y
## Base image
@z

@x
Template: `docker/sandbox-templates:claude-code`
@y
Template: `docker/sandbox-templates:claude-code`
@z

@x
Claude Code launches with `--dangerously-skip-permissions` by default in sandboxes.
@y
Claude Code launches with `--dangerously-skip-permissions` by default in sandboxes.
@z

@x
See [Custom templates](../templates.md) to build your own agent images.
@y
See [Custom templates](../templates.md) to build your own agent images.
@z
