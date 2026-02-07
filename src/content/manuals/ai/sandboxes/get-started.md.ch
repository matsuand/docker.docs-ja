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
This guide shows how to run Claude Code in an isolated sandbox for the first time.
@y
This guide shows how to run Claude Code in an isolated sandbox for the first time.
@z

@x
> [!NOTE]
> Upgrading from an earlier version of Docker Desktop? See the
> [migration guide](migration.md) for information about the new microVM
> architecture.
@y
> [!NOTE]
> Upgrading from an earlier version of Docker Desktop? See the
> [migration guide](migration.md) for information about the new microVM
> architecture.
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
- Docker Desktop 4.58 or later
- macOS, or Windows {{< badge color=violet text=Experimental >}}
- A Claude API key (can be provided via environment variable or interactively)
@y
- Docker Desktop 4.58 or later
- macOS, or Windows {{< badge color=violet text=Experimental >}}
- A Claude API key (can be provided via environment variable or interactively)
@z

@x
## Run your first sandbox
@y
## Run your first sandbox
@z

@x
Follow these steps to run Claude Code:
@y
Follow these steps to run Claude Code:
@z

@x
1. (Optional but recommended) Set your Anthropic API key as an environment variable.
@y
1. (Optional but recommended) Set your Anthropic API key as an environment variable.
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
   Docker Sandboxes use a daemon process that runs independently of your
   current shell session. This means setting the environment variable inline or
   in your current session will not work. You must set it globally in your
   shell configuration file to ensure the daemon can access it.
@y
   Docker Sandboxes use a daemon process that runs independently of your
   current shell session. This means setting the environment variable inline or
   in your current session will not work. You must set it globally in your
   shell configuration file to ensure the daemon can access it.
@z

@x
   Apply the changes:
   1. Source your shell configuration.
   2. Restart Docker Desktop so the daemon picks up the new environment variable.
@y
   Apply the changes:
   1. Source your shell configuration.
   2. Restart Docker Desktop so the daemon picks up the new environment variable.
@z

@x
   Alternatively, you can skip this step and authenticate interactively when
   Claude Code starts. If no credentials are found, you'll be prompted to log
   in. Note that interactive authentication requires you to authenticate for
   each workspace separately.
@y
   Alternatively, you can skip this step and authenticate interactively when
   Claude Code starts. If no credentials are found, you'll be prompted to log
   in. Note that interactive authentication requires you to authenticate for
   each workspace separately.
@z

@x
2. Create and run a sandbox for Claude Code for your workspace:
@y
2. Create and run a sandbox for Claude Code for your workspace:
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
   This creates a microVM sandbox. Docker assigns it a name automatically.
@y
   This creates a microVM sandbox. Docker assigns it a name automatically.
@z

@x
3. Claude Code starts and you can begin working. The first run takes longer
   while Docker initializes the microVM and pulls the template image.
@y
3. Claude Code starts and you can begin working. The first run takes longer
   while Docker initializes the microVM and pulls the template image.
@z

@x
## What just happened?
@y
## What just happened?
@z

@x
When you ran `docker sandbox run`:
@y
When you ran `docker sandbox run`:
@z

@x
- Docker created a lightweight microVM with a private Docker daemon
- The sandbox was assigned a name based on the workspace path
- Your workspace synced into the VM
- Docker started the Claude Code agent as a container inside the sandbox VM
@y
- Docker created a lightweight microVM with a private Docker daemon
- The sandbox was assigned a name based on the workspace path
- Your workspace synced into the VM
- Docker started the Claude Code agent as a container inside the sandbox VM
@z

@x
The sandbox persists until you remove it. Installed packages and configuration
remain available. Run `docker sandbox run <sandbox-name>` again to reconnect.
@y
The sandbox persists until you remove it. Installed packages and configuration
remain available. Run `docker sandbox run <sandbox-name>` again to reconnect.
@z

@x
> [!NOTE]
> Agents can modify files in your workspace. Review changes before executing
> code or performing actions that auto-run scripts. See
> [Security considerations](workflows.md#security-considerations) for details.
@y
> [!NOTE]
> Agents can modify files in your workspace. Review changes before executing
> code or performing actions that auto-run scripts. See
> [Security considerations](workflows.md#security-considerations) for details.
@z

@x
## Basic commands
@y
## Basic commands
@z

@x
Here are essential commands to manage your sandboxes:
@y
Here are essential commands to manage your sandboxes:
@z

@x
### List sandboxes
@y
### List sandboxes
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
> [!NOTE]
> Sandboxes don't appear in `docker ps` because they're microVMs, not
> containers. Use `docker sandbox ls` to see them.
@y
> [!NOTE]
> Sandboxes don't appear in `docker ps` because they're microVMs, not
> containers. Use `docker sandbox ls` to see them.
@z

@x
### Access a running sandbox
@y
### Access a running sandbox
@z

@x
```console
$ docker sandbox exec -it <sandbox-name> bash
```
@y
```console
$ docker sandbox exec -it <sandbox-name> bash
```
@z

@x
Executes a command inside the container in the sandbox. Use `-it` to open an
interactive shell for debugging or installing additional tools.
@y
Executes a command inside the container in the sandbox. Use `-it` to open an
interactive shell for debugging or installing additional tools.
@z

@x
### Remove a sandbox
@y
### Remove a sandbox
@z

@x
```console
$ docker sandbox rm <sandbox-name>
```
@y
```console
$ docker sandbox rm <sandbox-name>
```
@z

@x
Deletes the sandbox VM and all installed packages inside it. You can remove
multiple sandboxes at once by specifying multiple names:
@y
Deletes the sandbox VM and all installed packages inside it. You can remove
multiple sandboxes at once by specifying multiple names:
@z

@x
```console
$ docker sandbox rm <sandbox-1> <sandbox-2>
```
@y
```console
$ docker sandbox rm <sandbox-1> <sandbox-2>
```
@z

@x
### Recreate a sandbox
@y
### Recreate a sandbox
@z

@x
To start fresh with a clean environment, remove and recreate the sandbox:
@y
To start fresh with a clean environment, remove and recreate the sandbox:
@z

@x
```console
$ docker sandbox rm <sandbox-name>
$ docker sandbox run claude ~/project
```
@y
```console
$ docker sandbox rm <sandbox-name>
$ docker sandbox run claude ~/project
```
@z

@x
Configuration like custom templates and workspace paths are set when you create
the sandbox. To change these settings, remove and recreate.
@y
Configuration like custom templates and workspace paths are set when you create
the sandbox. To change these settings, remove and recreate.
@z

@x
For a complete list of commands and options, see the
[CLI reference](/reference/cli/docker/sandbox/).
@y
For a complete list of commands and options, see the
[CLI reference](reference/cli/docker/sandbox/).
@z

@x
## Next steps
@y
## Next steps
@z

@x
Now that you have Claude running in a sandbox, learn more about:
@y
Now that you have Claude running in a sandbox, learn more about:
@z

@x
- [Claude Code configuration](claude-code.md)
- [Supported agents](agents.md)
- [Using sandboxes effectively](workflows.md)
- [Custom templates](templates.md)
- [Network policies](network-policies.md)
- [Troubleshooting](troubleshooting.md)
@y
- [Claude Code configuration](claude-code.md)
- [Supported agents](agents.md)
- [Using sandboxes effectively](workflows.md)
- [Custom templates](templates.md)
- [Network policies](network-policies.md)
- [Troubleshooting](troubleshooting.md)
@z
