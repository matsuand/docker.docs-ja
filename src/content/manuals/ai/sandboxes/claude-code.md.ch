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
The simplest way to start Claude in a sandbox:
@y
The simplest way to start Claude in a sandbox:
@z

@x
```console
$ docker sandbox run claude
```
@y
```console
$ docker sandbox run claude
```
@z

@x
This starts a sandboxed Claude Code agent with the current working directory as
its workspace.
@y
This starts a sandboxed Claude Code agent with the current working directory as
its workspace.
@z

@x
Or specify a different workspace:
@y
Or specify a different workspace:
@z

@x
```console
$ docker sandbox run -w ~/my-project claude
```
@y
```console
$ docker sandbox run -w ~/my-project claude
```
@z

@x
## Passing CLI options to Claude
@y
## Passing CLI options to Claude
@z

@x
Claude Code supports various command-line options that you can pass through
`docker sandbox run`. Any arguments after the agent name (`claude`) are passed
directly to Claude Code inside the sandbox.
@y
Claude Code supports various command-line options that you can pass through
`docker sandbox run`. Any arguments after the agent name (`claude`) are passed
directly to Claude Code inside the sandbox.
@z

@x
### Continue previous conversation
@y
### Continue previous conversation
@z

@x
Resume your most recent conversation:
@y
Resume your most recent conversation:
@z

@x
```console
$ docker sandbox run claude -c
```
@y
```console
$ docker sandbox run claude -c
```
@z

@x
Or use the long form:
@y
Or use the long form:
@z

@x
```console
$ docker sandbox run claude --continue
```
@y
```console
$ docker sandbox run claude --continue
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
$ docker sandbox run claude "Add error handling to the login function"
```
@y
```console
$ docker sandbox run claude "Add error handling to the login function"
```
@z

@x
This starts Claude and immediately processes the prompt.
@y
This starts Claude and immediately processes the prompt.
@z

@x
### Combine options
@y
### Combine options
@z

@x
You can combine sandbox options with Claude options:
@y
You can combine sandbox options with Claude options:
@z

@x
```console
$ docker sandbox run -e DEBUG=1 claude -c
```
@y
```console
$ docker sandbox run -e DEBUG=1 claude -c
```
@z

@x
This creates a sandbox with `DEBUG` set to `1`, enabling debug output for
troubleshooting, and continues the previous conversation.
@y
This creates a sandbox with `DEBUG` set to `1`, enabling debug output for
troubleshooting, and continues the previous conversation.
@z

@x
### Available Claude options
@y
### Available Claude options
@z

@x
All Claude Code CLI options work through `docker sandbox run`:
@y
All Claude Code CLI options work through `docker sandbox run`:
@z

