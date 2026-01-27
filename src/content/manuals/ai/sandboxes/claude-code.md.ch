%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

% __SUBDIR__ 対応

@x
title: Configure Claude Code
description: Learn how to configure Claude Code authentication, pass CLI options, and customize your sandboxed agent environment with Docker.
@y
title: Configure Claude Code
description: Learn how to configure Claude Code authentication, pass CLI options, and customize your sandboxed agent environment with Docker.
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
Claude Code needs an Anthropic API key to work. The recommended approach is to
set the `ANTHROPIC_API_KEY` environment variable in your shell configuration
file.
@y
Claude Code needs an Anthropic API key to work. The recommended approach is to
set the `ANTHROPIC_API_KEY` environment variable in your shell configuration
file.
@z

@x
Docker Sandboxes run through a daemon process that doesn't inherit environment
variables from your current shell session. To make your API key available to
sandboxes, you need to set it globally in your shell configuration file.
@y
Docker Sandboxes run through a daemon process that doesn't inherit environment
variables from your current shell session. To make your API key available to
sandboxes, you need to set it globally in your shell configuration file.
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
Then apply the changes:
@y
Then apply the changes:
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
The sandbox will detect the environment variable and use it automatically.
@y
The sandbox will detect the environment variable and use it automatically.
@z

@x
### Interactive authentication
@y
### Interactive authentication
@z

@x
If no credentials are found, Claude Code prompts you to authenticate when it
starts. You'll need to authenticate for each workspace separately when using
this method.
@y
If no credentials are found, Claude Code prompts you to authenticate when it
starts. You'll need to authenticate for each workspace separately when using
this method.
@z

@x
To avoid repeated authentication, use the `ANTHROPIC_API_KEY` environment
variable method described above.
@y
To avoid repeated authentication, use the `ANTHROPIC_API_KEY` environment
variable method described above.
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
See the [Claude Code CLI reference](https://docs.claude.com/en/docs/claude-code/cli-reference)
for available options.
@y
See the [Claude Code CLI reference](https://docs.claude.com/en/docs/claude-code/cli-reference)
for available options.
@z

@x
## Base image
@y
## Base image
@z

@x
The Claude Code sandbox template is a container image that runs inside the
sandbox VM. It includes:
@y
The Claude Code sandbox template is a container image that runs inside the
sandbox VM. It includes:
@z

@x
- Ubuntu-based environment with Claude Code
- Development tools: Docker CLI, GitHub CLI, Node.js, Go, Python 3, Git, ripgrep, jq
- Non-root `agent` user with sudo access
- Private Docker daemon for running additional containers
@y
- Ubuntu-based environment with Claude Code
- Development tools: Docker CLI, GitHub CLI, Node.js, Go, Python 3, Git, ripgrep, jq
- Non-root `agent` user with sudo access
- Private Docker daemon for running additional containers
@z

@x
Claude launches with `--dangerously-skip-permissions` by default in sandboxes.
@y
Claude launches with `--dangerously-skip-permissions` by default in sandboxes.
@z

@x
You can build custom templates based on `docker/sandbox-templates:claude-code`.
See [Custom templates](templates.md) for details.
@y
You can build custom templates based on `docker/sandbox-templates:claude-code`.
See [Custom templates](templates.md) for details.
@z

@x
## Next steps
@y
## Next steps
@z

@x
- [Using sandboxes effectively](workflows.md)
- [Custom templates](templates.md)
- [Network policies](network-policies.md)
- [Troubleshooting](troubleshooting.md)
- [CLI Reference](/reference/cli/docker/sandbox/)
@y
- [Using sandboxes effectively](workflows.md)
- [Custom templates](templates.md)
- [Network policies](network-policies.md)
- [Troubleshooting](troubleshooting.md)
- [CLI Reference](reference/cli/docker/sandbox/)
@z
