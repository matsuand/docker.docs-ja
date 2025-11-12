%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

% __SUBDIR__ 対応

@x
title: Get started with Docker Sandboxes
linkTitle: Get started
description: Run Claude Code in an isolated sandbox. Quick setup guide with prerequisites and essential commands.
@y
title: Get started with Docker Sandboxes
linkTitle: Get started
description: Run Claude Code in an isolated sandbox. Quick setup guide with prerequisites and essential commands.
@z

@x
{{< summary-bar feature_name="Docker Sandboxes" >}}
@y
{{< summary-bar feature_name="Docker Sandboxes" >}}
@z

@x
This guide will help you run Claude Code in a sandboxed environment for the first time.
@y
This guide will help you run Claude Code in a sandboxed environment for the first time.
@z

@x
## Prerequisites
@y
## Prerequisites
@z

@x
Before you begin, ensure you have:
@y
Before you begin, ensure you have:
@z

@x
- Docker Desktop 4.50 or later
- A Claude Code subscription
@y
- Docker Desktop 4.50 or later
- A Claude Code subscription
@z

@x
## Run a sandboxed agent
@y
## Run a sandboxed agent
@z

@x
Follow these steps to run Claude Code in a sandboxed environment:
@y
Follow these steps to run Claude Code in a sandboxed environment:
@z

@x
1. Navigate to Your Project
@y
1. Navigate to Your Project
@z

@x
   ```console
   $ cd ~/my-project
   ```
@y
   ```console
   $ cd ~/my-project
   ```
@z

@x
2. Start Claude in a sandbox
@y
2. Start Claude in a sandbox
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
3. Authenticate: on first run, Claude will prompt you to authenticate.
@y
3. Authenticate: on first run, Claude will prompt you to authenticate.
@z

@x
   Once you've authenticated, the credentials are stored in a persistent Docker
   volume and reused for future sessions.
@y
   Once you've authenticated, the credentials are stored in a persistent Docker
   volume and reused for future sessions.
@z

@x
4. Claude Code launches inside the container.
@y
4. Claude Code launches inside the container.
@z

@x
## What just happened?
@y
## What just happened?
@z

@x
When you ran `docker sandbox run claude`:
@y
When you ran `docker sandbox run claude`:
@z

@x
- Docker created a container from a template image
- Your current directory was mounted at the same path inside the container
- Your Git name and email were injected into the container
- Your API key was stored in a Docker volume (`docker-claude-sandbox-data`)
- Claude Code started with bypass permissions enabled
@y
- Docker created a container from a template image
- Your current directory was mounted at the same path inside the container
- Your Git name and email were injected into the container
- Your API key was stored in a Docker volume (`docker-claude-sandbox-data`)
- Claude Code started with bypass permissions enabled
@z

@x
The container continues running in the background. Running `docker sandbox run
claude` again in the same directory reuses the existing container, allowing the
agent to maintain state (installed packages, temporary files) across sessions.
@y
The container continues running in the background. Running `docker sandbox run
claude` again in the same directory reuses the existing container, allowing the
agent to maintain state (installed packages, temporary files) across sessions.
@z

@x
## Basic commands
@y
## Basic commands
@z

@x
Here are a few essential commands to manage your sandboxes:
@y
Here are a few essential commands to manage your sandboxes:
@z

@x
### List your sandboxes
@y
### List your sandboxes
@z

@x
```console
$ docker sandbox ls
```
@y
```console
$ docker sandbox ls
```
@z

@x
Shows all your sandboxes with their IDs, names, status, and creation time.
@y
Shows all your sandboxes with their IDs, names, status, and creation time.
@z

@x
### Remove a sandbox
@y
### Remove a sandbox
@z

@x
```console
$ docker sandbox rm <sandbox-id>
```
@y
```console
$ docker sandbox rm <sandbox-id>
```
@z

@x
Deletes a sandbox when you're done with it. Get the sandbox ID from `docker sandbox ls`.
@y
Deletes a sandbox when you're done with it. Get the sandbox ID from `docker sandbox ls`.
@z

@x
### View sandbox details
@y
### View sandbox details
@z

@x
```console
$ docker sandbox inspect <sandbox-id>
```
@y
```console
$ docker sandbox inspect <sandbox-id>
```
@z

@x
Shows detailed information about a specific sandbox in JSON format.
@y
Shows detailed information about a specific sandbox in JSON format.
@z

@x
For a complete list of all commands and options, see the [CLI reference](/reference/cli/docker/sandbox/).
@y
For a complete list of all commands and options, see the [CLI reference](__SUBDIR__/reference/cli/docker/sandbox/).
@z

@x
## Next Steps
@y
## Next Steps
@z

@x
Now that you have Claude running in a sandboxed environment, learn more about:
@y
Now that you have Claude running in a sandboxed environment, learn more about:
@z

@x
- [Authentication strategies](claude-code.md#authentication)
- [Configuration options](claude-code.md#configuration)
- [Advanced configurations](advanced-config.md)
- [Troubleshooting guide](troubleshooting.md)
@y
- [Authentication strategies](claude-code.md#authentication)
- [Configuration options](claude-code.md#configuration)
- [Advanced configurations](advanced-config.md)
- [Troubleshooting guide](troubleshooting.md)
@z