@x
- `-c, --continue` - Continue the most recent conversation
- `-p, --prompt` - Read prompt from stdin (useful for piping)
- `--dangerously-skip-permissions` - Skip permission prompts (enabled by default in sandboxes)
- And more - see the [Claude Code documentation](https://docs.claude.com/en/docs/claude-code) for a complete list
@y
- `-c, --continue` - Continue the most recent conversation
- `-p, --prompt` - Read prompt from stdin (useful for piping)
- `--dangerously-skip-permissions` - Skip permission prompts (enabled by default in sandboxes)
- And more - see the [Claude Code documentation](https://docs.claude.com/en/docs/claude-code) for a complete list
@z

@x
## Authentication
@y
## Authentication
@z

@x
Claude sandboxes support the following credential management strategies.
@y
Claude sandboxes support the following credential management strategies.
@z

@x
### Strategy 1: `sandbox` (Default)
@y
### Strategy 1: `sandbox` (Default)
@z

@x
```console
$ docker sandbox run claude
```
@y
```console
$ docker sandbox run claude
```
@z

@x
On first run, Claude prompts you to enter your Anthropic API key. The
credentials are stored in a persistent Docker volume named
`docker-claude-sandbox-data`. All future Claude sandboxes automatically use
these stored credentials, and they persist across sandbox restarts and deletion.
@y
On first run, Claude prompts you to enter your Anthropic API key. The
credentials are stored in a persistent Docker volume named
`docker-claude-sandbox-data`. All future Claude sandboxes automatically use
these stored credentials, and they persist across sandbox restarts and deletion.
@z

@x
Sandboxes mount this volume at `/mnt/claude-data` and create symbolic links in
the sandbox user's home directory.
@y
Sandboxes mount this volume at `/mnt/claude-data` and create symbolic links in
the sandbox user's home directory.
@z

@x
> [!NOTE]
> If your workspace contains a `.claude.json` file with a `primaryApiKey`
> field, you'll receive a warning about potential conflicts. You can choose to
> remove the `primaryApiKey` field from your `.claude.json` or proceed and
> ignore the warning.
@y
> [!NOTE]
> If your workspace contains a `.claude.json` file with a `primaryApiKey`
> field, you'll receive a warning about potential conflicts. You can choose to
> remove the `primaryApiKey` field from your `.claude.json` or proceed and
> ignore the warning.
@z

@x
### Strategy 2: `none`
@y
### Strategy 2: `none`
@z

@x
No automatic credential management.
@y
No automatic credential management.
@z

@x
```console
$ docker sandbox run --credentials=none claude
```
@y
```console
$ docker sandbox run --credentials=none claude
```
@z

@x
Docker does not discover, inject, or store any credentials. You must
authenticate manually inside the container. Credentials are not shared with
other sandboxes but persist for the lifetime of the container.
@y
Docker does not discover, inject, or store any credentials. You must
authenticate manually inside the container. Credentials are not shared with
other sandboxes but persist for the lifetime of the container.
@z

@x
## Configuration
@y
## Configuration
@z

@x
Claude Code can be configured through CLI options. Any arguments you pass after
the agent name are passed directly to Claude Code inside the container.
@y
Claude Code can be configured through CLI options. Any arguments you pass after
the agent name are passed directly to Claude Code inside the container.
@z

@x
Pass options after the agent name:
@y
Pass options after the agent name:
@z

@x
```console
$ docker sandbox run claude [claude-options]
```
@y
```console
$ docker sandbox run claude [claude-options]
```
@z

@x
For example:
@y
For example:
@z

@x
```console
$ docker sandbox run claude --continue
```
@y
```console
$ docker sandbox run claude --continue
```
@z

@x
See the [Claude Code CLI reference](https://docs.claude.com/en/docs/claude-code/cli-reference)
for a complete list of available options.
@y
See the [Claude Code CLI reference](https://docs.claude.com/en/docs/claude-code/cli-reference)
for a complete list of available options.
@z

@x
## Advanced usage
@y
## Advanced usage
@z

@x
For more advanced configurations including environment variables, volume mounts,
Docker socket access, and custom templates, see
[Advanced configurations](advanced-config.md).
@y
For more advanced configurations including environment variables, volume mounts,
Docker socket access, and custom templates, see
[Advanced configurations](advanced-config.md).
@z

@x
## Base image
@y
## Base image
@z

@x
The `docker/sandbox-templates:claude-code` image includes Claude Code with
automatic credential management, plus development tools (Docker CLI, GitHub
CLI, Node.js, Go, Python 3, Git, ripgrep, jq). It runs as a non-root `agent`
user with `sudo` access and launches Claude with
`--dangerously-skip-permissions` by default.
@y
The `docker/sandbox-templates:claude-code` image includes Claude Code with
automatic credential management, plus development tools (Docker CLI, GitHub
CLI, Node.js, Go, Python 3, Git, ripgrep, jq). It runs as a non-root `agent`
user with `sudo` access and launches Claude with
`--dangerously-skip-permissions` by default.
@z

@x
## Next Steps
@y
## Next Steps
@z

@x
- [Advanced configurations](advanced-config.md)
- [Troubleshooting](troubleshooting.md)
- [CLI Reference](/reference/cli/docker/sandbox/)
@y
- [Advanced configurations](advanced-config.md)
- [Troubleshooting](troubleshooting.md)
- [CLI Reference](__SUBDIR__/reference/cli/docker/sandbox/)
@z
