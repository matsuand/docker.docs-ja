%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
title: Kiro sandbox
description: |
  Use Kiro in Docker Sandboxes with device flow authentication for interactive
  AI-assisted development.
keywords: docker, sandboxes, kiro, ai agent, authentication, device flow
@y
title: Kiro sandbox
description: |
  Use Kiro in Docker Sandboxes with device flow authentication for interactive
  AI-assisted development.
keywords: docker, sandboxes, kiro, ai agent, authentication, device flow
@z

@x
{{< summary-bar feature_name="Docker Sandboxes" >}}
@y
{{< summary-bar feature_name="Docker Sandboxes" >}}
@z

@x
This guide covers authentication, configuration, and usage of Kiro in a
sandboxed environment.
@y
This guide covers authentication, configuration, and usage of Kiro in a
sandboxed environment.
@z

@x
Official documentation: [Kiro CLI](https://kiro.dev/docs/cli/)
@y
Official documentation: [Kiro CLI](https://kiro.dev/docs/cli/)
@z

@x
## Quick start
@y
## Quick start
@z

@x
Create a sandbox and run Kiro for a project directory:
@y
Create a sandbox and run Kiro for a project directory:
@z

@x
```console
$ docker sandbox run kiro ~/my-project
```
@y
```console
$ docker sandbox run kiro ~/my-project
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
$ docker sandbox run kiro
```
@y
```console
$ cd ~/my-project
$ docker sandbox run kiro
```
@z

@x
On first run, Kiro prompts you to authenticate using device flow.
@y
On first run, Kiro prompts you to authenticate using device flow.
@z

@x
## Authentication
@y
## Authentication
@z

@x
Kiro uses device flow authentication, which requires interactive login through
a web browser. This method provides secure authentication without storing API
keys directly.
@y
Kiro uses device flow authentication, which requires interactive login through
a web browser. This method provides secure authentication without storing API
keys directly.
@z

@x
### Device flow login
@y
### Device flow login
@z

@x
When you first run Kiro, it prompts you to authenticate:
@y
When you first run Kiro, it prompts you to authenticate:
@z

@x
1. Kiro displays a URL and a verification code
2. Open the URL in your web browser
3. Enter the verification code
4. Complete the authentication flow in your browser
5. Return to the terminal - Kiro proceeds automatically
@y
1. Kiro displays a URL and a verification code
2. Open the URL in your web browser
3. Enter the verification code
4. Complete the authentication flow in your browser
5. Return to the terminal - Kiro proceeds automatically
@z

@x
The authentication session is persisted in the sandbox and doesn't require
repeated login unless you destroy and recreate the sandbox.
@y
The authentication session is persisted in the sandbox and doesn't require
repeated login unless you destroy and recreate the sandbox.
@z

@x
### Manual login
@y
### Manual login
@z

@x
You can trigger the login flow manually:
@y
You can trigger the login flow manually:
@z

@x
```console
$ docker sandbox run <sandbox-name> -- login --use-device-flow
```
@y
```console
$ docker sandbox run <sandbox-name> -- login --use-device-flow
```
@z

@x
This command initiates device flow authentication without starting a coding
session.
@y
This command initiates device flow authentication without starting a coding
session.
@z

@x
### Authentication persistence
@y
### Authentication persistence
@z

@x
Kiro stores authentication state in `~/.local/share/kiro-cli/data.sqlite3`
inside the sandbox. This database persists as long as the sandbox exists. If
you destroy the sandbox, you'll need to authenticate again when you recreate
it.
@y
Kiro stores authentication state in `~/.local/share/kiro-cli/data.sqlite3`
inside the sandbox. This database persists as long as the sandbox exists. If
you destroy the sandbox, you'll need to authenticate again when you recreate
it.
@z

@x
## Configuration
@y
## Configuration
@z

@x
Kiro requires minimal configuration. The agent runs with trust-all-tools mode
by default, which allows it to execute commands without repeated approval
prompts.
@y
Kiro requires minimal configuration. The agent runs with trust-all-tools mode
by default, which allows it to execute commands without repeated approval
prompts.
@z

@x
### Pass options at runtime
@y
### Pass options at runtime
@z

@x
Pass Kiro CLI options after the sandbox name and a `--` separator:
@y
Pass Kiro CLI options after the sandbox name and a `--` separator:
@z

@x
```console
$ docker sandbox run <sandbox-name> -- chat --trust-all-tools
```
@y
```console
$ docker sandbox run <sandbox-name> -- chat --trust-all-tools
```
@z

@x
The `chat --trust-all-tools` command starts Kiro with approval prompts
disabled.
@y
The `chat --trust-all-tools` command starts Kiro with approval prompts
disabled.
@z

@x
## Base image
@y
## Base image
@z

@x
Template: `docker/sandbox-templates:kiro`
@y
Template: `docker/sandbox-templates:kiro`
@z

@x
Kiro manages authentication through an interactive device flow. The authentication database is persisted across sandbox restarts. Launches with `chat --trust-all-tools` by default.
@y
Kiro manages authentication through an interactive device flow. The authentication database is persisted across sandbox restarts. Launches with `chat --trust-all-tools` by default.
@z

@x
See [Custom templates](../templates.md) to build your own agent images.
@y
See [Custom templates](../templates.md) to build your own agent images.
@z
