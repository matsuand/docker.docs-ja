%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
title: Copilot sandbox
description: |
  Use GitHub Copilot in Docker Sandboxes with GitHub token authentication and
  trusted folder configuration.
keywords: docker, sandboxes, copilot, github, ai agent, authentication, trusted folders
@y
title: Copilot sandbox
description: |
  Use GitHub Copilot in Docker Sandboxes with GitHub token authentication and
  trusted folder configuration.
keywords: docker, sandboxes, copilot, github, ai agent, authentication, trusted folders
@z

@x
{{< summary-bar feature_name="Docker Sandboxes" >}}
@y
{{< summary-bar feature_name="Docker Sandboxes" >}}
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
$ docker sandbox run copilot ~/my-project
```
@y
```console
$ docker sandbox run copilot ~/my-project
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
$ docker sandbox run copilot
```
@y
```console
$ cd ~/my-project
$ docker sandbox run copilot
```
@z

@x
## Authentication
@y
## Authentication
@z

@x
Copilot requires a GitHub token with Copilot access. Credentials are scoped
per sandbox and must be provided through environment variables on the host.
@y
Copilot requires a GitHub token with Copilot access. Credentials are scoped
per sandbox and must be provided through environment variables on the host.
@z

@x
### Environment variable (recommended)
@y
### Environment variable (recommended)
@z

@x
Set the `GH_TOKEN` or `GITHUB_TOKEN` environment variable in your shell
configuration file.
@y
Set the `GH_TOKEN` or `GITHUB_TOKEN` environment variable in your shell
configuration file.
@z

@x
Docker Sandboxes use a daemon process that doesn't inherit environment
variables from your current shell session. To make your token available to
sandboxes, set it globally in your shell configuration file.
@y
Docker Sandboxes use a daemon process that doesn't inherit environment
variables from your current shell session. To make your token available to
sandboxes, set it globally in your shell configuration file.
@z

@x
Add the token to your shell configuration file:
@y
Add the token to your shell configuration file:
@z

@x
```plaintext {title="~/.bashrc or ~/.zshrc"}
export GH_TOKEN=ghp_xxxxx
```
@y
```plaintext {title="~/.bashrc or ~/.zshrc"}
export GH_TOKEN=ghp_xxxxx
```
@z

@x
Or use `GITHUB_TOKEN`:
@y
Or use `GITHUB_TOKEN`:
@z

@x
```plaintext {title="~/.bashrc or ~/.zshrc"}
export GITHUB_TOKEN=ghp_xxxxx
```
@y
```plaintext {title="~/.bashrc or ~/.zshrc"}
export GITHUB_TOKEN=ghp_xxxxx
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
$ docker sandbox create copilot ~/project
$ docker sandbox run <sandbox-name>
```
@y
```console
$ docker sandbox create copilot ~/project
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
Copilot can be configured to trust specific folders, disabling safety prompts
for those locations. Configure trusted folders in `~/.copilot/config.json`:
@y
Copilot can be configured to trust specific folders, disabling safety prompts
for those locations. Configure trusted folders in `~/.copilot/config.json`:
@z

@x
```json
{
  "trusted_folders": ["/workspace", "/home/agent/projects"]
}
```
@y
```json
{
  "trusted_folders": ["/workspace", "/home/agent/projects"]
}
```
@z

@x
Workspaces are mounted at `/workspace` by default, so trusting this path
allows Copilot to operate without repeated confirmations.
@y
Workspaces are mounted at `/workspace` by default, so trusting this path
allows Copilot to operate without repeated confirmations.
@z

@x
### Pass options at runtime
@y
### Pass options at runtime
@z

@x
Pass Copilot CLI options after the sandbox name and a `--` separator:
@y
Pass Copilot CLI options after the sandbox name and a `--` separator:
@z

@x
```console
$ docker sandbox run <sandbox-name> -- --yolo
```
@y
```console
$ docker sandbox run <sandbox-name> -- --yolo
```
@z

@x
The `--yolo` flag disables approval prompts for a single session without
modifying the configuration file.
@y
The `--yolo` flag disables approval prompts for a single session without
modifying the configuration file.
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
Copilot launches with `--yolo` by default when trusted folders are configured.
@y
Copilot launches with `--yolo` by default when trusted folders are configured.
@z

@x
See [Custom templates](../templates.md) to build your own agent images.
@y
See [Custom templates](../templates.md) to build your own agent images.
@z
